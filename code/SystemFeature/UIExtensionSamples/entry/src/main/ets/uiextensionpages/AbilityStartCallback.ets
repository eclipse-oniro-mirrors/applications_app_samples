/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @file entry/src/main/ets/uiextensionpages/AbilityStartCallback.ets
 * 文件职责：AbilityStartCallback 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：AbilityStartCallback。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { promptAction } from '@kit.ArkUI';

// 日志域标识：0xFF00 为本示例统一使用的 hilog 业务域
const TAG: string = '[AbilityStartCallback]';
// 日志 TAG：用于在 hilog 输出中过滤本文件日志
const DOMAIN: number = 0xFF00;

/**
 * AbilityStartCallback：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct AbilityStartCallback {
  private promptDuration: number = 2000;
  private context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // Row：水平布局容器
      // 关键属性：宽度、高度、主轴对齐、背景色
      Row() {
        // Flex：弹性布局容器
        Flex({ justifyContent: FlexAlign.Start, alignContent: FlexAlign.Center }) {
          // Text：文本
          // 关键属性：字号、字重、文本对齐、外边距
          Text($r('app.string.AbilityStartCallback')).id('ability_start_callback_text_4')
            .fontSize(30)
            .fontWeight(700)
            .textAlign(TextAlign.Start)
            .margin({
              top: 8,
              bottom: 8,
              left: 12
            })
        }.id('ability_start_callback_flex_3')
      }.id('ability_start_callback_row_2')
      .width('100%')
      .height('14.36%')
      .justifyContent(FlexAlign.Start)
      .backgroundColor($r('app.color.backGrounding'))

      // List：列表容器
      // 关键属性：高度、背景色
      List({ initialIndex: 0 }) {
        // ListItem：列表项
        // 关键属性：高度、背景色、圆角、外边距
        ListItem() {
          // Flex：弹性布局容器
          // 关键属性：点击事件回调
          // 交互：可点击交互
          Flex({ justifyContent: FlexAlign.SpaceBetween, alignContent: FlexAlign.Center }) {
            // Text：文本
            // 关键属性：文本对齐、字重、外边距
            Text($r('app.string.UIAbilityContext_startAbilityByType_onResult')).id('ability_start_callback_text_7')
              .textAlign(TextAlign.Start)
              .fontWeight(500)
              .margin({
                top: 17,
                bottom: 17,
                left: 12
              })
              .fontSize(16)
              .width('77.87%')
              .height('39.29%')
              .fontColor($r('app.color.text_color'))

            // Row：水平布局容器
            Row() {
              // Image：图片
              // 关键属性：宽度、高度、外边距
              Image($r('app.media.ic_arrow')).id('ability_start_callback_image_9')
                .width(24)
                .height(24)
                .margin({ top: 16, bottom: 16, right: 6 })
            }.id('ability_start_callback_row_8')
          }
          .id('onResult')
          .onClick(() => {
            // 构造拉起音频选择器的入参：wantParam 为空表示使用默认选择器配置
            let wantParam: Record<string, Object> = {};
            // 回调对象：分别处理启动失败（onError）与用户选择结果（onResult）
            let abilityStartCallback: common.AbilityStartCallback = {
              // 分支说明：启动失败 → 打印日志并 toast 提示错误码与错误名
              onError: (code: number, name: string, message: string) => {
                let msg = `startAbilityByType onError, code:${code} name:${name} message:${message}`;
                hilog.info(DOMAIN, TAG, msg);
                promptAction.showToast({ message: msg, duration: this.promptDuration, bottom: '11%' });
              },
              // 分支说明：用户完成选择 → 打印结果码与目标包名并 toast 展示
              onResult: (abilityResult: common.AbilityResult) => {
                hilog.info(DOMAIN, TAG, `resultCode:` + abilityResult.resultCode + `bundleName:` +
                  abilityResult.want?.bundleName);
                let msg = `startAbilityByType onResult,
                    resultCode:${abilityResult.resultCode} bundleName:${abilityResult.want?.bundleName}`;
                hilog.info(DOMAIN, TAG, msg);
                promptAction.showToast({ message: msg, duration: this.promptDuration, bottom: '11%' });
              }
            };

            // 以 audioPicker 类型拉起系统音频选择器，失败时走 err 回调提示
            this.context.startAbilityByType('audioPicker', wantParam, abilityStartCallback, (err: BusinessError) => {
              let msg = `startAbilityByType fail, err: ${JSON.stringify(err)}`;
              hilog.info(DOMAIN, TAG, msg);
              promptAction.showToast({ message: msg, duration: this.promptDuration, bottom: '11%' });
            });
          })
        }.id('ability_start_callback_list_item_6')
        .height('8.45%')
        .backgroundColor($r('app.color.start_window_background'))
        .borderRadius(24)
        .margin({ top: 12, right: 12, left: 12 })

        // ListItem：列表项
        // 关键属性：高度、背景色、圆角、外边距
        ListItem() {
          // Flex：弹性布局容器
          // 关键属性：点击事件回调
          // 交互：可点击交互
          Flex({ justifyContent: FlexAlign.SpaceBetween, alignContent: FlexAlign.Center }) {
            // Text：文本
            // 关键属性：文本对齐、字重、外边距
            Text($r('app.string.UIAbilityContext_startAbilityByType_onError')).id('ability_start_callback_text_11')
              .textAlign(TextAlign.Start)
              .fontWeight(500)
              .margin({
                top: 17,
                bottom: 17,
                left: 12
              })
              .fontSize(16)
              .width('77.87%')
              .height('39.29%')
              .fontColor($r('app.color.text_color'))
          }
          .id('onError')
          .onClick(() => {
            // 构造拉起音频选择器的入参：wantParam 为空表示使用默认选择器配置
            let wantParam: Record<string, Object> = {};
            // 回调对象：分别处理启动失败（onError）与用户选择结果（onResult）
            let abilityStartCallback: common.AbilityStartCallback = {
              // 分支说明：启动失败 → 打印日志并 toast 提示错误码与错误名
              onError: (code: number, name: string, message: string) => {
                let msg = `startAbilityByType onError, code:${code} name:${name} message:${message}`;
                hilog.info(DOMAIN, TAG, msg);
                promptAction.showToast({ message: msg, duration: this.promptDuration, bottom: '11%' });
              },
              // 分支说明：用户完成选择 → 打印结果码与目标包名并 toast 展示
              onResult: (abilityResult: common.AbilityResult) => {
                hilog.info(DOMAIN, TAG, `resultCode:` + abilityResult.resultCode + `bundleName:` +
                  abilityResult.want?.bundleName);
                let msg = `startAbilityByType onResult,
                    resultCode:${abilityResult.resultCode} bundleName:${abilityResult.want?.bundleName}`;
                hilog.info(DOMAIN, TAG, msg);
                promptAction.showToast({ message: msg, duration: this.promptDuration, bottom: '11%' });
              }
            };

            // 以 error 类型拉起，用于演示 onError 回调分支的提示效果
            this.context.startAbilityByType('error', wantParam, abilityStartCallback, (err: BusinessError) => {
              let msg = `startAbilityByType fail, err: ${JSON.stringify(err)}`;
              hilog.info(DOMAIN, TAG, msg);
              promptAction.showToast({ message: msg, duration: this.promptDuration, bottom: '11%' });
            });
          })
        }.id('ability_start_callback_list_item_10')
        .height('8.45%')
        .backgroundColor($r('app.color.start_window_background'))
        .borderRadius(24)
        .margin({ top: 12, right: 12, left: 12 })
      }.id('ability_start_callback_list_5')
      .height('86%')
      .backgroundColor($r('app.color.backGrounding'))
    }.id('ability_start_callback_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.backGrounding'))
  }
}