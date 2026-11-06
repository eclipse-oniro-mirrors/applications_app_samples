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
import { ActionButton, StatusChip, WidgetTone } from '../components/CommonWidgets';
import { LogPanel } from '../components/LogPanel';
import { ExtraConfigDemo } from './demos/ExtraConfigDemo';
import { InputMethodListDemo } from './demos/InputMethodListDemo';
import { PanelDemo } from './demos/PanelDemo';

const SYSCAP_NAME: string = 'SystemCapability.MiscServices.InputMethodFramework';
const NAV_TITLE: string = '输入法扩展';
const SUBTITLE: string = 'IME Kit：扩展信息、输入法列表与面板';

@Entry
@Component
struct Index {
  navPathStack: NavPathStack = new NavPathStack();
  @State keyword: string = '';
  @State syscapText: string = '未检测';
  @State syscapTone: WidgetTone = WidgetTone.NEUTRAL;

  private visibleFeatures(): FeatureEntry[] {
    return filterFeatures(this.keyword);
  }

  aboutToAppear(): void {
    if (!AppStorage.has(StorageKeys.APP_LOGS)) {
      AppStorage.setOrCreate<LogItem[]>(StorageKeys.APP_LOGS, []);
    }
    this.readSyscap();
    Logger.info('首页', '生命周期', `首页显示，目录 ${FEATURES.length} 项`);
  }

  aboutToDisappear(): void {
    Logger.info('首页', '生命周期', '首页销毁');
  }

  /**
   * 先看 syscap 再谈接口是否可用：
   * 未声明时后续调用会统一拿 801，此时去改入参或换时序都是白费功夫。
   */
  private readSyscap(): void {
    const supported: boolean = canIUse(SYSCAP_NAME);
    this.syscapText = supported ? '已声明' : '未声明';
    this.syscapTone = supported ? WidgetTone.SUCCESS : WidgetTone.DANGER;
    Logger.info('首页', 'syscap', `canIUse(${SYSCAP_NAME}) = ${supported}`);
  }

  private openDemo(item: FeatureEntry): void {
    Logger.info('首页', '导航', `打开 ${item.title}`);
    this.navPathStack.pushPath({ name: item.id });
  }

  @Builder
  header() {
    Column({ space: AppSpacing.XS }) {
      Text(NAV_TITLE)
        .fontSize(AppText.DISPLAY)
        .fontWeight(FontWeight.Bold)
        .fontColor(AppColors.TEXT_PRIMARY)
        .width('100%')
      Text(SUBTITLE)
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
        Text('系统能力')
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
      Text('本模块不需要申请权限；module.json5 已注册 type 为 inputMethod 的扩展，' +
        '但"被系统拉起为输入法"还要求用户在设置里启用它。')
        .fontSize(AppText.CAPTION)
        .fontColor(AppColors.TEXT_MUTED)
        .width('100%')
      ActionButton({
        label: '重新检测系统能力',
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
      TextInput({ placeholder: '搜索能力，例如 扩展、列表、面板', text: this.keyword })
        .fontSize(AppText.BODY)
        .height(AppSize.BUTTON_MD)
        .backgroundColor(AppColors.SUBTLE_BG)
        .borderRadius(AppRadius.SMALL)
        .layoutWeight(1)
        .onChange((value: string) => {
          this.keyword = value;
        })
      Text(`${this.visibleFeatures().length} 项`)
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
        Text(item.title)
          .fontSize(AppText.SECTION)
          .fontWeight(FontWeight.Medium)
          .fontColor(AppColors.TEXT_PRIMARY)
          .layoutWeight(1)
        Text('进入')
          .fontSize(AppText.BODY)
          .fontColor(AppColors.PRIMARY)
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)

      Text(item.subtitle)
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
      Text('本示例未覆盖的部分')
        .fontSize(AppText.SECTION)
        .fontWeight(FontWeight.Medium)
        .fontColor(AppColors.TEXT_PRIMARY)
        .width('100%')
      Text(uncoveredSummary())
        .fontSize(AppText.CAPTION)
        .fontColor(AppColors.TEXT_TERTIARY)
        .width('100%')
      Text('两项都需要"本应用已被启用为输入法并连上真实编辑框"，不是接口能否使用的问题，' +
        '所以这里只写"未覆盖"和原因。')
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
      .title('扩展信息')
    } else if (name === FeatureId.LIST) {
      NavDestination() {
        InputMethodListDemo()
      }
      .title('输入法列表')
    } else if (name === FeatureId.PANEL) {
      NavDestination() {
        PanelDemo()
      }
      .title('面板与模式')
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
              Text('没有匹配的能力，试试清空搜索词')
                .fontSize(AppText.LABEL)
                .fontColor(AppColors.TEXT_MUTED)
                .width('100%')
                .padding(AppSpacing.LARGE)
                .backgroundColor(AppColors.CARD_BG)
                .borderRadius(AppRadius.LARGE)
            }

            this.uncoveredCard()
            LogPanel({ title: '首页事件', maxItems: HOME_LOG_LIMIT })
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
    .title(NAV_TITLE)
    .titleMode(NavigationTitleMode.Mini)
    .mode(NavigationMode.Stack)
    .navDestination(this.pageMap)
    .width('100%')
    .height('100%')
  }
}
