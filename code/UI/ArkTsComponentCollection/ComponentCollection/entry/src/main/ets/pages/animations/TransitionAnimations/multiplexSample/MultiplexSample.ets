/*
 * Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
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
 * @file entry/src/main/ets/pages/animations/TransitionAnimations/multiplexSample/MultiplexSample.ets
 * 文件职责：MultiplexSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：MultiplexSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { ScrollItem } from './ScrollItem';
import { MultiplexModel } from './MultiplexModel';
import { TitleBar } from '../../../../common/TitleBar';

const MARGIN_BETWEEN: number = 15; // 间距

const SELECT_SIZE: number = 0.6; // 当前选中大小

const UNSELECT_SIZE: number = 0.5; // 未选中大小

/**
 * MultiplexSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct MultiplexSample {
  private scroller: Scroller = new Scroller();
  private currentX: number = 0; // 当前X轴位置
  private startScroll: boolean = false; // 开始滑动
  // @StorageProp windowWidth：与 AppStorage 单向绑定
  @StorageProp('windowWidth') windowWidth: number = 480;

  // @StorageProp windowHeight：与 AppStorage 单向绑定
  @StorageProp('windowHeight') windowHeight: number = 720;

  // @State resources：组件内部状态
  @State resources: Array<MultiplexModel> = new Array<MultiplexModel>();

  // @State currentModel：组件内部状态
  @State currentModel: MultiplexModel | null = null; // 当前item
  // @State onceXOffset：组件内部状态
  @State onceXOffset: number = 0; // 本次滑动X轴距离
  // @State scrollIndex：组件内部状态
  @State @Watch('scrollIndexUpdated') scrollIndex: number = 0; // 当前滑动item下标

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear() {
    this.resources.push(new MultiplexModel('1', $r('app.media.img_test_1')));
    this.resources.push(new MultiplexModel('2', $r('app.media.img_test_3')));
    this.resources.push(new MultiplexModel('3', $r('app.media.img_test_2')));
    this.resources.push(new MultiplexModel('4', $r('app.media.img_test_4')));
    this.resources.push(new MultiplexModel('5', $r('app.media.img_test_5')));
    this.currentModel = this.resources[0];
  }

  /**
   * scrollIndexUpdated：执行 scrollIndexUpdated 相关逻辑。
   */
  scrollIndexUpdated() {
    this.currentModel = this.resources[this.scrollIndex];
    this.onceXOffset = 0;
  }

  /**
   * getSize：执行 getSize 相关逻辑。
   */
  getSize(size: number, resource: MultiplexModel) {
    let changeRatio = 0.1 * (Math.abs(this.onceXOffset) / (this.windowWidth / 2));
    let changeSize = Math.floor(size * (changeRatio > 0.1 ? 0.1 : changeRatio));
    // 分支：if (this.currentModel && this.currentModel.getId() === resou
    if (this.currentModel && this.currentModel.getId() === resource.getId()) {
      return size * SELECT_SIZE - changeSize;
    }
    return size * UNSELECT_SIZE;
  }

  /**
   * getLeftMargin：执行 getLeftMargin 相关逻辑。
   */
  getLeftMargin(resource: MultiplexModel) {
    // 分支：if (this.resources.length === 0) {
    if (this.resources.length === 0) {
      return 0;
    }
    return resource.getId() === this.resources[0].getId() ? this.windowWidth * 0.2 : -MARGIN_BETWEEN;
  }

  /**
   * getRightMargin：执行 getRightMargin 相关逻辑。
   */
  getRightMargin(resource: MultiplexModel) {
    // 分支：if (this.resources.length === 0) {
    if (this.resources.length === 0) {
      return 0;
    }
    return resource.getId() === this.resources[this.resources.length - 1].getId() ? this.windowWidth * 0.2 : 0;
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.Multiplex_interface') })
        .id('target')
        // Scroll：滚动容器
        // 关键属性：scrollable、滚动条、边缘效果、onScroll
        Scroll(this.scroller) {
          // Row：水平布局容器
          Row() {
            ForEach(this.resources, (resource: MultiplexModel) => {
              // ScrollItem：ScrollItem 自定义组件
              // 关键属性：getId、外边距、getLeftMargin
              ScrollItem({
                resource: resource,
                onDelete: this.onDelete
              // 结束当前组件块
              })
                .id(resource.getId())
                // margin：设置外边距
                .margin({
                  left: this.getLeftMargin(resource),
                  right: this.getRightMargin(resource)
                // 结束当前组件块
                })
                // width：设置宽度
                .width(this.getSize(this.windowWidth, resource))
                // height：设置高度
                .height(this.getSize(this.windowHeight, resource))
                // zIndex：设置层级
                .zIndex(resource.getId() === (this.currentModel && this.currentModel.getId()) ? 1 : 0)
                .blur(resource.getId() === (this.currentModel && this.currentModel.getId()) ? 0 : 5)
            // 结束当前组件块
            }, (item: MultiplexModel) => {
              return item.getId();
            // 结束当前组件块
            })
          // 结束当前组件块
          }.id('multiplex_sample_row_2')
        // 结束当前组件块
        }
        .id('scroll')
        // scrollable：设置可滚动方向
        .scrollable(ScrollDirection.Horizontal)
        // scrollBar：设置滚动条
        .scrollBar(BarState.Off) // 滚动条常驻显示
        // edgeEffect：设置边缘回弹效果
        .edgeEffect(EdgeEffect.None)
        .onScroll((xOffset: number, yOffset: number) => {
          // 处理：this.currentX += xOffset;
          this.currentX += xOffset;
          // 处理：this.onceXOffset += xOffset;
          this.onceXOffset += xOffset;
          // 处理：let index = Math.round(this.currentX / (this.win
          let index = Math.round(this.currentX / (this.windowWidth / 2 - MARGIN_BETWEEN));
          // 分支：if (index < 0) {
          if (index < 0) {
            // 处理：index = 0;
            index = 0;
          // 结束当前组件块
          }
          if (index > this.resources.length - 1) {
            index = this.resources.length - 1;
          }
          this.scrollIndex = index;
        })

        .onScrollEdge((side: Edge) => {
        })
        .onScrollFrameBegin((offset: number) => {
          return { offsetRemain: offset };
        })
        .onScrollStart(() => {
          this.startScroll = true;
        })
        .onScrollStop(() => {
          this.currentX = this.scroller.currentOffset().xOffset;
          this.onceXOffset = 0;
          if (this.startScroll) {
            this.scrollCurrentIndex();
          }
          this.startScroll = false;
        })
        .height('100%')
        .margin({ top: -20 })
      }.id('multiplex_sample_column_1')
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))

  }

  /**
   * scrollCurrentIndex：执行 scrollCurrentIndex 相关逻辑。
   */
  scrollCurrentIndex() {
    let index = 0
    for (let i = 0;i < this.resources.length; i++) {
      if (this.currentModel && this.currentModel.getId() === this.resources[i].getId()) {
        index = i;
        break;
      }
    }
    this.scroller.scrollTo({
      xOffset: (this.windowWidth / 2 - MARGIN_BETWEEN) * index,
      yOffset: 0,
      animation: { duration: 100, curve: Curve.LinearOutSlowIn }
    })
  }

  onDelete = (id: string) => {
    for (let i = this.resources.length - 1;i >= 0; i--) {
      if (this.resources[i].getId() === id) {
        let isCurrent = this.resources[i].getId() === this.currentModel?.getId();
        this.resources.splice(i, 1);
        if (isCurrent) {
          if (i === this.resources.length) {
            this.currentModel = this.resources[i - 1];
          } else {
            this.currentModel = this.resources[i];
          }
        }
        break;
      }
    }
    this.scrollCurrentIndex();
  }
}