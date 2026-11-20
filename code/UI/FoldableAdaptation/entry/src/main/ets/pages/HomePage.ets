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
 * @file entry/src/main/ets/pages/HomePage.ets
 * 文件职责：HomePage 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：HomePage。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { BreakpointConstants } from '../constants/BreakpointConstants';
import { emitter } from '@kit.BasicServicesKit';
import { display, window } from '@kit.ArkUI';
import { NormalPage } from './NormalPage';
import { FullScreenPage } from './FullScreenPage';
import { NavMode, RouterUtils } from '../utils/RouterUtils';

// const 语句
const FULL_SCREEN_ROUTE: string[] = ['fullscreen']; // 折叠屏展开时需要全屏的路由信息

// const 语句
const swiperData: ResourceStr[] = [
  $r('app.media.banner_movie1'),
  $r('app.media.banner_movie2'),
  $r('app.media.banner_movie3')
];

// const 语句
const productData: ResourceStr[] = [
  $r('app.media.product001'),
  $r('app.media.product002'),
  $r('app.media.product003'),
  $r('app.media.product004'),
  $r('app.media.product005'),
  $r('app.media.product006'),
  $r('app.media.product007'),
  $r('app.media.product008'),
  $r('app.media.product001'),
  $r('app.media.product002'),
  $r('app.media.product003'),
  $r('app.media.product004'),
  $r('app.media.product005'),
  $r('app.media.product006'),
  $r('app.media.product007'),
  $r('app.media.product008')
];

// const 语句
const FULL_SCREEN_PAGE_NAME: string = 'fullscreen';
// const 语句
const NORMAL_PAGE_NAME: string = 'normal';

