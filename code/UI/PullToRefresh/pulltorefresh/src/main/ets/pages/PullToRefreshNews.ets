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
 * @file pulltorefresh/src/main/ets/pages/PullToRefreshNews.ets
 * 文件职责：PullToRefreshNews 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：PullToRefreshNewsComponent、newsItem、NewsData、NewsDataSource、JsonObjType、JsonObject、getNews。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

/**
 * 使用pullToRefresh组件样例
 *
 * 核心组件:
 * 1. pullToRefresh
 *
 * 实现步骤:
 * 1. 使用一个@Builder修饰的方法实现LazyForEach列表懒加载。
 * 2. 使用pullToRefresh组件实现上拉下滑加载数据，将UI方法传入组件中。
 */

import util from '@ohos.util';
import { PullToRefresh, PullToRefreshConfigurator } from '@ohos/pulltorefresh/index';
import { BasicDataSource } from '../viewModel/BasicDataSource';

const NEWS_TITLE_MAX_LINES: number = 1;

const NEWS_TITLE_TEXT_FONT_WEIGHT: number = 500;

const NEWS_CONTENT_MAX_LINES: number = 2;

const NEWS_TIME_MAX_LINES: number = 1;

const NEWS_PAGE_TEXT_FONT_WEIGHT: number = 600;

const CURRENT_DATA_RESOLVE_SUCCESS: string = '刷新当前数据成功';

const NEW_DATA_RESOLVE_SUCCESS: string = '更新数据成功';

const CURRENT_DATA_TIP: string = '释放刷新当前页面数据';

const NEW_DATA_TIP: string = '释放更新下页数据';

const NEWS_MOCK_DATA_COUNT: number = 8; // 每份模拟数据所含的新闻个数为8

const MOCK_DATA_FILE_ONE_DIR: string = 'mockDataOne.json'; // 模拟数据路径

const MOCK_DATA_FILE_TWO_DIR: string = 'mockDataTwo.json'; // 模拟数据路径

const NEWS_REFRESH_TIME: number = 1500; // 数据刷新时间

const LOAD_DEFAULT_TEXT: string = '正在玩命加载中...'; // 上拉加载默认文本

const LOAD_STOP_TEXT: string = '已经到底啦'; // 上拉加载到底提示文本

const LOAD_TEXT_PULL_UP_1: string = '正在上拉刷新...'; // 上拉1阶段文本

const LOAD_TEXT_PULL_UP_2: string = '放开刷新'; // 上拉2阶段文本

const NEWS_MAX_LIST: number = 4; // 数据列表总页数

const LOAD_PULL_STATE_CHANGE: number = 0.75; // 根据组件动画配置的上拉阶段改变临界值

const CHANGE_PAGE_STATE: number = 0.99 //下拉改变刷新状态的临界值

const PAGE_LIST_ID: string = 'pageList'; // 列表ID

