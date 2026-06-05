'use static'

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

import { image } from '@kit.ImageKit';
import { PopupUtils } from '../common/PopupUtils';
import { NewsItem } from './NewsItem';
import { SnapshotPreview } from './SnapshotPreview';
import { LazyDataSource } from '../common/LazyDataSource';
import { CommonUtils } from '../common/CommonUtils';
import { ImageUtils } from '../common/ImageUtils';
import { Logger } from '../common/Logger';
import { common } from '@kit.AbilityKit';
import {
  $r, Component, State, StorageLink, Builder, AppStorage, UIContext, Stack, List, ListItem, LazyForEach, Row,
  NavDestination, Column, Image, Button, Padding, Scroller, BarState, Position, DismissContentCoverAction,
  DismissReason, ColumnOptions, RowOptions, Area, ModalTransition, ContentCoverOptions
} from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

const LIST_ID = 'LIST_ID';
const TAG = 'ScrollSnapshot';

// [Start scroll_snapshot]
// src/main/ets/view/ScrollSnapshot.ets
@Component
export struct ScrollSnapshot {
  private scroller: Scroller = new Scroller();
  private listComponentWidth: double = 0; // 组件宽度，默认值为0
  private listComponentHeight: double = 0; // 组件高度，默认值为0
  // list组件的当前偏移量
  private curYOffset: double = 0;
  // 每次滚动距离
  private scrollHeight: double = 0;

  // [StartExclude scroll_snapshot]
  // The component is overwritten during the screenshot process
  @State componentMaskImage: image.PixelMap | undefined = undefined;
  // The location of the component before backing up the screenshot
  private yOffsetBefore: double = 0;
  // is click to stop scroll
  private isClickStop: boolean = false;
  @State isEnableScroll: boolean = true;
  @StorageLink('screenWidth') screenWidth: int = 0;
  @StorageLink('screenHeight') screenHeight: int = 0;
  // The component is overwritten during the screenshot process
  @State snapPopupPosition: Position = { x: 0, y: 0 } as Position;
  // Whether to display the preview window
  @State isShowPreview: boolean = false;
  // Displays a long screenshot to preview a larger image
  @State isLargePreview: boolean = false;
  // Long picture after stitching
  @State mergedImage: image.PixelMap | undefined = undefined;

  // One-click screenshot scrolling process caching
  private areaArray: image.PositionArea[] = [];
  // The y-direction offset of the List component on each page during the screenshot scrolling process,
  //in the unit of vp
  private scrollYOffsets: int[] = [];

  private dataSource: LazyDataSource<int> = new LazyDataSource<int>();

  aboutToAppear(): void {
    // init List data
    for (let i = 0; i < 20; i++) {
      this.dataSource.pushData(i);
    }
  }

  /**
   * One-click screenshot
   */
  async onceSnapshot(): Promise<void> {
    await this.beforeSnapshot();
    await this.snapAndMerge();
    await this.afterSnapshot();
    await this.afterGeneratorImage();
  }

  /**
   * Scroll through the screenshots
   */
  async scrollSnapshot(): Promise<void> {
    // The settings list cannot be manually scrolled during the screenshot process
    // to avoid interference with the screenshot
    this.isEnableScroll = false;
    // Saves the current location of the component for recovery
    this.yOffsetBefore = this.curYOffset;
    // Set the prompt pop-up to be centered
    this.snapPopupPosition = PopupUtils.calcPopupCenter(this.screenWidth, this.screenHeight, 100, 200);
    await this.scrollSnapAndMerge();
    // Open the prompt pop-up window
    this.isShowPreview = true;
    // Initial variable after stitching
    await this.afterGeneratorImage();
    this.isEnableScroll = true;
    this.isClickStop = false;
  }

