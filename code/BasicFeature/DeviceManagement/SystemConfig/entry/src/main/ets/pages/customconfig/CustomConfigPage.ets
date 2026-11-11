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
import { SystemConfigConstants, PageConstants, ChannelConfigStatus } from 'library';
import { CustomConfigViewModel } from '../../viewmodel/CustomConfigViewModel';
import { InfoCard } from '../../components/InfoCard';
import { ActionButton } from '../../components/ActionButton';
import { LogPanel } from '../../components/LogPanel';
import { StatusBadge } from '../../components/StatusBadge';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

/**
 * 定制配置页面。
 * 展示 customConfig.getChannelId() 接口的使用，
 * 通过 CustomConfigViewModel 驱动数据获取和状态更新。
 */
@Entry
@Component
struct CustomConfigPage {
  /** 视图模型实例 */
  @State viewModel: CustomConfigViewModel = new CustomConfigViewModel();
  /** 当前渠道号显示 */
  @State displayChannelId: ResourceStr = $r('app.string.value_not_fetched');
  /** 当前状态文本 */
  @State displayStatus: ResourceStr = $r('app.string.status_uninitialized');
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
   * 初始化视图模型并加载数据。
   */
  aboutToAppear(): void {
    hilog.info(DOMAIN, TAG, 'CustomConfigPage aboutToAppear');
    this.viewModel.initialize();
    this.refreshDisplay();
  }

  /**
   * 页面约消失回调。
   * 销毁视图模型释放资源。
   */
  aboutToDisappear(): void {
    hilog.info(DOMAIN, TAG, 'CustomConfigPage aboutToDisappear');
    this.viewModel.destroy();
  }

  /**
   * 刷新页面显示状态。
   * 从视图模型同步数据到 @State 变量。
   */
  private refreshDisplay(): void {
    this.displayChannelId = this.viewModel.currentChannelId || $r('app.string.value_not_fetched');
    this.displayStatus = this.getStatusText(this.viewModel.currentStatus);
    this.updateStatusStyle(this.viewModel.currentStatus);
    this.displayLogs = this.viewModel.getLogs();
    this.detailText = this.viewModel.getConfigDetail();
  }

  /**
   * 获取状态对应的本地化文本资源。
   * @param {ChannelConfigStatus} status - 状态枚举值
   * @returns {Resource} 状态文本资源
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
   * 更新状态标签的样式。
   * @param {ChannelConfigStatus} status - 状态枚举值
   */
  private updateStatusStyle(status: ChannelConfigStatus): void {
    switch (status) {
      case ChannelConfigStatus.SUCCESS:
        this.statusColor = PageConstants.COLOR_SUCCESS;
        this.statusBgColor = '#E8F5E9';
        break;
      case ChannelConfigStatus.FAILED:
        this.statusColor = PageConstants.COLOR_ERROR;
        this.statusBgColor = '#FFEBEE';
        break;
      case ChannelConfigStatus.LOADING:
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
   * 渲染定制配置页面的完整 UI 布局。
   */
  build() {
    Column() {
      // 标题栏
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

      // 可滚动内容区域
      Scroll() {
        Column({ space: PageConstants.SECTION_SPACING }) {
          // 渠道号信息卡片
          InfoCard({
            title: $r('app.string.card_channel_title'),
            subtitle: $r('app.string.card_channel_subtitle')
          }) {
            Column({ space: 8 }) {
              Row() {
                Text($r('app.string.label_channel_id'))
                  .fontSize(PageConstants.FONT_SIZE_BODY)
                  .fontColor(PageConstants.COLOR_TEXT_SECONDARY)
                  .width(80)
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
                  .width(80)
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

          // 操作按钮区域
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

          // 详情信息卡片
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
