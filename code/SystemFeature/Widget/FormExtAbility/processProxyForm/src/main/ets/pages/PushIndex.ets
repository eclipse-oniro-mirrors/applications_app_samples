/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

/**
 * @file processProxyForm/src/main/ets/pages/PushIndex.ets
 * 文件职责：PushIndex 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：updateCardDisplayContent、publish、IndexSec。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import base from '@ohos.base';
import common from '@ohos.app.ability.common';
import dataShare from '@ohos.data.dataShare';
import formInfo from '@ohos.app.form.formInfo';
import formObserver from '@ohos.app.form.formObserver';
import prompt from '@ohos.promptAction';
import Logger from '../../common/Logger';

// 日志 TAG：用于在 hilog 输出中过滤本页面日志
const TAG = '[Sample_PushIndex]';
// UIAbility 上下文，用于创建 DataShareHelper
let context: common.UIAbilityContext;
// DataShareHelper 实例：用于向卡片推送数据
let dataShareHelper: dataShare.DataShareHelper;
// DataShare 代理 URI：卡片订阅的数据源地址
let uri = ('datashareproxy://ohos.samples.formextability');
// 待推送的城市名称
let conditionCity = '';
// 待推送的城市编码，默认沈阳 110000
let conditionID = '110000';
// 待推送的温度数据，默认 -30 ℃
let conditionData = '-30 ℃';
// 卡片提供方过滤条件：用于查询 processWidget 的运行实例
const formInstanceFilter: formInfo.FormProviderFilter = {
  bundleName: 'ohos.samples.formextability',
  abilityName: 'processEntryFormAbility',
  formName: 'processWidget',
  moduleName: 'processProxyForm'
};

/**
 * updateCardDisplayContent：向指定卡片推送城市名与温度数据。
 * @param runningFormInfo 正在运行的卡片实例信息
 */
function updateCardDisplayContent(runningFormInfo: formInfo.RunningFormInfo): void {
  Logger.info(TAG, `updateCardDisplayContent bundle: ${runningFormInfo.bundleName}`);
  dataShare.createDataShareHelper(context, uri, { isProxy: true }, (err, dataHelper) => {
    Logger.info(TAG, `dataShareHelper err: ${err}`, `data: ${JSON.stringify(dataShareHelper)}`);
    dataShareHelper = dataHelper;
    // 分支说明：创建失败 → 打印错误并 toast；创建成功 → 组装数据项并推送
    if (err !== undefined) {
      Logger.error(TAG, `createDataShareHelper error code: ${err.code}`, `message: ${err.message} `);
      prompt.showToast({ message: 'createDataShareHelper:' + err.message, duration: 5000 });
    } else {
      // 推送数据项：城市名与温度，subscriberId 为城市编码
      let publishedItemData: Array<dataShare.PublishedItem> = [
        { key: 'cityName', data: JSON.stringify(conditionCity), subscriberId: conditionID },
        { key: 'cityTemperature', data: JSON.stringify(conditionData), subscriberId: conditionID }
      ];
      dataShareHelper.publish(publishedItemData, 'ohos.samples.formextability').then((data: Array<dataShare.OperationResult>) => {
        Logger.info(TAG, `publish success, data is ${JSON.stringify(data)}`);
        prompt.showToast(
          { message: `publish success ${conditionCity} ${conditionData}`, duration: 5000 });
      }).catch((err: base.BusinessError<void>) => {
        Logger.error(TAG, `publish error: ${JSON.stringify(err)}`);
        prompt.showToast({ message: `publish err: ${JSON.stringify(err)}`, duration: 5000 });
      });
    }
  });
}

/**
 * publish：查询运行中的卡片实例，并逐个推送最新数据。
 */
function publish(): void {
  Logger.info(TAG, 'publish called');

  // 分支说明：查询成功 → 写入 AppStorage 并逐个推送；失败 → 打印错误并 toast
  formObserver.getRunningFormInfosByFilter(formInstanceFilter).then((data: Array<formInfo.RunningFormInfo>) => {
    Logger.info(TAG, `getRunningFormInfosByFilter data: ${JSON.stringify(data)}`);
    AppStorage.SetOrCreate('runningFormInfo', JSON.stringify(data));
    data.forEach(updateCardDisplayContent);
  }).catch((err: base.BusinessError<void>) => {
    Logger.error(TAG, `getRunningFormInfosByFilter err is ${JSON.stringify(err)}`);
    prompt.showToast(
      { message: `publish err, getRunningFormInfosByFilter failed ${JSON.stringify(err)}`, duration: 5000 });
  });
}

