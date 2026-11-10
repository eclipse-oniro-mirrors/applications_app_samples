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
  @State pinStatusText: string = '空闲';
  /** NFC 设置状态文本 */
  @State nfcStatusText: string = '空闲';
  /** 双击设置状态文本 */
  @State doubleClickStatusText: string = '空闲';
  /** 双击查询结果文本 */
  @State clickResultDisplay: string = '未查询';
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
    this.clickResultDisplay = this.viewModel.clickResultText || '未查询';
    this.displayLogs = this.viewModel.getLogs();
    this.detailText = this.viewModel.getAllSettingsDetail();
  }

  /**
   * 获取状态标签的文字颜色。
   * @param {string} statusText - 状态文本
   * @returns {string} 颜色值
   */
  private getStatusTextColor(statusText: string): string {
    switch (statusText) {
      case '操作成功':
        return PageConstants.COLOR_SUCCESS;
      case '操作失败':
        return PageConstants.COLOR_ERROR;
      case '打开页面中':
      case '查询中':
        return PageConstants.COLOR_WARNING;
      default:
        return PageConstants.COLOR_TEXT_HINT;
    }
  }

  /**
   * 获取状态标签的背景颜色。
   * @param {string} statusText - 状态文本
   * @returns {string} 颜色值
   */
  private getStatusBgColor(statusText: string): string {
    switch (statusText) {
      case '操作成功':
        return '#E8F5E9';
      case '操作失败':
        return '#FFEBEE';
      case '打开页面中':
      case '查询中':
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
        Text(PageConstants.TITLE_SETTINGS_LITE)
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
          // PIN 设置卡片
          InfoCard({
            title: 'PIN 码设置',
            subtitle: 'settingsLite.openPinSettingPage()'
          }) {
            Column({ space: 8 }) {
              Row() {
                Text('状态:')
                  .fontSize(PageConstants.FONT_SIZE_BODY)
                  .fontColor(PageConstants.COLOR_TEXT_SECONDARY)
                  .width(60)
                StatusBadge({
                  text: this.pinStatusText,
                  textColor: this.getStatusTextColor(this.pinStatusText),
                  bgColor: this.getStatusBgColor(this.pinStatusText)
                })
              }
              .width('100%')
              .alignItems(VerticalAlign.Center)

              ActionButton({
                buttonText: '打开 PIN 设置页面',
                buttonType: 'primary',
                isDisabled: this.viewModel.isLoading,
                onButtonClick: () => {
                  this.viewModel.openPinSettings();
                  this.refreshDisplay();
                }
              })
            }
            .width('100%')
          }

          // NFC 设置卡片
          InfoCard({
            title: 'NFC 设置',
            subtitle: 'settingsLite.openNfcSettingsPage()'
          }) {
            Column({ space: 8 }) {
              Row() {
                Text('状态:')
                  .fontSize(PageConstants.FONT_SIZE_BODY)
                  .fontColor(PageConstants.COLOR_TEXT_SECONDARY)
                  .width(60)
                StatusBadge({
                  text: this.nfcStatusText,
                  textColor: this.getStatusTextColor(this.nfcStatusText),
                  bgColor: this.getStatusBgColor(this.nfcStatusText)
                })
              }
              .width('100%')
              .alignItems(VerticalAlign.Center)

              ActionButton({
                buttonText: '打开 NFC 设置页面',
                buttonType: 'primary',
                isDisabled: this.viewModel.isLoading,
                onButtonClick: () => {
                  this.viewModel.openNfcSettings();
                  this.refreshDisplay();
                }
              })
            }
            .width('100%')
          }

          // 双击设置卡片
          InfoCard({
            title: '双击设置',
            subtitle: 'settingsLite.openDoubleClickSettingsPage() / isDoubleClickAppForSelf()'
          }) {
            Column({ space: 8 }) {
              Row() {
                Text('状态:')
                  .fontSize(PageConstants.FONT_SIZE_BODY)
                  .fontColor(PageConstants.COLOR_TEXT_SECONDARY)
                  .width(60)
                StatusBadge({
                  text: this.doubleClickStatusText,
                  textColor: this.getStatusTextColor(this.doubleClickStatusText),
                  bgColor: this.getStatusBgColor(this.doubleClickStatusText)
                })
              }
              .width('100%')
              .alignItems(VerticalAlign.Center)

              Row() {
                Text('查询结果:')
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
                buttonText: '打开双击设置页面',
                buttonType: 'primary',
                isDisabled: this.viewModel.isLoading,
                onButtonClick: () => {
                  this.viewModel.openDoubleClickSettings();
                  this.refreshDisplay();
                }
              })

              ActionButton({
                buttonText: '查询双击应用',
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
              subtitle: 'SettingsItemModel JSON 表示'
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
