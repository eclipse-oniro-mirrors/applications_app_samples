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
 
import { AtomicServiceNavigation, AtomicServiceSearch, BackgroundTheme, GradientAlpha, MixMode } from '@kit.ArkUI';
import {
  DemoItem, DEMO_ITEMS, CATEGORIES, filterDemos, demoTitleRes, demoSubtitleRes, demoCategoryRes
} from '../model/DemoLogic';
import { DEFAULT_LAYOUT_PROFILE, DisplaySnapshot, LayoutProfile, buildLayoutProfile } from '../model/DeviceProfile';
import { LogItem } from '../model/LogStore';
import { HOME_LOG_LIMIT, RouteKey, StorageKeys } from '../common/AppConstants';
import { AppColors, AppRadius, AppSize, AppSpacing, AppText } from '../common/Theme';
import { Logger } from '../utils/Logger';
import { displayWatcher, readDeviceSnapshot } from '../utils/DeviceUtil';
import { LogPanel } from '../components/LogPanel';
import { NavigationDemo } from './demos/NavigationDemo';
import { SearchDemo } from './demos/SearchDemo';
import { TabsDemo } from './demos/TabsDemo';
import { WebDemo } from './demos/WebDemo';
import { DownloadDemo } from './demos/DownloadDemo';
import { HalfScreenDemo } from './demos/HalfScreenDemo';
import { CrossAbilityDemo } from './demos/CrossAbilityDemo';
import { SheetDemo } from './demos/SheetDemo';
import { PreferencesDemo } from './demos/PreferencesDemo';

@Entry
@Component
struct Index {
  navPathStack: NavPathStack = new NavPathStack();
  @StorageLink('navTitle') navTitle: string = '';
  @StorageLink('navGradient') navGradient: boolean = true;
  @StorageLink('navHideTitle') navHideTitle: boolean = false;
  @StorageLink('navSplit') navSplit: boolean = false;
  @StorageProp('layoutProfile') layout: LayoutProfile = DEFAULT_LAYOUT_PROFILE;
  @State keyword: string = '';
  @State category: string = '';
  @State categoryIndex: number = 0;
  private layoutInitialized: boolean = false;

  /** 读取字符串资源；用于需要与动态内容拼接或接口只接受 string 的场景 */
  private getString(resource: Resource): string {
    const context = this.getUIContext().getHostContext();
    if (context === undefined) {
      return '';
    }
    try {
      return context.resourceManager.getStringSync(resource.id);
    } catch (err) {
      return '';
    }
  }

  private navModeLabel(): string {
    return this.navSplit ? this.getString($r('app.string.nav_split')) : this.getString($r('app.string.nav_stack'));
  }

  private navBackgroundLabel(): string {
    return this.navGradient ? this.getString($r('app.string.nav_gradient')) : this.getString($r('app.string.nav_solid'));
  }

  private filteredDemos(): DemoItem[] {
    // 过滤仍使用逻辑分类值，显示文案由 category 单独维护，避免英文环境下过滤失效
    return filterDemos(DEMO_ITEMS, this.keyword, CATEGORIES[this.categoryIndex]);
  }

  aboutToAppear(): void {
    if (!AppStorage.has(StorageKeys.APP_LOGS)) {
      AppStorage.setOrCreate<LogItem[]>(StorageKeys.APP_LOGS, []);
    }
    if (this.navTitle === '') {
      this.navTitle = this.getString($r('app.string.nav_title_default'));
    }
    if (this.category === '') {
      this.category = this.getString($r('app.string.category_all'));
    }
    const snapshot = readDeviceSnapshot();
    AppStorage.setOrCreate(StorageKeys.LAYOUT_PROFILE, snapshot.profile);
    if (!this.layoutInitialized) {
      this.layoutInitialized = true;
      if (snapshot.profile.navSplitDefault && !this.navSplit) {
        this.navSplit = true;
      }
    }
    const watching = displayWatcher.attach((next: DisplaySnapshot) => {
      const profile = buildLayoutProfile(snapshot.profile.form, next);
      AppStorage.setOrCreate(StorageKeys.LAYOUT_PROFILE, profile);
      Logger.info('首页', '布局', `显示参数变化，重新计算布局：${profile.describe()}`);
    });
    if (!watching) {
      Logger.warn('首页', '布局', 'display change 监听注册失败，布局仅在启动时计算');
    }
    Logger.info('首页', '生命周期', '首页显示');
    Logger.info('首页', '布局',
      `deviceType=${snapshot.deviceType} ${snapshot.profile.describe()}`);
  }

  aboutToDisappear(): void {
    displayWatcher.detach();
    Logger.info('首页', '生命周期', '首页销毁');
  }

