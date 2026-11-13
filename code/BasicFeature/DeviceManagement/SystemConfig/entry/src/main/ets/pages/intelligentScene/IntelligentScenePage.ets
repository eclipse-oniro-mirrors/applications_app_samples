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
import { SystemConfigConstants, PageConstants, DoNotDisturbStatus } from 'library';
import { IntelligentSceneViewModel } from '../../viewmodel/IntelligentSceneViewModel';
import { InfoCard } from '../../components/InfoCard';
import { ActionButton } from '../../components/ActionButton';
import { LogPanel } from '../../components/LogPanel';
import { StatusBadge } from '../../components/StatusBadge';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

/**
 * Intelligent Scene page.
 * Demonstrates the Do Not Disturb status query feature of the intelligentScene module,
 * driving asynchronous data fetching and state updates through IntelligentSceneViewModel.
 * Requires permission: ohos.permission.GET_DONOTDISTURB_STATE
 */
@Entry
@Component
struct IntelligentScenePage {
  /** View model instance */
  @State viewModel: IntelligentSceneViewModel = new IntelligentSceneViewModel();
  /** DND enabled status display */
  @State displayDndEnabled: ResourceStr = $r('app.string.value_not_queried');
  /** Notification allowed status display */
  @State displayNotifyAllowed: ResourceStr = $r('app.string.value_not_queried');
  /** Current query status text */
  @State displayStatus: ResourceStr = $r('app.string.status_idle');
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
   * Initializes the view model.
   */
  aboutToAppear(): void {
    hilog.info(DOMAIN, TAG, 'IntelligentScenePage aboutToAppear');
    const context = getContext(this) as common.UIAbilityContext;
    this.viewModel.initialize(context);
    this.refreshDisplay();
  }

  /**
   * Page aboutToDisappear callback.
   * Destroys the view model to release resources.
   */
  aboutToDisappear(): void {
    hilog.info(DOMAIN, TAG, 'IntelligentScenePage aboutToDisappear');
    this.viewModel.destroy();
  }

  /**
   * Refreshes the page display state.
   * Syncs data from the view model into @State variables.
   */
  private refreshDisplay(): void {
    this.displayDndEnabled = this.viewModel.isDndEnabled ? $r('app.string.value_enabled') : $r('app.string.value_disabled');
    this.displayNotifyAllowed = this.viewModel.isNotifyAllowed ? $r('app.string.value_allowed') : $r('app.string.value_not_allowed');
    this.displayStatus = this.getStatusText(this.viewModel.currentStatus);
    this.updateStatusStyle(this.viewModel.currentStatus);
    this.displayLogs = this.viewModel.getLogs();
    this.detailText = this.viewModel.getDndDetail();
  }

  /**
   * Gets the localized text resource for a status.
   * @param {DoNotDisturbStatus} status - Status enum value
   * @returns {Resource} Status text resource
   */
  private getStatusText(status: DoNotDisturbStatus): Resource {
    switch (status) {
      case DoNotDisturbStatus.IDLE:
        return $r('app.string.status_idle');
      case DoNotDisturbStatus.QUERYING:
        return $r('app.string.status_querying');
      case DoNotDisturbStatus.SUCCESS:
        return $r('app.string.status_query_success');
      case DoNotDisturbStatus.FAILED:
        return $r('app.string.status_query_failed');
      default:
        return $r('app.string.status_unknown');
    }
  }

