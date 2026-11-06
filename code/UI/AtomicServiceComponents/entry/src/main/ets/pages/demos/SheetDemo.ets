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
import {
  SheetStyle,
  canOpenSheet,
  heightBucket,
  heightBucketLabel,
  sheetModeName,
  sheetStatusText,
  toggleSheetStyle
} from '../../model/SheetFlow';
import { DEFAULT_LAYOUT_PROFILE, LayoutProfile } from '../../model/DeviceProfile';
import { AppColors, AppRadius, AppSize, AppSpacing, AppText } from '../../common/Theme';
import { Logger } from '../../utils/Logger';

@Component
export struct SheetDemo {
  navPathStack: NavPathStack = new NavPathStack();
  @StorageProp('layoutProfile') layout: LayoutProfile = DEFAULT_LAYOUT_PROFILE;
  @State showSheet: boolean = false;
  @State style: SheetStyle = SheetStyle.CENTER;
  @State showClose: boolean = true;
  @State lastHeight: number = 0;
  @State dismissReason: string = '';

  private getString(resource: Resource, ...args: Array<string | number>): string {
    const context = this.getUIContext().getHostContext();
    if (context === undefined) {
      return '';
    }
    try {
      return context.resourceManager.getStringSync(resource.id, ...args);
    } catch (err) {
      return '';
    }
  }

  aboutToAppear(): void {
    this.dismissReason = this.getString($r('app.string.sheet_dismiss_none'));
    Logger.info('Sheet', '生命周期', '进入半模态演示页');
  }

  aboutToDisappear(): void {
    Logger.info('Sheet', '生命周期', `离开半模态演示页，${sheetStatusText(this.showSheet, this.style, this.lastHeight)}`);
  }

  private openSheet(): void {
    if (!canOpenSheet(this.showSheet)) {
      Logger.warn('Sheet', '打开', '半模态已经打开，忽略重复请求');
      return;
    }
    this.showSheet = true;
    Logger.info('Sheet', '打开',
      `bindSheet 打开，${sheetModeName(this.style)}，档位 半屏 / 全屏，showClose=${this.showClose}`);
  }

  private switchStyle(): void {
    this.style = toggleSheetStyle(this.style);
    Logger.info('Sheet', '样式', `打开样式切换为 ${sheetModeName(this.style)}`);
  }

  private switchCloseButton(): void {
    this.showClose = !this.showClose;
    Logger.info('Sheet', '样式', `关闭按钮${this.showClose ? '显示' : '隐藏'}`);
  }

