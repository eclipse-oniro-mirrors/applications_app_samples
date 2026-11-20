/*
 * Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @file entry/src/main/ets/pages/universal/properties/componentIDSample/ComponentIDSample.ets
 * 文件职责：ComponentIDSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：commonButtonStyle、RectValue、Utils、ComponentIDSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { getStringData } from '../../../../data/ResourceDataHandle';
import { TitleBar } from '../../../../common/TitleBar';

/**
 * commonButtonStyle：函数定义，承载本文件对应的逻辑与数据。
 */
@Extend(Button)
function commonButtonStyle() {
  .fontSize(16)
  .height(40)
  .width('100%')
  .margin({ left: 24, right: 24, top: 12, bottom: 8 })
}

/**
 * RectValue：类定义，承载本文件对应的逻辑与数据。
 */
class RectValue {
  left: number = 0;
  top: number = 0;
  right: number = 0;
  bottom: number = 0;
}

/**
 * Utils：类定义，承载本文件对应的逻辑与数据。
 */
class Utils {
  static rect_left: number;
  static rect_top: number;
  static rect_right: number;
  static rect_bottom: number;
  static rect_value: RectValue;

  //获取组件所占矩形区域坐标
  /**
   * getComponentRect：执行 getComponentRect 相关逻辑。
   */
  static getComponentRect(key: string) {
    let strJson = getInspectorByKey(key);
    let obj: Record<string, Object> = JSON.parse(strJson);
    let rectInfo: Array<string> = JSON.parse('[' + obj.$rect + ']');
    Utils.rect_left = JSON.parse('[' + rectInfo[0] + ']')[0];
    Utils.rect_top = JSON.parse('[' + rectInfo[0] + ']')[1];
    Utils.rect_right = JSON.parse('[' + rectInfo[1] + ']')[0];
    Utils.rect_bottom = JSON.parse('[' + rectInfo[1] + ']')[1];
    return Utils.rect_value = {
      left: Utils.rect_left, top: Utils.rect_top, right: Utils.rect_right, bottom: Utils.rect_bottom
    }
  }
}