  /**
   * Updates the status badge style.
   * @param {DoNotDisturbStatus} status - Status enum value
   */
  private updateStatusStyle(status: DoNotDisturbStatus): void {
    switch (status) {
      case DoNotDisturbStatus.SUCCESS:
        this.statusColor = PageConstants.COLOR_SUCCESS;
        this.statusBgColor = PageConstants.COLOR_STATUS_SUCCESS_BG;
        break;
      case DoNotDisturbStatus.FAILED:
        this.statusColor = PageConstants.COLOR_ERROR;
        this.statusBgColor = PageConstants.COLOR_STATUS_FAIL_BG;
        break;
      case DoNotDisturbStatus.QUERYING:
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
   * Renders the full UI layout of the Intelligent Scene page.
   */
  build() {
    Column() {
      // Title bar
      Row() {
        Text($r('app.string.page_intelligent_scene'))
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
          // Do Not Disturb status info card
          InfoCard({
            title: $r('app.string.card_dnd_title'),
            subtitle: $r('app.string.card_dnd_subtitle')
          }) {
            Column({ space: PageConstants.CARD_INNER_SPACING }) {
              Row() {
                Text($r('app.string.label_dnd_mode'))
                  .fontSize(PageConstants.FONT_SIZE_BODY)
                  .fontColor(PageConstants.COLOR_TEXT_SECONDARY)
                  .width(PageConstants.LABEL_WIDTH_LONG)
                Text(this.displayDndEnabled)
                  .fontSize(PageConstants.FONT_SIZE_BODY)
                  .fontWeight(PageConstants.FONT_WEIGHT_BOLD)
                  .fontColor(this.viewModel.isDndEnabled ? PageConstants.COLOR_WARNING : PageConstants.COLOR_SUCCESS)
              }
              .width('100%')

              Row() {
                Text($r('app.string.label_notify_allowed'))
                  .fontSize(PageConstants.FONT_SIZE_BODY)
                  .fontColor(PageConstants.COLOR_TEXT_SECONDARY)
                  .width(PageConstants.LABEL_WIDTH_LONG)
                Text(this.displayNotifyAllowed)
                  .fontSize(PageConstants.FONT_SIZE_BODY)
                  .fontWeight(PageConstants.FONT_WEIGHT_BOLD)
                  .fontColor(this.viewModel.isNotifyAllowed ? PageConstants.COLOR_SUCCESS : PageConstants.COLOR_ERROR)
              }
              .width('100%')

              Row() {
                Text($r('app.string.label_query_status'))
                  .fontSize(PageConstants.FONT_SIZE_BODY)
                  .fontColor(PageConstants.COLOR_TEXT_SECONDARY)
                  .width(PageConstants.LABEL_WIDTH_LONG)
                StatusBadge({
                  text: this.displayStatus,
                  textColor: this.statusColor,
                  bgColor: this.statusBgColor
                })
              }
              .width('100%')
              .alignItems(VerticalAlign.Center)

              Row() {
                Text($r('app.string.label_required_permission'))
                  .fontSize(PageConstants.FONT_SIZE_SMALL)
                  .fontColor(PageConstants.COLOR_TEXT_HINT)
                  .width(PageConstants.LABEL_WIDTH_LONG)
                Text(SystemConfigConstants.PERMISSION_DND)
                  .fontSize(PageConstants.FONT_SIZE_SMALL)
                  .fontColor(PageConstants.COLOR_TEXT_HINT)
                  .fontFamily('monospace')
              }
              .width('100%')
              .margin({ top: PageConstants.PERMISSION_TIP_MARGIN_TOP })
            }
            .width('100%')
            .alignItems(HorizontalAlign.Start)
          }

          // Action button area
          Column({ space: PageConstants.ITEM_SPACING }) {
            ActionButton({
              buttonText: $r('app.string.btn_check_dnd'),
              buttonType: 'primary',
              isDisabled: this.viewModel.isLoading,
              onButtonClick: async () => {
                await this.viewModel.queryDndState();
                this.refreshDisplay();
              }
            })

            ActionButton({
              buttonText: $r('app.string.btn_query_notify'),
              buttonType: 'primary',
              isDisabled: this.viewModel.isLoading,
              onButtonClick: async () => {
                await this.viewModel.queryNotifyState();
                this.refreshDisplay();
              }
            })

            ActionButton({
              buttonText: $r('app.string.btn_query_all'),
              buttonType: 'secondary',
              isDisabled: this.viewModel.isLoading,
              onButtonClick: async () => {
                await this.viewModel.queryAllStates();
                this.refreshDisplay();
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
              subtitle: $r('app.string.card_detail_subtitle_dnd')
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
