/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/pages/Index.ets
 * 文件职责：Index 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：Index。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import base from '@ohos.base';
import formProvider from '@ohos.app.form.formProvider';
import formBindingData from '@ohos.app.form.formBindingData';
import formInfo from '@ohos.app.form.formInfo';
import Want from '@ohos.app.ability.Want';
import Logger from '../logger/Logger';

let conditionID = '110000';

/**
 * Index：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct Index {
  // @State abilityName：组件内部状态
  @State abilityName: string = 'EntryFormAbility';

  // @State addArkTsButtonId：组件内部状态
  @State addArkTsButtonId: string = 'addArkTsCard';

  // @State addJsButtonId：组件内部状态
  @State addJsButtonId: string = 'addJsCard';

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Row：水平布局容器
    // 关键属性：高度
    Row() {
      // Column：垂直布局容器
      // 关键属性：交叉轴对齐、主轴对齐、宽度
      Column() {
        // Button：按钮
        // 关键属性：宽度、高度、圆角、背景色、点击事件回调
        // 交互：可点击交互
        Button() {
          // Text：文本
          // 关键属性：字体颜色、字号、字重
          Text($r('app.string.add_arkTsCard')).id('index_text_3')
            .fontColor($r('sys.color.ohos_id_color_foreground_contrary'))
            .fontSize($r('sys.float.ohos_id_text_size_button1'))
            .fontWeight(FontWeight.Bold)
        }
        .id(this.addArkTsButtonId)
        .width(220)
        .height(40)
        .borderRadius($r('sys.float.ohos_id_corner_radius_button'))
        .backgroundColor($r('sys.color.ohos_id_color_component_activated'))
        .onClick(() => {
          let want: Want = {
            abilityName: 'EntryFormAbility',
            parameters: {
              'ohos.extra.param.key.form_dimension': formInfo.FormDimension.Dimension_2_2,
              'ohos.extra.param.key.form_name': 'widget',
              'ohos.extra.param.key.module_name': 'entry'
            }
          };
          let bindingData = formBindingData.createFormBindingData();
          let proxies = [{ key: 'weather', subscriberid: conditionID } as formBindingData.ProxyData];
          bindingData['proxies'] = proxies;
          Logger.debug(`RequestPublishForm want: ${JSON.stringify(want)}`);
          formProvider.requestPublishForm(want, bindingData).then((str: string) => {
            Logger.debug(`RequestPublishForm success : ${str}`);
          }).catch((err: base.BusinessError<void>) => {
            Logger.debug(`RequestPublishForm failed : ${err}`);
          });
          Logger.debug('=====> want is ' + JSON.stringify(want));
        })

        // Button：按钮
        // 关键属性：外边距
        Button() {
          // Text：文本
          // 关键属性：字体颜色、字号、字重
          Text($r('app.string.add_jsCard')).id('index_text_4')
            .fontColor($r('sys.color.ohos_id_color_foreground_contrary'))
            .fontSize($r('sys.float.ohos_id_text_size_button1'))
            .fontWeight(FontWeight.Bold)
        }
        .margin({
          top: 20
        })
        .id(this.addJsButtonId)
        .width(220)
        .height(40)
        .borderRadius($r('sys.float.ohos_id_corner_radius_button'))
        .backgroundColor($r('sys.color.ohos_id_color_component_activated'))
        .onClick(() => {
          let want: Want = {
            abilityName: 'EntryFormAbility',
            parameters: {
              'ohos.extra.param.key.form_dimension': formInfo.FormDimension.Dimension_2_2,
              'ohos.extra.param.key.form_name': 'JsWidget',
              'ohos.extra.param.key.module_name': 'entry'
            }
          };
          let bindingData = formBindingData.createFormBindingData();
          Logger.debug(`RequestPublishForm want: ${JSON.stringify(want)}`);
          formProvider.requestPublishForm(want, bindingData).then((str: string) => {
            Logger.debug(`RequestPublishForm success : ${str}`);
          }).catch((err: base.BusinessError<void>) => {
            Logger.debug(`RequestPublishForm failed : ${err}`);
          });
          Logger.debug('=====> want is ' + JSON.stringify(want));
        })
      }.id('index_column_2')
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)
      .width('100%')
    }.id('index_row_1')
    .height('100%')
  }
}