/**
 * PullToRefreshNewsComponent：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct PullToRefreshNewsComponent {
  // 创建用于懒加载的数据对象
  // @State newsData：组件内部状态
  @State newsData: NewsDataSource = new NewsDataSource();

  // 需绑定列表或宫格组件
  private scroller: Scroller = new Scroller();

  // 模拟数据列表页
  // @State newsDataListIndex：组件内部状态
  @State newsDataListIndex: number = 1;
  private refreshConfigurator: PullToRefreshConfigurator = new PullToRefreshConfigurator();

  // @State isPullUp：组件内部状态
  @State isPullUp: boolean = true;

  // @State isLoading：组件内部状态
  @State isLoading: boolean = false;

  // @State string：组件内部状态
  @State private angle1?: number | string = 0;

  // @State string：组件内部状态
  @State private angle2?: number | string = 0;

  // @State loadText：组件内部状态
  @State loadText: string = '';

  // @State pullHeightValue：组件内部状态
  @State pullHeightValue: number = 0;

  // 每页与数据的对应关系
  private currentPageMap: Map<number, string> = new Map();

  // 当前页
  // @State currentPage：组件内部状态
  @State currentPage: number = 0;

  // 是否更换页面
  // @State isChangePage：组件内部状态
  @State isChangePage: boolean = false;

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear() {
    this.currentPageMap.set(0, MOCK_DATA_FILE_ONE_DIR);
    this.currentPageMap.set(1, MOCK_DATA_FILE_TWO_DIR);
    const newsModelMockData: NewsData[] = getNews(MOCK_DATA_FILE_ONE_DIR);
    for (let j = 0; j < NEWS_MOCK_DATA_COUNT; j++) {
      this.newsData.pushData(newsModelMockData[j]);
    }
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度
    // Column：垂直布局容器
    // 关键属性：高度
    Column() {
      // Text：文本
      // 关键属性：字号、字重、文本对齐、行高、内边距、宽度
      // Text：文本
      // 关键属性：字号、字重、文本对齐、行高、内边距、宽度
      Text($r('app.string.pull_refresh_page_title'))
        .fontSize($r('app.integer.pull_refresh_page_text_font_size'))
        .fontWeight(NEWS_PAGE_TEXT_FONT_WEIGHT)
        .textAlign(TextAlign.Start)
        .lineHeight($r('app.integer.pull_refresh_page_text_line_height'))
        .padding({ left: $r('app.string.pull_refresh_page_text_padding_left') })
        .width($r('app.string.pull_refresh_page_text_width'))
        .height($r('app.string.pull_refresh_page_text_height'))
        .backgroundColor($r('app.color.pull_refresh_listColor'))
        .id('pullRefreshTitle')

      // Column：垂直布局容器
      // 关键属性：背景色
      // Column：垂直布局容器
      // 关键属性：背景色
      Column() {
        // PullToRefresh：PullToRefresh 自定义组件
        PullToRefresh({
          // TODO: 知识点：使用PullToRefresh组件时需要先绑定数据与主体布局。若使用LazyForEach组件渲染列表时，需将UI方法使用@Builder修饰并传入customList属性中。
          // 必传项，列表组件所绑定的数据
          data: $newsData,
          // 必传项，需绑定传入主体布局内的列表或宫格组件
          scroller: this.scroller,
          // 必传项，自定义主体布局，内部有列表或宫格组件
          customList: () => {
            // 一个用@Builder修饰过的UI方法
            this.getListView();
          },
          // 组件属性配置，具有默认值
          refreshConfigurator: this.refreshConfigurator,
          // TODO: 知识点：设置onRefresh下拉刷新回调方法，该方法必须返回一个Promise类型。
          onRefresh: () => {
            return new Promise<string>((resolve, reject) => {
              setTimeout(() => {
                if (this.isChangePage) {
                  // 计算改变页面
                  this.currentPage = (this.currentPage + 1) % 2;
                }
                this.newsData.clear();
                let newsModelMockData: NewsData[] = [];
                newsModelMockData = getNews(this.currentPageMap.get(this.currentPage));
                for (let j = 0; j < NEWS_MOCK_DATA_COUNT; j++) {
                  this.newsData.pushData(newsModelMockData[j]);
                }
                if (this.isChangePage) {
                  resolve(NEW_DATA_RESOLVE_SUCCESS);
                } else {
                  resolve(CURRENT_DATA_RESOLVE_SUCCESS);
                }
                // 页码归零
                this.newsDataListIndex = 1;
              }, NEWS_REFRESH_TIME);
            });
          },
          // TODO: 知识点：设置onLoadMore上滑加载更多数据回调方法，该方法必须返回一个Promise类型。
          onLoadMore: () => {
            return new Promise<string>((resolve, reject) => {
              // 模拟数据列表页超过4页后已到达底部，无法继续加载
              if (this.newsDataListIndex < NEWS_MAX_LIST) {
                // 模拟网络请求操作，请求网络1.5秒后得到数据，通知组件变更列表数据
                setTimeout(() => {
                  let newsModelMockData: NewsData[] = getNews(MOCK_DATA_FILE_ONE_DIR);
                  for (let j = 0; j < NEWS_MOCK_DATA_COUNT; j++) {
                    this.newsData.pushData(newsModelMockData[j]);
                  }
                  this.newsDataListIndex++;
                  resolve('');
                }, NEWS_REFRESH_TIME);
              } else {
                // 如果已满4页，更改上拉提示信息提示已经加载完所有数据
                setTimeout(() => {
                  resolve('');
                }, NEWS_REFRESH_TIME);
              }
            });
          },
          customLoad: () => this.customLoad(),
          customRefresh: () => this.customRefresh(),
          onAnimPullDown: (value) => {
            this.pullHeightValue = value;
          },
          onAnimRefreshing: (value, width, height) => {
            if (value !== undefined && width !== undefined && height !== undefined) {
              if (value) {
                this.angle2 = value * 360;
                if (this.pullHeightValue > LOAD_PULL_STATE_CHANGE && this.pullHeightValue <= CHANGE_PAGE_STATE) {
                  this.isChangePage = false;
                } else {
                  // 当下拉到最顶部时，触发更新页面，不再刷新当前页。
                  this.isChangePage = true;
                }
              }
            }
          },
          onAnimPullUp: (value, width, height) => {
            if (value !== undefined && width !== undefined && height !== undefined) {
              if (value) {
                this.isLoading = false;
                this.isPullUp = true;
                // 判断上拉拖拽过程中高度是否超过阶段临界值
                if (value < LOAD_PULL_STATE_CHANGE) {
                  // 归零角度，保持箭头朝上
                  this.angle1 = 0;
                  // 改变提示文本为上拉1阶段
                  this.loadText = LOAD_TEXT_PULL_UP_1;
                } else {
                  // 翻转角度，保持箭头朝下
                  this.angle1 = 180;
                  // 改变提示文本为上拉2阶段
                  this.loadText = LOAD_TEXT_PULL_UP_2;
                }
              }
            }
          },
          onAnimLoading: (value, width, height) => {
            if (value !== undefined && width !== undefined && height !== undefined) {
              if (value) {
                this.isPullUp = false;
                this.isLoading = true;
                // 更改角度使加载图片保持旋转
                this.angle2 = value * 360;
                // 判读页码是否为最后一页
                if (this.newsDataListIndex !== NEWS_MAX_LIST) {
                  this.loadText = LOAD_DEFAULT_TEXT;
                } else {
                  // 最后一页更换文本提示已经到底了
                  this.loadText = LOAD_STOP_TEXT;
                }
              }
            }
          }
        }).id('pull_to_refresh_news_pull_to_refresh_3')
      }.id('pull_to_refresh_news_column_2')
      .backgroundColor($r('app.color.pull_refresh_listColor'))
    }.id('pull_to_refresh_news_column_1')
    .height($r('app.string.pull_refresh_page_height'))
  }

  // 上滑加载提示
  /**
   * customLoad：执行 customLoad 相关逻辑。
   */
  @Builder
  private customLoad() {
    // Row：水平布局容器
    // 关键属性：高度
    // Row：水平布局容器
    // 关键属性：高度
    Row() {
      // Stack：层叠布局容器
      Stack() {
        // 上拉1阶段箭头图片
        // Image：图片
        // 关键属性：宽度、高度、objectFit、可见性、旋转
        // Image：图片
        // 关键属性：宽度、高度、objectFit、可见性、旋转
        Image($r('app.media.pull_icon_up')).id('pull_to_refresh_news_image_5')
          .width($r('app.string.pull_refresh_load_width'))
          .height($r('app.string.pull_refresh_load_height'))
          .objectFit(ImageFit.Contain)
          .visibility(this.isPullUp ? Visibility.Visible : Visibility.Hidden)
          .rotate({
            z: 1,
            angle: this.angle1 !== undefined ? this.angle1 : 0
          })
        // 加载时图片
        // Image：图片
        // 关键属性：宽度、高度、objectFit、可见性、旋转
        // Image：图片
        // 关键属性：宽度、高度、objectFit、可见性、旋转
        Image($r('app.media.pull_icon_load')).id('pull_to_refresh_news_image_6')
          .width($r('app.string.pull_refresh_load_width'))
          .height($r('app.string.pull_refresh_load_height'))
          .objectFit(ImageFit.Contain)
          .visibility(this.isLoading ? Visibility.Visible : Visibility.Hidden)
          .rotate({
            z: 1,
            angle: this.angle2 !== undefined ? this.angle2 : 0
          })
      }.id('pull_to_refresh_news_stack_4')
      // 最后一页加载时隐藏加载图片
      .width(this.newsDataListIndex === NEWS_MAX_LIST && this.isLoading ? 0 :
      this.refreshConfigurator.getLoadImgHeight())
      .height(this.newsDataListIndex === NEWS_MAX_LIST && this.isLoading ? 0 :
      this.refreshConfigurator.getLoadImgHeight())

      // 上拉过程与加载时提示文本
      // Text：文本
      // 关键属性：高度、文本对齐、外边距、字体颜色、getLoadTextColor、字号
      // Text：文本
      // 关键属性：高度、文本对齐、外边距、字体颜色、getLoadTextColor、字号
      Text(this.loadText).id('pull_to_refresh_news_text_7')
        .height($r('app.string.pull_refresh_load_height'))
        .textAlign(TextAlign.Center)
        .margin({ left: this.newsDataListIndex === NEWS_MAX_LIST && this.isLoading ? 0 : 8 })
        .fontColor(this.refreshConfigurator !== undefined ? this.refreshConfigurator.getLoadTextColor() : 0)
        .fontSize(this.refreshConfigurator !== undefined ? this.refreshConfigurator.getLoadTextSize() : 0)
    }
    .height($r('app.string.pull_refresh_load_height'))
    .id('pullLoadTipRow')
  }

  // 下拉刷新提示
  /**
   * customRefresh：执行 customRefresh 相关逻辑。
   */
  @Builder
  private customRefresh() {
    // Row：水平布局容器
    // 关键属性：高度
    // Row：水平布局容器
    // 关键属性：高度
    Row() {
      // 下滑加载图片
      // Image：图片
      // 关键属性：宽度、高度、objectFit、旋转
      // Image：图片
      // 关键属性：宽度、高度、objectFit、旋转
      Image($r('app.media.pull_icon_load')).id('pull_to_refresh_news_image_8')
        .width($r('app.string.pull_refresh_load_width'))
        .height($r('app.string.pull_refresh_load_height'))
        .objectFit(ImageFit.Contain)
        .rotate({
          z: 1,
          angle: this.angle2 !== undefined ? this.angle2 : 0
        })
        .width(this.refreshConfigurator.getLoadImgHeight())
        .height(this.refreshConfigurator.getLoadImgHeight())

      // 下拉时提示文本
      // Stack：层叠布局容器
      Stack() {
        // Text：文本
        // 关键属性：高度、文本对齐、外边距、字体颜色、getLoadTextColor、字号
        // Text：文本
        // 关键属性：高度、文本对齐、外边距、字体颜色、getLoadTextColor、字号
        Text(CURRENT_DATA_TIP).id('pull_to_refresh_news_text_10')
          .height($r('app.string.pull_refresh_load_height'))
          .textAlign(TextAlign.Center)
          .margin({ left: this.newsDataListIndex === NEWS_MAX_LIST && this.isLoading ? 0 : 8 })
          .fontColor(this.refreshConfigurator !== undefined ? this.refreshConfigurator.getLoadTextColor() : 0)
          .fontSize(this.refreshConfigurator !== undefined ? this.refreshConfigurator.getLoadTextSize() : 0)
          .visibility(this.pullHeightValue <= CHANGE_PAGE_STATE ? Visibility.Visible : Visibility.Hidden)
        // Text：文本
        // 关键属性：高度、文本对齐、外边距、字体颜色、getLoadTextColor、字号
        // Text：文本
        // 关键属性：高度、文本对齐、外边距、字体颜色、getLoadTextColor、字号
        Text(NEW_DATA_TIP).id('pull_to_refresh_news_text_11')
          .height($r('app.string.pull_refresh_load_height'))
          .textAlign(TextAlign.Center)
          .margin({ left: this.newsDataListIndex === NEWS_MAX_LIST && this.isLoading ? 0 : 8 })
          .fontColor(this.refreshConfigurator !== undefined ? this.refreshConfigurator.getLoadTextColor() : 0)
          .fontSize(this.refreshConfigurator !== undefined ? this.refreshConfigurator.getLoadTextSize() : 0)
          .visibility(this.pullHeightValue > CHANGE_PAGE_STATE ? Visibility.Visible : Visibility.Hidden)
      }.id('pull_to_refresh_news_stack_9')
    }
    .height($r('app.string.pull_refresh_load_height'))
    .id('pullRefreshTipRow')
  }

  // 必须使用@Builder修饰方法
  /**
   * getListView：执行 getListView 相关逻辑。
   */
  @Builder
  private getListView() {
    // List：列表容器
    // 关键属性：宽度、背景色
    // List：列表容器
    // 关键属性：宽度、背景色
    List({
      space: 3, scroller: this.scroller
    }) {
      // TODO: 性能知识点：使用懒加载组件渲染数据
      LazyForEach(this.newsData, (item: NewsData) => {
        // ListItem：列表项
        // 关键属性：背景色、外边距
        // ListItem：列表项
        // 关键属性：背景色、外边距
        ListItem() {
          newsItem({
            newsTitle: item.newsTitle,
            newsContent: item.newsContent,
            newsTime: item.newsTime
          })
        }.id('pull_to_refresh_news_list_item_12')
        .backgroundColor($r('app.color.pull_refresh_white'))
        .margin({
          bottom: $r('app.string.pull_refresh_list_margin_bottom'),
          left: $r('app.string.pull_refresh_list_item_margin_left')
        })
        .borderRadius($r('app.integer.pull_refresh_list_border_radius'))
      }, (item: NewsData, index?: number) => JSON.stringify(item) + index);
    }
    .id(PAGE_LIST_ID)
    .width($r('app.string.pull_refresh_List_width'))
    .backgroundColor($r('app.color.pull_refresh_listColor'))
    // TODO: 知识点：必须设置列表为滑动到边缘无效果，否则无法触发pullToRefresh组件的上滑下拉方法。
    .edgeEffect(EdgeEffect.None)
  }

  /**
   * aboutToDisappear：组件即将销毁时回调，用于释放资源与取消订阅。
   */
  aboutToDisappear() {
    this.newsData.clear();
  }
}

