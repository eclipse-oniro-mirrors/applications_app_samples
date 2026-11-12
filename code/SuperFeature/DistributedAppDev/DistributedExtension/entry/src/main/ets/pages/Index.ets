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

/**
 * 首页：把「分布式扩展 / 链路增强 / 代理通道」三条能力做成可进入的卡片，
 * 顶部先给出本机的三个前置条件（syscap、DISTRIBUTED_DATASYNC、ACCESS_BLUETOOTH），
 * 让读者在点进演示页之前就知道这台设备能不能真跑。
 */

import { common } from '@kit.AbilityKit';
import {
  BLUETOOTH_PERMISSION, DATASYNC_PERMISSION, HOME_LOG_LIMIT, RouteKey, StorageKeys
} from '../common/AppConstants';
import { AppColors, AppRadius, AppSize, AppSpacing, AppText } from '../common/Theme';
import { text, text1 } from '../common/StringResource';
import { ActionButton, StatusChip, WidgetTone } from '../components/CommonWidgets';
import { LogPanel } from '../components/LogPanel';
import {
  FEATURE_METAS, FeatureMeta, entryText, filterFeatures, permissionText, summaryText, titleText
} from '../model/DistributedCatalog';
import { LogItem, LogLevel } from '../model/LogStore';
import { probeSyscap } from '../utils/DistributedProbe';
import { Logger } from '../utils/Logger';
import { PermissionOutcome, checkPermission, requestPermissions } from '../utils/PermissionUtil';
import { ExtensionDemo } from './demos/ExtensionDemo';
import { LinkEnhanceDemo } from './demos/LinkEnhanceDemo';
import { ProxyChannelDemo } from './demos/ProxyChannelDemo';

@Entry
@Component
struct Index {
  navPathStack: NavPathStack = new NavPathStack();
  @State keyword: string = '';
  @State syscapText: string = text('home_syscap_unread');
  @State syscapSupported: boolean = false;
  @State datasyncText: string = text('home_query_unread');
  @State datasyncGranted: boolean = false;
  @State bluetoothText: string = text('home_query_unread');
  @State bluetoothGranted: boolean = false;

  private filteredFeatures(): FeatureMeta[] {
    return filterFeatures(this.keyword);
  }

  aboutToAppear(): void {
    if (!AppStorage.has(StorageKeys.APP_LOGS)) {
      AppStorage.setOrCreate<LogItem[]>(StorageKeys.APP_LOGS, []);
    }
    this.readSyscap();
    this.readPermissions();
    Logger.info('Home', 'Lifecycle', `home shown, catalog=${FEATURE_METAS.length}`);
  }

  aboutToDisappear(): void {
    Logger.info('Home', 'Lifecycle', 'home destroyed');
  }

  private readSyscap(): void {
    const outcome = probeSyscap();
    this.syscapSupported = outcome.succeeded();
    this.syscapText = outcome.succeeded() ? text('home_syscap_declared') :
      text1('home_syscap_undeclared', `${outcome.code}`);
    Logger.record(outcome.succeeded() ? LogLevel.INFO : LogLevel.ERROR, 'Home', 'syscap', outcome.describe());
  }

  private readPermissions(): void {
    const datasync: PermissionOutcome = checkPermission(DATASYNC_PERMISSION);
    this.datasyncGranted = datasync.granted;
    this.datasyncText = datasync.granted ? text('home_granted') : text('home_not_granted');
    const bluetooth: PermissionOutcome = checkPermission(BLUETOOTH_PERMISSION);
    this.bluetoothGranted = bluetooth.granted;
    this.bluetoothText = bluetooth.granted ? text('home_granted') : text('home_not_granted');
  }

  private async requestPermission(): Promise<void> {
    const host = this.getUIContext().getHostContext();
    if (host === undefined) {
      Logger.warn('Home', 'Permission', 'getHostContext returned undefined, skip request');
      return;
    }
    const message = await requestPermissions(host as common.UIAbilityContext);
    Logger.info('Home', 'Permission', message);
    this.readPermissions();
  }

  private openDemo(item: FeatureMeta): void {
    Logger.info('Home', 'Nav', `open ${item.kind}`);
    this.navPathStack.pushPath({ name: item.kind });
  }

  private toneOf(granted: boolean): WidgetTone {
    return granted ? WidgetTone.SUCCESS : WidgetTone.WARNING;
  }

