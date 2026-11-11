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
import { SystemConfigConstants, PageConstants, DoNotDisturbStatus } from 'library';
import { IntelligentSceneViewModel } from '../../viewmodel/IntelligentSceneViewModel';
import { InfoCard } from '../../components/InfoCard';
import { ActionButton } from '../../components/ActionButton';
import { LogPanel } from '../../components/LogPanel';
import { StatusBadge } from '../../components/StatusBadge';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

/**
 * 情景模式页面。
 * 展示 intelligentScene 模块的免打扰状态查询功能，
 * 通过 IntelligentSceneViewModel 驱动异步数据获取和状态更新。
 * 需要权限：ohos.permission.GET_DONOTDISTURB_STATE
 */
@Entry
@Component
struct IntelligentScenePage {
  /** 视图模型实例 */
  @State viewModel: IntelligentSceneViewModel = new IntelligentSceneViewModel();
  /** 免打扰启用状态显示 */
  @State displayDndEnabled: ResourceStr = $r('app.string.value_not_queried');
  /** 通知允许状态显示 */
  @State displayNotifyAllowed: ResourceStr = $r('app.string.value_not_queried');
  /** 当前查询状态文本 */
  @State displayStatus: ResourceStr = $r('app.string.status_idle');
  /** 状态标签颜色 */
  @State statusColor: string = PageConstants.COLOR_TEXT_HINT;
  /** 状态标签背景色 */
  @State statusBgColor: string = '#F0F0F0';
  /** 日志列表 */
  @State displayLogs: string[] = [];
  /** 详情文本 */
  @State detailText: string = '';

  /**
   * 页面约创建回调。
   * 初始化视图模型。
   */
  aboutToAppear(): void {
    hilog.info(DOMAIN, TAG, 'IntelligentScenePage aboutToAppear');
    this.viewModel.initialize();
    this.refreshDisplay();
  }

  /**
   * 页面约消失回调。
   * 销毁视图模型释放资源。
   */
  aboutToDisappear(): void {
    hilog.info(DOMAIN, TAG, 'IntelligentScenePage aboutToDisappear');
    this.viewModel.destroy();
  }

  /**
   * 刷新页面显示状态。
   * 从视图模型同步数据到 @State 变量。
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
   * 获取状态对应的本地化文本资源。
   * @param {DoNotDisturbStatus} status - 状态枚举值
   * @returns {Resource} 状态文本资源
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
   * 更新状态标签的样式。
   * @param {DoNotDisturbStatus} status - 状态枚举值
   */
  private updateStatusStyle(status: DoNotDisturbStatus): void {
    switch (status) {
      case DoNotDisturbStatus.SUCCESS:
        this.statusColor = PageConstants.COLOR_SUCCESS;
        this.statusBgColor = '#E8F5E9';
        break;
      case DoNotDisturbStatus.FAILED:
        this.statusColor = PageConstants.COLOR_ERROR;
        this.statusBgColor = '#FFEBEE';
        break;
      case DoNotDisturbStatus.QUERYING:
        this.statusColor = PageConstants.COLOR_WARNING;
        this.statusBgColor = '#FFF3E0';
        break;
      default:
        this.statusColor = PageConstants.COLOR_TEXT_HINT;
        this.statusBgColor = '#F0F0F0';
        break;
    }
  }

  /**
   * 页面构建方法。
   * 渲染情景模式页面的完整 UI 布局。
   */
  build() {
    Column() {
      // 标题栏
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

      // 可滚动内容区域
      Scroll() {
        Column({ space: PageConstants.SECTION_SPACING }) {
          // 免打扰状态信息卡片
          InfoCard({
            title: $r('app.string.card_dnd_title'),
            subtitle: $r('app.string.card_dnd_subtitle')
          }) {
            Column({ space: 8 }) {
              Row() {
                Text($r('app.string.label_dnd_mode'))
                  .fontSize(PageConstants.FONT_SIZE_BODY)
                  .fontColor(PageConstants.COLOR_TEXT_SECONDARY)
                  .width(100)
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
                  .width(100)
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
                  .width(100)
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
                  .width(100)
                Text(SystemConfigConstants.PERMISSION_DND)
                  .fontSize(PageConstants.FONT_SIZE_SMALL)
                  .fontColor(PageConstants.COLOR_TEXT_HINT)
                  .fontFamily('monospace')
              }
              .width('100%')
              .margin({ top: 4 })
            }
            .width('100%')
            .alignItems(HorizontalAlign.Start)
          }

          // 操作按钮区域
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

          // 详情信息卡片
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
