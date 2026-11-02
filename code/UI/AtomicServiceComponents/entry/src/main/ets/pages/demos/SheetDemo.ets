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
  @State dismissReason: string = '尚未关闭过';

  aboutToAppear(): void {
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
      Text('半模态内容区')
        .fontSize(AppText.HEADING)
        .fontWeight(FontWeight.Bold)
        .fontColor(AppColors.TEXT_PRIMARY)
        .width('100%')
      Text('向上拖动可切换半屏 / 全屏两档；向下拖过阈值或点击关闭按钮即可退出。')
        .fontSize(AppText.BODY)
        .fontColor(AppColors.TEXT_SECONDARY)
        .width('100%')
      Text(`当前样式：${sheetModeName(this.style)}`)
        .fontSize(AppText.BODY)
        .fontColor(AppColors.PRIMARY)
        .width('100%')
      Text(`实时高度：${this.lastHeight.toFixed(0)}vp · ${heightBucketLabel(heightBucket(this.lastHeight))}`)
        .fontSize(AppText.BODY)
        .fontColor(AppColors.TEXT_TERTIARY)
        .width('100%')
      Button('关闭半模态')
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
      title: '半模态面板',
      subtitle: '使用 bindSheet 承载半模态内容，支持高度档位、样式切换和关闭回调。',
      logSource: 'Sheet',
      navPathStack: this.navPathStack
    }) {
      Scroll() {
        Column({ space: AppSpacing.XL }) {
          Column({ space: AppSpacing.MD }) {
            Text('操作')
              .fontSize(AppText.TITLE)
              .fontColor(AppColors.TEXT_SECONDARY)
              .width('100%')

            Button('打开半模态')
              .fontSize(AppText.BODY)
              .height(AppSize.BUTTON_MD)
              .backgroundColor(AppColors.PRIMARY)
              .fontColor(AppColors.WHITE)
              .width('100%')
              .onClick(() => {
                this.openSheet();
              })

            Row({ space: AppSpacing.MD }) {
              Button(`样式：${sheetModeName(this.style)}`)
                .fontSize(AppText.BODY)
                .height(AppSize.BUTTON)
                .backgroundColor(AppColors.PRIMARY_SOFT)
                .fontColor(AppColors.PRIMARY)
                .layoutWeight(1)
                .onClick(() => {
                  this.switchStyle();
                })
              Button(`关闭按钮：${this.showClose ? '显示' : '隐藏'}`)
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
              Text('当前状态')
                .fontSize(AppText.TITLE)
                .fontColor(AppColors.TEXT_SECONDARY)
              Blank()
              Text(this.showSheet ? '已打开' : '已关闭')
                .fontSize(AppText.TITLE)
                .fontColor(AppColors.PRIMARY)
            }
            .width('100%')

            Text(sheetStatusText(this.showSheet, this.style, this.lastHeight))
              .fontSize(AppText.BODY)
              .fontColor(AppColors.TEXT_TERTIARY)
              .width('100%')
            Text(`最近一次关闭：${this.dismissReason}`)
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
            Text('实现说明')
              .fontSize(AppText.TITLE)
              .fontWeight(FontWeight.Medium)
              .fontColor(AppColors.TEXT_PRIMARY)
              .width('100%')
            Text('bindSheet 通过 $$ 双向绑定控制显隐，detents 固定为半屏与全屏两档，preferType 在 CENTER 与 POPUP 间切换。onHeightDidChange 把拖拽高度按低 / 中 / 高归档写入日志，onDisappear 记录关闭原因。')
              .fontSize(AppText.BODY)
              .fontColor(AppColors.TEXT_SECONDARY)
              .width('100%')
          }
          .width('100%')
          .padding(AppSpacing.CARD)
          .backgroundColor(AppColors.CARD_BG)
          .borderRadius(AppRadius.LARGE)

          LogPanel({ title: 'Sheet 事件', filterSource: 'Sheet' })
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
          this.dismissReason = '已关闭（按钮、拖拽或遮罩）';
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