  @Builder
  header() {
    Column({ space: AppSpacing.XS }) {
      Text($r('app.string.app_title'))
        .fontSize(AppText.DISPLAY)
        .fontWeight(FontWeight.Bold)
        .fontColor(AppColors.TEXT_PRIMARY)
        .width('100%')
      Text($r('app.string.app_subtitle'))
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
        Text($r('app.string.home_precondition'))
          .fontSize(AppText.SECTION)
          .fontWeight(FontWeight.Medium)
          .fontColor(AppColors.TEXT_PRIMARY)
        Blank()
        StatusChip({
          text: this.syscapText,
          tone: this.syscapSupported ? WidgetTone.SUCCESS : WidgetTone.DANGER
        })
      }
      .width('100%')

      Row({ space: AppSpacing.MD }) {
        Text('DISTRIBUTED_DATASYNC')
          .fontSize(AppText.SMALL)
          .fontColor(AppColors.TEXT_TERTIARY)
          .layoutWeight(1)
        StatusChip({ text: this.datasyncText, tone: this.toneOf(this.datasyncGranted) })
      }
      .width('100%')

      Row({ space: AppSpacing.MD }) {
        Text('ACCESS_BLUETOOTH')
          .fontSize(AppText.SMALL)
          .fontColor(AppColors.TEXT_TERTIARY)
          .layoutWeight(1)
        StatusChip({ text: this.bluetoothText, tone: this.toneOf(this.bluetoothGranted) })
      }
      .width('100%')

      ActionButton({
        label: text('home_request_perms'),
        tone: WidgetTone.WARNING,
        onAction: () => {
          this.requestPermission();
        }
      })

      Text($r('app.string.home_perm_note'))
        .fontSize(AppText.CAPTION)
        .fontColor(AppColors.TEXT_MUTED)
        .width('100%')
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
      TextInput({ placeholder: $r('app.string.home_search_hint'), text: this.keyword })
        .fontSize(AppText.BODY)
        .height(AppSize.BUTTON_MD)
        .backgroundColor(AppColors.SUBTLE_BG)
        .borderRadius(AppRadius.SMALL)
        .layoutWeight(1)
        .onChange((value: string) => {
          this.keyword = value;
        })
      Text($r('app.string.home_count', this.filteredFeatures().length))
        .fontSize(AppText.BODY)
        .fontColor(AppColors.TEXT_TERTIARY)
    }
    .width('100%')
  }

  @Builder
  featureCard(item: FeatureMeta) {
    Column({ space: AppSpacing.XS }) {
      Row({ space: AppSpacing.MD }) {
        Text(item.code)
          .fontSize(AppText.CAPTION)
          .fontColor(AppColors.PRIMARY)
          .backgroundColor(AppColors.PRIMARY_SOFT)
          .borderRadius(AppRadius.TAG)
          .padding({ left: 6, right: 6, top: 2, bottom: 2 })
        Text(titleText(item))
          .fontSize(AppText.SECTION)
          .fontWeight(FontWeight.Medium)
          .fontColor(AppColors.TEXT_PRIMARY)
          .layoutWeight(1)
        Text($r('app.string.home_enter'))
          .fontSize(AppText.BODY)
          .fontColor(AppColors.PRIMARY)
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)

      Text(summaryText(item))
        .fontSize(AppText.BODY)
        .fontColor(AppColors.TEXT_SECONDARY)
        .width('100%')
      Text(`${item.apiName} · ${entryText(item)}`)
        .fontSize(AppText.CAPTION)
        .fontColor(AppColors.TEXT_TERTIARY)
        .width('100%')
      Text(permissionText(item))
        .fontSize(AppText.CAPTION)
        .fontColor(AppColors.TEXT_MUTED)
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
    if (name === RouteKey.EXTENSION) {
      NavDestination() {
        ExtensionDemo({ navPathStack: this.navPathStack })
      }
      .title($r('app.string.catalog_ext_title'))
    } else if (name === RouteKey.LINK) {
      NavDestination() {
        LinkEnhanceDemo({ navPathStack: this.navPathStack })
      }
      .title($r('app.string.catalog_link_title'))
    } else if (name === RouteKey.CHANNEL) {
      NavDestination() {
        ProxyChannelDemo({ navPathStack: this.navPathStack })
      }
      .title($r('app.string.catalog_chan_title'))
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

            ForEach(this.filteredFeatures(), (item: FeatureMeta) => {
              this.featureCard(item)
            }, (item: FeatureMeta) => item.code)

            if (this.filteredFeatures().length === 0) {
              Text($r('app.string.home_no_match'))
                .fontSize(AppText.LABEL)
                .fontColor(AppColors.TEXT_MUTED)
                .width('100%')
                .padding(AppSpacing.LARGE)
                .backgroundColor(AppColors.CARD_BG)
                .borderRadius(AppRadius.LARGE)
            }

            LogPanel({ title: $r('app.string.log_title_home'), maxItems: HOME_LOG_LIMIT })
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
    .title($r('app.string.app_title'))
    .titleMode(NavigationTitleMode.Mini)
    .mode(NavigationMode.Stack)
    .navDestination(this.pageMap)
    .width('100%')
    .height('100%')
  }
}