  @Builder
  sheetContent() {
    Column({ space: AppSpacing.LG }) {
      Text($r('app.string.sheet_content_title'))
        .fontSize(AppText.HEADING)
        .fontWeight(FontWeight.Bold)
        .fontColor(AppColors.TEXT_PRIMARY)
        .width('100%')
      Text($r('app.string.sheet_content_desc'))
        .fontSize(AppText.BODY)
        .fontColor(AppColors.TEXT_SECONDARY)
        .width('100%')
      Text(this.getString($r('app.string.sheet_current_style'), sheetModeName(this.style)))
        .fontSize(AppText.BODY)
        .fontColor(AppColors.PRIMARY)
        .width('100%')
      Text(this.getString($r('app.string.sheet_realtime_height'), this.lastHeight.toFixed(0),
        heightBucketLabel(heightBucket(this.lastHeight))))
        .fontSize(AppText.BODY)
        .fontColor(AppColors.TEXT_TERTIARY)
        .width('100%')
      Button($r('app.string.sheet_btn_close'))
        .fontSize(AppText.BODY)
        .height(AppSize.BUTTON)
        .backgroundColor(AppColors.PRIMARY)
        .fontColor(AppColors.WHITE)
        .width('100%')
        .onClick(() => {
          this.showSheet = false;
          Logger.info('Sheet', '关闭', '点击内容区按钮关闭半模态');
        })
    }
    .width('100%')
    .padding(AppSpacing.PAGE)
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    DemoPageScaffold({
      title: $r('app.string.dest_sheet'),
      subtitle: $r('app.string.sheet_page_subtitle'),
      logSource: 'Sheet',
      navPathStack: this.navPathStack
    }) {
      Scroll() {
        Column({ space: AppSpacing.XL }) {
          Column({ space: AppSpacing.MD }) {
            Text($r('app.string.sheet_label_action'))
              .fontSize(AppText.TITLE)
              .fontColor(AppColors.TEXT_SECONDARY)
              .width('100%')

            Button($r('app.string.sheet_btn_open'))
              .fontSize(AppText.BODY)
              .height(AppSize.BUTTON_MD)
              .backgroundColor(AppColors.PRIMARY)
              .fontColor(AppColors.WHITE)
              .width('100%')
              .onClick(() => {
                this.openSheet();
              })

            Row({ space: AppSpacing.MD }) {
              Button(this.getString($r('app.string.sheet_btn_style'), sheetModeName(this.style)))
                .fontSize(AppText.BODY)
                .height(AppSize.BUTTON)
                .backgroundColor(AppColors.PRIMARY_SOFT)
                .fontColor(AppColors.PRIMARY)
                .layoutWeight(1)
                .onClick(() => {
                  this.switchStyle();
                })
              Button(this.getString($r('app.string.sheet_btn_close_btn'),
                this.showClose ? this.getString($r('app.string.shown')) : this.getString($r('app.string.hidden'))))
                .fontSize(AppText.BODY)
                .height(AppSize.BUTTON)
                .backgroundColor(AppColors.PRIMARY_SOFT)
                .fontColor(AppColors.PRIMARY)
                .layoutWeight(1)
                .onClick(() => {
                  this.switchCloseButton();
                })
            }
            .width('100%')
          }
          .width('100%')
          .padding(AppSpacing.CARD)
          .backgroundColor(AppColors.CARD_BG)
          .borderRadius(AppRadius.LARGE)
          .alignItems(HorizontalAlign.Start)

          Column({ space: AppSpacing.SM }) {
            Row() {
              Text($r('app.string.label_current_state'))
                .fontSize(AppText.TITLE)
                .fontColor(AppColors.TEXT_SECONDARY)
              Blank()
              Text(this.showSheet ? $r('app.string.sheet_state_open') : $r('app.string.sheet_state_closed'))
                .fontSize(AppText.TITLE)
                .fontColor(AppColors.PRIMARY)
            }
            .width('100%')

            Text(sheetStatusText(this.showSheet, this.style, this.lastHeight))
              .fontSize(AppText.BODY)
              .fontColor(AppColors.TEXT_TERTIARY)
              .width('100%')
            Text(this.getString($r('app.string.sheet_last_close'), this.dismissReason))
              .fontSize(AppText.SMALL)
              .fontColor(AppColors.TEXT_MUTED)
              .width('100%')
          }
          .width('100%')
          .padding(AppSpacing.CARD)
          .backgroundColor(AppColors.CARD_BG)
          .borderRadius(AppRadius.LARGE)
          .alignItems(HorizontalAlign.Start)

          Column({ space: AppSpacing.SM }) {
            Text($r('app.string.label_impl_title'))
              .fontSize(AppText.TITLE)
              .fontWeight(FontWeight.Medium)
              .fontColor(AppColors.TEXT_PRIMARY)
              .width('100%')
            Text($r('app.string.sheet_impl_desc'))
              .fontSize(AppText.BODY)
              .fontColor(AppColors.TEXT_SECONDARY)
              .width('100%')
          }
          .width('100%')
          .padding(AppSpacing.CARD)
          .backgroundColor(AppColors.CARD_BG)
          .borderRadius(AppRadius.LARGE)

          LogPanel({ title: $r('app.string.log_title_sheet'), filterSource: 'Sheet' })
        }
        .width('100%')
        .constraintSize({ maxWidth: this.layout.pageMaxWidth })
        .padding(AppSpacing.PAGE)
      }
      .layoutWeight(1)
      .align(Alignment.TopStart)
      .scrollBar(BarState.Auto)
      .bindSheet($$this.showSheet, this.sheetContent(), {
        detents: [SheetSize.MEDIUM, SheetSize.LARGE],
        preferType: this.style === SheetStyle.POPUP ? SheetType.POPUP : SheetType.CENTER,
        showClose: this.showClose,
        dragBar: true,
        backgroundColor: AppColors.CARD_BG,
        onAppear: () => {
          Logger.info('Sheet', '回调', '半模态 onAppear');
        },
        onDisappear: () => {
          this.showSheet = false;
          this.dismissReason = this.getString($r('app.string.sheet_dismiss_reason'));
          Logger.info('Sheet', '回调', '半模态 onDisappear');
        },
        onHeightDidChange: (height: number) => {
          this.lastHeight = height;
          Logger.info('Sheet', '回调',
            `高度变化 ${height.toFixed(0)}vp → ${heightBucketLabel(heightBucket(height))}`);
        }
      })
    }
  }
}
