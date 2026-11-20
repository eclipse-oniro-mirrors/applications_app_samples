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
 * @file persistentProxyForm/src/main/ets/widget/pages/WidgetCard.ets
 * 文件职责：WidgetCard 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ListType、WidgetCard、ParamsType、ActionType。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

let storage = new LocalStorage();

const ACTION_TYPE: string = 'router';

const ABILITY_NAME: string = 'EntryAbility';

const MESSAGE: string = 'add detail';

const FULL_WIDTH_PERCENT: string = '100%';

const FULL_HEIGHT_PERCENT: string = '100%';

/**
 * ListType：类定义，承载本文件对应的逻辑与数据。
 */
class ListType {
  cityTemperature: string = '';
  cityName: string = '';
}

/**
 * WidgetCard：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry(storage)
@Component
struct WidgetCard {
  // @LocalStorageProp list：与 LocalStorage 单向绑定
  @LocalStorageProp('list') list: Array<object> = [{ cityTemperature: '', cityName: '' } as ListType];

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Row：水平布局容器
    // 关键属性：背景色、边框样式、圆角、透明度、高度、点击事件回调
    // 交互：可点击交互
    Row() {
      // Column：垂直布局容器
      // 关键属性：宽度
      Column() {
        // Row：水平布局容器
        Row() {
          // Text：文本
          // 关键属性：字号、字重
          Text($r('app.string.city')).id('widget_card_text_4')
            .fontSize($r('sys.float.ohos_id_text_size_body2'))
            .fontWeight('medium')
          // Text：文本
          // 关键属性：字号、字重
          Text(this.list[0]['cityName']).id('widget_card_text_5')
            .fontSize($r('sys.float.ohos_id_text_size_body2'))
            .fontWeight('medium')
        }.id('widget_card_row_3')

        // Row：水平布局容器
        Row() {
          // Text：文本
          // 关键属性：字号、字重
          Text($r('app.string.temperature')).id('widget_card_text_7')
            .fontSize($r('sys.float.ohos_id_text_size_body2'))
            .fontWeight('medium')
          // Text：文本
          // 关键属性：字号、字重
          Text(this.list[0]['cityTemperature']).id('widget_card_text_8')
            .fontSize($r('sys.float.ohos_id_text_size_body2'))
            .fontWeight('medium')
        }.id('widget_card_row_6')
      }.id('widget_card_column_2')
      .width(FULL_WIDTH_PERCENT)
    }.id('widget_card_row_1')
    .backgroundColor(0xAFEEEE)
    .borderStyle(12)
    .borderRadius(16)
    .opacity(0.5)
    .height(FULL_HEIGHT_PERCENT)
    .onClick(() => {
      class ParamsType {
        message: string = '';
      };

      class ActionType {
        action: string = '';
        abilityName: string = '';
        params: ParamsType = { message: '' };
      };
      let action: ActionType = {
        action: ACTION_TYPE,
        abilityName: ABILITY_NAME,
        params: {
          message: MESSAGE
        }
      };
      postCardAction(this, action);
    })
  }
}