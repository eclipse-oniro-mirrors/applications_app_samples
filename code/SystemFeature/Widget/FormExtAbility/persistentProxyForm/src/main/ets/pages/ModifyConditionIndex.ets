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
 * @file persistentProxyForm/src/main/ets/pages/ModifyConditionIndex.ets
 * 文件职责：ModifyConditionIndex 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：updateCardDisplayContent、ProxiesType、modifyCondition、IndexThi。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import base from '@ohos.base';
import common from '@ohos.app.ability.common';
import dataShare from '@ohos.data.dataShare';
import formBindingData from '@ohos.app.form.formBindingData';
import formInfo from '@ohos.app.form.formInfo';
import formObserver from '@ohos.app.form.formObserver';
import formProvider from '@ohos.app.form.formProvider';
import Logger from '../../common/Logger';
import { getPersistentConditionID, savePersistentConditionID } from '../../common/StatePersistence';

// 日志 TAG：用于在 hilog 输出中过滤本页面日志
const TAG = '[Sample_ModifyConditionIndex]';
// DataShareHelper 实例：用于注册卡片数据模板
let dataShareHelper: dataShare.DataShareHelper;
// 当前生效的城市编码，默认沈阳 110000
let conditionID = '110000';
// UIAbility 上下文，用于创建 DataShareHelper
let context: common.UIAbilityContext;

/**
 * updateCardDisplayContent：为指定卡片注册 DataShare 模板并触发卡片刷新。
 * @param runningFormInfo 正在运行的卡片实例信息
 */
function updateCardDisplayContent(runningFormInfo: formInfo.RunningFormInfo): void {
  Logger.info(`TAG updateCardDisplayContent bundle: ${runningFormInfo.bundleName}`);

  // 模板 SQL：按城市编码查询城市名与温度，供卡片订阅
  let template: dataShare.Template = {
    // 字段 predicates：声明并维护该成员的状态
    predicates: {
      // 字段 list：声明并维护该成员的状态
      list: `select cityTemperature as cityTemperature, cityName as cityName from TBL00 where cityId = ${conditionID}`
    },
    // 字段 scheduler：声明并维护该成员的状态
    scheduler: ''
  };
  dataShare.createDataShareHelper(context, 'datashareproxy://ohos.samples.formextability', { isProxy: true })
    .then((data: dataShare.DataShareHelper) => {
      // 字段 dataShareHelper：声明并维护该成员的状态
      dataShareHelper = data;
      dataShareHelper.addTemplate('datashareproxy://ohos.samples.formextability/test', conditionID, template);
    });

  // 卡片数据代理项：key 为数据 URI，subscriberId 为订阅者（城市编码）
  class ProxiesType {
    // 字段 key：声明并维护该成员的状态
    key: string = '';
    // 字段 subscriberId：声明并维护该成员的状态
    subscriberId: string = '';
  };

  // let 语句
  let proxies = [{
    // 字段 key：声明并维护该成员的状态
    key: 'datashareproxy://ohos.samples.formextability/test',
    subscriberId: conditionID
  } as ProxiesType];
  let formData: string = '';
  Logger.info(TAG, `formData: ${JSON.stringify(formData)}`);
  let formBinding = formBindingData.createFormBindingData(formData);
  formBinding['proxies'] = proxies;

  // 分支说明：刷新成功 → 打印绑定数据；刷新失败 → 打印错误信息
  formProvider.updateForm(runningFormInfo.formId, formBinding).then(() => {
    Logger.info(TAG, `update Form OK formData is ${JSON.stringify(formBinding)}`);
  }).catch((err: base.BusinessError<void>) => {
    Logger.error(TAG, `update Form Failed ${JSON.stringify(err)}`);
  });
}

/**
 * modifyCondition：分别查询 ArkTS 与 JS 两类卡片的运行实例，并逐个刷新。
 */
