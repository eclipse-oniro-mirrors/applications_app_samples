/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { FileDescriptor, FileKind, describeFile } from '../core/FileKindCore';
import { FileEntry, QueryResult, SortField } from '../core/FileQueryCore';
import { DetailModel } from '../feature/DetailModel';
import { SearchModel } from '../feature/SearchModel';
import { RecentStore } from '../feature/PreferenceStore';

@Entry
@Component
struct SearchPage {
  @State items: Array<FileEntry> = [];
  @State keyword: string = '';
  @State kindKey: string = 'all';
  @State sortKey: string = 'name';
  @State onlyDlp: boolean = false;
  @State selectionMode: boolean = false;
  @State selectedCount: number = 0;
  @State total: number = 0;
  @State pageIndex: number = 0;
  @State pageCount: number = 0;
  private model: SearchModel = new SearchModel();

  aboutToAppear(): void {
    this.loadEntries();
    this.applyFilters();
  }

  private loadEntries(): void {
    const names: Array<string> | undefined = AppStorage.get<Array<string>>('fileNameList');
    const uris: Array<string> | undefined = AppStorage.get<Array<string>>('fileUriList');
    const entries: Array<FileEntry> = [];
    if (names !== undefined) {
      for (let index = 0; index < names.length; index++) {
        let uri: string = '';
        if (uris !== undefined && index < uris.length) {
          uri = uris[index];
        }
        const descriptor: FileDescriptor = describeFile(names[index], -1);
        entries.push(new FileEntry(index.toString() + ':' + names[index], names[index], uri, descriptor.kind, -1, 0,
          descriptor.isDlp, false));
      }
    }
    this.model.setEntries(entries);
    this.model.setPageSize(20);
  }

  private applyFilters(): void {
    this.model.setKeyword(this.keyword);
    this.model.clearKinds();
    if (this.kindKey === 'text') {
      this.model.setKind(FileKind.TEXT);
    } else if (this.kindKey === 'document') {
      this.model.setKind(FileKind.DOCUMENT);
    } else if (this.kindKey === 'image') {
      this.model.setKind(FileKind.IMAGE);
    }
    this.model.setOnlyDlp(this.onlyDlp);
    this.model.setSort(this.currentSortField(), false);
    const result: QueryResult = this.model.page();
    this.items = result.items;
    this.total = result.total;
    this.pageIndex = this.model.currentPageIndex();
    this.pageCount = this.model.pageCount();
    this.selectedCount = this.model.selectedCount();
  }

  private currentSortField(): SortField {
    if (this.sortKey === 'size') {
      return SortField.SIZE;
    }
    if (this.sortKey === 'time') {
      return SortField.MODIFIED;
    }
    return SortField.NAME;
  }

  private openDetail(item: FileEntry): void {
    AppStorage.setOrCreate('detailName', item.name);
    AppStorage.setOrCreate('detailUri', item.uri);
    AppStorage.setOrCreate('detailSize', item.sizeBytes);
    AppStorage.setOrCreate('detailModified', item.modifiedAtSec);
    this.recordRecent(item);
    router.pushUrl({ url: 'pages/DetailPage' }).catch((err: BusinessError) => {
      promptAction.showToast({ message: '打开详情失败：' + err.message, duration: 2000 });
    });
  }

  private async recordRecent(item: FileEntry): Promise<void> {
    const context = getContext(this) as common.UIAbilityContext;
    await RecentStore.record(context, item.name, item.uri, item.isDlp);
  }

  private handleItemClick(item: FileEntry): void {
    if (this.selectionMode) {
      this.model.toggleSelection(item.id);
      this.selectedCount = this.model.selectedCount();
    } else {
      this.openDetail(item);
    }
  }

  private batchAuthorize(): void {
    promptAction.showToast({ message: '已为 ' + this.selectedCount.toString() + ' 个文件应用只读权限模板', duration: 2000 });
    this.model.clearSelection();
    this.selectedCount = 0;
    this.selectionMode = false;
  }

  private goPrev(): void {
    if (this.model.previousPage()) {
      this.applyFilters();
    }
  }

  private goNext(): void {
    if (this.model.nextPage()) {
      this.applyFilters();
    }
  }