// 单一列表样式组件
/**
 * newsItem：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
struct newsItem {
  private newsTitle: string | Resource = '';
  private newsContent: string | Resource = '';
  private newsTime: string | Resource = '';

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：交叉轴对齐
    // Column：垂直布局容器
    // 关键属性：交叉轴对齐
    Column() {
      // Row：水平布局容器
      // 关键属性：交叉轴对齐、高度、外边距
      // Row：水平布局容器
      // 关键属性：交叉轴对齐、高度、外边距
      Row() {
        // Image：图片
        // 关键属性：宽度、高度、objectFit
        // Image：图片
        // 关键属性：宽度、高度、objectFit
        Image($r('app.media.pull_refresh_news')).id('pull_to_refresh_news_image_14')
          .width($r('app.string.pull_refresh_title_image_width'))
          .height($r('app.string.pull_refresh_title_image_height'))
          .objectFit(ImageFit.Contain)
        // Text：文本
        // 关键属性：字号、字体颜色、宽度、最大行数、外边距、溢出处理
        // Text：文本
        // 关键属性：字号、字体颜色、宽度、最大行数、外边距、溢出处理
        Text(this.newsTitle).id('pull_to_refresh_news_text_15')
          .fontSize($r('app.integer.pull_refresh_title_text_font_size'))
          .fontColor($r('app.color.pull_refresh_title_fontColor'))
          .width($r('app.string.pull_refresh_title_text_width'))
          .maxLines(NEWS_TITLE_MAX_LINES)
          .margin({ left: $r('app.string.pull_refresh_title_text_margin_left') })
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .fontWeight(NEWS_TITLE_TEXT_FONT_WEIGHT)
      }.id('pull_to_refresh_news_row_13')
      .alignItems(VerticalAlign.Center)
      .height($r('app.string.pull_refresh_title_row_height'))
      .margin({
        top: $r('app.string.pull_refresh_title_row_margin_top'),
        left: $r('app.string.pull_refresh_title_image_margin_left')
      })

      // Text：文本
      // 关键属性：字号、行高、字体颜色、高度、宽度、最大行数
      // Text：文本
      // 关键属性：字号、行高、字体颜色、高度、宽度、最大行数
      Text(this.newsContent).id('pull_to_refresh_news_text_16')
        .fontSize($r('app.integer.pull_refresh_content_font_size'))
        .lineHeight($r('app.integer.pull_refresh_content_font_line_height'))
        .fontColor($r('app.color.pull_refresh_content_fontColor'))
        .height($r('app.string.pull_refresh_content_height'))
        .width($r('app.string.pull_refresh_content_width'))
        .maxLines(NEWS_CONTENT_MAX_LINES)
        .margin({
          left: $r('app.string.pull_refresh_content_margin_left'),
          top: $r('app.string.pull_refresh_content_margin_top')
        })
        .textOverflow({ overflow: TextOverflow.Ellipsis })
      // Text：文本
      // 关键属性：字号、字体颜色、高度、宽度、最大行数、外边距
      // Text：文本
      // 关键属性：字号、字体颜色、高度、宽度、最大行数、外边距
      Text(this.newsTime).id('pull_to_refresh_news_text_17')
        .fontSize($r('app.integer.pull_refresh_time_font_size'))
        .fontColor($r('app.color.pull_refresh_time_fontColor'))
        .height($r('app.string.pull_refresh_time_height'))
        .width($r('app.string.pull_refresh_time_width'))
        .maxLines(NEWS_TIME_MAX_LINES)
        .margin({
          left: $r('app.string.pull_refresh_time_margin_left'),
          top: $r('app.string.pull_refresh_time_margin_top')
        })
        .textOverflow({ overflow: TextOverflow.None })
    }
    .alignItems(HorizontalAlign.Start)
    .id('pullNewsItem')
  }
}

// 新闻数据对象
/**
 * NewsData：类定义，承载本文件对应的逻辑与数据。
 */
