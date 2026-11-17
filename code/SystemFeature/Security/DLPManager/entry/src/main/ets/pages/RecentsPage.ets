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
import common from '@ohos.app.ability.common';
import { RecentItem, RecentModel } from '../feature/RecentModel';
import { RecentStore } from '../feature/PreferenceStore';
import { formatRelative } from '../core/FormatCore';

@Entry
@Component
struct RecentsPage {
  @State favorites: RecentItem[] = [];
  @State recents: RecentItem[] = [];
  @State empty: boolean = true;
  @State status: ResourceStr = '';
  private nowSec: number = 0;

  aboutToAppear(): void {
    this.nowSec = Math.floor(Date.now() / 1000);
    this.load();
  }

  private context(): common.UIAbilityContext {
    return getContext(this) as common.UIAbilityContext;
  }

  private async load(): Promise<void> {
    const model: RecentModel = await RecentStore.load(this.context());
    this.favorites = model.favorites();
    this.recents = model.nonFavorites();
    this.empty = model.isEmpty();
  }

  private async refresh(): Promise<void> {
    this.nowSec = Math.floor(Date.now() / 1000);
    await this.load();
    this.status = $r('app.string.dlp_recents_status_refreshed');
  }

  private async clearRecents(): Promise<void> {
    const model: RecentModel = await RecentStore.clearRecents(this.context());
    this.favorites = model.favorites();
    this.recents = model.nonFavorites();
    this.empty = model.isEmpty();
    this.status = $r('app.string.dlp_recents_status_cleared');
  }

  private async toggleFavorite(item: RecentItem): Promise<void> {
    const model: RecentModel = await RecentStore.toggleFavorite(this.context(), item.id);
    this.favorites = model.favorites();
    this.recents = model.nonFavorites();
    this.status = item.favorite ? $r('app.string.dlp_recents_status_unfavorited') :
      $r('app.string.dlp_recents_status_favorited');
  }

  private async removeItem(item: RecentItem): Promise<void> {
    const model: RecentModel = await RecentStore.removeItem(this.context(), item.id);
    this.favorites = model.favorites();
    this.recents = model.nonFavorites();
    this.empty = model.isEmpty();
    this.status = $r('app.string.dlp_recents_status_removed');
  }

  private openDetail(item: RecentItem): void {
    AppStorage.setOrCreate('detailName', item.name);
    AppStorage.setOrCreate('detailUri', item.uri);
    AppStorage.setOrCreate('detailSize', -1);
    AppStorage.setOrCreate('detailModified', item.lastOpenedSec);
    router.pushUrl({ url: 'pages/DetailPage' });
  }

  build() {
    Column() {
      Row() {
        Image($r('app.media.ic_public_back'))
          .width('24vp')
          .height('24vp')
          .margin({ right: '12vp' })
          .id('recents_back')
          .onClick(() => {
            router.back();
          })
        Text($r('app.string.dlp_page_recents_title'))
          .fontSize('20vp')
          .fontWeight(700)
          .fontColor($r('app.color.font_color_182431'))
          .layoutWeight(1)
          .id('recents_title')
        Text($r('app.string.dlp_recents_refresh'))
          .fontSize('14vp')
          .fontColor($r('app.color.main_blue'))
          .margin({ right: '12vp' })
          .id('recents_refresh')
          .onClick(() => {
            this.refresh();
          })
        Text($r('app.string.dlp_recents_clear'))
          .fontSize('14vp')
          .fontColor($r('app.color.main_red'))
          .id('recents_clear')
          .onClick(() => {
            this.clearRecents();
          })
      }
      .width('100%')
      .padding({ left: '16vp', right: '16vp', top: '12vp', bottom: '12vp' })
      .backgroundColor($r('app.color.white_bg_color'))

      if (this.empty) {
        Column() {
          Text($r('app.string.dlp_recents_empty'))
            .fontSize('16vp')
            .fontColor($r('app.color.color_999999_grey'))
            .id('recents_empty')
        }
        .layoutWeight(1)
        .width('100%')
        .justifyContent(FlexAlign.Center)
      } else {
        Scroll() {
          Column() {
            if (this.favorites.length > 0) {
              Text($r('app.string.dlp_recents_favorite_section'))
                .fontSize('14vp')
                .fontColor($r('app.color.color_666666_grey'))
                .width('100%')
                .padding({ left: '16vp', top: '12vp', bottom: '6vp' })
                .id('favorite_section')
              ForEach(this.favorites, (item: RecentItem, index: number) => {
                this.ItemRow(item, index, 'fav')
              }, (item: RecentItem): string => 'fav_' + item.id)
            }
            Text($r('app.string.dlp_recents_recent_section'))
              .fontSize('14vp')
              .fontColor($r('app.color.color_666666_grey'))
              .width('100%')
              .padding({ left: '16vp', top: '12vp', bottom: '6vp' })
              .id('recent_section')
            ForEach(this.recents, (item: RecentItem, index: number) => {
              this.ItemRow(item, index, 'recent')
            }, (item: RecentItem): string => 'recent_' + item.id)
            if (this.status !== '') {
              Text(this.status)
                .fontSize('12vp')
                .fontColor($r('app.color.color_999999_grey'))
                .width('100%')
                .padding({ left: '16vp', top: '12vp', bottom: '12vp' })
                .id('recents_status')
            }
          }
          .width('100%')
        }
        .align(Alignment.TopStart)
        .layoutWeight(1)
        .width('100%')
        .scrollBar(BarState.Off)
      }
    }
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.index_background'))
  }

  @Builder
  ItemRow(item: RecentItem, index: number, prefix: string) {
    Row() {
      Column() {
        Text(item.name)
          .fontSize('16vp')
          .fontColor($r('app.color.font_color_182431'))
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .id(prefix + '_name_' + index.toString())
        Text($r('app.string.dlp_recents_opened_at', formatRelative(item.lastOpenedSec, this.nowSec, false)))
          .fontSize('12vp')
          .fontColor($r('app.color.color_666666_grey'))
          .margin({ top: '4vp' })
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
      .onClick(() => {
        this.openDetail(item);
      })
      Text(item.favorite ? '★' : '☆')
        .fontSize('20vp')
        .fontColor($r('app.color.main_blue'))
        .margin({ left: '8vp' })
        .id(prefix + '_fav_' + index.toString())
        .onClick(() => {
          this.toggleFavorite(item);
        })
      Text($r('app.string.dlp_recents_remove'))
        .fontSize('12vp')
        .fontColor($r('app.color.main_red'))
        .margin({ left: '12vp' })
        .id(prefix + '_remove_' + index.toString())
        .onClick(() => {
          this.removeItem(item);
        })
    }
    .width('100%')
    .padding({ left: '16vp', right: '16vp', top: '12vp', bottom: '12vp' })
    .backgroundColor($r('app.color.white_bg_color'))
    .margin({ bottom: '1vp' })
    .id(prefix + '_item_' + index.toString())
  }
}
