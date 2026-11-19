/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
 * @file entry/src/main/ets/pages/components/listAndGrid/waterFlowSample/WaterFlowDataSource.ets
 * 文件职责：WaterFlowDataSource 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：WaterFlowScrollByControlPanel、WaterFlowScrollEdgeControlPanel、WaterFlowPropertiesControlPanel、
 *   WaterFlowPropertiesScrollBarControlPanel、WaterFlowPropertiesScrollBarColorControlPanel、
 *   WaterFlowPropertiesScrollBarWidthControlPanel、WaterFlowPropertiesEdgeEffectControlPanel、WaterFlowDataSource。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { CommonItemTwoRowSlider, CommonItemSelect, CommonItemColorSelectDef } from '../../../../common/AttributeModificationTool';
import { WATER_FLOW_SCROLL_EDGE_SELECT_DATA, LIST_SCROLLBAR_SELECT_DATA,WATER_FLOW_EDGE_EFFECT_SELECT_DATA, LIST_ALIGN_LIST_ITEM_SELECT_DATA } from '../../ComponentData';
import { getStringArrayData } from '../../../../data/ResourceDataHandle';

/**
 * WaterFlowScrollByControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct WaterFlowScrollByControlPanel {
  // @Link scrollBy：与父组件双向绑定的状态
  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  @Link scrollBy : number;
  build() {
    // Column：垂直布局容器
    // 关键属性：背景色、高度、外边距、内边距、圆角
    Column() {
      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider(
        {
          changeValue: $scrollBy,
          min: -200,
          max: 200,
          name: $r('app.string.water_flow_controller_scrollBy'),
          testId: `waterFlow_001`
        }
      ).id('water_flow_data_source_common_item_two_row_slider_2')
    }.id('water_flow_data_source_column_1')
    .backgroundColor(Color.White)
    .height(96)
    .margin({bottom:12})
    .padding({left:12,right:12, top:17, bottom:17})
    .borderRadius(16)
  }
}

/**
 * WaterFlowScrollEdgeControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct WaterFlowScrollEdgeControlPanel {
  // @Link scrollEdge：与父组件双向绑定的状态
  @Link scrollEdge : Edge;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、背景色、圆角、内边距、外边距
    Column() {
      // CommonItemSelect：CommonItemSelect 自定义组件
      // 关键属性：高度
      CommonItemSelect({
        name: $r('app.string.water_flow_controller_scrollEdge'),
        selects : getStringArrayData(WATER_FLOW_SCROLL_EDGE_SELECT_DATA),
        callback : (index)=>{
          switch (index) {
            case 0:
              this.scrollEdge = Edge.Top;
              break;
            default:
              this.scrollEdge = Edge.Bottom;
              break;
          }
        },
        testId: `waterFlow_002`
      }).id('water_flow_data_source_common_item_select_4')
    }.id('water_flow_data_source_column_3').height(56)
    .backgroundColor(Color.White)
    .borderRadius(16)
    .padding({left:12,right:12})
    .margin({bottom:12})
  }
}

/**
 * WaterFlowPropertiesControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct WaterFlowPropertiesControlPanel {
  // @Link scrollBar：与父组件双向绑定的状态
  @Link scrollBar : BarState;

  // @Link scrollBarColor：与父组件双向绑定的状态
  @Link scrollBarColor : Color;

  // @Link scrollBarWidth：与父组件双向绑定的状态
  @Link scrollBarWidth : number;

  // @Link edgeEffect：与父组件双向绑定的状态
  @Link edgeEffect : EdgeEffect;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build(){
    // Column：垂直布局容器
    Column(){

      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.water_flow_properties_scroll_bar'),
        selects : getStringArrayData(LIST_SCROLLBAR_SELECT_DATA),
        callback : (index)=>{
          switch (index) {
            case 1:
              this.scrollBar = BarState.On
              break;
            case 2:
              this.scrollBar = BarState.Auto
              break;
            default:
              this.scrollBar = BarState.Off
              break;
          }
        },
        testId: `waterFlow_003`
      }).id('water_flow_data_source_common_item_select_6')

      // CommonItemColorSelectDef：CommonItemColorSelectDef 自定义组件
      CommonItemColorSelectDef({
        name: $r('app.string.water_flow_properties_scroll_bar_color'),
        selectColor: $scrollBarColor,
        testId: 'waterFlow_004'
      }).id('water_flow_data_source_common_item_color_select_def_7')

      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        changeValue: $scrollBarWidth,
        min: 0,
        max: 15,
        name: $r('app.string.water_flow_properties_scroll_bar_width'),
        testId: `waterFlow_005`
      }).id('water_flow_data_source_common_item_two_row_slider_8')

      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.water_flow_properties_edge_effect'),
        selects : getStringArrayData(WATER_FLOW_EDGE_EFFECT_SELECT_DATA),
        callback : (index)=>{
          switch (index) {
            case 0:
              this.edgeEffect = EdgeEffect.Spring;
              break;
            case 1:
              this.edgeEffect = EdgeEffect.Fade;
              break;
            default:
              this.edgeEffect = EdgeEffect.None;
              break;
          }
        },
        testId: `waterFlow_006`
      }).id('water_flow_data_source_common_item_select_9')
    }.id('water_flow_data_source_column_5')
  }
}

/**
 * WaterFlowPropertiesScrollBarControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct WaterFlowPropertiesScrollBarControlPanel {
  // @Link scrollBar：与父组件双向绑定的状态
  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  @Link scrollBar : BarState;
  build(){
    // Column：垂直布局容器
    Column(){
      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.water_flow_properties_scroll_bar'),
        selects : getStringArrayData(LIST_SCROLLBAR_SELECT_DATA),
        callback : (index)=>{
          switch (index) {
            case 1:
              this.scrollBar = BarState.On
              break;
            case 2:
              this.scrollBar = BarState.Auto
              break;
            default:
              this.scrollBar = BarState.Off
              break;
          }
        },
        testId: `waterFlow_003`
      }).id('water_flow_data_source_common_item_select_11')
    }.id('water_flow_data_source_column_10')
  }
}

/**
 * WaterFlowPropertiesScrollBarColorControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct WaterFlowPropertiesScrollBarColorControlPanel {
  // @Link scrollBarColor：与父组件双向绑定的状态
  @Link scrollBarColor : Color;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build(){
    // Column：垂直布局容器
    Column(){
      // CommonItemColorSelectDef：CommonItemColorSelectDef 自定义组件
      CommonItemColorSelectDef({
        name: $r('app.string.water_flow_properties_scroll_bar_color'),
        selectColor: $scrollBarColor,
        testId: 'waterFlow_004'
      }).id('water_flow_data_source_common_item_color_select_def_13')
    }.id('water_flow_data_source_column_12')
  }
}

/**
 * WaterFlowPropertiesScrollBarWidthControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct WaterFlowPropertiesScrollBarWidthControlPanel {
  // @Link scrollBarWidth：与父组件双向绑定的状态
  @Link scrollBarWidth : number;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build(){
    // Column：垂直布局容器
    Column(){
      // CommonItemTwoRowSlider：CommonItemTwoRowSlider 自定义组件
      CommonItemTwoRowSlider({
        changeValue: $scrollBarWidth,
        min: 0,
        max: 15,
        name: $r('app.string.water_flow_properties_scroll_bar_width'),
        testId: `waterFlow_005`
      }).id('water_flow_data_source_common_item_two_row_slider_15')
    }.id('water_flow_data_source_column_14')
  }
}

/**
 * WaterFlowPropertiesEdgeEffectControlPanel：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct WaterFlowPropertiesEdgeEffectControlPanel {
  // @Link edgeEffect：与父组件双向绑定的状态
  @Link edgeEffect : EdgeEffect;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build(){
    // Column：垂直布局容器
    Column(){
      // CommonItemSelect：CommonItemSelect 自定义组件
      CommonItemSelect({
        name: $r('app.string.water_flow_properties_edge_effect'),
        selects : getStringArrayData(WATER_FLOW_EDGE_EFFECT_SELECT_DATA),
        callback : (index)=>{
          switch (index) {
            case 0:
              this.edgeEffect = EdgeEffect.Spring;
              break;
            case 1:
              this.edgeEffect = EdgeEffect.Fade;
              break;
            default:
              this.edgeEffect = EdgeEffect.None;
              break;
          }
        },
        testId: `waterFlow_006`
      }).id('water_flow_data_source_common_item_select_17')
    }.id('water_flow_data_source_column_16')
  }
}

// 实现IDataSource接口的对象，用于瀑布流组件加载数据
/**
 * WaterFlowDataSource：类定义，承载本文件对应的逻辑与数据。
 */
