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

import { appSubtitle, defaultNavTitle, HOME_LOG_LIMIT, RouteKey, StorageKeys } from '../common/AppConstants';
import { text } from '../common/StringResource';
import { AppColors, AppRadius, AppSize, AppSpacing, AppText } from '../common/Theme';
import { LogItem } from '../model/LogStore';
import { PROFILE_METAS, ProfileMeta, filterProfiles } from '../model/ProfileCatalog';
import { BluetoothStateResult, readBluetoothState } from '../utils/BluetoothAccess';
import { Logger } from '../utils/Logger';
import { PermissionOutcome, checkBluetoothPermission } from '../utils/PermissionUtil';
import { ActionButton, StatusChip, WidgetTone } from '../components/CommonWidgets';
import { LogPanel } from '../components/LogPanel';
import { HfpDemo } from './demos/HfpDemo';

/** 首页：HFP（AG 角色）的入口，列出 Profile 并提供搜索与蓝牙开关概览 */
@Entry
@Component
struct Index {
  navPathStack: NavPathStack = new NavPathStack();
  @State keyword: string = '';
  @State bluetoothText: string = text('state_unread');
  @State bluetoothTone: WidgetTone = WidgetTone.NEUTRAL;
  @State permissionText: string = text('state_unqueried');

  private filteredProfiles(): ProfileMeta[] {
    return filterProfiles(this.keyword);
  }

  aboutToAppear(): void {
    if (!AppStorage.has(StorageKeys.APP_LOGS)) {
      AppStorage.setOrCreate<LogItem[]>(StorageKeys.APP_LOGS, []);
    }
    const permission: PermissionOutcome = checkBluetoothPermission();
    this.permissionText = permission.describe();
    this.readState();
    Logger.info('Index', 'lifecycle', `page shown, catalog size=${PROFILE_METAS.length}`);
  }

  aboutToDisappear(): void {
    Logger.info('Index', 'lifecycle', 'page destroyed');
  }

  private readState(): void {
    const result: BluetoothStateResult = readBluetoothState();
    this.bluetoothText = result.describe();
    this.bluetoothTone = result.code === 0 ? WidgetTone.SUCCESS : WidgetTone.DANGER;
  }

  private openDemo(item: ProfileMeta): void {
    Logger.info('Index', 'navigation', `open profile, code=${item.code}`);
    this.navPathStack.pushPath({ name: item.kind });
  }

  @Builder
  header() {
    Column({ space: AppSpacing.XS }) {
      Text(defaultNavTitle())
        .fontSize(AppText.DISPLAY)
        .fontWeight(FontWeight.Bold)
        .fontColor(AppColors.TEXT_PRIMARY)
        .width('100%')
      Text(appSubtitle())
        .fontSize(AppText.LABEL)
        .fontColor(AppColors.TEXT_SECONDARY)
        .width('100%')
    }
    .width('100%')
    .padding({ left: AppSpacing.PAGE, right: AppSpacing.PAGE, top: AppSpacing.XL, bottom: AppSpacing.MD })
    .backgroundColor(AppColors.CARD_BG)
  }