/**
 * ComponentIDSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct ComponentIDSample {
  // @State text：组件内部状态
  @State text: string = '';

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.component_id') }).id('component_idsample_title_bar_2')
      // Row：水平布局容器
      // 关键属性：主轴对齐
      Row() {
        // Column：垂直布局容器
        Column() {
          // Row：水平布局容器
          // 关键属性：主轴对齐、圆角、背景色、高度、外边距、宽度
          Row() {
            // Text：文本
            // 关键属性：字号、宽度、文本对齐、外边距
            Text(this.text).id('component_idsample_text_6')
              // fontSize：设置字号
              .fontSize(16)
              // width：设置宽度
              .width('100%')
              // textAlign：设置文本对齐方式
              .textAlign(TextAlign.Start)
              // margin：设置外边距
              .margin({ left: 12 })
          // 结束当前组件块
          }.id('component_idsample_row_5')
          // justifyContent：设置主轴对齐
          .justifyContent(FlexAlign.Center)
          // borderRadius：设置圆角
          .borderRadius(24)
          // backgroundColor：设置背景色
          .backgroundColor(Color.White)
          // height：设置高度
          .height(60)
          // margin：设置外边距
          .margin({ left: 12, right: 12, bottom: 8 })
          // width：设置宽度
          .width('100%')

          // Button：按钮
          // 关键属性：commonButtonStyle、按键事件回调
          Button($r('app.string.component_id_onKeyTab')).id('component_idsample_button_7')
            .commonButtonStyle()
            // onKeyEvent：绑定按键事件回调
            .onKeyEvent(() => {
              // 处理：this.text = getStringData($r('app.string.compone
              this.text = getStringData($r('app.string.component_id_onKeyTab'));
            // 结束当前组件块
            })

          // Button：按钮
          // 关键属性：commonButtonStyle、点击事件回调
          // 交互：可点击交互
          Button($r('app.string.component_id_click'))
            .commonButtonStyle()
            // onClick：绑定点击事件回调
            .onClick(() => {
              // 处理：this.text = getStringData($r('app.string.compone
              this.text = getStringData($r('app.string.component_id_click_text'));
              setTimeout(() => {
                // 向id为"longClick"的组件发送长按事件
                sendEventByKey(getStringData($r('app.string.componentId_longClick')), 11, '');
              // 结束当前组件块
              }, 2000);
            // 结束当前组件块
            })
            .id('click')

          // Button：按钮
          // 关键属性：commonButtonStyle、gesture、onActionEnd
          Button($r('app.string.component_id_longClick'))
            .commonButtonStyle()
            // gesture：绑定手势事件
            .gesture(
              // LongPressGesture：LongPressGesture 自定义组件
              LongPressGesture().onActionEnd(() => {
                // 处理：this.text = getStringData($r('app.string.compone
                this.text = getStringData($r('app.string.component_id_longClick_text'));
                setTimeout(() => {
                  // 获取id为"onTouch"组件的矩形区域坐标
                  let rect = Utils.getComponentRect(getStringData($r('app.string.componentId_onTouch')));
                  // 处理：let touchPoint: TouchObject = {
                  let touchPoint: TouchObject = {
                    id: 1,
                    displayX: rect.left + (rect.right - rect.left) / 2, // 组件中心点x坐标
                    displayY: rect.top + (rect.bottom - rect.top) / 2, // 组件中心点y坐标
                    windowX: rect.left + (rect.right - rect.left) / 2, // 组件中心点x坐标
                    windowY: rect.top + (rect.bottom - rect.top) / 2, // 组件中心点y坐标
                    x: rect.left + (rect.right - rect.left) / 2, // 组件中心点x坐标
                    y: rect.top + (rect.bottom - rect.top) / 2, // 组件中心点y坐标
                    type: TouchType.Down,
                    screenX: rect.left + (rect.right - rect.left) / 2, // 组件中心点x坐标
                    screenY: rect.top + (rect.right - rect.left) / 2, // 组件中心点y坐标
                  // 结束当前组件块
                  };
                  sendTouchEvent(touchPoint); // 发送触摸事件
                  // 处理：touchPoint.type = TouchType.Up;
                  touchPoint.type = TouchType.Up;
                  sendTouchEvent(touchPoint); // 发送触摸事件
                // 结束当前组件块
                }, 2000);
              // 结束当前组件块
              }))
            .id('longClick')

          // Button：按钮
          // 关键属性：commonButtonStyle、点击事件回调
          // 交互：可点击交互
          Button($r('app.string.component_id_onTouch'))
            .commonButtonStyle()
            .onClick(() => {
              this.text = getStringData($r('app.string.component_id_onTouch_text'))
              setTimeout(() => {
                // 获取id为"onMouse"组件的矩形区域坐标
                let rect = Utils.getComponentRect(getStringData($r('app.string.componentId_onMouse')));
                let mouseEvent: MouseEvent = {
                  button: MouseButton.Left,
                  action: MouseAction.Press,
                  displayX: rect.left + (rect.right - rect.left) / 2, // 组件中心点x坐标
                  displayY: rect.top + (rect.bottom - rect.top) / 2, // 组件中心点y坐标
                  windowY: rect.top + (rect.bottom - rect.top) / 2, // 组件中心点y坐标
                  windowX: rect.left + (rect.right - rect.left) / 2, // 组件中心点x坐标
                  x: rect.left + (rect.right - rect.left) / 2, // 组件中心点x坐标
                  y: rect.top + (rect.bottom - rect.top) / 2, // 组件中心点y坐标
                  screenX: rect.left + (rect.right - rect.left) / 2, // 组件中心点x坐标
                  screenY: rect.top + (rect.bottom - rect.top) / 2, // 组件中心点y坐标
                  timestamp: 1,
                  target: {
                    area: {
                      width: 1,
                      height: 1,
                      position: {
                        x: 1,
                        y: 1
                      },
                      globalPosition: {
                        x: 1,
                        y: 1
                      }
                    }
                  },
                  source: SourceType.Mouse,
                  pressure: 1,
                  tiltX: 1,
                  tiltY: 1,
                  sourceTool: SourceTool.Unknown,
                  stopPropagation: () => {
                  }
                };
                sendMouseEvent(mouseEvent); // 发送鼠标事件
              }, 2000)
            })
            .id('onTouch')

          // Button：按钮
          // 关键属性：commonButtonStyle、onMouse
          Button($r('app.string.component_id_onMouse'))
            .commonButtonStyle()
            .onMouse(() => {
              this.text = getStringData($r('app.string.component_id_onMouse_text'));
              setTimeout(() => {
                let keyEvent: KeyEvent = {
                  type: KeyType.Down,
                  keyCode: 2049,
                  keyText: 'tab',
                  keySource: 4,
                  deviceId: 0,
                  metaKey: 0,
                  timestamp: 0,
                  intentionCode: 2,
                  stopPropagation: () => {
                  }
                };
                sendKeyEvent(keyEvent); // 发送按键事件
              }, 2000)
            })
            .id('onMouse')
        }.id('component_idsample_column_4')
      }.id('component_idsample_row_3')
      .justifyContent(FlexAlign.Center)
    }.id('component_idsample_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}