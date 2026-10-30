import { AtomicServiceNavigation, AtomicServiceSearch, BackgroundTheme, GradientAlpha, MixMode } from '@kit.ArkUI';
import { DemoItem, DEMO_ITEMS, filterDemos } from '../model/DemoLogic';
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

@Entry
@Component
struct Index {
  navPathStack: NavPathStack = new NavPathStack();
  @StorageLink('navTitle') navTitle: string = '原子化服务组件';
  @StorageLink('navGradient') navGradient: boolean = true;
  @StorageLink('navHideTitle') navHideTitle: boolean = false;
  @StorageLink('navSplit') navSplit: boolean = false;
  @StorageProp('layoutProfile') layout: LayoutProfile = DEFAULT_LAYOUT_PROFILE;
  @State keyword: string = '';
  @State category: string = '全部';
  @State categoryIndex: number = 0;
  private layoutInitialized: boolean = false;

  private filteredDemos(): DemoItem[] {
    return filterDemos(DEMO_ITEMS, this.keyword, this.category);
  }

  aboutToAppear(): void {
    if (!AppStorage.has(StorageKeys.APP_LOGS)) {
      AppStorage.setOrCreate<LogItem[]>(StorageKeys.APP_LOGS, []);
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
          placeholder: '搜索组件，例如 Web、Tabs',
          search: {
            searchButton: {
              searchButtonValue: '搜索'
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
              { value: '全部' },
              { value: '容器' },
              { value: '交互' },
              { value: '能力' }
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
                Text(`当前：${this.navTitle} · ${this.navSplit ? '分栏' : '单栏'} · ` +
                  `${this.navGradient ? '渐变背景' : '纯色背景'}`)
                  .fontSize(AppText.BODY)
                  .fontColor(AppColors.TEXT_SECONDARY)
                Text(`设备：${this.layout.form} · ${this.layout.breakpoint} · ${this.layout.columns} 列 · ` +
                  `选择器${this.layout.pickerSupported ? '可用' : '不可用'}`)
                  .fontSize(AppText.SMALL)
                  .fontColor(AppColors.TEXT_TERTIARY)
              }
              .alignItems(HorizontalAlign.Start)
              .layoutWeight(1)

              Button('调节')
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
              Text(`组件目录（${this.filteredDemos().length}）`)
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
              Text('没有匹配的组件，试试清空搜索词或切换分类')
                .fontSize(AppText.LABEL)
                .fontColor(AppColors.TEXT_MUTED)
                .width('100%')
                .padding(AppSpacing.LARGE)
                .backgroundColor(AppColors.CARD_BG)
                .borderRadius(AppRadius.LARGE)
            }

            LogPanel({ title: '首页事件', maxItems: HOME_LOG_LIMIT })
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
          Text(item.title)
            .fontSize(AppText.SECTION)
            .fontWeight(FontWeight.Medium)
            .fontColor(AppColors.TEXT_PRIMARY)
          Text(item.category)
            .fontSize(AppText.CAPTION)
            .fontColor(AppColors.PRIMARY)
            .backgroundColor(AppColors.PRIMARY_SOFT)
            .borderRadius(AppRadius.TAG)
            .padding({ left: 6, right: 6, top: 2, bottom: 2 })
        }

        Text(item.subtitle)
          .fontSize(AppText.BODY)
          .fontColor(AppColors.TEXT_SECONDARY)
          .maxLines(2)
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

      Text('进入')
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