/**
 * IndexSec：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct IndexSec {
  // @StorageLink runningFormInfo：与 AppStorage 双向绑定
  @StorageLink('runningFormInfo') runningFormInfo: string = '';

  // @State focus：组件内部状态
  @State focus: boolean = false;

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear() {
    context = getContext(this) as common.UIAbilityContext;
    conditionCity = context.resourceManager.getStringSync($r('app.string.city_sy'));
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Row：水平布局容器
    // 关键属性：高度
    Row() {
      // Column：垂直布局容器
      // 关键属性：宽度
      Column({ space: 200 }) {
        // Column：垂直布局容器
        Column({ space: 5 }) {
          // Text：文本
          // 关键属性：字体颜色、字号、行高、字重
          Text($r('app.string.modify_publish_data')).id('push_index_text_4')
            .fontColor('#182431')
            .fontSize(40)
            .lineHeight(41)
            .fontWeight('100%')
        }.id('push_index_column_3')

        // Column：垂直布局容器
        // 关键属性：交叉轴对齐、高度
        Column() {
          // Column：垂直布局容器
          // 关键属性：交叉轴对齐
          Column() {
            // Row：水平布局容器
            Row() {
              // Text：文本
              // 关键属性：字号
              Text($r('app.string.selection_city')).id('push_index_text_8')
                .fontSize(30)
              // Row：水平布局容器
              // 关键属性：外边距
              Row() {
                // Column：垂直布局容器
                Column() {
                  // Text：文本
                  // 关键属性：字号、外边距
                  Text($r('app.string.city_sy')).id('push_index_text_11')
                    .fontSize(15)
                    .margin({ bottom: 10 })
                  // Radio：单选框
                  // 关键属性：勾选状态、高度、宽度、radioStyle
                  Radio({ value: 'sy', group: 'cityGroup' }).id('push_index_radio_12')
                    .checked(true)
                    .height(24)
                    .width(24)
                    .radioStyle({
                      checkedBackgroundColor: $r('sys.color.ohos_id_color_text_primary_activated'),
                      indicatorColor: $r('sys.color.ohos_fa_foreground_contrary'),
                      uncheckedBorderColor: $r('sys.color.ohos_id_color_switch_outline_off') })
                    .onChange((isChecked: boolean) => {
                      Logger.info(TAG, `sy status is ${JSON.stringify(isChecked)}`);
                      if (isChecked) {
                        conditionID = '110000';
                        conditionCity = context.resourceManager.getStringSync($r('app.string.city_sy'));
                      }
                    })
                }.id('push_index_column_10')

                // Column：垂直布局容器
                // 关键属性：外边距
                Column() {
                  // Text：文本
                  // 关键属性：字号、外边距
                  Text($r('app.string.city_hz')).id('push_index_text_14')
                    .fontSize(15)
                    .margin({ bottom: 10 })
                  // Radio：单选框
                  // 关键属性：高度、宽度、radioStyle
                  Radio({ value: 'hz', group: 'cityGroup' }).id('push_index_radio_15')
                    .height(24)
                    .width(24)
                    .radioStyle({
                      checkedBackgroundColor: $r('sys.color.ohos_id_color_text_primary_activated'),
                      indicatorColor: $r('sys.color.ohos_fa_foreground_contrary'),
                      uncheckedBorderColor: $r('sys.color.ohos_id_color_switch_outline_off') })
                    .onChange((isChecked: boolean) => {
                      Logger.info(TAG, `hz status is ${JSON.stringify(isChecked)}`);
                      if (isChecked) {
                        conditionID = '310000';
                        conditionCity = context.resourceManager.getStringSync($r('app.string.city_hz'));
                      }
                    })
                }.id('push_index_column_13')
                .margin({ left: 20 })
              }.id('push_index_row_9')
              .margin({ left: 10 })
            }.id('push_index_row_7')

            // Row：水平布局容器
            Row() {
              // Text：文本
              // 关键属性：字号、宽度、高度
              Text($r('app.string.input_temperature')).id('push_index_text_17')
                .fontSize(30)
                .width(200)
                .height(60)
              // TextInput：单行输入框
              // 关键属性：字号、字体颜色、宽度、高度、输入类型、圆角
              // 交互：输入/提交回调
              TextInput({ text: '-30' }).id('push_index_text_input_18')
                .fontSize(20)
                .fontColor($r('sys.color.ohos_id_color_text_primary'))
                .width(100)
                .height(40)
                .type(InputType.Normal)
                .borderRadius(16)
                .backgroundColor($r('sys.color.ohos_id_color_text_field_sub_bg'))
                .onChange((text) => {
                  conditionData = text;
                })
              // Text：文本
              // 关键属性：字号、高度
              Text('℃').id('push_index_text_19')
                .fontSize(30)
                .height(60)
            }.id('push_index_row_16')
          }.id('push_index_column_6')
          .alignItems(HorizontalAlign.Start)

          // Button：按钮
          // 关键属性：高度、宽度、圆角、背景色、输入类型、外边距
          // 交互：可点击交互
          Button() {
            // Text：文本
            // 关键属性：字体颜色、字号、字重
            Text($r('app.string.published_data')).id('push_index_text_21')
              .fontColor($r('sys.color.ohos_id_color_foreground_contrary'))
              .fontSize($r('sys.float.ohos_id_text_size_button1'))
              .fontWeight(FontWeight.Bold)
          }.id('push_index_button_20')
          .height(40)
          .width(220)
          .borderRadius($r('sys.float.ohos_id_corner_radius_button'))
          .backgroundColor($r('sys.color.ohos_id_color_component_activated'))
          .type(ButtonType.Capsule)
          .margin({ top: 20 })
          .onClick(() => {
            if (Number(conditionData) >= -40 && Number(conditionData) <= 60) {
              Logger.info(TAG, `correct temperature is ${conditionData}`);
              publish();
            } else {
              Logger.info(TAG, `incorrect temperature is ${conditionData}`);
              prompt.showToast({ message: 'Please enter the correct value from -40 to 60', duration: 5000 });
            }
          })
        }.id('push_index_column_5')
        .alignItems(HorizontalAlign.Center)
        .height('30%')
      }.id('push_index_column_2')
      .width('100%')
    }.id('push_index_row_1')
    .height('100%')
  }
}