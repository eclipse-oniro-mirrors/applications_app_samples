/*
 * Copyright (c) 2024 Hunan OpenValley Digital Industry Development Co., Ltd.
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
  @State displayDndEnabled: string = '未查询';
  /** 通知允许状态显示 */
  @State displayNotifyAllowed: string = '未查询';
  /** 当前查询状态文本 */
  @State displayStatus: string = '空闲';
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
    this.displayDndEnabled = this.viewModel.isDndEnabled ? '已启用' : '未启用';
    this.displayNotifyAllowed = this.viewModel.isNotifyAllowed ? '允许' : '不允许';
    this.displayStatus = this.getStatusText(this.viewModel.currentStatus);
    this.updateStatusStyle(this.viewModel.currentStatus);
    this.displayLogs = this.viewModel.getLogs();
    this.detailText = this.viewModel.getDndDetail();
  }

  /**
   * 获取状态的中文文本。
   * @param {DoNotDisturbStatus} status - 状态枚举值
   * @returns {string} 中文状态描述
   */
  private getStatusText(status: DoNotDisturbStatus): string {
    switch (status) {
      case DoNotDisturbStatus.IDLE:
        return '空闲';
      case DoNotDisturbStatus.QUERYING:
        return '查询中';
      case DoNotDisturbStatus.SUCCESS:
        return '查询成功';
      case DoNotDisturbStatus.FAILED:
        return '查询失败';
      default:
        return '未知';
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
        Text(PageConstants.TITLE_INTELLIGENT_SCENE)
          .fontSize(PageConstants.FONT_SIZE_TITLE)
          .fontWeight(PageConstants.FONT_WEIGHT_BOLD)
          .fontColor(PageConstants.COLOR_TEXT_PRIMARY)
      }
      .width('100%')
      .height(PageConstants.NAV_BAR_HEIGHT)
      .padding({ left: PageConstants.PAGE_PADDING, right: PageConstants.PAGE_PADDING })
      .backgroundColor(PageConstants.COLOR_SURFACE)
      .justifyContent(FlexAlign.Center)

      // 可滚动内容区域
      Scroll() {
        Column({ space: PageConstants.SECTION_SPACING }) {
          // 免打扰状态信息卡片
          InfoCard({
            title: '免打扰状态信息',
            subtitle: 'intelligentScene 模块查询结果'
          }) {
            Column({ space: 8 }) {
              Row() {
                Text('免打扰模式:')
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
                Text('通知允许:')
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
                Text('查询状态:')
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
                Text('所需权限:')
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
              buttonText: '查询免打扰状态',
              buttonType: 'primary',
              isDisabled: this.viewModel.isLoading,
              onButtonClick: async () => {
                await this.viewModel.queryDndState();
                this.refreshDisplay();
              }
            })

            ActionButton({
              buttonText: '查询通知允许状态',
              buttonType: 'primary',
              isDisabled: this.viewModel.isLoading,
              onButtonClick: async () => {
                await this.viewModel.queryNotifyState();
                this.refreshDisplay();
              }
            })

            ActionButton({
              buttonText: '查询全部状态',
              buttonType: 'secondary',
              isDisabled: this.viewModel.isLoading,
              onButtonClick: async () => {
                await this.viewModel.queryAllStates();
                this.refreshDisplay();
              }
            })

            ActionButton({
              buttonText: '重置',
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
              title: '详细数据',
              subtitle: 'DoNotDisturbModel JSON 表示'
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
            panelTitle: '操作日志',
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
