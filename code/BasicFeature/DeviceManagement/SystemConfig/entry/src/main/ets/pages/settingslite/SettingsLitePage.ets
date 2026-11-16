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
 * Settings Lite page.
 * Shows the settings page launching and double-click query features of the settingsLite module,
 * driving operations and state updates through SettingsLiteViewModel.
 */
@Entry
@Component
struct SettingsLitePage {
  /** View model instance */
  @State viewModel: SettingsLiteViewModel = new SettingsLiteViewModel();
  /** PIN settings status text */
  @State pinStatusText: ResourceStr = $r('app.string.status_idle');
  /** NFC settings status text */
  @State nfcStatusText: ResourceStr = $r('app.string.status_idle');
  /** Double-click settings status text */
  @State doubleClickStatusText: ResourceStr = $r('app.string.status_idle');
  /** PIN settings operation status */
  @State pinStatus: SettingsOperationStatus = SettingsOperationStatus.IDLE;
  /** NFC settings operation status */
  @State nfcStatus: SettingsOperationStatus = SettingsOperationStatus.IDLE;
  /** Double-click settings operation status */
  @State doubleClickStatus: SettingsOperationStatus = SettingsOperationStatus.IDLE;
  /** Double-click query result text */
  @State clickResultDisplay: ResourceStr = $r('app.string.value_not_queried');
  /** Log list */
  @State displayLogs: string[] = [];
  /** Detail text */
  @State detailText: string = '';

  /**
   * Page aboutToAppear callback.
   * Initializes the view model.
   */
  aboutToAppear(): void {
    hilog.info(DOMAIN, TAG, 'SettingsLitePage aboutToAppear');
    const context = getContext(this) as common.UIAbilityContext;
    this.viewModel.initialize(context);
    this.refreshDisplay();
  }

  /**
   * Page aboutToDisappear callback.
   * Destroys the view model to release resources.
   */
  aboutToDisappear(): void {
    hilog.info(DOMAIN, TAG, 'SettingsLitePage aboutToDisappear');
    this.viewModel.destroy();
  }

  /**
   * Refreshes the page display state.
   * Syncs data from the view model into @State variables.
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
   * Gets the text color of the status badge.
   * Determined by the operation status enum, not by the displayed text.
   * @param {SettingsOperationStatus} status - Operation status
   * @returns {string} Color value
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
   * Gets the background color of the status badge.
   * Determined by the operation status enum, not by the displayed text.
   * @param {SettingsOperationStatus} status - Operation status
   * @returns {string} Color value
   */
  private getStatusBgColor(status: SettingsOperationStatus): string {
    switch (status) {
      case SettingsOperationStatus.SUCCESS:
        return PageConstants.COLOR_STATUS_SUCCESS_BG;
      case SettingsOperationStatus.FAILED:
        return PageConstants.COLOR_STATUS_FAIL_BG;
      case SettingsOperationStatus.OPENING:
      case SettingsOperationStatus.QUERYING:
        return PageConstants.COLOR_STATUS_WARNING_BG;
      default:
        return PageConstants.COLOR_STATUS_DEFAULT_BG;
    }
  }

  /**
   * Page build method.
   * Renders the full UI layout of the Settings Lite page.
   */
  build() {
    Column() {
      // Title bar
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

      // Scrollable content area
      Scroll() {
        Column({ space: PageConstants.SECTION_SPACING }) {
          // PIN settings card
          InfoCard({
            title: $r('app.string.card_pin_title'),
            subtitle: $r('app.string.card_pin_subtitle')
          }) {
            Column({ space: PageConstants.CARD_INNER_SPACING }) {
              Row() {
                Text($r('app.string.label_status'))
                  .fontSize(PageConstants.FONT_SIZE_BODY)
                  .fontColor(PageConstants.COLOR_TEXT_SECONDARY)
                  .width(PageConstants.LABEL_WIDTH_SHORT)
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

          // NFC settings card
          InfoCard({
            title: $r('app.string.card_nfc_title'),
            subtitle: $r('app.string.card_nfc_subtitle')
          }) {
            Column({ space: PageConstants.CARD_INNER_SPACING }) {
              Row() {
                Text($r('app.string.label_status'))
                  .fontSize(PageConstants.FONT_SIZE_BODY)
                  .fontColor(PageConstants.COLOR_TEXT_SECONDARY)
                  .width(PageConstants.LABEL_WIDTH_SHORT)
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

          // Double-click settings card
          InfoCard({
            title: $r('app.string.card_double_click_title'),
            subtitle: $r('app.string.card_double_click_subtitle')
          }) {
            Column({ space: PageConstants.CARD_INNER_SPACING }) {
              Row() {
                Text($r('app.string.label_status'))
                  .fontSize(PageConstants.FONT_SIZE_BODY)
                  .fontColor(PageConstants.COLOR_TEXT_SECONDARY)
                  .width(PageConstants.LABEL_WIDTH_SHORT)
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
                  .width(PageConstants.LABEL_WIDTH_MEDIUM)
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

          // Action button area
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

          // Detail info card
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

          // Log panel
          LogPanel({
            panelTitle: $r('app.string.log_panel_title'),
            logs: this.displayLogs,
            maxHeight: PageConstants.LOG_PANEL_MAX_HEIGHT
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
