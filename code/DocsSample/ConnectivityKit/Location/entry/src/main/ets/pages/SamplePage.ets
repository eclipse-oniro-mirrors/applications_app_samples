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
 * @file entry/src/main/ets/pages/SamplePage.ets
 * 文件职责：SamplePage 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：SamplePage。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

// [Start import_geoLocation]
import geoLocationManager from '@ohos.geoLocationManager';
// [End import_geoLocation]
import {listData, heatCity, ListItem, ProvinceWithSubCities} from '../mock/LocationMock';
import hilog from '@ohos.hilog';

/**
 * SamplePage：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
export struct SamplePage {
  // @State alphabetIndex：组件内部状态
  @State alphabetIndex: number = 0;

  // @State location：组件内部状态
  @State location: boolean = true;

  // @State isCity：组件内部状态
  @State isCity: string = '';

  // @State currentLocation：组件内部状态
  @State currentLocation: string = '';

  // @State latitude：组件内部状态
  @State latitude: number = 0;

  // @State longitude：组件内部状态
  @State longitude: number = 0;

  // @State city：组件内部状态
  @State city: string = '';

  // @State isShow：组件内部状态
  @State isShow: boolean = true;
  private tabValue: string[] = ['A', 'B', 'C', 'F', 'G', 'H', 'J', 'L', 'N', 'Q', 'S', 'T', 'X', 'Y', 'Z'];
  private scroller: Scroller = new Scroller();
  private tag: string = 'LocationSample'; 

  /**
   * requestLocation：执行 requestLocation 相关逻辑。
   */
  async requestLocation() {
// [Start request_location]
    let requestConfig: geoLocationManager.ContinuousLocationRequest = {
      'interval': 1,
      'locationScenario': geoLocationManager.UserActivityScenario.NAVIGATION
    };

    let locationCallback = async (location: geoLocationManager.Location) => {
      hilog.info(0x0000, this.tag, 'Received Location:' + JSON.stringify(location));
// [StartExclude request_location]
// [Start off_location]
      // 该回调函数需要与on接口传入的回调函数保持一致。
      geoLocationManager.off('locationChange', locationCallback);
// [End off_location]
// [EndExclude request_location]
    };
    try {
      let isLocationEnabled = geoLocationManager.isLocationEnabled();
      if (isLocationEnabled) {
        geoLocationManager.on('locationChange', requestConfig, locationCallback);
      }
    } catch (err) {
      hilog.info(0x0000, this.tag, 'error:' + JSON.stringify(err));
    }
// [End request_location]
  }

  /**
   * getCurrentLocation：执行 getCurrentLocation 相关逻辑。
   */
  async getCurrentLocation() {
// [Start get_current_location]
// [Start is_location_enabled]
// [Start get_address_from_location]
    try {
      let isLocationEnabled = geoLocationManager.isLocationEnabled();
// [StartExclude is_location_enabled]
      if (isLocationEnabled) {
        let requestInfo: geoLocationManager.CurrentLocationRequest = {
            priority: 0x203,
            scenario: 0x300,
            maxAccuracy: 100
        };
        let location = await geoLocationManager.getCurrentLocation(requestInfo);
        if (location !== undefined) {
// [StartExclude get_current_location]
          let request: geoLocationManager.ReverseGeoCodeRequest = {
            latitude: location.latitude,
            longitude: location.longitude
          };
          let address = await geoLocationManager.getAddressesFromLocation(request);
          if (address !== undefined && address.length >= 1 && address[0].locality !== undefined) {
            this.city = address[0].locality;
          }
          hilog.info(0x0000, this.tag, 'this city:' + JSON.stringify(this.city));
// [EndExclude get_current_location]
          hilog.info(0x0000, this.tag, 'current location:' + JSON.stringify(location));
        }
      }
// [EndExclude is_location_enabled]
    } catch (err) {
      hilog.info(0x0000, this.tag, 'error:' + JSON.stringify(err));
    }
// [End get_address_from_location]
// [End is_location_enabled]
// [End get_current_location]
  }

  /**
   * getLastLocation：执行 getLastLocation 相关逻辑。
   */
  async getLastLocation() {
// [Start get_last_location]
    try {
      let isLocationEnabled = geoLocationManager.isLocationEnabled();
      if (isLocationEnabled) {
        let location = await geoLocationManager.getLastLocation();
        if (location !== undefined) {
          this.latitude = location.latitude;
          this.longitude = location.longitude;
          hilog.info(0x0000, this.tag, 'last location:' + JSON.stringify(location));
        }
      }
    } catch (err) {
      hilog.info(0x0000, this.tag, 'error:' + JSON.stringify(err));
    }
// [End get_last_location]
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build () {
    // Scroll：滚动容器
    // 关键属性：宽度、内边距、背景色、圆角
    // Scroll：滚动容器
    // 关键属性：宽度、内边距、背景色、圆角
    Scroll() {
      // Column：垂直布局容器
      // 关键属性：宽度
      // Column：垂直布局容器
      // 关键属性：宽度
      Column() {
        // Column：垂直布局容器
        // 关键属性：宽度、高度、外边距
        // Column：垂直布局容器
        // 关键属性：宽度、高度、外边距
        Column() {
          // Text：文本
          // 关键属性：字号、外边距、自身对齐
          // Text：文本
          // 关键属性：字号、外边距、自身对齐
          Text($r('app.string.deliver_to'))
              .fontSize(25)
              .margin({ bottom: 30})
              .alignSelf(ItemAlign.Start)
              .id('deliverToTitle');
          if (this.currentLocation) {
            // Text：文本
            // 关键属性：字号、自身对齐
            // Text：文本
            // 关键属性：字号、自身对齐
            Text('${this.currentLocation}' || $r('app.string.xian'))
              .fontSize(20)
              .alignSelf(ItemAlign.Start)
              .id('currentLoc');
          } else {
            // Text：文本
            // 关键属性：字号、透明度、自身对齐
            // Text：文本
            // 关键属性：字号、透明度、自身对齐
            Text($r('app.string.current_positioning'))
              .fontSize(20)
              .opacity(0.6)
              .alignSelf(ItemAlign.Start)
              .id('currentPositionHint');
          }
        }.id('sample_page_column_3')
        .width('100%')
        .height(100)
        .margin({ top: 20});

        // Row：水平布局容器
        // 关键属性：自身对齐、主轴对齐、宽度、高度、圆角、边框宽度
        // 交互：可点击交互
        // Row：水平布局容器
        // 关键属性：自身对齐、主轴对齐、宽度、高度、圆角、边框宽度
        // 交互：可点击交互
        Row() {
          // Image：图片
          // 关键属性：宽度、高度、aspectRatio、内边距
          // Image：图片
          // 关键属性：宽度、高度、aspectRatio、内边距
          Image($r('app.media.location')).id('sample_page_image_4')
            .width(22)
            .height(22)
            .aspectRatio(1)
            .padding({ left: 4 });
          // Text：文本
          // 关键属性：字号、字体颜色、外边距、内边距
          // Text：文本
          // 关键属性：字号、字体颜色、外边距、内边距
          Text(this.city === '' ? $r('app.string.xian') : this.city).id('sample_page_text_5')
            .fontSize(20)
            .fontColor('#E92F4F')
            .margin({ left: 12 })
            .padding({right: 5, top: 2 });
        }
        .alignSelf(ItemAlign.Start)
        .justifyContent(FlexAlign.Center)
        .width(110)
        .height(40)
        .borderRadius(20)
        .borderWidth(1)
        .borderColor('#E92F4F')
        .id('citySelectButton')
        .onClick(async () => {
          await this.getCurrentLocation();
        });

        // Button：按钮
        // 关键属性：输入类型、宽度、高度、背景色、圆角、边框宽度
        // 交互：可点击交互
        // Button：按钮
        // 关键属性：输入类型、宽度、高度、背景色、圆角、边框宽度
        // 交互：可点击交互
        Button($r('app.string.continuous_location_request'))
          .type(ButtonType.Normal)
          .width(110)
          .height(40)
          .backgroundColor(Color.Transparent)
          .borderRadius(20)
          .borderWidth(1)
          .margin({ top: 12 })
          .borderColor('#E92F4F')
          .fontColor('#E92F4F')
          .fontSize(18)
          .alignSelf(ItemAlign.Start)
          .id('continuousLocationButton')
          .onClick(async () => {
            await this.requestLocation()
          });

        // Column：垂直布局容器
        Column() {
          // Stack：层叠布局容器
          Stack({ alignContent: Alignment.End }) {
            // Column：垂直布局容器
            Column() {
              // Row：水平布局容器
              // 关键属性：自身对齐、外边距
              // Row：水平布局容器
              // 关键属性：自身对齐、外边距
              Row() {
                  // Text：文本
                  // 关键属性：字号、字体颜色、透明度
                  // Text：文本
                  // 关键属性：字号、字体颜色、透明度
                  Text($r('app.string.domestic_hot_city')).id('sample_page_text_10')
                      .fontSize(20)
                      .fontColor('#000000')
                      .opacity(0.6);
              }.id('sample_page_row_9')
              .alignSelf(ItemAlign.Start)
              .margin({ top: 10, bottom: 15 });

              // Grid：网格容器
              // 关键属性：外边距、宽度、高度、columnsTemplate
              // Grid：网格容器
              // 关键属性：外边距、宽度、高度、columnsTemplate
              Grid() {
                ForEach(heatCity, (item: string, index: number) => {
                  // GridItem：网格项
                  GridItem() {
                    // Text：文本
                    // 关键属性：外边距、字号、最大行数、字体颜色、点击事件回调
                    // 交互：可点击交互
                    // Text：文本
                    // 关键属性：外边距、字号、最大行数、字体颜色、点击事件回调
                    // 交互：可点击交互
                    Text(item)
                      .margin({ bottom: 20})
                      .fontSize(20)
                      .maxLines(1)
                      .fontColor('#000000')
                      .id(`heatCityItem_${index}`)
                      .onClick(() => {
                          this.currentLocation = item;
                      });
                  }
                  .id('city${idex + 1}');
                });
              }
              .margin({ right: 60, top: 10 })
              .width('100%')
              .height(130)
              .columnsTemplate('1fr 1fr 1fr 1fr')
              .id('heatCityGrid');

              // List：列表容器
              // 关键属性：高度、宽度、边缘效果、列表方向、onScrollIndex
              // List：列表容器
              // 关键属性：高度、宽度、边缘效果、列表方向、onScrollIndex
              List({ space: 15, initialIndex: 0, scroller: this.scroller }) {
                ForEach(listData, (firstItem: ListItem) => {
                  // ListItem：列表项
                  ListItem() {
                      this.buildListItem(firstItem);
                  }.id('sample_page_list_item_11')
                });
              }
              .height(500)
              .width('100%')
              .edgeEffect(EdgeEffect.None)
              .listDirection(Axis.Vertical)
              .id('provinceList')
              .onScrollIndex((firstIndex: number) => {
                this.alphabetIndex = firstIndex;
              });
            }.id('sample_page_column_8')

            // Column：垂直布局容器
            // 关键属性：绝对定位、外边距
            // Column：垂直布局容器
            // 关键属性：绝对定位、外边距
            Column() {
              // AlphabetIndexer：字母索引条
              // 关键属性：高度、font、popupColor、selectedBackgroundColor、popupBackground、usingPopup
              // AlphabetIndexer：字母索引条
              // 关键属性：高度、font、popupColor、selectedBackgroundColor、popupBackground、usingPopup
              AlphabetIndexer({ arrayValue: this.tabValue, selected: this.alphabetIndex })
                .height('100%')
                .font({ size: 16 })
                .popupColor('#FFFFFF') // 弹出框颜色
                .selectedBackgroundColor(0xCCCCCC) // 选中背景颜色
                .popupBackground(0xCCCCCC) // 弹出框背景颜色
                .usingPopup(true) // 是否显示弹出框
                .selectedFont({ size: 16, style: FontStyle.Normal }) // 选中的样式
                .selectedColor('#969494') // 选中颜色
                .popupFont({ size: 30, weight: FontWeight.Bolder }) // 弹出框的演示
                .alignStyle(this.location ? IndexerAlign.Right : IndexerAlign.Left)
                .id('alphabetIndexer')
                .onSelect((tabIndex: number) => {
                  this.scroller.scrollToIndex(tabIndex);
                });
            }.id('sample_page_column_12')
            .position({ x: '97%' })
            .margin({ top: 4 });
          }.id('sample_page_stack_7')
        }.id('sample_page_column_6')
      }.id('sample_page_column_2')
      .width('100%');
    }.id('sample_page_scroll_1')
    .width('100%')
    .padding({ left: '6.7%', right: '6.7%', top: 20})
    .backgroundColor('#F1F3F5')
    .borderRadius({ topLeft: 40, topRight: 40 });
  }

  /**
   * buildListItem：执行 buildListItem 相关逻辑。
   */
  @Builder
  buildListItem(firstItem:ListItem) {
    // Column：垂直布局容器
    Column() {
      // Text：文本
      // 关键属性：高度、字号、字体颜色、宽度、外边距
      // Text：文本
      // 关键属性：高度、字号、字体颜色、宽度、外边距
      Text(firstItem.name)
        .height(30)
        .fontSize(24)
        .fontColor('#000000')
        .width('100%')
        .margin({ top: 10 })
        .id(`letterHeader_${firstItem.name}`);

      // Divider：分割线
      // 关键属性：strokeWidth、color、透明度、外边距
      // Divider：分割线
      // 关键属性：strokeWidth、color、透明度、外边距
      Divider().id('sample_page_divider_14')
        .strokeWidth(0.8)
        .color('#000000')
        .opacity(0.2)
        .margin({ right: 10, top: 12 });

      ForEach(firstItem.city, (item: string | ProvinceWithSubCities, index:number) => {
        if (typeof item !== 'string') {
          this.buildProvinceItem(item, index);
        } else {
          this.buildCityItem(item, index);
        }
      });
    }.id('sample_page_column_13')
  }

  /**
   * buildProvinceItem：执行 buildProvinceItem 相关逻辑。
   */
  @Builder
  buildProvinceItem(item:ProvinceWithSubCities, index: number) {
    // Text：文本
    // 关键属性：高度、字号、宽度、外边距、点击事件回调
    // 交互：可点击交互
    // Text：文本
    // 关键属性：高度、字号、宽度、外边距、点击事件回调
    // 交互：可点击交互
    Text(item.name)
      .height(30)
      .fontSize(20)
      .width('100%')
      .margin({ top: 16})
      .onClick(() => {
        this.currentLocation = item.name;
        this.isCity = this.isCity === item.name ? '' : item.name;
      })
      .id('cityFirst${index + 1}');

    if (this.isCity === item.name) {
      // List：列表容器
      // 关键属性：高度、宽度
      // List：列表容器
      // 关键属性：高度、宽度
      List() {
        ForEach(item.city, (secondCity: string, subIndex: number) => {
          // ListItem：列表项
          ListItem() {
            // Column：垂直布局容器
            Column() {
              // Text：文本
              // 关键属性：宽度、高度、字号、外边距、点击事件回调
              // 交互：可点击交互
              // Text：文本
              // 关键属性：宽度、高度、字号、外边距、点击事件回调
              // 交互：可点击交互
              Text(secondCity)
              .width('100%')
              .height(30)
              .fontSize(18)
              .margin({ top: 4 })
              .id('regiion${subIndex + 1}')
              .onClick(() => {
                this.currentLocation = '${item.name/${secondCity}}';
              });
            }.id('sample_page_column_17')
          }.id('sample_page_list_item_16')
        })
      }.id('sample_page_list_15')
      .height('9%')
      .width('100%');
    }
  }

  /**
   * buildCityItem：执行 buildCityItem 相关逻辑。
   */
  @Builder
  buildCityItem(item:string, index: number) {
    // Text：文本
    // 关键属性：高度、字号、宽度、外边距、点击事件回调
    // 交互：可点击交互
    // Text：文本
    // 关键属性：高度、字号、宽度、外边距、点击事件回调
    // 交互：可点击交互
    Text(item)
      .height(30)
      .fontSize(20)
      .width('100%')
      .margin({ top: 16 })
      .onClick(() => {
        this.currentLocation = item;
        this.isCity = this.isCity === item ? '' :item;
      })
      .id('cityFirst${index + 1}');
  }
}