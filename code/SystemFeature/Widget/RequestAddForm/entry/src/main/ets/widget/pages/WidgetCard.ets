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
 * @file entry/src/main/ets/widget/pages/WidgetCard.ets
 * 文件职责：WidgetCard 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：WidgetCard、ParamsData、ActionType。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

/**
 * WidgetCard：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct WidgetCard {
  /*
   * The title.
   */
  readonly TITLE: string = 'App Store';
  readonly TITLE_CARD: string = 'ArkTs Widget Card';

  /*
   * The action type.
   */
  readonly ACTION_TYPE: string = 'router';

  /*
   * The ability name.
   */
  readonly ABILITY_NAME: string = 'EntryAbility';

  /*
   * The message.
   */
  readonly MESSAGE: string = 'add detail';

  /*
   * The with percentage setting.
   */
  readonly FULL_WIDTH_PERCENT: string = '100%';

  /*
   * The height percentage setting.
   */
  readonly FULL_HEIGHT_PERCENT: string = '100%';

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Row：水平布局容器
    // 关键属性：高度、宽度、边框样式、点击事件回调
    // 交互：可点击交互
    Row() {
      // Column：垂直布局容器
      // 关键属性：宽度
      Column() {
        // Text：文本
        // 关键属性：字号、字重
        Text(this.TITLE).id('widget_card_text_3')
          .fontSize($r('sys.float.ohos_id_text_size_body2'))
          .fontWeight('medium')
        // Text：文本
        // 关键属性：字号、字重、外边距
        Text(this.TITLE_CARD).id('widget_card_text_4')
          .fontSize($r('sys.float.ohos_id_text_size_body3'))
          .fontWeight('regular')
          .margin({
            top: 10
          })
      }.id('widget_card_column_2')
      .width(this.FULL_WIDTH_PERCENT)
    }.id('widget_card_row_1')
    .height(this.FULL_HEIGHT_PERCENT)
    .width((this.FULL_WIDTH_PERCENT))
    .borderStyle(12)
    .onClick(() => {
      class ParamsData {
        message: string = '';
      };

      class ActionType {
        action: string = '';
        abilityName: string = '';
        params: ParamsData = { message : '' };
      };
      let action: ActionType = {
        action: this.ACTION_TYPE,
        abilityName: this.ABILITY_NAME,
        params: {
          message: this.MESSAGE
        }
      };
      postCardAction(this, action);
    })
    .borderRadius(0)
  }
}