  build() {
    Column() {
      this.Header()
      this.FilterBar()
      this.SortBar()
      this.ResultArea()
      if (this.pageCount > 1) {
        this.Pager()
      }
      if (this.selectedCount > 0) {
        this.BatchBar()
      }
    }
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.index_background'))
  }

  @Builder
  Header() {
    Row() {
      Image($r('app.media.ic_public_back'))
        .width('24vp')
        .height('24vp')
        .margin({ right: '12vp' })
        .id('search_back')
        .onClick(() => {
          router.back();
        })
      TextInput({ placeholder: '输入文件名搜索' })
        .layoutWeight(1)
        .height('36vp')
        .fontSize('14vp')
        .backgroundColor($r('app.color.input_background'))
        .borderRadius('18vp')
        .id('search_input')
        .onChange((value: string) => {
          this.keyword = value;
          this.applyFilters();
        })
      Text(this.selectionMode ? '完成' : '多选')
        .fontSize('14vp')
        .fontColor($r('app.color.main_blue'))
        .margin({ left: '12vp' })
        .id('search_multi_select')
        .onClick(() => {
          this.selectionMode = !this.selectionMode;
          if (!this.selectionMode) {
            this.model.clearSelection();
            this.selectedCount = 0;
          }
        })
    }
    .width('100%')
    .padding({ left: '16vp', right: '16vp', top: '12vp', bottom: '12vp' })
    .backgroundColor($r('app.color.white_bg_color'))
  }

  @Builder
  FilterBar() {
    Scroll() {
      Row() {
        this.KindChip('全部', 'all', 'filter_all')
        this.KindChip('文本', 'text', 'filter_text')
        this.KindChip('文档', 'document', 'filter_document')
        this.KindChip('图片', 'image', 'filter_image')
        Text('仅加密')
          .fontSize('14vp')
          .fontColor(this.onlyDlp ? '#FFFFFF' : $r('app.color.font_color_182431'))
          .backgroundColor(this.onlyDlp ? $r('app.color.main_red') : $r('app.color.color_button_grey'))
          .padding({ left: '12vp', right: '12vp', top: '6vp', bottom: '6vp' })
          .borderRadius('14vp')
          .margin({ right: '8vp' })
          .id('filter_dlp')
          .onClick(() => {
            this.onlyDlp = !this.onlyDlp;
            this.applyFilters();
          })
      }
      .padding({ left: '16vp', right: '16vp' })
    }
    .scrollable(ScrollDirection.Horizontal)
    .scrollBar(BarState.Off)
    .width('100%')
    .padding({ top: '10vp', bottom: '6vp' })
    .backgroundColor($r('app.color.white_bg_color'))
  }

  @Builder
  KindChip(label: string, key: string, itemId: string) {
    Text(label)
      .fontSize('14vp')
      .fontColor(this.kindKey === key ? '#FFFFFF' : $r('app.color.font_color_182431'))
      .backgroundColor(this.kindKey === key ? $r('app.color.main_blue') : $r('app.color.color_button_grey'))
      .padding({ left: '12vp', right: '12vp', top: '6vp', bottom: '6vp' })
      .borderRadius('14vp')
      .margin({ right: '8vp' })
      .id(itemId)
      .onClick(() => {
        this.kindKey = key;
        this.applyFilters();
      })
  }

  @Builder
  SortBar() {
    Row() {
      Text('排序')
        .fontSize('12vp')
        .fontColor($r('app.color.color_999999_grey'))
        .margin({ right: '12vp' })
      this.SortItem('名称', 'name', 'sort_name')
      this.SortItem('大小', 'size', 'sort_size')
      this.SortItem('时间', 'time', 'sort_time')
      Blank()
      Text('共 ' + this.total.toString() + ' 个')
        .fontSize('12vp')
        .fontColor($r('app.color.color_666666_grey'))
        .id('search_total')
    }
    .width('100%')
    .padding({ left: '16vp', right: '16vp', bottom: '8vp' })
    .backgroundColor($r('app.color.white_bg_color'))
  }

  @Builder
  SortItem(label: string, key: string, itemId: string) {
    Text(label)
      .fontSize('12vp')
      .fontColor(this.sortKey === key ? $r('app.color.main_blue') : $r('app.color.color_666666_grey'))
      .margin({ right: '12vp' })
      .id(itemId)
      .onClick(() => {
        this.sortKey = key;
        this.applyFilters();
      })
  }

