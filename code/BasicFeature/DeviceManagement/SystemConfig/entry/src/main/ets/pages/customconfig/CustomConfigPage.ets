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
import { common } from '@kit.AbilityKit';
import { SystemConfigConstants, PageConstants, ChannelConfigStatus } from 'library';
import { CustomConfigViewModel } from '../../viewmodel/CustomConfigViewModel';
import { InfoCard } from '../../components/InfoCard';
import { ActionButton } from '../../components/ActionButton';
import { LogPanel } from '../../components/LogPanel';
import { StatusBadge } from '../../components/StatusBadge';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

/**
 * Custom Config page.
 * Demonstrates the usage of the customConfig.getChannelId() API,
 * driving data fetching and state updates through CustomConfigViewModel.
 */
@Entry
@Component
struct CustomConfigPage {
  /** View model instance */
  @State viewModel: CustomConfigViewModel = new CustomConfigViewModel();
  /** Current channel id display */
  @State displayChannelId: ResourceStr = $r('app.string.value_not_fetched');
  /** Current status text */
  @State displayStatus: ResourceStr = $r('app.string.status_uninitialized');
  /** Status badge text color */
  @State statusColor: string = PageConstants.COLOR_TEXT_HINT;
  /** Status badge background color */
  @State statusBgColor: string = PageConstants.COLOR_STATUS_DEFAULT_BG;
  /** Log list */
  @State displayLogs: string[] = [];
  /** Detail text */
  @State detailText: string = '';

  /**
   * Page aboutToAppear callback.
   * Initializes the view model and loads data.
   */
  aboutToAppear(): void {
    hilog.info(DOMAIN, TAG, 'CustomConfigPage aboutToAppear');
    const context = getContext(this) as common.UIAbilityContext;
    this.viewModel.initialize(context);
    this.refreshDisplay();
  }

  /**
   * Page aboutToDisappear callback.
   * Destroys the view model to release resources.
   */
  aboutToDisappear(): void {
    hilog.info(DOMAIN, TAG, 'CustomConfigPage aboutToDisappear');
    this.viewModel.destroy();
  }

  /**
   * Refreshes the page display state.
   * Syncs data from the view model into @State variables.
   */
  private refreshDisplay(): void {
    this.displayChannelId = this.viewModel.currentChannelId || $r('app.string.value_not_fetched');
    this.displayStatus = this.getStatusText(this.viewModel.currentStatus);
    this.updateStatusStyle(this.viewModel.currentStatus);
    this.displayLogs = this.viewModel.getLogs();
    this.detailText = this.viewModel.getConfigDetail();
  }

  /**
   * Gets the localized text resource for a status.
   * @param {ChannelConfigStatus} status - Status enum value
   * @returns {Resource} Status text resource
   */
  private getStatusText(status: ChannelConfigStatus): Resource {
    switch (status) {
      case ChannelConfigStatus.UNINITIALIZED:
        return $r('app.string.status_uninitialized');
      case ChannelConfigStatus.LOADING:
        return $r('app.string.status_loading');
      case ChannelConfigStatus.SUCCESS:
        return $r('app.string.status_success');
      case ChannelConfigStatus.FAILED:
        return $r('app.string.status_failed');
      default:
        return $r('app.string.status_unknown');
    }
  }

  /**
   * Updates the status badge style.
   * @param {ChannelConfigStatus} status - Status enum value
   */
  private updateStatusStyle(status: ChannelConfigStatus): void {
    switch (status) {
      case ChannelConfigStatus.SUCCESS:
        this.statusColor = PageConstants.COLOR_SUCCESS;
        this.statusBgColor = PageConstants.COLOR_STATUS_SUCCESS_BG;
        break;
      case ChannelConfigStatus.FAILED:
        this.statusColor = PageConstants.COLOR_ERROR;
        this.statusBgColor = PageConstants.COLOR_STATUS_FAIL_BG;
        break;
      case ChannelConfigStatus.LOADING:
        this.statusColor = PageConstants.COLOR_WARNING;
        this.statusBgColor = PageConstants.COLOR_STATUS_WARNING_BG;
        break;
      default:
        this.statusColor = PageConstants.COLOR_TEXT_HINT;
        this.statusBgColor = PageConstants.COLOR_STATUS_DEFAULT_BG;
        break;
    }
  }

  /**
   * Page build method.
   * Renders the full UI layout of the Custom Config page.
   */
  build() {
    Column() {
      // Title bar
      Row() {
        Text($r('app.string.page_custom_config'))
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
          // Channel id info card
          InfoCard({
            title: $r('app.string.card_channel_title'),
            subtitle: $r('app.string.card_channel_subtitle')
          }) {
            Column({ space: PageConstants.CARD_INNER_SPACING }) {
              Row() {
                Text($r('app.string.label_channel_id'))
                  .fontSize(PageConstants.FONT_SIZE_BODY)
                  .fontColor(PageConstants.COLOR_TEXT_SECONDARY)
                  .width(PageConstants.LABEL_WIDTH_MEDIUM)
                Text(this.displayChannelId)
                  .fontSize(PageConstants.FONT_SIZE_BODY)
                  .fontWeight(PageConstants.FONT_WEIGHT_BOLD)
                  .fontColor(PageConstants.COLOR_TEXT_PRIMARY)
              }
              .width('100%')

              Row() {
                Text($r('app.string.label_status'))
                  .fontSize(PageConstants.FONT_SIZE_BODY)
                  .fontColor(PageConstants.COLOR_TEXT_SECONDARY)
                  .width(PageConstants.LABEL_WIDTH_MEDIUM)
                StatusBadge({
                  text: this.displayStatus,
                  textColor: this.statusColor,
                  bgColor: this.statusBgColor
                })
              }
              .width('100%')
              .alignItems(VerticalAlign.Center)
            }
            .width('100%')
            .alignItems(HorizontalAlign.Start)
          }

          // Action button area
          Column({ space: PageConstants.ITEM_SPACING }) {
            ActionButton({
              buttonText: $r('app.string.btn_get_channel_id'),
              buttonType: 'primary',
              isDisabled: this.viewModel.isLoading,
              onButtonClick: () => {
                this.viewModel.fetchChannelId();
                this.refreshDisplay();
              }
            })

            ActionButton({
              buttonText: $r('app.string.btn_view_detail'),
              buttonType: 'secondary',
              isDisabled: false,
              onButtonClick: () => {
                this.detailText = this.viewModel.getConfigDetail();
                hilog.info(DOMAIN, TAG, 'CustomConfigPage: detail refreshed');
              }
            })

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
              subtitle: $r('app.string.card_detail_subtitle_channel')
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