class NewsData {
  newsId: string
  newsTitle: string | Resource
  newsContent: string | Resource
  newsTime: string | Resource

  /**
   * toString：function toString() { [native code] }
   */
  toString(): string {
    return this.newsId + ' ' + this.newsTitle + ' ' + this.newsContent + ' ' + this.newsTime;
  }

  /** 构造 PullToRefreshNews 实例。 */
  constructor(id: string, title: string | Resource, content: string | Resource, time: string | Resource) {
    this.newsId = id;
    this.newsTitle = title;
    this.newsContent = content;
    this.newsTime = time;
  }
}

// 懒加载列表对象
/**
 * NewsDataSource：类定义，承载本文件对应的逻辑与数据。
 */
class NewsDataSource extends BasicDataSource {
  dataArray: Array<NewsData> = [];

  /**
   * totalCount：执行 totalCount 相关逻辑。
   */
  public totalCount(): number {
    return this.dataArray.length;
  }

  /**
   * getData：执行 getData 相关逻辑。
   */
  public getData(index: number): Object {
    return this.dataArray[index];
  }

  /**
   * addData：执行 addData 相关逻辑。
   */
  public addData(index: number, data: NewsData): void {
    this.dataArray.splice(index, 0, data);
    this.notifyDataAdd(index);
  }

