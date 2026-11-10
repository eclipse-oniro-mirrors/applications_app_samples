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

import {
  GridObjectSortComponent,
  GridObjectSortComponentItem,
  GridObjectSortComponentOptions,
  GridObjectSortComponentType,
  router
} from '@kit.ArkUI';
import Logger from '../util/Logger';
import { BreakpointUtils } from '../utils/BreakpointUtils';
import { TreeSortUtils } from '../utils/TreeSortUtils';

/** GridSort sample page. */
@Entry
@Component
struct GridSortDemo {
  @State widthVp: number = 0;
  @State status: string = 'selected=2, unselected=2';
  @State dataList: GridObjectSortComponentItem[] = [
    { id: 0, text: $r('app.string.sort_a'), selected: true, order: 0 },
    { id: 1, text: $r('app.string.sort_b'), selected: true, order: 1 },
    { id: 2, text: $r('app.string.sort_c'), selected: false, order: 2 },
    { id: 3, text: $r('app.string.sort_d'), selected: false, order: 3 }
  ];
  @State options: GridObjectSortComponentOptions = {
    type: GridObjectSortComponentType.TEXT,
    normalTitle: $r('app.string.sort_normal'),
    editTitle: $r('app.string.sort_edit'),
    showAreaTitle: $r('app.string.sort_drag'),
    addAreaTitle: $r('app.string.sort_add')
  };

  // Initialize page state and write the entry log.
  aboutToAppear(): void {
    Logger.enter('GridSortDemo');
    Logger.event('GridSortDemo', 'init',
      TreeSortUtils.sortSummary(TreeSortUtils.countSelected(this.dataList),
        this.dataList.length - TreeSortUtils.countSelected(this.dataList)));
  }

  // Release page resources and write the exit log.
  aboutToDisappear(): void {
    Logger.leave('GridSortDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageShow(): void {
    Logger.show('GridSortDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageHide(): void {
    Logger.hide('GridSortDemo');
  }

  // Compose the page layout and responsive controls.
  build() {
    Column({ space: 10 }) {
      Row({ space: 12 }) {
        Button($r('app.string.back'))
          .id('sortBack')
          .onClick(() => {
            Logger.event('GridSortDemo', 'back');
            router.back();
          })
        Text($r('app.string.sort_title'))
          .id('sortPageTitle')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .padding(12)

      Column() {
        GridObjectSortComponent({
          options: this.options,
          dataList: this.dataList,
          onSave: (select: Array<GridObjectSortComponentItem>, unselect: Array<GridObjectSortComponentItem>) => {
            this.status = TreeSortUtils.sortSummary(select.length, unselect.length);
            Logger.event('GridSortDemo', 'onSave', this.status);
          },
          onCancel: () => {
            this.status = 'cancelled';
            Logger.event('GridSortDemo', 'onCancel');
          }
        })
      }
      .id('gridObjectSort')
      .width('100%')
      .layoutWeight(1)

      Text(this.status)
        .id('sortStatus')
        .fontSize(13)
        .fontColor('#666666')
        .padding({ bottom: 12 })
    }
    .width('100%')
    .height('100%')
  }
}
