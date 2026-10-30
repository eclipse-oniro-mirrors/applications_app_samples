import { AtomicServiceTabs, TabBarOptions, TabBarPosition } from '@kit.ArkUI';
import { DemoPageScaffold } from '../../components/DemoPageScaffold';
import { LogPanel } from '../../components/LogPanel';
import { canSwitchTab } from '../../model/DemoLogic';
import { LOG_STORE_CAPACITY, TAB_COUNT } from '../../common/AppConstants';
import { AppColors, AppRadius, AppSize, AppSpacing, AppText } from '../../common/Theme';
import { DEFAULT_LAYOUT_PROFILE, LayoutProfile } from '../../model/DeviceProfile';
import { LogItem, LogLevel, countByTag, queryLogs } from '../../model/LogStore';
import { Logger } from '../../utils/Logger';

@Component
export struct TabsDemo {
  navPathStack: NavPathStack = new NavPathStack();
  @StorageProp('layoutProfile') layout: LayoutProfile = DEFAULT_LAYOUT_PROFILE;
  @StorageProp('appLogs') allLogs: LogItem[] = [];
  @State locked: boolean = false;
  @State verticalLayout: boolean = false;
  @State currentIndex: number = 0;

  aboutToAppear(): void {
    Logger.info('Tabs', '生命周期',
      `进入 Tabs 演示页，页签数 ${TAB_COUNT}，布局高度 ${this.layout.tabsHeight}vp`);
  }

  aboutToDisappear(): void {
    Logger.info('Tabs', '生命周期', '离开 Tabs 演示页');
  }

  private clickCount(): number {
    return countByTag(queryLogs(this.allLogs, 'Tabs', LogLevel.DEBUG, '', LOG_STORE_CAPACITY), '点击');
  }

  private canGoPrevious(): boolean {
    return this.currentIndex > 0;
  }

  private canGoNext(): boolean {
    return this.currentIndex < TAB_COUNT - 1;
  }

  private switchCount(): number {
    return countByTag(queryLogs(this.allLogs, 'Tabs', LogLevel.DEBUG, '', LOG_STORE_CAPACITY), '切换');
  }

  private goTo(index: number): void {
    if (index < 0 || index >= TAB_COUNT) {
      Logger.warn('Tabs', '页签', `目标索引 ${index} 越界（有效范围 0-${TAB_COUNT - 1}）`);
      return;
    }
    if (index === this.currentIndex) {
      Logger.warn('Tabs', '页签', `已经位于页签 ${index + 1}，无需切换`);
      return;
    }
    if (!canSwitchTab(this.currentIndex, index, this.locked, TAB_COUNT)) {
      Logger.warn('Tabs', '拦截', `锁定状态下尝试 ${this.currentIndex + 1} → ${index + 1}，忽略按钮切换`);
      return;
    }
    this.currentIndex = index;
    Logger.info('Tabs', '页签', `按钮切换到页签 ${index + 1}`);
  }

  @Builder
  tabContentOverview() {
    this.tabOverview()
  }

  @Builder
  tabContentData() {
    this.tabData()
  }

  @Builder
  tabContentMore() {
    this.tabMore()
  }