export class WaterFlowDataSource implements IDataSource {
  private dataArray: number[] = []
  private listeners: DataChangeListener[] = []

  /** 构造 WaterFlowDataSource 实例。 */
  constructor() {
    for (let i = 0; i < 28; i++) {
      this.dataArray.push(i)
    }
  }

  // 获取索引对应的数据
  /**
   * getData：执行 getData 相关逻辑。
   */
  public getData(index: number): number {
    return this.dataArray[index]
  }

  // 通知控制器数据重新加载
  /**
   * notifyDataReload：执行 notifyDataReload 相关逻辑。
   */
  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded()
    })
  }

  // 通知控制器数据增加
  /**
   * notifyDataAdd：执行 notifyDataAdd 相关逻辑。
   */
  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index)
    })
  }

  // 通知控制器数据变化
  /**
   * notifyDataChange：执行 notifyDataChange 相关逻辑。
   */
  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index)
    })
  }

  // 通知控制器数据删除
  /**
   * notifyDataDelete：执行 notifyDataDelete 相关逻辑。
   */
  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index)
    })
  }

  // 通知控制器数据位置变化
  /**
   * notifyDataMove：执行 notifyDataMove 相关逻辑。
   */
  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to)
    })
  }

  // 获取数据总数
  /**
   * totalCount：执行 totalCount 相关逻辑。
   */
  public totalCount(): number {
    return this.dataArray.length
  }

  // 注册改变数据的控制器
  /**
   * registerDataChangeListener：执行 registerDataChangeListener 相关逻辑。
   */
  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener)
    }
  }

  // 注销改变数据的控制器
  /**
   * unregisterDataChangeListener：执行 unregisterDataChangeListener 相关逻辑。
   */
  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener)
    if (pos >= 0) {
      this.listeners.splice(pos, 1)
    }
  }

  // 增加数据
  /**
   * add1stItem：执行 add1stItem 相关逻辑。
   */
  public add1stItem(): void {
    this.dataArray.splice(0, 0, this.dataArray.length)
    this.notifyDataAdd(0)
  }

  // 在数据尾部增加一个元素
  /**
   * addLastItem：执行 addLastItem 相关逻辑。
   */
  public addLastItem(): void {
    this.dataArray.splice(this.dataArray.length, 0, this.dataArray.length)
    this.notifyDataAdd(this.dataArray.length - 1)
  }

  // 在指定索引位置增加一个元素
  /**
   * addItem：执行 addItem 相关逻辑。
   */
  public addItem(index: number): void {
    this.dataArray.splice(index, 0, this.dataArray.length)
    this.notifyDataAdd(index)
  }

  // 删除第一个元素
  /**
   * delete1stItem：执行 delete1stItem 相关逻辑。
   */
  public delete1stItem(): void {
    this.dataArray.splice(0, 1)
    this.notifyDataDelete(0)
  }

  // 删除第二个元素
  /**
   * delete2ndItem：执行 delete2ndItem 相关逻辑。
   */
  public delete2ndItem(): void {
    this.dataArray.splice(1, 1)
    this.notifyDataDelete(1)
  }

  // 删除最后一个元素
  /**
   * deleteLastItem：执行 deleteLastItem 相关逻辑。
   */
  public deleteLastItem(): void {
    this.dataArray.splice(-1, 1)
    this.notifyDataDelete(this.dataArray.length)
  }

  // 重新加载数据
  /**
   * reload：执行 reload 相关逻辑。
   */
  public reload(): void {
    this.dataArray.splice(1, 1)
    this.dataArray.splice(3, 2)
    this.notifyDataReload()
  }
}