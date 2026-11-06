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
 
import { DemoPageScaffold } from '../../components/DemoPageScaffold';
import { LogPanel } from '../../components/LogPanel';
import { DEFAULT_NAV_TITLE, NAV_TITLE_PRESETS } from '../../common/AppConstants';
import { AppColors, AppRadius, AppSize, AppSpacing, AppText } from '../../common/Theme';
import { DEFAULT_LAYOUT_PROFILE, LayoutProfile } from '../../model/DeviceProfile';
import { Logger } from '../../utils/Logger';

@Component
export struct NavigationDemo {
  navPathStack: NavPathStack = new NavPathStack();
  @StorageLink('navTitle') navTitle: string = '';
  @StorageLink('navGradient') navGradient: boolean = true;
  @StorageLink('navHideTitle') navHideTitle: boolean = false;
  @StorageLink('navSplit') navSplit: boolean = false;
  @StorageProp('layoutProfile') layout: LayoutProfile = DEFAULT_LAYOUT_PROFILE;

  private getStringByName(name: string): string {
    const context = this.getUIContext().getHostContext();
    if (context === undefined) {
      return '';
    }
    try {
      return context.resourceManager.getStringByNameSync(name);
    } catch (err) {
      return '';
    }
  }

  aboutToAppear(): void {
    if (this.navTitle === '') {
      this.navTitle = this.getStringByName(DEFAULT_NAV_TITLE);
    }
    Logger.info('Navigation', '生命周期',
      `进入 Navigation 演示页，当前标题「${this.navTitle}」，` +
        `模式 ${this.navSplit ? 'Split' : 'Stack'}，${this.layout.describe()}`);
  }

  aboutToDisappear(): void {
    Logger.info('Navigation', '生命周期', '离开 Navigation 演示页');
  }

  private changeTitle(title: string): void {
    this.navTitle = title;
    Logger.info('Navigation', '标题', `标题切换为「${title}」`);
  }

  private goBack(): void {
    if (this.navPathStack.size() <= 0) {
      Logger.warn('Navigation', '导航', '导航栈为空，忽略返回首页');
      return;
    }
    Logger.info('Navigation', '导航', '点击返回首页');
    this.navPathStack.pop();
  }

