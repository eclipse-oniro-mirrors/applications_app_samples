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
 * @file persistentProxyForm/src/main/ets/pages/PublishIndex.ets
 * 文件职责：PublishIndex 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：updateRDB、publish、IndexSec。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import base from '@ohos.base';
import common from '@ohos.app.ability.common';
import dataShare from '@ohos.data.dataShare';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import formInfo from '@ohos.app.form.formInfo';
import formObserver from '@ohos.app.form.formObserver';
import prompt from '@ohos.promptAction';
import resourceManager from '@ohos.resourceManager';
import { ValuesBucket, ValueType } from '@ohos.data.ValuesBucket';
import Logger from '../../common/Logger';

// 日志 TAG：用于在 hilog 输出中过滤本页面日志
const TAG = '[Sample_PublishIndex]';
// 当前选中的城市名称（发布时写入 DataShare）
let conditionCity: string;
// 当前选中城市的城市编码，默认沈阳 110000
let conditionID: ValueType = '110000';
// 待发布的温度数据，默认 -30 ℃
let conditionData = '-30 ℃';
// UIAbility 上下文，用于创建 DataShareHelper
let context: common.UIAbilityContext;
// 沈阳的城市名称（从资源文件读取）
let shenYang: string;
// 杭州的城市名称（从资源文件读取）
let hangZhou: string;
// 卡片提供方过滤条件：用于查询本模块正在运行的卡片实例
const formInstanceFilter: formInfo.FormProviderFilter = {
  bundleName: 'ohos.samples.formextability',
  moduleName: 'persistentProxyForm'
};

/**
 * updateRDB：把当前城市与温度写入 DataShare，并通知卡片数据变更。
 * @param context UIAbility 上下文，用于创建 DataShareHelper
 */
function updateRDB(context: common.UIAbilityContext): void {
  dataShare.createDataShareHelper(context, 'datashareproxy://ohos.samples.formextability', { isProxy: true })
    .then((data: dataShare.DataShareHelper) => {
      Logger.info(TAG, `createDataShareHelper succeed, data :  ${JSON.stringify(data)}`);
      let dataShareHelper = data;
      // 按城市编码匹配要更新的数据行
      let da = new dataSharePredicates.DataSharePredicates();
      da.equalTo('cityId', conditionID);
      // 待写入的新值：城市名与温度
      let va: ValuesBucket = {
        cityName: conditionCity,
        cityTemperature: conditionData
      };
      try {
        let uri = 'datashareproxy://ohos.samples.formextability/test';
        dataShareHelper.update(uri, da, va, (err, data) => {
          // 分支说明：更新失败 → 打印错误并 toast 提示
          if (err !== undefined) {
            Logger.info(TAG, `update error1: code: ${err.code}, message: ${err.message} `);
            prompt.showToast(
              { message: `publish err: ${JSON.stringify(err)}`, duration: 5000 });
            return;
          }
          // 分支说明：更新成功 → 打印结果并 toast 展示发布内容
          Logger.info(TAG, `update succeed, data : ${data}`);
          prompt.showToast(
            { message: `publish success ${conditionCity} ${conditionData}`, duration: 5000 });
        });
        // 通知订阅方（卡片）数据已变更
        dataShareHelper.notifyChange(uri);
      } catch (err) {
        Logger.info(TAG, `update error2: code: ${err.code}, message: ${err.message} `);
      }
    })
    .catch((err: base.BusinessError<void>) => {
      Logger.info(TAG, `createDataShareHelper error: code: ${err.code}, message: ${err.message} `);
    });
}

/**
 * publish：查询本模块正在运行的卡片实例，并写入 AppStorage 供页面展示。
 */
function publish(): void {
  Logger.info(TAG, 'publish called');
  formObserver.getRunningFormInfosByFilter(formInstanceFilter).then((data: Array<formInfo.RunningFormInfo>) => {
    Logger.info(TAG, `getRunningFormInfosByFilter data: ${JSON.stringify(data)}`);
    AppStorage.SetOrCreate('RunningFormInfo', JSON.stringify(data));
  }).catch((err: base.BusinessError<void>) => {
    Logger.error(TAG, `getRunningFormInfosByFilter err is ${JSON.stringify(err)}`);
    prompt.showToast(
      { message: `publish err, getRunningFormInfosByFilter1 failed ${JSON.stringify(err)}`, duration: 5000 });
  });
}