  // [Start snapand_merge]
  /**
   * One click screenshot loop traversal screenshot and merge
   */
  async snapAndMerge(): Promise<void> {
    try {
      this.scrollYOffsets.push(Math.round(this.curYOffset) as int);
      // Call the component screenshot interface to obtain the current screenshot
      let snapshot = this.getUIContext().getComponentSnapshot();
      let pixelMapPromise = snapshot.get(LIST_ID);
      if (pixelMapPromise === null) {
        Logger.error(TAG, 'getSnapshot failed');
        return;
      }
      let pixelMap: image.PixelMap = await pixelMapPromise;
      if (!pixelMap) {
        Logger.error(TAG, 'getSnapshot failed');
        return;
      }
      // Gets the number of bytes per line of image pixels.
      let area: image.PositionArea =
        await ImageUtils.getSnapshotArea(pixelMap, this.scrollYOffsets, Math.round(this.listComponentWidth) as int,
          Math.round(this.listComponentHeight) as int);
      this.areaArray.push(area);
      // Determine whether the bottom has been reached during the loop process
      if (!this.scroller.isAtEnd()) {
        CommonUtils.scrollAnimation(this.scroller, 200, Math.round(this.scrollHeight) as int);
        await CommonUtils.sleep(200);
        await this.snapAndMerge();
      } else {
        this.mergedImage =
          await ImageUtils.mergeImage(this.areaArray, this.scrollYOffsets[this.scrollYOffsets.length - 1],
            Math.round(this.listComponentWidth) as int, Math.round(this.listComponentHeight) as int);
      }
    } catch (err) {
      let error = err as BusinessError;
      Logger.error(TAG, `snapAndMerge err, errCode: ${error.code}, error message: ${error.message}`);
    }
  }
  // [End snapand_merge]

  // [Start scroll_snapand_merge]
  /**
   * 递归滚动截图，直到滚动到底，最后合并所有截图
   */
  async scrollSnapAndMerge(): Promise<void> {
    try {
      // 记录滚动偏移
      this.scrollYOffsets.push(Math.round(this.curYOffset - this.yOffsetBefore) as int);
      // 调用组件截图接口，获取list组件的截图
      let snapshot = this.getUIContext().getComponentSnapshot();
      let pixelMapPromise = snapshot.get(LIST_ID);
      if (pixelMapPromise === null) {
        Logger.error(TAG, 'getSnapshot failed');
        return;
      }
      let pixelMap: image.PixelMap = await pixelMapPromise;
      if (!pixelMap) {
        Logger.error(TAG, 'getSnapshot failed');
        return;
      }
      // 获取位图像素字节，并保存在数组中
      let area: image.PositionArea =
        await ImageUtils.getSnapshotArea(pixelMap, this.scrollYOffsets, Math.round(this.listComponentWidth) as int,
          Math.round(this.listComponentHeight) as int);
      this.areaArray.push(area);

      // 判断是否滚动到底以及用户是否已经强制停止
      if (!this.scroller.isAtEnd() && !this.isClickStop) {
        // 如果没有到底或被停止，则播放一个滚动动效，延迟一段时间后，继续递归截图
        CommonUtils.scrollAnimation(this.scroller, 1000, Math.round(this.scrollHeight) as int);
        await CommonUtils.sleep(1500);
        await this.scrollSnapAndMerge();
      } else {
        // 当滚动到底时，调用`mergeImage`将所有保存的位图数据进行拼接，返回长截图位图对象
        this.mergedImage =
          await ImageUtils.mergeImage(this.areaArray, this.scrollYOffsets[this.scrollYOffsets.length - 1],
            Math.round(this.listComponentWidth) as int, Math.round(this.listComponentHeight) as int);
      }
    } catch (err) {
      let error = err as BusinessError;
      Logger.error(TAG, `scrollSnapAndMerge err, errCode: ${error.code}, error message: ${error.message}`);
    }
  }
  // [End scroll_snapand_merge]

  async beforeSnapshot(): Promise<void> {
    try {
      this.yOffsetBefore = this.curYOffset;
      // Take a screenshot of the loaded List component as a cover image for the List component
      let snapshot = this.getUIContext().getComponentSnapshot();
      let pixelMapPromise = snapshot.get(LIST_ID);
      if (pixelMapPromise === null) {
        Logger.error(TAG, 'getSnapshot failed');
        this.componentMaskImage = undefined;
        return;
      }
      this.componentMaskImage = await pixelMapPromise;
      this.scroller.scrollTo({
        xOffset: 0,
        yOffset: 0,
        animation:
        {
          duration: 200
        }
      });
      this.snapPopupPosition = PopupUtils.calcPopupCenter(this.screenWidth, this.screenHeight, 100, 200);
      this.isShowPreview = true;
      // Delay ensures that the scroll has reached the top
      await CommonUtils.sleep(200);
    } catch (err) {
      let error = err as BusinessError;
      Logger.error(TAG, `beforeSnapshot err, errCode: ${error.code}, error message: ${error.message}`);
    }
  }

  // [Start after_snapshot]
  async afterSnapshot(): Promise<void> {
    this.scroller.scrollTo({
      xOffset: 0,
      yOffset: this.yOffsetBefore,
      animation: {
        duration: 200
      }
    });
    await CommonUtils.sleep(200);
  }
  // [End after_snapshot]

