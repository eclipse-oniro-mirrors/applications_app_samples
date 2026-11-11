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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { SystemConfigConstants, PageConstants, SettingsOperationStatus } from 'library';
import { SettingsLiteViewModel } from '../../viewmodel/SettingsLiteViewModel';
import { InfoCard } from '../../components/InfoCard';
import { ActionButton } from '../../components/ActionButton';
import { LogPanel } from '../../components/LogPanel';
import { StatusBadge } from '../../components/StatusBadge';
import { common } from '@kit.AbilityKit';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

/**
 * 设置信息页面。
 * 展示 settingsLite 模块的设置页面打开和双击查询功能，
 * 通过 SettingsLiteViewModel 驱动操作和状态更新。
 */
@Entry
@Component
struct SettingsLitePage {
  /** 视图模型实例 */
  @State viewModel: SettingsLiteViewModel = new SettingsLiteViewModel();
  /** PIN 设置状态文本 */
  @State pinStatusText: ResourceStr = $r('app.string.status_idle');
  /** NFC 设置状态文本 */
  @State nfcStatusText: ResourceStr = $r('app.string.status_idle');
  /** 双击设置状态文本 */
  @State doubleClickStatusText: ResourceStr = $r('app.string.status_idle');
  /** PIN 设置操作状态 */
  @State pinStatus: SettingsOperationStatus = SettingsOperationStatus.IDLE;
  /** NFC 设置操作状态 */
  @State nfcStatus: SettingsOperationStatus = SettingsOperationStatus.IDLE;
  /** 双击设置操作状态 */
  @State doubleClickStatus: SettingsOperationStatus = SettingsOperationStatus.IDLE;
  /** 双击查询结果文本 */
  @State clickResultDisplay: ResourceStr = $r('app.string.value_not_queried');
  /** 日志列表 */
  @State displayLogs: string[] = [];
  /** 详情文本 */
  @State detailText: string = '';

  /**
   * 页面约创建回调。
   * 初始化视图模型。
   */
  aboutToAppear(): void {
    hilog.info(DOMAIN, TAG, 'SettingsLitePage aboutToAppear');
    const context = getContext(this) as common.UIAbilityContext;
    this.viewModel.initialize(context);
    this.refreshDisplay();
  }

  /**
   * 页面约消失回调。
   * 销毁视图模型释放资源。
   */
  aboutToDisappear(): void {
    hilog.info(DOMAIN, TAG, 'SettingsLitePage aboutToDisappear');
    this.viewModel.destroy();
  }

  /**
   * 刷新页面显示状态。
   * 从视图模型同步数据到 @State 变量。
   */
  private refreshDisplay(): void {
    this.pinStatusText = this.viewModel.getItemStatusText(this.viewModel.pinModel);
    this.nfcStatusText = this.viewModel.getItemStatusText(this.viewModel.nfcModel);
    this.doubleClickStatusText = this.viewModel.getItemStatusText(this.viewModel.doubleClickModel);
    this.pinStatus = this.viewModel.pinModel.operationStatus;
    this.nfcStatus = this.viewModel.nfcModel.operationStatus;
    this.doubleClickStatus = this.viewModel.doubleClickModel.operationStatus;
    this.clickResultDisplay = this.viewModel.clickResultText || $r('app.string.value_not_queried');
    this.displayLogs = this.viewModel.getLogs();
    this.detailText = this.viewModel.getAllSettingsDetail();
  }

  /**
   * 获取状态标签的文字颜色。
   * 基于操作状态枚举判断，不依赖显示文本。
   * @param {SettingsOperationStatus} status - 操作状态
   * @returns {string} 颜色值
   */
  private getStatusTextColor(status: SettingsOperationStatus): string {
    switch (status) {
      case SettingsOperationStatus.SUCCESS:
        return PageConstants.COLOR_SUCCESS;
      case SettingsOperationStatus.FAILED:
        return PageConstants.COLOR_ERROR;
      case SettingsOperationStatus.OPENING:
      case SettingsOperationStatus.QUERYING:
        return PageConstants.COLOR_WARNING;
      default:
        return PageConstants.COLOR_TEXT_HINT;
    }
  }

  /**
   * 获取状态标签的背景颜色。
   * 基于操作状态枚举判断，不依赖显示文本。
   * @param {SettingsOperationStatus} status - 操作状态
   * @returns {string} 颜色值
   */
  private getStatusBgColor(status: SettingsOperationStatus): string {
    switch (status) {
      case SettingsOperationStatus.SUCCESS:
        return '#E8F5E9';
      case SettingsOperationStatus.FAILED:
        return '#FFEBEE';
      case SettingsOperationStatus.OPENING:
      case SettingsOperationStatus.QUERYING:
        return '#FFF3E0';
      default:
        return '#F0F0F0';
    }
  }