function modifyCondition(): void {
  // ArkTS 卡片实例过滤条件
  let formInstanceFilterArkTS: formInfo.FormProviderFilter = {
    bundleName: 'ohos.samples.formextability',
    abilityName: 'EntryFormAbility',
    formName: 'persistentWidget',
    moduleName: 'persistentProxyForm'
  };

  // JS 卡片实例过滤条件
  let formInstanceFilterJS: formInfo.FormProviderFilter = {
    bundleName: 'ohos.samples.formextability',
    abilityName: 'EntryFormAbility',
    formName: 'persistentWidgetJS',
    moduleName: 'persistentProxyForm'
  };

  // 分支说明：查询成功 → 写入 AppStorage 并逐个刷新卡片；失败 → 打印错误
  formObserver.getRunningFormInfosByFilter(formInstanceFilterArkTS).then((data: Array<formInfo.RunningFormInfo>) => {
    Logger.info(TAG, `getRunningFormInfosByFilter data: ${JSON.stringify(data)}`);
    AppStorage.SetOrCreate('runningFormInfo', JSON.stringify(data));
    data.forEach(updateCardDisplayContent);
  }).catch((err: base.BusinessError<void>) => {
    Logger.error(TAG, `getRunningFormInfosByFilter err is ${JSON.stringify(err)}`);
  });
  formObserver.getRunningFormInfosByFilter(formInstanceFilterJS).then((data: Array<formInfo.RunningFormInfo>) => {
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
  // @State persistentConditionID：组件内部状态
  @State persistentConditionID: string = '';

  // @State persistentSwitchFlag：组件内部状态
  @State persistentSwitchFlag: boolean = true;

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear() {
    context = getContext(this) as common.UIAbilityContext;
    this.persistentConditionID = getPersistentConditionID(context);
    if (typeof this.persistentConditionID !== 'string' || this.persistentConditionID === '') {
      this.persistentConditionID = '110000'
    }
    this.persistentSwitchFlag = this.persistentConditionID.localeCompare('110000') === 0;
    Logger.debug(TAG, `persistentSwitchFlag : ${JSON.stringify(this.persistentSwitchFlag)}`);
  }

  /**
   * aboutToDisappear：组件即将销毁时回调，用于释放资源与取消订阅。
   */
  aboutToDisappear() {
    savePersistentConditionID(context, this.persistentConditionID);
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
          .fontWeight('Bold')
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
                // 关键属性：勾选状态、高度、宽度、radioStyle
                Radio({ value: 'sy', group: 'modifyConditionGroup' }).id('modify_condition_index_radio_10')
                  .checked(this.persistentSwitchFlag)
                  .height(24)
                  .width(24)
                  .radioStyle({
                    checkedBackgroundColor: $r('sys.color.ohos_id_color_text_primary_activated'),
                    uncheckedBorderColor: $r('sys.color.ohos_id_color_switch_outline_off'),
                    indicatorColor: $r('sys.color.ohos_id_color_foreground_contrary')
                  })
                  .onChange((isChecked: boolean) => {
                    Logger.info('firstRadio status is ' + isChecked);
                    if (isChecked) {
                      conditionID = '110000';
                      this.persistentConditionID = conditionID;
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
                // 关键属性：勾选状态、高度、宽度、radioStyle
                Radio({ value: 'hz', group: 'modifyConditionGroup' }).id('modify_condition_index_radio_13')
                  .checked(!this.persistentSwitchFlag)
                  .height(24)
                  .width(24)
                  .radioStyle({
                    checkedBackgroundColor: $r('sys.color.ohos_id_color_text_primary_activated'),
                    uncheckedBorderColor: $r('sys.color.ohos_id_color_switch_outline_off'),
                    indicatorColor: $r('sys.color.ohos_id_color_foreground_contrary')
                  })
                  .onChange((isChecked: boolean) => {
                    Logger.info('secondRadio status is ' + isChecked);
                    if (isChecked) {
                      conditionID = '310000';
                      this.persistentConditionID = conditionID;
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