  /**
   * pushData：执行 pushData 相关逻辑。
   */
  public pushData(data: NewsData): void {
    this.dataArray.push(data);
    this.notifyDataAdd(this.dataArray.length - 1);
  }

  /**
   * clear：执行 clear 相关逻辑。
   */
  public clear(): void {
    this.dataArray = [];
  }
}

/**
 * JsonObjType：类定义，承载本文件对应的逻辑与数据。
 */
class JsonObjType {
  newsList: Array<NewsData> = [];
}

/**
 * JsonObject：类定义，承载本文件对应的逻辑与数据。
 */
class JsonObject {
  private jsonFileDir: string = '';

  /** 构造 PullToRefreshNews 实例。 */
  constructor(jsonFileDir: string) {
    this.jsonFileDir = jsonFileDir;
  }

  // 获取数据
  /**
   * getNewsData：执行 getNewsData 相关逻辑。
   */
  getNewsData(): Array<NewsData> {
    // 从本地文件中获取数据
    const value = getContext().resourceManager.getRawFileContentSync(this.jsonFileDir);
    // 解码为utf-8格式
    const textDecoder = util.TextDecoder.create('utf-8', {
      ignoreBOM: true
    });
    const textDecoderResult = textDecoder.decodeWithStream(new Uint8Array(value.buffer));
    const jsonObj: JsonObjType = JSON.parse(textDecoderResult) as JsonObjType;
    const newsModelBuckets: NewsData[] = [];
    // 映射json数据为NewsModel对象
    const newsModelObj = jsonObj.newsList;
    for (let i = 0; i < newsModelObj.length; i++) {
      const contactTemp = new NewsData(newsModelObj[i].newsId, newsModelObj[i].newsTitle,
        newsModelObj[i].newsContent, newsModelObj[i].newsTime);
      newsModelBuckets.push(contactTemp);
    }
    return newsModelBuckets;
  }
}

/**
 * getNews：函数定义，承载本文件对应的逻辑与数据。
 */
function getNews(mockFileDir: string): Array<NewsData> {
  const jsonObj: JsonObject = new JsonObject(mockFileDir);
  const newsModelMockData: NewsData[] = jsonObj.getNewsData();
  return newsModelMockData;
}