  /**
   * 页面构建方法。
   * 渲染设置信息页面的完整 UI 布局。
   */
  build() {
    Column() {
      // 标题栏
      Row() {
        Text($r('app.string.page_settings_lite'))
          .fontSize(PageConstants.FONT_SIZE_TITLE)
          .fontWeight(PageConstants.FONT_WEIGHT_BOLD)
          .fontColor(PageConstants.COLOR_TEXT_PRIMARY)
      }
      .width('100%')
      .height(PageConstants.NAV_BAR_HEIGHT)
      .padding({ left: PageConstants.PAGE_PADDING, right: PageConstants.PAGE_PADDING })
      .backgroundColor(PageConstants.COLOR_CARD)
      .justifyContent(FlexAlign.Center)

      // 可滚动内容区域
      Scroll() {
        Column({ space: PageConstants.SECTION_SPACING }) {
          // PIN 设置卡片
          InfoCard({
            title: $r('app.string.card_pin_title'),
            subtitle: 'settingsLite.openPinSettingPage()'
          }) {
            Column({ space: 8 }) {
              Row() {
                Text($r('app.string.label_status'))
                  .fontSize(PageConstants.FONT_SIZE_BODY)
                  .fontColor(PageConstants.COLOR_TEXT_SECONDARY)
                  .width(60)
                StatusBadge({
                  text: this.pinStatusText,
                  textColor: this.getStatusTextColor(this.pinStatus),
                  bgColor: this.getStatusBgColor(this.pinStatus)
                })
              }
              .width('100%')
              .alignItems(VerticalAlign.Center)

              ActionButton({
                buttonText: $r('app.string.btn_open_pin_page'),
                buttonType: 'primary',
                isDisabled: this.viewModel.isLoading,
                onButtonClick: async () => {
                  await this.viewModel.openPinSettings();
                  this.refreshDisplay();
                }
              })
            }
            .width('100%')
          }

          // NFC 设置卡片
          InfoCard({
            title: $r('app.string.card_nfc_title'),
            subtitle: 'settingsLite.openNfcSettingsPage()'
          }) {
            Column({ space: 8 }) {
              Row() {
                Text($r('app.string.label_status'))
                  .fontSize(PageConstants.FONT_SIZE_BODY)
                  .fontColor(PageConstants.COLOR_TEXT_SECONDARY)
                  .width(60)
                StatusBadge({
                  text: this.nfcStatusText,
                  textColor: this.getStatusTextColor(this.nfcStatus),
                  bgColor: this.getStatusBgColor(this.nfcStatus)
                })
              }
              .width('100%')
              .alignItems(VerticalAlign.Center)

              ActionButton({
                buttonText: $r('app.string.btn_open_nfc_page'),
                buttonType: 'primary',
                isDisabled: this.viewModel.isLoading,
                onButtonClick: async () => {
                  await this.viewModel.openNfcSettings();
                  this.refreshDisplay();
                }
              })
            }
            .width('100%')
          }

          // 双击设置卡片
          InfoCard({
            title: $r('app.string.card_double_click_title'),
            subtitle: 'settingsLite.openDoubleClickSettingsPage() / isDoubleClickAppForSelf()'
          }) {
            Column({ space: 8 }) {
              Row() {
                Text($r('app.string.label_status'))
                  .fontSize(PageConstants.FONT_SIZE_BODY)
                  .fontColor(PageConstants.COLOR_TEXT_SECONDARY)
                  .width(60)
                StatusBadge({
                  text: this.doubleClickStatusText,
                  textColor: this.getStatusTextColor(this.doubleClickStatus),
                  bgColor: this.getStatusBgColor(this.doubleClickStatus)
                })
              }
              .width('100%')
              .alignItems(VerticalAlign.Center)

              Row() {
                Text($r('app.string.label_query_result'))
                  .fontSize(PageConstants.FONT_SIZE_BODY)
                  .fontColor(PageConstants.COLOR_TEXT_SECONDARY)
                  .width(80)
                Text(this.clickResultDisplay)
                  .fontSize(PageConstants.FONT_SIZE_BODY)
                  .fontWeight(PageConstants.FONT_WEIGHT_BOLD)
                  .fontColor(PageConstants.COLOR_TEXT_PRIMARY)
              }
              .width('100%')

              ActionButton({
                buttonText: $r('app.string.btn_open_double_click_page'),
                buttonType: 'primary',
                isDisabled: this.viewModel.isLoading,
                onButtonClick: async () => {
                  await this.viewModel.openDoubleClickSettings();
                  this.refreshDisplay();
                }
              })

              ActionButton({
                buttonText: $r('app.string.btn_query_double_click'),
                buttonType: 'secondary',
                isDisabled: this.viewModel.isLoading,
                onButtonClick: () => {
                  this.viewModel.queryDoubleClickApp();
                  this.refreshDisplay();
                }
              })
            }
            .width('100%')
          }

          // 操作按钮区域
          Column({ space: PageConstants.ITEM_SPACING }) {
            ActionButton({
              buttonText: $r('app.string.btn_reset'),
              buttonType: 'danger',
              isDisabled: false,
              onButtonClick: () => {
                this.viewModel.resetState();
                this.refreshDisplay();
              }
            })
          }
          .width('100%')

          // 详情信息卡片
          if (this.detailText.length > 0) {
            InfoCard({
              title: $r('app.string.card_detail_title'),
              subtitle: $r('app.string.card_detail_subtitle_settings')
            }) {
              Text(this.detailText)
                .fontSize(PageConstants.FONT_SIZE_SMALL)
                .fontColor(PageConstants.COLOR_TEXT_SECONDARY)
                .width('100%')
                .fontFamily('monospace')
            }
          }

          // 日志面板
          LogPanel({
            panelTitle: $r('app.string.log_panel_title'),
            logs: this.displayLogs,
            maxHeight: 200
          })
        }
        .width('100%')
        .padding({
          left: PageConstants.PAGE_PADDING,
          right: PageConstants.PAGE_PADDING,
          top: PageConstants.SECTION_SPACING,
          bottom: PageConstants.SECTION_SPACING
        })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(PageConstants.COLOR_BACKGROUND)
  }
}