  @Builder
  ResultArea() {
    if (this.items.length === 0) {
      Column() {
        Text(this.keyword.length > 0 || this.kindKey !== 'all' || this.onlyDlp ? '无匹配文件' : '暂无可搜索的文件')
          .fontSize('16vp')
          .fontColor($r('app.color.color_999999_grey'))
          .id('search_empty')
      }
      .layoutWeight(1)
      .width('100%')
      .justifyContent(FlexAlign.Center)
    } else {
      List({ space: '8vp' }) {
        ForEach(this.items, (item: FileEntry, index: number) => {
          ListItem() {
            Row() {
              Column() {
                Text(item.name)
                  .fontSize('16vp')
                  .fontColor($r('app.color.font_color_182431'))
                  .maxLines(1)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .width('100%')
                  .id('search_item_name_' + index.toString())
                Text(DetailModel.summary(item.name, item.sizeBytes))
                  .fontSize('12vp')
                  .fontColor($r('app.color.color_666666_grey'))
                  .margin({ top: '4vp' })
                  .width('100%')
                  .id('search_item_summary_' + index.toString())
              }
              .alignItems(HorizontalAlign.Start)
              .layoutWeight(1)
              if (this.selectionMode) {
                Text(this.model.isSelected(item.id) ? '✓' : '○')
                  .fontSize('18vp')
                  .fontColor($r('app.color.main_blue'))
                  .margin({ left: '12vp' })
                  .id('search_item_check_' + index.toString())
              }
            }
            .width('100%')
            .padding({ left: '16vp', right: '16vp', top: '12vp', bottom: '12vp' })
            .backgroundColor($r('app.color.white_bg_color'))
            .borderRadius('12vp')
          }
          .id('search_item_' + index.toString())
          .onClick(() => {
            this.handleItemClick(item);
          })
        }, (item: FileEntry): string => item.id)
      }
      .layoutWeight(1)
      .width('100%')
      .padding({ left: '12vp', right: '12vp', top: '8vp', bottom: '8vp' })
    }
  }

  @Builder
  Pager() {
    Row() {
      Button('上一页')
        .fontSize('12vp')
        .height('28vp')
        .backgroundColor($r('app.color.color_button_grey'))
        .fontColor($r('app.color.font_color_182431'))
        .id('search_prev')
        .onClick(() => {
          this.goPrev();
        })
      Text((this.pageIndex + 1).toString() + ' / ' + this.pageCount.toString())
        .fontSize('12vp')
        .fontColor($r('app.color.color_666666_grey'))
        .margin({ left: '12vp', right: '12vp' })
        .id('search_page_info')
      Button('下一页')
        .fontSize('12vp')
        .height('28vp')
        .backgroundColor($r('app.color.color_button_grey'))
        .fontColor($r('app.color.font_color_182431'))
        .id('search_next')
        .onClick(() => {
          this.goNext();
        })
    }
    .width('100%')
    .justifyContent(FlexAlign.Center)
    .padding({ top: '6vp', bottom: '6vp' })
  }

  @Builder
  BatchBar() {
    Row() {
      Text('已选择 ' + this.selectedCount.toString() + ' 个文件')
        .fontSize('14vp')
        .fontColor($r('app.color.font_color_182431'))
        .layoutWeight(1)
        .id('batch_count')
      Button('批量授权')
        .fontSize('14vp')
        .height('32vp')
        .backgroundColor($r('app.color.main_blue'))
        .fontColor('#FFFFFF')
        .margin({ right: '8vp' })
        .id('search_batch_authorize')
        .onClick(() => {
          this.batchAuthorize();
        })
      Button('取消')
        .fontSize('14vp')
        .height('32vp')
        .backgroundColor($r('app.color.color_button_grey'))
        .fontColor($r('app.color.font_color_182431'))
        .id('search_batch_cancel')
        .onClick(() => {
          this.model.clearSelection();
          this.selectedCount = 0;
          this.selectionMode = false;
        })
    }
    .width('100%')
    .padding({ left: '16vp', right: '16vp', top: '10vp', bottom: '10vp' })
    .backgroundColor($r('app.color.white_bg_color'))
  }
}
