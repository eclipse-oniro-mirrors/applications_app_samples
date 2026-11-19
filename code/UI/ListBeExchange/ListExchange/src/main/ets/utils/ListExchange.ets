/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
 * @file ListExchange/src/main/ets/utils/ListExchange.ets
 * 文件职责：ListExchange 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ListExchange。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { ListExchangeCtrl } from '../model/ListExchangeCtrl';
import { ListInfo } from '../model/ListInfo';
import { logger } from './Logger';
import { CommonConstants } from '../common/commonConstants';

/**
 * 功能描述：
 * 1. 长按列表项，向上或向下拖动，当前列表项和目标列表项位置互换。
 * 2. 列表项向左滑动，显示删除按钮。
 * 3. 点击删除按钮，当前列表项删除。
 *
 * 实现原理：
 * 1. 创建一个数组modifier来添加自定义属性对象，根据组合手势GestureGroup来控制自定义属性的值并通过attributeModifier绑定自定义属性对象来动态加载属性。
 * 2. 然后swipeAction属性绑定删除组件，左滑显示此删除组件，点击实现列表项的删除。
 *
 * @param appInfoList - 列表数据
 * @param appInfoList - 列表元素交换类
 * @param deductionView - 列表项UI模块
 */
/**
 * ListExchange：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct ListExchange {
  // -------------------对外暴露变量-----------------------
  // @Link appInfoList：与父组件双向绑定的状态
  @Link appInfoList: Object[];

  // 控制列表项交换的类
  // @Link listExchangeCtrl：与父组件双向绑定的状态
  @Link listExchangeCtrl: ListExchangeCtrl<Object>;

  // 列表项Builder
  // @BuilderParam deductionView：构建函数参数
  @BuilderParam deductionView: (listInfo: Object) => void;

  // --------------------私有属性----------------------------
  // 当前选定的列表项
  // @State currentListItem：组件内部状态
  @State currentListItem: Object | undefined = undefined;

  // 初始化长按状态
  // @State isLongPress：组件内部状态
  @State isLongPress: boolean = false;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // List：列表容器
      // 关键属性：分割线、滚动条、边框
      List() {
        ForEach(this.appInfoList, (item: Object, index: number) => {
          // ListItem：列表项
          // 关键属性：层级、swipeAction、defaultDeleteBuilder、转场动画、attributeModifier、getModifier
          ListItem() {
            this.deductionView(item)
          }
          .id('list_exchange_' + index)
          .zIndex(this.currentListItem === item ? 2 : 1) // 层级属性
          .swipeAction({ end: this.defaultDeleteBuilder(item) }) // 用于设置ListItem的划出组件
          .transition(TransitionEffect.OPACITY)
          .attributeModifier(this.listExchangeCtrl.getModifier(item)) //动态设置组件的属性方法， 参数为属性修改器
          .gesture(
            // 以下组合手势为顺序识别，当长按手势事件未正常触发时，则不会出发拖动手势事件
            GestureGroup(GestureMode.Sequence,
              // 长按
              LongPressGesture()
                .onAction((event: GestureEvent) => {
                  this.currentListItem = item;
                  this.isLongPress = true;
                  this.listExchangeCtrl.onLongPress(item);
                }),
              // 拖动
              PanGesture()
                .onActionUpdate((event: GestureEvent) => {
                  this.listExchangeCtrl.onMove(item, event.offsetY);
                })
                .onActionEnd((event: GestureEvent) => {
                  this.listExchangeCtrl.onDrop(item);
                  this.isLongPress = false;
                })
            ).onCancel(() => {
              if (!this.isLongPress) {
                return;
              }
              this.listExchangeCtrl.onDrop(item);
            }))
        }, (item: Object) => JSON.stringify(item))
      }.id('list_exchange_list_2')
      .divider({ strokeWidth: '1px', color: 0xeaf0ef })
      .scrollBar(BarState.Off)
      .border({
        radius: {
          bottomLeft: $r('app.string.ohos_id_corner_radius_default_l'),
          bottomRight: $r('app.string.ohos_id_corner_radius_default_l')
        }
      })
      .backgroundColor(Color.White)
      .width('100%')

    }.id('list_exchange_column_1')
  }

  /**
   * 删除按钮
   * @param item: 删除的列表项
   */
  /**
   * defaultDeleteBuilder：执行 defaultDeleteBuilder 相关逻辑。
   */
  @Builder
  defaultDeleteBuilder(item: Object) {
    // Image：图片
    // 关键属性：宽度、高度、objectFit、外边距、interpolation、点击事件回调
    // 交互：可点击交互
    Image($r('app.media.list_exchange_icon_delete'))
      .width($r('app.integer.list_exchange_icon_size'))
      .height($r('app.integer.list_exchange_icon_size'))
      .objectFit(ImageFit.Cover)
      .margin({ right: $r('app.integer.list_exchange_delete_icon_margin_right') })
      .interpolation(ImageInterpolation.High)// 抗锯齿
      .id('delete_button')
      .onClick(() => {
        this.listExchangeCtrl.deleteItem(item);
      })
  }

  /**
   * ListItem自定义组件(默认)
   */
  /**
   * defaultDeductionView：执行 defaultDeductionView 相关逻辑。
   */
  @Builder
  defaultDeductionView(listItemInfo: ListInfo) {
    // Row：水平布局容器
    // 关键属性：宽度、高度、背景色、内边距
    Row() {
      // Image：图片
      // 关键属性：宽度、高度、draggable
      Image(listItemInfo.icon).id('list_exchange_image_4')
        .width($r('app.integer.list_exchange_icon_size'))
        .height($r('app.integer.list_exchange_icon_size'))
        .draggable(false) // TODO：知识点：保持默认值true时，图片有默认拖拽效果，会影响Grid子组件拖拽判断，所以修改为false
      // Text：文本
      // 关键属性：外边距
      Text(listItemInfo.name).id('list_exchange_text_5')
        .margin({ left: $r('app.string.ohos_id_elements_margin_vertical_l') })
      // Blank：占位空白
      Blank().id('list_exchange_blank_6')
      // Image：图片
      // 关键属性：宽度、高度、objectFit、draggable
      Image($r('app.media.list_exchange_ic_public_drawer')).id('list_exchange_image_7')
        .width($r('app.integer.list_exchange_icon_size'))
        .height($r('app.integer.list_exchange_icon_size'))
        .objectFit(ImageFit.Cover)
        .draggable(false) // TODO：知识点：保持默认值true时，图片有默认拖拽效果，会影响Grid子组件拖拽判断，所以修改为false
    }.id('list_exchange_row_3')
    .width('100%')
    .height(CommonConstants.LIST_ITEM_HEIGHT)
    .backgroundColor(Color.White)
    .padding({
      left: $r('app.string.ohos_id_card_padding_start'),
      right: $r('app.string.ohos_id_card_padding_start')
    })
  }

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear(): void {
    this.checkParam();
  }

  /**
   * 检查输入参数合法性
   */
  checkParam() {
    logger.info('checkParam start');
    if (!this.appInfoList.length) {
      this.appInfoList.push(new ListInfo($r('app.media.list_exchange_ic_public_cards_filled'), CommonConstants.LIST_NAME))
    }
    if (!this.deductionView) {
      this.deductionView = this.deductionView;
    }
    if (!this.listExchangeCtrl) {
      this.listExchangeCtrl = new ListExchangeCtrl();
      this.listExchangeCtrl.initData(this.appInfoList);
    }
  }
}