  @Builder
  tabOverview() {
    Column({ space: AppSpacing.XL }) {
      Text('概览')
        .fontSize(AppText.HEADING)
        .fontWeight(FontWeight.Bold)
        .fontColor(AppColors.TEXT_PRIMARY)
      Text('AtomicServiceTabs 在保留 Tabs 切换能力的同时，简化了页签样式，最多支持 5 个页签。')
        .fontSize(AppText.LABEL)
        .fontColor(AppColors.TEXT_SECONDARY)
        .textAlign(TextAlign.Start)
      Row({ space: AppSpacing.LG }) {
        Column() {
          Text(`${TAB_COUNT}`)
            .fontSize(AppText.METRIC)
            .fontWeight(FontWeight.Bold)
            .fontColor(AppColors.PRIMARY)
          Text('页签数量')
            .fontSize(AppText.SMALL)
            .fontColor(AppColors.TEXT_TERTIARY)
        }
        .layoutWeight(1)
        .padding(AppSpacing.XL)
        .backgroundColor(AppColors.HIGHLIGHT_BG)
        .borderRadius(AppRadius.SMALL)

        Column() {
          Text(`${this.currentIndex + 1}`)
            .fontSize(AppText.METRIC)
            .fontWeight(FontWeight.Bold)
            .fontColor(AppColors.PRIMARY)
          Text('当前索引')
            .fontSize(AppText.SMALL)
            .fontColor(AppColors.TEXT_TERTIARY)
        }
        .layoutWeight(1)
        .padding(AppSpacing.XL)
        .backgroundColor(AppColors.HIGHLIGHT_BG)
        .borderRadius(AppRadius.SMALL)
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .padding(AppSpacing.PAGE)
    .alignItems(HorizontalAlign.Start)
    .backgroundColor(AppColors.CARD_BG)
  }

  @Builder
  tabData() {
    Column({ space: AppSpacing.LG }) {
      Text('数据')
        .fontSize(AppText.HEADING)
        .fontWeight(FontWeight.Bold)
        .fontColor(AppColors.TEXT_PRIMARY)
      Row() {
        Text('页签点击次数')
          .fontSize(AppText.LABEL)
          .fontColor(AppColors.TEXT_SECONDARY)
        Blank()
        Text(`${this.clickCount()}`)
          .fontSize(AppText.LABEL)
          .fontColor(AppColors.TEXT_PRIMARY)
      }
      .width('100%')
      .padding(AppSpacing.LG)
      .backgroundColor(AppColors.SUBTLE_BG)
      .borderRadius(AppRadius.SMALL)
      Row() {
        Text('页签切换次数')
          .fontSize(AppText.LABEL)
          .fontColor(AppColors.TEXT_SECONDARY)
        Blank()
        Text(`${this.switchCount()}`)
          .fontSize(AppText.LABEL)
          .fontColor(AppColors.TEXT_PRIMARY)
      }
      .width('100%')
      .padding(AppSpacing.LG)
      .backgroundColor(AppColors.SUBTLE_BG)
      .borderRadius(AppRadius.SMALL)
      Text('切换页签后，onChange 回调会同步更新当前索引；计数来自全局日志存储中 source=Tabs 的记录。')
        .fontSize(AppText.BODY)
        .fontColor(AppColors.TEXT_TERTIARY)
    }
    .width('100%')
    .height('100%')
    .padding(AppSpacing.PAGE)
    .alignItems(HorizontalAlign.Start)
    .backgroundColor(AppColors.CARD_BG)
  }

  @Builder
  tabMore() {
    Column({ space: AppSpacing.LG }) {
      Text('更多')
        .fontSize(AppText.HEADING)
        .fontWeight(FontWeight.Bold)
        .fontColor(AppColors.TEXT_PRIMARY)
      Text('锁定页签后，onContentWillChange 返回 false，切换动作会被拦截。')
        .fontSize(AppText.LABEL)
        .fontColor(AppColors.TEXT_SECONDARY)
      Text(this.locked ? '当前状态：已锁定' : '当前状态：可切换')
        .fontSize(AppText.LABEL)
        .fontColor(this.locked ? AppColors.DANGER : AppColors.PRIMARY)
        .padding(AppSpacing.LG)
        .width('100%')
        .backgroundColor(this.locked ? AppColors.DANGER_SOFT : AppColors.PRIMARY_SOFT)
        .borderRadius(AppRadius.SMALL)
    }
    .width('100%')
    .height('100%')
    .padding(AppSpacing.PAGE)
    .alignItems(HorizontalAlign.Start)
    .backgroundColor(AppColors.CARD_BG)
  }

  build() {
    DemoPageScaffold({
      title: 'AtomicServiceTabs',
      subtitle: '三个图文页签，演示点击、切换、切换拦截和布局模式。',
      logSource: 'Tabs',
      navPathStack: this.navPathStack
    }) {
      Scroll() {
        Column({ space: AppSpacing.XL }) {
          Row({ space: AppSpacing.XL }) {
            Text('锁定切换')
              .fontSize(AppText.TITLE)
              .fontColor(AppColors.TEXT_PRIMARY)
            Toggle({ type: ToggleType.Switch, isOn: this.locked })
              .onChange((value: boolean) => {
                this.locked = value;
                Logger.info('Tabs', '拦截', `页签切换${value ? '已锁定' : '已解锁'}`);
              })
            Blank()
            Button(this.verticalLayout ? '布局：VERTICAL' : '布局：AUTO')
              .fontSize(AppText.BODY)
              .height(AppSize.BUTTON)
              .backgroundColor(AppColors.PRIMARY_SOFT)
              .fontColor(AppColors.PRIMARY)
              .onClick(() => {
                this.verticalLayout = !this.verticalLayout;
                Logger.info('Tabs', '布局', `切换为 ${this.verticalLayout ? 'VERTICAL' : 'AUTO'}`);
              })
          }
          .width('100%')
          .padding(AppSpacing.XL)
          .backgroundColor(AppColors.CARD_BG)
          .borderRadius(AppRadius.LARGE)

          Column() {
            AtomicServiceTabs({
              tabContents: [
                () => {
                  this.tabContentOverview()
                },
                () => {
                  this.tabContentData()
                },
                () => {
                  this.tabContentMore()
                }
              ],
              tabBarOptionsArray: [
                new TabBarOptions($r('sys.media.ohos_ic_public_phone'), '概览',
                  AppColors.TEXT_TERTIARY, AppColors.PRIMARY),
                new TabBarOptions($r('sys.media.ohos_ic_public_location'), '数据',
                  AppColors.TEXT_TERTIARY, AppColors.PRIMARY),
                new TabBarOptions($r('sys.media.ohos_ic_public_more'), '更多',
                  AppColors.TEXT_TERTIARY, AppColors.PRIMARY)
              ],
              tabBarPosition: TabBarPosition.BOTTOM,
              layoutMode: this.verticalLayout ? LayoutMode.VERTICAL : LayoutMode.AUTO,
              barBackgroundColor: AppColors.CARD_BG,
              index: this.currentIndex,
              onTabBarClick: (index: number) => {
                Logger.info('Tabs', '点击', `点击页签 ${index + 1}`);
              },
              onChange: (index: number) => {
                this.currentIndex = index;
                Logger.info('Tabs', '切换', `切换到页签 ${index + 1}`);
              },
              onContentWillChange: (currentIndex: number, comingIndex: number): boolean => {
                const allowed = canSwitchTab(currentIndex, comingIndex, this.locked, TAB_COUNT);
                if (allowed) {
                  Logger.debug('Tabs', '拦截', `尝试 ${currentIndex + 1} → ${comingIndex + 1}，允许`);
                } else {
                  Logger.warn('Tabs', '拦截', `尝试 ${currentIndex + 1} → ${comingIndex + 1}，被拦截`);
                }
                return allowed;
              }
            })
              .width('100%')
              .height(this.layout.tabsHeight)
          }
          .width('100%')
          .backgroundColor(AppColors.CARD_BG)
          .borderRadius(AppRadius.LARGE)
          .clip(true)

          Row({ space: AppSpacing.MD }) {
            Button('上一页')
              .fontSize(AppText.BODY)
              .height(AppSize.BUTTON)
              .backgroundColor(this.canGoPrevious() ? AppColors.PRIMARY : AppColors.SOFT_BG)
              .fontColor(this.canGoPrevious() ? AppColors.WHITE : AppColors.TEXT_MUTED)
              .onClick(() => {
                this.goTo(this.currentIndex - 1);
              })
            Button('下一页')
              .fontSize(AppText.BODY)
              .height(AppSize.BUTTON)
              .backgroundColor(this.canGoNext() ? AppColors.PRIMARY : AppColors.SOFT_BG)
              .fontColor(this.canGoNext() ? AppColors.WHITE : AppColors.TEXT_MUTED)
              .onClick(() => {
                this.goTo(this.currentIndex + 1);
              })
            Text(`当前：${this.currentIndex + 1} / ${TAB_COUNT}`)
              .fontSize(AppText.BODY)
              .fontColor(AppColors.TEXT_SECONDARY)
          }
          .width('100%')

          LogPanel({ title: 'Tabs 事件', filterSource: 'Tabs' })
        }
        .width('100%')
        .constraintSize({ maxWidth: this.layout.pageMaxWidth })
        .padding(AppSpacing.PAGE)
      }
      .layoutWeight(1)
      .align(Alignment.TopStart)
      .scrollBar(BarState.Auto)
    }
  }
}
