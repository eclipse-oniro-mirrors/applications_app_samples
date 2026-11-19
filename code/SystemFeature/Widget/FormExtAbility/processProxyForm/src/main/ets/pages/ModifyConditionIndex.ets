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
 * @file processProxyForm/src/main/ets/pages/ModifyConditionIndex.ets
 * 文件职责：ModifyConditionIndex 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：updateCardDisplayContent、modifyCondition、IndexThi。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import base from '@ohos.base';
import common from '@ohos.app.ability.common';
import formBindingData from '@ohos.app.form.formBindingData';
import formInfo from '@ohos.app.form.formInfo';
import formObserver from '@ohos.app.form.formObserver';
import formProvider from '@ohos.app.form.formProvider';
import Logger from '../../common/Logger';
import { getProcessConditionID, saveProcessConditionID } from '../../common/StatePersistence';

const TAG = '[Sample_ModifyConditionIndex]';

let conditionID = '110000';

let context: common.UIAbilityContext;

/**
 * updateCardDisplayContent：函数定义，承载本文件对应的逻辑与数据。
 */
function updateCardDisplayContent(runningFormInfo: formInfo.RunningFormInfo): void {
  Logger.info(TAG, `updateCardDisplayContent bundle: ${runningFormInfo.bundleName}`);
  let proxies:Array<formBindingData.ProxyData> = [
    {
      key: 'cityName',
      subscriberId: conditionID
    },
    {
      key: 'cityTemperature',
      subscriberId: conditionID
    }
  ];
  let formBinding = formBindingData.createFormBindingData();
  formBinding['proxies'] = proxies;
  formProvider.updateForm(runningFormInfo.formId, formBinding).then(() => {
    Logger.info(TAG, `update Form OK formData is ${JSON.stringify(formBinding)}`);
  }).catch((err: base.BusinessError<void>) => {
    Logger.error(TAG, `update Form Failed ${JSON.stringify(err)}`);
  });
}

/**
 * modifyCondition：函数定义，承载本文件对应的逻辑与数据。
 */
function modifyCondition(): void {
  let formInstanceFilter: formInfo.FormProviderFilter = {
    bundleName: 'ohos.samples.formextability',
    moduleName: 'processProxyForm'
  };
  formObserver.getRunningFormInfosByFilter(formInstanceFilter).then((data: Array<formInfo.RunningFormInfo>) => {
    Logger.info(TAG, `getRunningFormInfosByFilter data: ${JSON.stringify(data)}`);
    AppStorage.SetOrCreate('runningFormInfo', JSON.stringify(data));
    data.forEach(updateCardDisplayContent);
  }).catch((err: base.BusinessError<void>) => {
    Logger.error(TAG, `getRunningFormInfosByFilter err is ${JSON.stringify(err)}`);
  });
}

/**
 * IndexThi：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct IndexThi {
  // @State processConditionID：组件内部状态
  @State processConditionID: string = '';

  // @State processSwitchFlag：组件内部状态
  @State processSwitchFlag: boolean = true;

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear() {
    context = getContext(this) as common.UIAbilityContext;
    this.processConditionID = getProcessConditionID(context);
    if (typeof this.processConditionID !== 'string' || this.processConditionID === '') {
      this.processConditionID = '110000'
    }
    this.processSwitchFlag = this.processConditionID.localeCompare('110000') === 0;
    Logger.debug(TAG, `persistentSwitchFlag : ${JSON.stringify(this.processSwitchFlag)}`);
  }

  /**
   * aboutToDisappear：组件即将销毁时回调，用于释放资源与取消订阅。
   */
  aboutToDisappear() {
    saveProcessConditionID(context, this.processConditionID);
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Row：水平布局容器
    // 关键属性：高度
    Row() {
      // Column：垂直布局容器
      Column({ space: 150 }) {
        // Text：文本
        // 关键属性：字体颜色、字号、行高、字重
        Text($r('app.string.subscription_conditions')).id('modify_condition_index_text_3')
          .fontColor('#182431')
          .fontSize(40)
          .lineHeight(41)
          .fontWeight('100%')
        // Column：垂直布局容器
        // 关键属性：宽度
        Column() {
          // Text：文本
          // 关键属性：字号、外边距
          Text($r('app.string.modify_subscription_conditions')).id('modify_condition_index_text_5')
            .fontSize(28)
            .margin({ bottom: 20 })
          // Row：水平布局容器
          // 关键属性：宽度
          Row() {
            // Flex：弹性布局容器
            Flex({ justifyContent: FlexAlign.SpaceEvenly }) {
              // Column：垂直布局容器
              Column() {
                // Text：文本
                // 关键属性：外边距
                Text($r('app.string.city_sy')).id('modify_condition_index_text_9')
                  .margin({ bottom: 10 })
                // Radio：单选框
                // 关键属性：高度、宽度、radioStyle
                Radio({ value: 'sy', group: 'modifyConditionGroup' }).id('modify_condition_index_radio_10')
                  .height(24)
                  .width(24)
                  .radioStyle({
                    checkedBackgroundColor: $r('sys.color.ohos_id_color_text_primary_activated'),
                    indicatorColor: $r('sys.color.ohos_fa_foreground_contrary'),
                    uncheckedBorderColor: $r('sys.color.ohos_id_color_switch_outline_off') })
                  .checked(this.processSwitchFlag)
                  .onChange((isChecked: boolean) => {
                    Logger.info('firstRadio status is ' + isChecked);
                    if (isChecked) {
                      conditionID = '110000';
                      this.processConditionID = conditionID;
                      modifyCondition();
                    }
                  })
              }.id('modify_condition_index_column_8')

              // Column：垂直布局容器
              Column() {
                // Text：文本
                // 关键属性：外边距
                Text($r('app.string.city_hz')).id('modify_condition_index_text_12')
                  .margin({ bottom: 10 })
                // Radio：单选框
                // 关键属性：高度、宽度、勾选状态、radioStyle
                Radio({ value: 'hz', group: 'modifyConditionGroup' }).id('modify_condition_index_radio_13')
                  .height(24)
                  .width(24)
                  .checked(!this.processSwitchFlag)
                  .radioStyle({
                    checkedBackgroundColor: $r('sys.color.ohos_id_color_text_primary_activated'),
                    indicatorColor: $r('sys.color.ohos_fa_foreground_contrary'),
                    uncheckedBorderColor: $r('sys.color.ohos_id_color_switch_outline_off') })
                  .onChange((isChecked: boolean) => {
                    Logger.info('secondRadio status is ' + isChecked);
                    if (isChecked) {
                      conditionID = '310000';
                      this.processConditionID = conditionID;
                      modifyCondition();
                    }
                  })
              }.id('modify_condition_index_column_11')
            }.id('modify_condition_index_flex_7')
          }.id('modify_condition_index_row_6')
          .width('70%')
        }.id('modify_condition_index_column_4')
        .width('100%')
      }.id('modify_condition_index_column_2')
    }.id('modify_condition_index_row_1')
    .height('100%')
  }
}