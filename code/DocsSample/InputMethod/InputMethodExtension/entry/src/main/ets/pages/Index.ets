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
 * 首页：IME Kit 输入法扩展示例的入口。
 *
 * 三张能力卡片与三个演示页一一对应；页面顶部先给 syscap 与"本应用已注册输入法扩展"
 * 这条前提，因为能否被系统拉起为输入法，决定后面所有面板与输入回调能否发生。
 */

import { HOME_LOG_LIMIT, StorageKeys } from '../common/AppConstants';
import { AppColors, AppRadius, AppSize, AppSpacing, AppText } from '../common/Theme';
import { LogItem } from '../model/LogStore';
import { FEATURES, FeatureEntry, FeatureId, filterFeatures, uncoveredSummary } from '../model/FeatureCatalog';
import { Logger } from '../utils/Logger';
import { ActionButton, StatusChip, WidgetTone, textOfResource } from '../components/CommonWidgets';
import { LogPanel } from '../components/LogPanel';
import { ExtraConfigDemo } from './demos/ExtraConfigDemo';
import { InputMethodListDemo } from './demos/InputMethodListDemo';
import { PanelDemo } from './demos/PanelDemo';

const SYSCAP_NAME: string = 'SystemCapability.MiscServices.InputMethodFramework';

@Entry
@Component
struct Index {
  navPathStack: NavPathStack = new NavPathStack();
  @State keyword: string = '';
  @State syscapText: ResourceStr = $r('app.string.index_syscap_untested');
  @State syscapTone: WidgetTone = WidgetTone.NEUTRAL;

  /** Navigation / NavDestination 的 title 只接受字符串，这里按资源 id 取出本地化文案 */
  private textOf(res: Resource): string {
    return textOfResource(this.getUIContext().getHostContext(), res);
  }

  private visibleFeatures(): FeatureEntry[] {
    return filterFeatures(this.keyword);
  }

  aboutToAppear(): void {
    if (!AppStorage.has(StorageKeys.APP_LOGS)) {
      AppStorage.setOrCreate<LogItem[]>(StorageKeys.APP_LOGS, []);
    }
    this.readSyscap();
    Logger.info('Home', 'Lifecycle', `page shown, catalog size ${FEATURES.length}`);
  }

  aboutToDisappear(): void {
    Logger.info('Home', 'Lifecycle', 'page destroyed');
  }

  /**
   * 先看 syscap 再谈接口是否可用：
   * 未声明时后续调用会统一拿 801，此时去改入参或换时序都是白费功夫。
   */
  private readSyscap(): void {
    const supported: boolean = canIUse(SYSCAP_NAME);
    this.syscapText = supported ? $r('app.string.index_syscap_declared') : $r('app.string.index_syscap_undeclared');
    this.syscapTone = supported ? WidgetTone.SUCCESS : WidgetTone.DANGER;
    Logger.info('Home', 'syscap', `canIUse(${SYSCAP_NAME}) = ${supported}`);
  }

  private openDemo(item: FeatureEntry): void {
    Logger.info('Home', 'Nav', `open ${item.titleText()}`);
    this.navPathStack.pushPath({ name: item.id });
  }