/**
 * IndexSec：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct IndexSec {
  private inputText: string = '';

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear() {
    context = getContext(this) as common.UIAbilityContext;
    // 从资源文件取出沈阳、杭州的城市名称资源描述
    let syTemp = $r('app.string.city_sy');
    let hzTemp = $r('app.string.city_hz');
    let citySy: resourceManager.Resource = {
      bundleName: syTemp.bundleName,
      moduleName: syTemp.moduleName,
      id: syTemp.id
    };
    let cityHz: resourceManager.Resource = {
      bundleName: hzTemp.bundleName,
      moduleName: hzTemp.moduleName,
      id: hzTemp.id
    };
    // 同步读取城市名称字符串，供单选框切换时使用
    shenYang = context.resourceManager.getStringSync(citySy);
    hangZhou = context.resourceManager.getStringSync(cityHz);
    // 默认选中沈阳
    conditionCity = shenYang;
  }

  // 与 AppStorage 双向绑定的运行中卡片信息（JSON 字符串）
  @StorageLink('RunningFormInfo') RunningFormInfo: string = '';

  // 输入框聚焦状态
  @State focus: boolean = false;

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
          Text($r('app.string.modify_publish_data')).id('publish_index_text_4')
            .fontColor('#182431')
            .fontSize(40)
            .lineHeight(41)
            .fontWeight('100%')
        }.id('publish_index_column_3')

        // Column：垂直布局容器
        // 关键属性：高度
        Column() {
          // Column：垂直布局容器
          // 关键属性：交叉轴对齐
          Column() {
            // Row：水平布局容器
            Row() {
              // Text：文本
              // 关键属性：字号
              Text($r('app.string.selection_city')).id('publish_index_text_8')
                .fontSize(30)
              // Row：水平布局容器
              // 关键属性：外边距
              Row() {
                // Column：垂直布局容器
                Column() {
                  // Text：文本
                  // 关键属性：字号、外边距
                  Text($r('app.string.city_sy')).id('publish_index_text_11')
                    .fontSize(15)
                    .margin({ bottom: 10 })
                  // Radio：单选框
                  // 关键属性：勾选状态、高度、宽度、radioStyle
                  Radio({ value: 'sy', group: 'cityGroup' }).id('publish_index_radio_12')
                    .checked(true)
                    .height(24)
                    .width(24)
                    .radioStyle({
                      checkedBackgroundColor: $r('sys.color.ohos_id_color_text_primary_activated'),
                      uncheckedBorderColor: $r('sys.color.ohos_id_color_switch_outline_off'),
                      indicatorColor: $r('sys.color.ohos_id_color_foreground_contrary')
                    })
                    .onChange((isChecked: boolean) => {
                      Logger.info(TAG, `sy status is ${JSON.stringify(isChecked)}`);
                      if (isChecked) {
                        conditionID = '110000';
                        conditionCity = shenYang;
                      }
                    })
                }.id('publish_index_column_10')

                // Column：垂直布局容器
                // 关键属性：外边距
                Column() {
                  // Text：文本
                  // 关键属性：字号、外边距
                  Text($r('app.string.city_hz')).id('publish_index_text_14')
                    .fontSize(15)
                    .margin({ bottom: 10 })
                  // Radio：单选框
                  // 关键属性：高度、宽度、radioStyle
                  Radio({ value: 'hz', group: 'cityGroup' }).id('publish_index_radio_15')
                    .height(24)
                    .width(24)
                    .radioStyle({
                      checkedBackgroundColor: $r('sys.color.ohos_id_color_text_primary_activated'),
                      uncheckedBorderColor: $r('sys.color.ohos_id_color_switch_outline_off'),
                      indicatorColor: $r('sys.color.ohos_id_color_foreground_contrary')
                    })
                    .onChange((isChecked: boolean) => {
                      Logger.info(TAG, `hz status is ${JSON.stringify(isChecked)}`);
                      if (isChecked) {
                        conditionID = '310000';
                        conditionCity = hangZhou;
                      }
                    })
                }.id('publish_index_column_13')
                .margin({ left: 20 })
              }.id('publish_index_row_9')
              .margin({ left: 10 })
            }.id('publish_index_row_7')

            // Row：水平布局容器
            Row() {
              // Text：文本
              // 关键属性：字号、宽度、高度
              Text($r('app.string.input_temperature')).id('publish_index_text_17')
                .fontSize(30)
                .width(200)
                .height(60)
              // TextInput：单行输入框
              // 关键属性：字号、字体颜色、宽度、高度、输入类型、圆角
              // 交互：输入/提交回调
              TextInput({ text: '-30' }).id('publish_index_text_input_18')
                .fontSize(20)
                .fontColor($r('sys.color.ohos_id_color_text_primary'))
                .width(100)
                .height(40)
                .type(InputType.Normal)
                .borderRadius(16)
                .backgroundColor($r('sys.color.ohos_id_color_text_field_sub_bg'))
                .onChange((text) => {
                  this.inputText = text;
                })
              // Text：文本
              // 关键属性：字号、高度
              Text('℃').id('publish_index_text_19')
                .fontSize(30)
                .height(60)
            }.id('publish_index_row_16')
          }.id('publish_index_column_6')
          .alignItems(HorizontalAlign.Start)

          // Button：按钮
          // 关键属性：宽度、高度、输入类型、外边距、圆角、背景色
          // 交互：可点击交互
          Button() {
            // Text：文本
            // 关键属性：字体颜色、字号、字重
            Text($r('app.string.published_data')).id('publish_index_text_21')
              .fontColor($r('sys.color.ohos_id_color_foreground_contrary'))
              .fontSize($r('sys.float.ohos_id_text_size_button1'))
              .fontWeight(FontWeight.Bold)
          }.id('publish_index_button_20')
          .width(220)
          .height(40)
          .type(ButtonType.Capsule)
          .margin({ top: 20 })
          .borderRadius($r('sys.float.ohos_id_corner_radius_button'))
          .backgroundColor($r('sys.color.ohos_id_color_component_activated'))
          .onClick(() => {
            if (Number(this.inputText) >= -40 && Number(this.inputText) <= 60) {
              Logger.info(TAG, `correct temperature is ${this.inputText}`);
              conditionData = this.inputText + ' ℃';
              publish();
              updateRDB(context);
            } else {
              Logger.info(TAG, `incorrect temperature is ${this.inputText}`);
              prompt.showToast({ message: 'Please enter the correct value from -40 to 60', duration: 5000 });
            }
          })
        }.id('publish_index_column_5')
        .height('30%')
      }.id('publish_index_column_2')
      .width('100%')
    }.id('publish_index_row_1')
    .height('100%')
  }
}