  @Builder
  homeContent() {
    Column() {
      Column() {
        AtomicServiceSearch({
          value: this.keyword,
          placeholder: this.getString($r('app.string.search_placeholder')),
          search: {
            searchButton: {
              searchButtonValue: $r('app.string.search_button')
            },
            onChange: (value: string) => {
              this.keyword = value;
            },
            onSubmit: (value: string) => {
              Logger.info('首页', '搜索',
                `提交关键字「${value.length > 0 ? value : '（空）'}」，命中 ${this.filteredDemos().length} 项`);
            }
          },
          select: {
            options: [
              { value: $r('app.string.category_all') },
              { value: $r('app.string.category_container') },
              { value: $r('app.string.category_interaction') },
              { value: $r('app.string.category_capability') }
            ],
            selected: this.categoryIndex,
            selectValue: this.category,
            onSelect: (index: number, selectValue: string) => {
              this.categoryIndex = index;
              this.category = selectValue;
              Logger.info('首页', '选择区',
                `切换到「${selectValue}」，命中 ${this.filteredDemos().length} 项`);
            }
          },
          operation: {
            auxiliaryItem: {
              value: $r('sys.media.ohos_ic_public_scan'),
              action: () => {
                Logger.info('首页', '功能区', '触发辅助功能位（扫一扫演示）');
              }
            },
            independentItem: {
              value: $r('sys.media.ohos_ic_public_share'),
              action: () => {
                Logger.info('首页', '功能区', '触发独立功能位（分享演示）');
              }
            }
          }
        })
          .width('100%')
      }
      .width('100%')
      .padding({ left: AppSpacing.PAGE, right: AppSpacing.PAGE, top: AppSpacing.XL, bottom: AppSpacing.MD })

      Scroll() {
        Row() {
          Column({ space: AppSpacing.XL }) {
            Row({ space: AppSpacing.LG }) {
              Column({ space: AppSpacing.XS }) {
                Text('AtomicServiceNavigation')
                  .fontSize(AppText.SECTION)
                  .fontWeight(FontWeight.Medium)
                  .fontColor(AppColors.TEXT_PRIMARY)
                Text(`${this.getString($r('app.string.nav_current'))}${this.navTitle} · ` +
                  `${this.navModeLabel()} · ${this.navBackgroundLabel()}`)
                  .fontSize(AppText.BODY)
                  .fontColor(AppColors.TEXT_SECONDARY)
                Text($r('app.string.layout_info', this.layout.form, this.layout.breakpoint, this.layout.columns,
                  this.layout.pickerSupported ? this.getString($r('app.string.available')) :
                    this.getString($r('app.string.unavailable'))))
                  .fontSize(AppText.SMALL)
                  .fontColor(AppColors.TEXT_TERTIARY)
              }
              .alignItems(HorizontalAlign.Start)
              .layoutWeight(1)

              Button($r('app.string.btn_adjust'))
                .fontSize(AppText.LABEL)
                .height(AppSize.BUTTON)
                .backgroundColor(AppColors.PRIMARY_SOFT)
                .fontColor(AppColors.PRIMARY)
                .onClick(() => {
                  Logger.info('首页', '导航', '打开 AtomicServiceNavigation 调节页');
                  this.navPathStack.pushPath({ name: RouteKey.NAVIGATION });
                })
            }
            .width('100%')
            .padding(AppSpacing.CARD)
            .backgroundColor(AppColors.CARD_BG)
            .borderRadius(AppRadius.LARGE)

            Row() {
              Text($r('app.string.catalog_title', this.filteredDemos().length))
                .fontSize(AppText.SECTION)
                .fontWeight(FontWeight.Medium)
                .fontColor(AppColors.TEXT_PRIMARY)
              Blank()
              Text(this.category)
                .fontSize(AppText.BODY)
                .fontColor(AppColors.PRIMARY)
            }
            .width('100%')

            GridRow({ columns: this.layout.columns, gutter: { x: AppSpacing.XL, y: AppSpacing.XL } }) {
              ForEach(this.filteredDemos(), (item: DemoItem) => {
                GridCol({ span: 1 }) {
                  this.demoCard(item)
                }
              }, (item: DemoItem) => item.key)
            }
            .width('100%')

            if (this.filteredDemos().length === 0) {
              Text($r('app.string.home_empty'))
                .fontSize(AppText.LABEL)
                .fontColor(AppColors.TEXT_MUTED)
                .width('100%')
                .padding(AppSpacing.LARGE)
                .backgroundColor(AppColors.CARD_BG)
                .borderRadius(AppRadius.LARGE)
            }

            LogPanel({ title: this.getString($r('app.string.home_log_title')), maxItems: HOME_LOG_LIMIT })
          }
          .width('100%')
          .constraintSize({ maxWidth: this.layout.pageMaxWidth })
          .padding({ left: AppSpacing.PAGE, right: AppSpacing.PAGE, bottom: AppSpacing.PAGE })
        }
        .width('100%')
        .justifyContent(FlexAlign.Center)
      }
      .layoutWeight(1)
      .align(Alignment.TopStart)
      .scrollBar(BarState.Auto)
    }
    .width('100%')
    .height('100%')
    .linearGradient(this.navGradient ? {
      angle: 180,
      colors: [[AppColors.GRADIENT_PRIMARY, 0], [AppColors.GRADIENT_SECONDARY, 0.55],
        [AppColors.GRADIENT_SECONDARY, 1]]
    } : {
      angle: 180,
      colors: [[AppColors.PAGE_BG, 0], [AppColors.PAGE_BG, 1]]
    })
    .padding({ bottom: AppSpacing.XLARGE })
  }