  build() {
    DemoPageScaffold({
      title: 'AtomicServiceNavigation',
      subtitle: '当前应用的外层容器就是该组件。下面的设置会实时作用到本页的标题栏、背景与导航模式。',
      logSource: 'Navigation',
      navPathStack: this.navPathStack
    }) {
      Scroll() {
        Column({ space: AppSpacing.XL }) {
          Column({ space: AppSpacing.SM }) {
            Text('当前状态')
              .fontSize(AppText.SECTION)
              .fontWeight(FontWeight.Medium)
              .fontColor(AppColors.TEXT_PRIMARY)
              .width('100%')
            Row() {
              Text('标题')
                .fontSize(AppText.LABEL)
                .fontColor(AppColors.TEXT_SECONDARY)
              Blank()
              Text(this.navTitle)
                .fontSize(AppText.LABEL)
                .fontColor(AppColors.TEXT_PRIMARY)
            }
            .width('100%')
            .padding({ top: AppSpacing.SM, bottom: AppSpacing.SM })
            Row() {
              Text('背景')
                .fontSize(AppText.LABEL)
                .fontColor(AppColors.TEXT_SECONDARY)
              Blank()
              Text(this.navGradient ? '渐变' : '纯色')
                .fontSize(AppText.LABEL)
                .fontColor(AppColors.TEXT_PRIMARY)
            }
            .width('100%')
            .padding({ top: AppSpacing.SM, bottom: AppSpacing.SM })
            Row() {
              Text('模式')
                .fontSize(AppText.LABEL)
                .fontColor(AppColors.TEXT_SECONDARY)
              Blank()
              Text(this.navSplit ? 'Split（分栏）' : 'Stack（单栏）')
                .fontSize(AppText.LABEL)
                .fontColor(AppColors.TEXT_PRIMARY)
            }
            .width('100%')
            .padding({ top: AppSpacing.SM, bottom: AppSpacing.SM })
            Row() {
              Text('标题栏')
                .fontSize(AppText.LABEL)
                .fontColor(AppColors.TEXT_SECONDARY)
              Blank()
              Text(this.navHideTitle ? '已隐藏' : '显示')
                .fontSize(AppText.LABEL)
                .fontColor(AppColors.TEXT_PRIMARY)
            }
            .width('100%')
            .padding({ top: AppSpacing.SM, bottom: AppSpacing.SM })
            Row() {
              Text('设备适配')
                .fontSize(AppText.LABEL)
                .fontColor(AppColors.TEXT_SECONDARY)
              Blank()
              Text(`${this.layout.form} / ${this.layout.breakpoint} / ${this.layout.columns} 列`)
                .fontSize(AppText.LABEL)
                .fontColor(AppColors.TEXT_PRIMARY)
            }
            .width('100%')
            .padding({ top: AppSpacing.SM, bottom: AppSpacing.SM })
          }
          .width('100%')
          .padding(AppSpacing.CARD)
          .backgroundColor(AppColors.CARD_BG)
          .borderRadius(AppRadius.LARGE)

          Column({ space: AppSpacing.LG }) {
            Text('标题')
              .fontSize(AppText.SECTION)
              .fontWeight(FontWeight.Medium)
              .fontColor(AppColors.TEXT_PRIMARY)
              .width('100%')
            Row({ space: AppSpacing.MD }) {
              ForEach(NAV_TITLE_PRESETS, (preset: string) => {
                Button(this.getStringByName(preset))
                  .fontSize(AppText.BODY)
                  .height(AppSize.BUTTON)
                  .backgroundColor(this.navTitle === this.getStringByName(preset) ?
                    AppColors.PRIMARY : AppColors.PRIMARY_SOFT)
                  .fontColor(this.navTitle === this.getStringByName(preset) ?
                    AppColors.WHITE : AppColors.PRIMARY)
                  .onClick(() => this.changeTitle(this.getStringByName(preset)))
              }, (preset: string) => preset)
            }
            .width('100%')
          }
          .width('100%')
          .padding(AppSpacing.CARD)
          .backgroundColor(AppColors.CARD_BG)
          .borderRadius(AppRadius.LARGE)

          Column({ space: AppSpacing.XS }) {
            Row() {
              Text('渐变背景')
                .fontSize(AppText.TITLE)
                .fontColor(AppColors.TEXT_PRIMARY)
              Blank()
              Toggle({ type: ToggleType.Switch, isOn: this.navGradient })
                .onChange((value: boolean) => {
                  this.navGradient = value;
                  Logger.info('Navigation', '背景', `渐变背景${value ? '开启' : '关闭'}`);
                })
            }
            .width('100%')
            .padding({ top: AppSpacing.XS, bottom: AppSpacing.XS })
            Row() {
              Text('隐藏标题栏')
                .fontSize(AppText.TITLE)
                .fontColor(AppColors.TEXT_PRIMARY)
              Blank()
              Toggle({ type: ToggleType.Switch, isOn: this.navHideTitle })
                .onChange((value: boolean) => {
                  this.navHideTitle = value;
                  Logger.info('Navigation', '标题栏', `标题栏${value ? '隐藏' : '显示'}`);
                })
            }
            .width('100%')
            .padding({ top: AppSpacing.XS, bottom: AppSpacing.XS })
            Row() {
              Text('分栏模式')
                .fontSize(AppText.TITLE)
                .fontColor(AppColors.TEXT_PRIMARY)
              Blank()
              Toggle({ type: ToggleType.Switch, isOn: this.navSplit })
                .onChange((value: boolean) => {
                  this.navSplit = value;
                  Logger.info('Navigation', '模式', `切换为 ${value ? 'Split' : 'Stack'}`);
                })
            }
            .width('100%')
            .padding({ top: AppSpacing.XS, bottom: AppSpacing.XS })
          }
          .width('100%')
          .padding(AppSpacing.CARD)
          .backgroundColor(AppColors.CARD_BG)
          .borderRadius(AppRadius.LARGE)

          Row({ space: AppSpacing.MD }) {
            Button('返回首页')
              .fontSize(AppText.LABEL)
              .height(AppSize.BUTTON_MD)
              .backgroundColor(AppColors.PRIMARY)
              .fontColor(AppColors.WHITE)
              .onClick(() => this.goBack())
            Button('恢复默认')
              .fontSize(AppText.LABEL)
              .height(AppSize.BUTTON_MD)
              .backgroundColor(AppColors.SOFT_BG)
              .fontColor(AppColors.TEXT_STRONG)
              .onClick(() => {
                this.navTitle = this.getStringByName(DEFAULT_NAV_TITLE);
                this.navGradient = true;
                this.navHideTitle = false;
                this.navSplit = this.layout.navSplitDefault;
                Logger.info('Navigation', '重置',
                  `已恢复默认导航配置（分栏=${this.layout.navSplitDefault ? '开' : '关'}）`);
              })
          }
          .width('100%')

          LogPanel({ title: 'Navigation 事件', filterSource: 'Navigation' })
        }
        .width('100%')
        .constraintSize({ maxWidth: this.layout.pageMaxWidth })
        .padding(AppSpacing.PAGE)
        .alignItems(HorizontalAlign.Start)
      }
      .layoutWeight(1)
      .align(Alignment.TopStart)
      .scrollBar(BarState.Auto)
    }
  }
}
