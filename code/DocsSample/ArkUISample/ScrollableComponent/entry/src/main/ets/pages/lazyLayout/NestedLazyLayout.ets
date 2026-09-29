/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { LengthMetrics, LazyVWaterFlowLayout, LazyVWaterFlowLayoutAttribute } from '@kit.ArkUI';

class BasicDataSource implements IDataSource {
  private listeners: DataChangeListener[] = [];
  protected dataArray: number[] = [];

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): number {
    return this.dataArray[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      this.listeners.splice(pos, 1);
    }
  }

  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }
}

class MyDataSource extends BasicDataSource {
  public pushData(data: number): void {
    this.dataArray.push(data);
    this.notifyDataAdd(this.dataArray.length - 1);
  }
}

@Entry
@Component
export struct NestedLazyLayout {
  private gridData: MyDataSource = new MyDataSource();
  private flowData: MyDataSource = new MyDataSource();

  aboutToAppear(): void {
    for (let i = 0; i < 9; i++) {
      this.gridData.pushData(i);
    }
    for (let i = 0; i < 100; i++) {
      this.flowData.pushData(i);
    }
  }

  build() {
    NavDestination() {
      Column() {
        Tabs() {
          TabContent() {
            // [Start OGNestedLazyLayout]
            List() {
              // 横幅区域
              ListItem() {
                // [StartExclude ListItemChild]
                Image($r('app.media.startIcon'))
                  .width('100%')
                  .height(200)
                  .backgroundColor(0xFAEEE0)
                  .objectFit(ImageFit.Contain)
                // [EndExclude ListItemChild]
              }

              // 网格分类区域：Grid嵌套在ListItem中，需要设置固定高度并配置nestedScroll
              ListItem() {
                Grid() {
                  LazyForEach(this.gridData, (item: number) => {
                    GridItem() {
                      // [StartExclude GridItemChild]
                      Column() {
                        Image($r('app.media.startIcon'))
                          .width(40)
                          .height(40)
                        Text('分类' + item)
                          .fontSize(12)
                          .margin({ top: 4 })
                      }
                      .width('100%')
                      .height(80)
                      .backgroundColor(0xFAEEE0)
                      .justifyContent(FlexAlign.Center)
                      // [EndExclude GridItemChild]
                    }
                  }, (item: number) => item.toString())
                }
                .columnsTemplate('1fr 1fr 1fr')
                // [StartExclude GridProperty]
                .rowsGap(10)
                .columnsGap(10)
                // [EndExclude GridProperty]
                .height(280) // 必须设置固定高度
                .nestedScroll({
                  scrollForward: NestedScrollMode.PARENT_FIRST,
                  scrollBackward: NestedScrollMode.SELF_FIRST
                })
              }

              // 瀑布流商品区域：WaterFlow嵌套在ListItem中，同样需要固定高度和nestedScroll
              ListItem() {
                WaterFlow() {
                  LazyForEach(this.flowData, (item: number) => {
                    FlowItem() {
                      // [StartExclude FlowItemChild]
                      Column() {
                        Image($r('app.media.startIcon'))
                          .width('100%')
                          .objectFit(ImageFit.Contain)
                          .layoutWeight(1)
                        Text('商品' + item)
                          .fontSize(12)
                          .margin({ top: 4 })
                      }
                      .width('100%')
                      .height(100 + item % 5 * 40)
                      .backgroundColor(0xFAEEE0)
                      .borderRadius(8)
                      .padding(8)
                      // [EndExclude FlowItemChild]
                    }
                  }, (item: number) => item.toString())
                }
                .columnsTemplate('1fr 1fr')
                // [StartExclude WaterFlowProperty]
                .columnsGap(10)
                .rowsGap(10)
                // [EndExclude WaterFlowProperty]
                .height(500) // 必须设置固定高度
                .nestedScroll({
                  scrollForward: NestedScrollMode.PARENT_FIRST,
                  scrollBackward: NestedScrollMode.SELF_FIRST
                })
              }
            }
            .width('100%')
            .height('100%')
            // [End OGNestedLazyLayout]
          }.tabBar('传统嵌套懒加载实现')

          TabContent() {
            // [Start NGNestedLazyLayout]
            List({ space: 10 }) {
              // 横幅区域
              ListItem() {
                // [StartExclude NGListItemChild]
                Image($r('app.media.startIcon'))
                  .width('100%')
                  .height(200)
                  .backgroundColor(0xFAEEE0)
                  .objectFit(ImageFit.Contain)
                // [EndExclude NGListItemChild]
              }

              // 网格分类区域：LazyVGridLayout直接作为List的子组件，无需固定高度，无需nestedScroll
              LazyVGridLayout() {
                LazyForEach(this.gridData, (item: number) => {
                  // [StartExclude LazyVGridLayoutChild]
                  Column() {
                    Image($r('app.media.startIcon'))
                      .width(40)
                      .height(40)
                    Text('分类' + item)
                      .fontSize(12)
                      .margin({ top: 4 })
                  }
                  .width('100%')
                  .height(80)
                  .backgroundColor(0xFAEEE0)
                  .justifyContent(FlexAlign.Center)
                  // [EndExclude LazyVGridLayoutChild]
                }, (item: number) => item.toString())
              }
              .columnsTemplate('1fr 1fr 1fr')
              // [StartExclude LazyVGridLayoutProperty]
              .rowsGap(LengthMetrics.vp(10))
              .columnsGap(LengthMetrics.vp(10))
              // [EndExclude LazyVGridLayoutProperty]

              // 瀑布流商品区域：LazyVWaterFlowLayout直接作为List的子组件，无需固定高度，无需nestedScroll
              LazyVWaterFlowLayout() {
                LazyForEach(this.flowData, (item: number) => {
                  // [StartExclude LazyVWaterFlowLayoutChild]
                  Column() {
                    Image($r('app.media.startIcon'))
                      .width('100%')
                      .objectFit(ImageFit.Contain)
                      .layoutWeight(1)
                    Text('商品' + item)
                      .fontSize(12)
                      .margin({ top: 4 })
                  }
                  .width('100%')
                  .height(100 + item % 5 * 40)
                  .backgroundColor(0xFAEEE0)
                  .borderRadius(8)
                  .padding(8)
                  // [EndExclude LazyVWaterFlowLayoutChild]
                }, (item: number) => item.toString())
              }
              .columnsTemplate('1fr 1fr')
              // [StartExclude LazyVWaterFlowLayoutProperty]
              .rowsGap(LengthMetrics.vp(10))
              .columnsGap(LengthMetrics.vp(10))
              .onVisibleIndexesChange((start: number, end: number) => {
                // 即将触底时提前加载更多数据
                if (end + 20 >= this.flowData.totalCount()) {
                  let currentCount = this.flowData.totalCount();
                  for (let i = currentCount; i < currentCount + 100; i++) {
                    this.flowData.pushData(i);
                  }
                }
              })
              // [EndExclude LazyVWaterFlowLayoutProperty]
            }
            .listDirection(Axis.Vertical)
            .width('100%')
            .height('100%')
            // [End NGNestedLazyLayout]
          }.tabBar('全新嵌套懒加载实现')
        }
      }.height('100%')

    }
    .backgroundColor('#f1f2f3')
    // 请将$r('app.string.lazyLayout_nested_layout_title')替换为实际资源文件
    // 在本示例中该资源文件的value值为"嵌套懒加载对比"
    .title($r('app.string.lazyLayout_nested_layout_title'))
  }
}