  @Builder
  demoCard(item: DemoItem) {
    Row({ space: AppSpacing.XL }) {
      Column({ space: AppSpacing.XS }) {
        Row({ space: AppSpacing.MD }) {
          Text(demoTitleRes(item.key))
            .fontSize(AppText.SECTION)
            .fontWeight(FontWeight.Medium)
            .fontColor(AppColors.TEXT_PRIMARY)
          Text(demoCategoryRes(item.key))
            .fontSize(AppText.CAPTION)
            .fontColor(AppColors.PRIMARY)
            .backgroundColor(AppColors.PRIMARY_SOFT)
            .borderRadius(AppRadius.TAG)
            .padding({ left: 6, right: 6, top: 2, bottom: 2 })
        }

        Text(demoSubtitleRes(item.key))
          .fontSize(AppText.BODY)
          .fontColor(AppColors.TEXT_SECONDARY)
          .maxLines(2)
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

      Text($r('app.string.action_enter'))
        .fontSize(AppText.BODY)
        .fontColor(AppColors.PRIMARY)
    }
    .width('100%')
    .padding(AppSpacing.CARD)
    .backgroundColor(AppColors.CARD_BG)
    .borderRadius(AppRadius.LARGE)
    .onClick(() => {
      Logger.info('首页', '导航', `打开 ${item.title}`);
      this.navPathStack.pushPath({ name: item.key });
    })
  }

  @Builder
  pageMap(name: string) {
    if (name === RouteKey.NAVIGATION) {
      NavDestination() {
        NavigationDemo({ navPathStack: this.navPathStack })
      }
      .title('AtomicServiceNavigation')
    } else if (name === RouteKey.SEARCH) {
      NavDestination() {
        SearchDemo({ navPathStack: this.navPathStack })
      }
      .title('AtomicServiceSearch')
    } else if (name === RouteKey.TABS) {
      NavDestination() {
        TabsDemo({ navPathStack: this.navPathStack })
      }
      .title('AtomicServiceTabs')
    } else if (name === RouteKey.WEB) {
      NavDestination() {
        WebDemo({ navPathStack: this.navPathStack })
      }
      .title('AtomicServiceWeb')
    } else if (name === RouteKey.DOWNLOAD) {
      NavDestination() {
        DownloadDemo({ navPathStack: this.navPathStack })
      }
      .title('DownloadFileButton')
    } else if (name === RouteKey.HALF_SCREEN) {
      NavDestination() {
        HalfScreenDemo({ navPathStack: this.navPathStack })
      }
      .title('HalfScreenLaunchComponent')
    } else if (name === RouteKey.JUMP) {
      NavDestination() {
        CrossAbilityDemo({ navPathStack: this.navPathStack })
      }
      .title($r('app.string.dest_jump'))
    } else if (name === RouteKey.SHEET) {
      NavDestination() {
        SheetDemo({ navPathStack: this.navPathStack })
      }
      .title($r('app.string.dest_sheet'))
    } else if (name === RouteKey.PREFS) {
      NavDestination() {
        PreferencesDemo({ navPathStack: this.navPathStack })
      }
      .title($r('app.string.dest_prefs'))
    }
  }

  build() {
    Column() {
      AtomicServiceNavigation({
        navigationContent: () => {
          this.homeContent()
        },
        title: this.navTitle,
        titleOptions: {
          isBlurEnabled: false,
          backgroundColor: AppColors.CARD_BG
        },
        gradientBackground: this.navGradient ? {
          primaryColor: AppColors.GRADIENT_PRIMARY,
          secondaryColor: AppColors.GRADIENT_SECONDARY,
          backgroundTheme: BackgroundTheme.LIGHT,
          mixMode: MixMode.TOWARDS,
          alpha: GradientAlpha.OPACITY_100
        } : undefined,
        navDestinationBuilder: this.pageMap,
        navPathStack: this.navPathStack,
        mode: this.navSplit ? NavigationMode.Split : NavigationMode.Stack,
        hideTitleBar: this.navHideTitle
      })
        .width('100%')
        .height('100%')
    }
    .width('100%')
    .height('100%')
  }
}
