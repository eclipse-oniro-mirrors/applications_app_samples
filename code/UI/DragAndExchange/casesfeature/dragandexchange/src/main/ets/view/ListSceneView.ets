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
 * @file src/main/ets/view/ListSceneView.ets
 * 文件职责：ListSceneView 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ListSceneView、IconNoNameView、JsonObjType。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { AppInfo } from '../model/AppInfo';
import { DataSource } from '../model/DateSource';

const ICON_NUM_IN_LIST: number = 4; // 示例List中子组件数目

const LIST_SPACE: number = 30; // 列表默认间隔

/**
 * 实现List场景，拖拽交换子组件位置: 通过ListItem的onDragStart()方法指定拖拽开始时的行为，通过List的onTouch()指定拖拽释放时的行为。
 */
/**
 * ListSceneView：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct ListSceneView {
  // @State dataSource：组件内部状态
  // @State dragIndex：组件内部状态
  @State dataSource: DataSource = new DataSource();
  @State dragIndex: number = 0;

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear() {
    for (let index = 0; index < ICON_NUM_IN_LIST; index++) {
      this.dataSource.pushData(new AppInfo($r(`app.media.drag_and_exchange_ic_public_game${index + 1}`),
        `Item${index + 1}`, true));
    }
  }

  /**
   * changeIndex：执行 changeIndex 相关逻辑。
   */
  changeIndex(index1: number, index2: number) {
    let temp: AppInfo = this.dataSource.getData(index1);
    this.dataSource.setData(index1, this.dataSource.getData(index2));
    this.dataSource.setData(index2, temp);
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    Column() {
      Text($r('app.string.drag_and_exchange_list_drag_title'))
        .fontColor(Color.White)
        .textAlign(TextAlign.Center)
        .fontSize($r('app.string.drag_and_exchange_opt_title_font_size'))
        .id('dragAndExchangeListTitle')
      Row() { // 仅靠List实现背景框，padding调整样式后，互换时可能错位
        List({ space: LIST_SPACE }) {
          // TODO: 性能知识点：图标一次性完全显示，且禁用滑动，无需懒加载。LazyForEach可以适用在动态添加数据的场景中，参考资料：
          //  https://docs.openharmony.cn/pages/v4.0/zh-cn/application-dev/performance/lazyforeach_optimization.md/
          LazyForEach(this.dataSource, (item: AppInfo, index) => {
            ListItem() {
              Column() {
                IconNoNameView({ app: item })
              }
            }
            // TODO：知识点：在ListItem层，通过onDragStart实现拖拽开始时的回调行为
            .onDragStart((event: DragEvent, extraParams: string) => {
              item.visible = false; // 拖拽时，设置子组件原位置图标不可见
              // 记录目标位置子组件index值
              this.dragIndex = (JSON.parse(extraParams) as JsonObjType).selectedIndex;
            })
            .onDragEnd(() => {
              item.visible = true;
            })
          }, (item: AppInfo) => item.name.toString())
        }
        .id('dragAndExchangeList')
        .scrollBar(BarState.Off)
        .height($r('app.string.drag_and_exchange_layout_90'))
        .listDirection(Axis.Horizontal)
        .alignListItem(ListItemAlign.Center)
        .onDrop((event: DragEvent, extraParams: string) => { // TODO：知识点：在List层，通过onDrop实现拖拽结束后的回调行为
          // 通过参数extraParams获取原位置子组件index值
          let insertIndex: number = (JSON.parse(extraParams) as JsonObjType).insertIndex;
          if (insertIndex >= this.dataSource.totalCount()) {
            return;
          }
          this.changeIndex(this.dragIndex, insertIndex); // 互换子组件index值
          this.dataSource.notifyDataReload();
        })
        .enableScrollInteraction(false) // 禁用滑动
        .alignListItem(ListItemAlign.Center)
        .padding({
          top: $r('app.string.drag_and_exchange_layout_10'),
          bottom: $r('app.string.drag_and_exchange_layout_10'),
          left: $r('app.string.drag_and_exchange_layout_15'),
          right: $r('app.string.drag_and_exchange_layout_15')
        })
      }
      .justifyContent(FlexAlign.Center)
      .height($r('app.string.drag_and_exchange_layout_90'))
      .width($r('app.string.drag_and_exchange_layout_90_percent'))
      .borderRadius($r('app.string.drag_and_exchange_layout_20'))
      .opacity($r('app.string.drag_and_exchange_background_opacity'))
      .backgroundColor($r('app.color.drag_and_exchange_background_color'))
    }
    .margin({ top: $r('app.string.drag_and_exchange_layout_20') })
  }
}

/**
 * 无名字App自定义组件
 */
/**
 * IconNoNameView：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
struct IconNoNameView {
  // @ObjectLink app：与父组件共享的对象引用
  @ObjectLink app: AppInfo;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    Column() {
      Image(this.app.icon)
        .id(`${this.app.name}`)
        .width($r('app.string.drag_and_exchange_icon_square_size'))
        .height($r('app.string.drag_and_exchange_icon_square_size'))
        .objectFit(ImageFit.Cover)
        .borderRadius($r('app.string.drag_and_exchange_layout_10'))
        .draggable(false) // TODO：知识点：保持默认值true时，图片有默认拖拽效果，会影响List子组件拖拽动效，所以修改为false
      Text(this.app.name)
        .width($r('app.string.drag_and_exchange_icon_square_size'))
        .fontColor(Color.White)
        .textAlign(TextAlign.Center)
        .margin({ top: $r('app.string.drag_and_exchange_layout_1') })
        .fontSize($r('app.string.drag_and_exchange_app_name_font_size'))
    }
    // 消失时需要占位，所以使用显隐控制而非条件渲染。（条件渲染与显隐控制区别，
    // 参考资料：
    // https://docs.openharmony.cn/pages/v4.0/zh-cn/application-dev/performance/proper-choice-between-if-and-visibility.md/）
    .visibility(this.app.visible ? Visibility.Visible :
    Visibility.Hidden)
  }
}

/**
 * 封装处理处理JSON对象的类
 */
class JsonObjType {
  public insertIndex: number;
  public selectedIndex: number;

  /** 构造 ListSceneView 实例。 */
  constructor(insertIndex: number, selectedIndex: number) {
    this.insertIndex = insertIndex;
    this.selectedIndex = selectedIndex;
  }
}