  @Builder
  header() {
    Column({ space: AppSpacing.XS }) {
      Text($r('app.string.index_nav_title'))
        .fontSize(AppText.DISPLAY)
        .fontWeight(FontWeight.Bold)
        .fontColor(AppColors.TEXT_PRIMARY)
        .width('100%')
      Text($r('app.string.index_subtitle'))
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
        Text($r('app.string.index_syscap_title'))
          .fontSize(AppText.SECTION)
          .fontWeight(FontWeight.Medium)
          .fontColor(AppColors.TEXT_PRIMARY)
        Blank()
        StatusChip({ text: this.syscapText, tone: this.syscapTone })
      }
      .width('100%')

      Text(SYSCAP_NAME)
        .fontSize(AppText.SMALL)
        .fontColor(AppColors.TEXT_TERTIARY)
        .width('100%')
      Text($r('app.string.index_syscap_note'))
        .fontSize(AppText.CAPTION)
        .fontColor(AppColors.TEXT_MUTED)
        .width('100%')
      ActionButton({
        label: $r('app.string.index_recheck'),
        tone: WidgetTone.NEUTRAL,
        onAction: () => {
          this.readSyscap();
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
      TextInput({ placeholder: $r('app.string.index_search_hint'), text: this.keyword })
        .fontSize(AppText.BODY)
        .height(AppSize.BUTTON_MD)
        .backgroundColor(AppColors.SUBTLE_BG)
        .borderRadius(AppRadius.SMALL)
        .layoutWeight(1)
        .onChange((value: string) => {
          this.keyword = value;
        })
      Text($r('app.string.common_count_items', this.visibleFeatures().length))
        .fontSize(AppText.BODY)
        .fontColor(AppColors.TEXT_TERTIARY)
    }
    .width('100%')
  }

  @Builder
  featureCard(item: FeatureEntry) {
    Column({ space: AppSpacing.XS }) {
      Row({ space: AppSpacing.MD }) {
        Text(item.id.toUpperCase())
          .fontSize(AppText.CAPTION)
          .fontColor(AppColors.PRIMARY)
          .backgroundColor(AppColors.PRIMARY_SOFT)
          .borderRadius(AppRadius.TAG)
          .padding({ left: 6, right: 6, top: 2, bottom: 2 })
        Text(item.titleText())
          .fontSize(AppText.SECTION)
          .fontWeight(FontWeight.Medium)
          .fontColor(AppColors.TEXT_PRIMARY)
          .layoutWeight(1)
        Text($r('app.string.index_enter'))
          .fontSize(AppText.BODY)
          .fontColor(AppColors.PRIMARY)
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)

      Text(item.subtitleText())
        .fontSize(AppText.BODY)
        .fontColor(AppColors.TEXT_SECONDARY)
        .width('100%')
      Text(item.apiSummary())
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
  uncoveredCard() {
    Column({ space: AppSpacing.XS }) {
      Text($r('app.string.index_uncovered_title'))
        .fontSize(AppText.SECTION)
        .fontWeight(FontWeight.Medium)
        .fontColor(AppColors.TEXT_PRIMARY)
        .width('100%')
      Text(uncoveredSummary())
        .fontSize(AppText.CAPTION)
        .fontColor(AppColors.TEXT_TERTIARY)
        .width('100%')
      Text($r('app.string.index_uncovered_note'))
        .fontSize(AppText.CAPTION)
        .fontColor(AppColors.TEXT_MUTED)
        .width('100%')
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding(AppSpacing.CARD)
    .backgroundColor(AppColors.SUBTLE_BG)
    .borderRadius(AppRadius.LARGE)
  }

  @Builder
  pageMap(name: string) {
    if (name === FeatureId.EXTRA) {
      NavDestination() {
        ExtraConfigDemo()
      }
      .title(this.textOf($r('app.string.nav_extra_title')))
    } else if (name === FeatureId.LIST) {
      NavDestination() {
        InputMethodListDemo()
      }
      .title(this.textOf($r('app.string.nav_list_title')))
    } else if (name === FeatureId.PANEL) {
      NavDestination() {
        PanelDemo()
      }
      .title(this.textOf($r('app.string.nav_panel_title')))
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

            ForEach(this.visibleFeatures(), (item: FeatureEntry) => {
              this.featureCard(item)
            }, (item: FeatureEntry) => item.id)

            if (this.visibleFeatures().length === 0) {
              Text($r('app.string.index_empty_search'))
                .fontSize(AppText.LABEL)
                .fontColor(AppColors.TEXT_MUTED)
                .width('100%')
                .padding(AppSpacing.LARGE)
                .backgroundColor(AppColors.CARD_BG)
                .borderRadius(AppRadius.LARGE)
            }

            this.uncoveredCard()
            LogPanel({ title: $r('app.string.index_log_title'), maxItems: HOME_LOG_LIMIT })
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
    .title(this.textOf($r('app.string.index_nav_title')))
    .titleMode(NavigationTitleMode.Mini)
    .mode(NavigationMode.Stack)
    .navDestination(this.pageMap)
    .width('100%')
    .height('100%')
  }
}