  @Builder
  overview() {
    Column({ space: AppSpacing.MD }) {
      Row({ space: AppSpacing.MD }) {
        Text(text('home_section_bluetooth'))
          .fontSize(AppText.SECTION)
          .fontWeight(FontWeight.Medium)
          .fontColor(AppColors.TEXT_PRIMARY)
        Blank()
        StatusChip({ text: this.bluetoothText, tone: this.bluetoothTone })
      }
      .width('100%')

      Text(this.permissionText)
        .fontSize(AppText.SMALL)
        .fontColor(AppColors.TEXT_TERTIARY)
        .width('100%')
      Text(text('home_hint'))
        .fontSize(AppText.CAPTION)
        .fontColor(AppColors.TEXT_MUTED)
        .width('100%')
      ActionButton({
        label: text('home_action_refresh'),
        tone: WidgetTone.NEUTRAL,
        onAction: () => {
          this.readState();
        }
      })
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding(AppSpacing.CARD)
    .backgroundColor(AppColors.CARD_BG)
    .borderRadius(AppRadius.LARGE)
  }

  @Builder
  searchBar() {
    Row({ space: AppSpacing.MD }) {
      TextInput({ placeholder: text('home_search_placeholder'), text: this.keyword })
        .fontSize(AppText.BODY)
        .height(AppSize.BUTTON_MD)
        .backgroundColor(AppColors.SUBTLE_BG)
        .borderRadius(AppRadius.SMALL)
        .layoutWeight(1)
        .onChange((value: string) => {
          this.keyword = value;
        })
      Text(text('home_count', this.filteredProfiles().length))
        .fontSize(AppText.BODY)
        .fontColor(AppColors.TEXT_TERTIARY)
    }
    .width('100%')
  }

  @Builder
  profileCard(item: ProfileMeta) {
    Column({ space: AppSpacing.XS }) {
      Row({ space: AppSpacing.MD }) {
        Text(item.code)
          .fontSize(AppText.CAPTION)
          .fontColor(AppColors.PRIMARY)
          .backgroundColor(AppColors.PRIMARY_SOFT)
          .borderRadius(AppRadius.TAG)
          .padding({ left: 6, right: 6, top: 2, bottom: 2 })
        Text(item.title)
          .fontSize(AppText.SECTION)
          .fontWeight(FontWeight.Medium)
          .fontColor(AppColors.TEXT_PRIMARY)
          .layoutWeight(1)
        Text(text('home_enter'))
          .fontSize(AppText.BODY)
          .fontColor(AppColors.PRIMARY)
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)

      Text(item.summary)
        .fontSize(AppText.BODY)
        .fontColor(AppColors.TEXT_SECONDARY)
        .width('100%')
      Text(`${item.apiName} · ${item.createFunction}`)
        .fontSize(AppText.CAPTION)
        .fontColor(AppColors.TEXT_TERTIARY)
        .width('100%')
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding(AppSpacing.CARD)
    .backgroundColor(AppColors.CARD_BG)
    .borderRadius(AppRadius.LARGE)
    .onClick(() => {
      this.openDemo(item);
    })
  }

  @Builder
  pageMap(name: string) {
    if (name === RouteKey.HFP) {
      NavDestination() {
        HfpDemo({ navPathStack: this.navPathStack })
      }
      .title(text('catalog_hfp_title'))
    }
  }

  build() {
    Navigation(this.navPathStack) {
      Column() {
        this.header()
        Scroll() {
          Column({ space: AppSpacing.XL }) {
            this.overview()
            this.searchBar()

            ForEach(this.filteredProfiles(), (item: ProfileMeta) => {
              this.profileCard(item)
            }, (item: ProfileMeta) => item.code)

            if (this.filteredProfiles().length === 0) {
              Text(text('home_empty'))
                .fontSize(AppText.LABEL)
                .fontColor(AppColors.TEXT_MUTED)
                .width('100%')
                .padding(AppSpacing.LARGE)
                .backgroundColor(AppColors.CARD_BG)
                .borderRadius(AppRadius.LARGE)
            }

            LogPanel({ title: text('home_log_title'), maxItems: HOME_LOG_LIMIT })
          }
          .width('100%')
          .padding({ left: AppSpacing.PAGE, right: AppSpacing.PAGE, bottom: AppSpacing.PAGE })
        }
        .layoutWeight(1)
        .align(Alignment.TopStart)
        .scrollBar(BarState.Auto)
      }
      .width('100%')
      .height('100%')
      .backgroundColor(AppColors.PAGE_BG)
    }
    .title(defaultNavTitle())
    .titleMode(NavigationTitleMode.Mini)
    .mode(NavigationMode.Stack)
    .navDestination(this.pageMap)
    .width('100%')
    .height('100%')
  }
}