  async afterGeneratorImage(): Promise<void> {
    // Delay for transition animation
    await CommonUtils.sleep(200);
    this.snapPopupPosition = PopupUtils.calcPopupBottomLeft(this.screenHeight, 200);
    this.componentMaskImage = undefined;
    this.scrollYOffsets.length = 0;
    this.areaArray.length = 0;
  }

  @Builder
  previewWindowComponent(): void {
    Column() {
      SnapshotPreview({
        mergedImage: this.mergedImage,
        snapPopupPosition: this.snapPopupPosition,
        isLargePreview: this.isLargePreview,
        isShowPreview: this.isShowPreview
      })
    }
  }

  // [EndExclude scroll_snapshot]
  build() {
    // [StartExclude scroll_snapshot]
    NavDestination() {
      Column() {
    // [EndExclude scroll_snapshot]
        Stack() {
          // [StartExclude scroll_snapshot]
          //  The masking layer of the screenshot process prevents users from noticing the screen swiping quickly
          //  and improves the user experience
          if (this.componentMaskImage) {
            Image(this.componentMaskImage)
              .width('100%')
              .height('100%')
              .zIndex(2)
              .backgroundColor('#FFDCDCDC')
          }
          // [EndExclude scroll_snapshot]
          // 1.1 绑定滚动控制器，并通过`.id`配置组件唯一标识。
          List({ space: 12, scroller: this.scroller }) {
              LazyForEach(this.dataSource, (item: int) => {
              ListItem() {
                NewsItem({ index: item })
              }
            }, (item: int) => item.toString())
          }
          // [StartExclude scroll_snapshot]
          .scrollBar(BarState.Off)
          .cachedCount(3)
          .width('100%')
          .height('100%')
          // $r('sys.color.background_secondary')需要替换为开发者所需的资源文件
          .backgroundColor($r('sys.color.background_secondary'))
          .enableScrollInteraction(this.isEnableScroll)
          // [EndExclude scroll_snapshot]
          .id(LIST_ID)
          // 1.2 通过回调获取滚动偏移量。
          .onDidScroll(() => {
            this.curYOffset = this.scroller.currentOffset()!.yOffset;
          })
          .onAreaChange((oldValue: Area, newValue: Area) => {
            // 1.3 获取组件的宽高。
            this.listComponentWidth = newValue.width as double;
            this.listComponentHeight = newValue.height as double;
            this.scrollHeight = this.listComponentHeight;
          })
          // [StartExclude scroll_snapshot]
          .onClick(() => {
            // Click on the list to stop scrolling
            if (!this.isEnableScroll) {
              this.scroller.scrollBy(0, 0);
              this.isClickStop = true;
            }
          })
        }
        .width('100%')
        .layoutWeight(1)
        .padding({
          left: 16,
          right: 16,
          top: 16
        } as Padding)
        .bindContentCover(this.isShowPreview, this.previewWindowComponent,
          {
            modalTransition: ModalTransition.NONE,
            onWillDismiss: (action: DismissContentCoverAction) => {
              if (action.reason === DismissReason.PRESS_BACK) {
                Logger.info('BindContentCover dismiss reason is back pressed');
              }
            }
          } as ContentCoverOptions)

        Row({ space: 12 } as RowOptions) {
          // 请将$r('app.string.one_click_snapshot')替换为实际资源文件，在本示例中该资源文件的value值为"One-Tap Screenshot"
          Button($r('app.string.one_click_snapshot'))
            .layoutWeight(1)
            .onClick(() => {
              this.onceSnapshot();
            })
          // 请将$r('app.string.scroll_snapshot')替换为实际资源文件，在本示例中该资源文件的value值为"Scrolling Snapshot"
          Button($r('app.string.scroll_snapshot'))
            .layoutWeight(1)
            .onClick(() => {
              // Prevent users from clicking the button during the screenshot process,
              // and the method is repeatedly called, resulting in an exception
              if (this.scrollYOffsets.length === 0) {
                this.scrollSnapshot();
              }
            })
        }
        .width('100%')
        .padding({
          left: 16,
          right: 16,
          bottom: (AppStorage.get<int>('naviIndicatorHeight') ?? 0) + 16,
          top: 12
        } as Padding)
      }
      // [EndExclude scroll_snapshot]
    }
  }
}
// [End scroll_snapshot]