/**
 * HomePage：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct HomePage {
  // 定义初始模式为NavMode.DefaultMode，并设置监听函数onModeChange
  // @State navMode：组件内部状态
  @State @Watch('onModeChange') navMode: NavMode = NavMode.DefaultMode;

  // @StorageLink currentBreakpoint：与 AppStorage 双向绑定
  @StorageLink('currentBreakpoint') @Watch('onWindowSizeChange') currentBreakpoint: string = '';

  // Navigation路由栈,控制页面跳转
  pageStack: NavPathStack = RouterUtils.pageStack;

  // @State navigationMode：组件内部状态
  @State navigationMode: NavigationMode = NavigationMode.Stack;

  // @State swiperDisplayCount：组件内部状态
  @State swiperDisplayCount: number = 1; // 首页swiper展示item数量
  // @StorageProp enterRouteName：与 AppStorage 单向绑定
  @StorageProp('enterRouteName') enterRouteName: string = '';

  // @StorageProp windowSize：与 AppStorage 单向绑定
  @StorageProp('windowSize') windowSize: window.Size = {
    // 字段 width：声明并维护该成员的状态
    width: display.getDefaultDisplaySync().width,
    // 字段 height：声明并维护该成员的状态
    height: display.getDefaultDisplaySync().height
  };

  // @State isFoldable：组件内部状态
  @State isFoldable: boolean = false; // 是否为折叠屏
  // @State searchContext：组件内部状态
  @State searchContext: string = ''; // 搜索输入内容
  // @State tabColumns：组件内部状态
  @State tabColumns: string = '1fr 1fr';

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear(): void {
    // 更新 onWindowSizeChange
    this.onWindowSizeChange();
    RouterUtils.setFullScreenRouter(FULL_SCREEN_ROUTE);
    // 存储折叠屏设备信息
    this.isFoldable = display.isFoldable();
    AppStorage.setOrCreate('isFoldable', this.isFoldable);
    // 首次进入应用判断页面展示类型
    this.navMode = NavMode.HomePageMode;
    // let 语句
    let innerEvent: emitter.InnerEvent = {
      // 字段 eventId：声明并维护该成员的状态
      eventId: 3
    };
    // 收到eventId为3的事件后执行回调函数
    emitter.on(innerEvent, (params) => {
      // if 语句
      if (params.data && params.data.navMode) {
        // 更新 navMode
        this.navMode = params.data.navMode;
      }
    });
  }

  // 屏幕尺寸发生改变时触发navMode改变
  /**
   * onWindowSizeChange：执行 onWindowSizeChange 相关逻辑。
   */
  onWindowSizeChange() {
    if (this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM) {
      this.navMode = NavMode.HomePageMode;
    } else {
      this.navMode = NavMode.FoldMode;
    }
  }

  /**
   * onModeChange：执行 onModeChange 相关逻辑。
   */
  onModeChange() {
    // 获取路由栈最后一个路由的名称
    let lastRouteName: string = this.pageStack.getAllPathName()[this.pageStack.getAllPathName().length-1];
    switch (this.navMode) {
      // 当设备折叠态发生改变或屏幕旋转时响应以下逻辑
      case NavMode.FoldMode:
        // 全屏案例在折叠态变化时不需要切换NavigationMode
        if (FULL_SCREEN_ROUTE.includes(lastRouteName)) {
          this.navigationMode = NavigationMode.Stack;
          break;
        }
        if (this.currentBreakpoint !== BreakpointConstants.BREAKPOINT_SM) {
          if (this.pageStack.size() > 0) {
            // 宽屏条件下且展示了子路由，NavigationMode为Split
            this.navigationMode = NavigationMode.Split;
            this.swiperDisplayCount = 1;
          } else {
            // 宽屏条件下且未展示子路由，NavigationMode为Stack
            this.navigationMode = NavigationMode.Stack;
            this.swiperDisplayCount = 2;
          }
        } else {
          this.navigationMode = NavigationMode.Stack;
          this.swiperDisplayCount = 1;
        }
        break;
      // 当应用进入子路由时响应以下逻辑
      case NavMode.ChildPageMode:
        // 进入全屏案例需切换为Stack
        if (FULL_SCREEN_ROUTE.includes(this.enterRouteName)) {
          this.navigationMode = NavigationMode.Stack;
          break;
        }
        // 根据屏幕宽度决定NavigationMode
        if (this.currentBreakpoint !== BreakpointConstants.BREAKPOINT_SM) {
          this.navigationMode = NavigationMode.Split;
        } else {
          this.navigationMode = NavigationMode.Stack;
        }
        this.swiperDisplayCount = 1;
        break;
      // 当应用返回首页时响应以下逻辑
      case NavMode.HomePageMode:
        if (this.currentBreakpoint !== BreakpointConstants.BREAKPOINT_SM) {
          this.navigationMode = NavigationMode.Stack;
          this.swiperDisplayCount = 2;
        } else {
          this.navigationMode = NavigationMode.Stack;
          this.swiperDisplayCount = 1;
        }
        this.pageStack.disableAnimation(false);
        break;
      default:
        break;
    }
    // 重置NavMode
    if (this.navMode !== NavMode.DefaultMode) {
      this.navMode = NavMode.DefaultMode;
    }
  }

  /**
   * buildMap：执行 buildMap 相关逻辑。
   */
  @Builder
  buildMap(name: string, param?: ESObject) {
    // NavDestination：导航目的地
    // 关键属性：onBackPressed、尺寸
    // NavDestination：导航目的地
    // 关键属性：onBackPressed、尺寸
    NavDestination() {
      if (name === NORMAL_PAGE_NAME) {
        // NormalPage：NormalPage 自定义组件
        NormalPage({ imageSrc: param as ResourceStr }).id('home_page_normal_page_2')
      }
      if (name === FULL_SCREEN_PAGE_NAME) {
        // FullScreenPage：FullScreenPage 自定义组件
        FullScreenPage({ imageSrc: param as ResourceStr }).id('home_page_full_screen_page_3')
      }
    }.id('home_page_nav_destination_1')
    .onBackPressed((): boolean => {
      if (this.pageStack.size() > 0) {
        RouterUtils.popAppRouter();
        return true;
      }
      return false;
    })
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Navigation：导航容器
    // 关键属性：hideTitleBar、navDestination、高度、宽度、mode、navBarWidth
    // Navigation：导航容器
    // 关键属性：hideTitleBar、navDestination、高度、宽度、mode、navBarWidth
    Navigation(this.pageStack) {
      // Scroll：滚动容器
      // 关键属性：高度、宽度、滚动条
      // Scroll：滚动容器
      // 关键属性：高度、宽度、滚动条
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：宽度、高度、区域变化回调
        // Column：垂直布局容器
        // 关键属性：宽度、高度、区域变化回调
        Column() {
          // Search：搜索框
          // 关键属性：defaultFocus、圆角、geometryTransition、高度、外边距、背景色
          // Search：搜索框
          // 关键属性：defaultFocus、圆角、geometryTransition、高度、外边距、背景色
          Search({ value: this.searchContext, placeholder: $r('app.string.search_placeholder') })
            .id('HomeSearch')
            .defaultFocus(false)// 默认获取焦点拉起键盘
            .borderRadius($r('app.integer.size_24'))// .geometryTransition(this.geometryId, { follow: true })
            .height($r('app.integer.size_40'))
            .margin($r('app.integer.size_8'))
            .backgroundColor($r('app.color.color_E7E9E8'))

          // Swiper：轮播容器
          // 关键属性：是否自动播放、displayCount、外边距、宽度
          // Swiper：轮播容器
          // 关键属性：是否自动播放、displayCount、外边距、宽度
          Swiper() {
            ForEach(swiperData, (dataItem: ResourceStr) => {
              // Stack：层叠布局容器
              // 关键属性：内容对齐、点击事件回调、pushUri
              // 交互：可点击交互
              // Stack：层叠布局容器
              // 关键属性：内容对齐、点击事件回调、pushUri
              // 交互：可点击交互
              Stack() {
                // Image：图片
                // 关键属性：宽度、高度、objectFit、圆角、内边距
                // Image：图片
                // 关键属性：宽度、高度、objectFit、圆角、内边距
                Image(dataItem).id('home_page_image_8')
                  .width(this.swiperDisplayCount === 2 ? px2vp(this.windowSize.width / 2) : $r('app.integer.size_353'))
                  .height($r('app.integer.size_160'))
                  .objectFit(ImageFit.Fill)
                  .borderRadius($r('app.integer.size_16'))
                  .padding(this.swiperDisplayCount === 2 ? {
                    left: $r('app.integer.size_16'),
                    right: $r('app.integer.size_16')
                  } :
                    {
                      left: $r('app.integer.size_8'),
                      right: $r('app.integer.size_8')
                    })
              }.id('home_page_stack_7')
              .alignContent(Alignment.Bottom)
              .onClick(() => {
                RouterUtils.pushUri(FULL_SCREEN_PAGE_NAME, dataItem);
              })
            })
          }
          .id('MainSwiper')
          .autoPlay(true)
          .displayCount(this.swiperDisplayCount)
          .margin({ top: $r('app.integer.size_8'), bottom: $r('app.integer.size_8') })
          .width(this.swiperDisplayCount === 2 ? px2vp(this.windowSize.width) : $r('app.integer.size_353'))

          // WaterFlow：瀑布流容器
          // 关键属性：nestedScroll
          // WaterFlow：瀑布流容器
          // 关键属性：nestedScroll
          WaterFlow() {
            ForEach(productData, (dataItem: ResourceStr, index: number) => {
              // FlowItem：瀑布流条目
              FlowItem() {
                // Image：图片
                // 关键属性：点击事件回调、pushUri
                // 交互：可点击交互
                // Image：图片
                // 关键属性：点击事件回调、pushUri
                // 交互：可点击交互
                Image(dataItem)
                  .onClick(() => {
                    RouterUtils.pushUri(NORMAL_PAGE_NAME, dataItem);
                  })
                  .id('WaterFlow' + index)
              }.id('home_page_flow_item_9')
            })
          }
          .id('MainWaterFlow')
          .nestedScroll({
            scrollForward: NestedScrollMode.PARENT_FIRST,
            scrollBackward: NestedScrollMode.SELF_FIRST
          })
          .cachedCount(1)
          .columnsTemplate(this.tabColumns)
          .columnsGap($r('app.integer.size_6'))
          .width($r('app.string.size_percent_100'))
          .height($r('app.string.size_percent_100'))

        }.id('home_page_column_6')
        .width($r('app.string.size_percent_100'))
        .height($r('app.string.size_percent_100'))
        .onAreaChange((oldValue: Area, newValue: Area) => {
          if (oldValue.width === newValue.width) {
            return;
          }
          // 折叠屏下item显示宽度
          let foldableWidth: number = 158;
          // 其他情况下item显示宽度
          let itemWidth: number = 177;
          // 根据屏幕宽度计算展示item列数
          let maxItemCount: number = Math.floor(Number(newValue.width) / (this.isFoldable ? foldableWidth : itemWidth));
          this.tabColumns = '1fr' + ' 1fr'.repeat(maxItemCount - 1);
        })
      }.id('home_page_scroll_5')
      .height($r('app.string.size_percent_100'))
      .width($r('app.string.size_percent_100'))
      .scrollBar(BarState.Off)
    }.id('home_page_navigation_4')
    .hideTitleBar(true)
    .navDestination(this.buildMap)
    .height($r('app.string.size_percent_100'))
    .width($r('app.string.size_percent_100'))
    .mode(this.navigationMode)
    .navBarWidth($r('app.string.size_percent_50'))

  }
}
