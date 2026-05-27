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

// [Start import_interface_storage]
import { statfs } from '@kit.CoreFileKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
import { storageStatistics } from '@kit.CoreFileKit';
import {
  State,
  Entry,
  Component,
  Column,
  ColumnOptions,
  Row,
  Text,
  Button,
  Blank,
  FontWeight,
  HorizontalAlign,
  FlexAlign,
} from '@kit.ArkUI';
// [End import_interface_storage]


@Entry
@Component
struct Index {
  @State text: string = '';
  @State documentResult: string = '';
  @State result: string = '';

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Row() {
        // getFreeSize按钮
        Button('getFreeSizeButton')
          .width('50%') // 按钮宽度占屏幕宽度50%
          .height('10%') // 按钮高度占屏幕高度10%
          .fontSize(25) // 按钮字体大小为25
          .borderRadius(25) // 按钮圆角半径为25
          .backgroundColor('white') // 按钮背景颜色为白色
          .shadow({
            radius: 10, // 阴影半径为10
            color: 'gray', // 阴影颜色为灰色
            offsetX: 15, // 阴影水平偏移量为15
            offsetY: 15 // 阴影垂直偏移量为15
          })
          .fontColor('black') // 按钮字体颜色为黑色
          .onClick(() => {
            this.getFreeSize();
          })
      }
      // getCurrentBundleStats按钮
      Button('getCurrentBundleStatsButton')
        .width('80%') // 按钮宽度占屏幕宽度30%
        .height('10%') // 按钮高度占屏幕高度10%
        .fontSize(25) // 按钮字体大小为25
        .borderRadius(25) // 按钮圆角半径为25
        .backgroundColor('white') // 按钮背景颜色为白色
        .shadow({
          radius: 10, // 阴影半径为10
          color: 'gray', // 阴影颜色为灰色
          offsetX: 15, // 阴影水平偏移量为15
          offsetY: 15 // 阴影垂直偏移量为15
        })
        .fontColor('black') // 按钮字体颜色为黑色
        .onClick(() => {
          this.getCurrentBundleStats();
        })
      // getTotalSize按钮
      Button('getTotalSizeButton')
        .width('80%') // 按钮宽度占屏幕宽度80%
        .height('10%') // 按钮高度占屏幕高度10%
        .fontSize(25) // 按钮字体大小为25
        .borderRadius(25) // 按钮圆角半径为25
        .backgroundColor('white') // 按钮背景颜色为白色
        .shadow({
          radius: 10, // 阴影半径为10
          color: 'gray', // 阴影颜色为灰色
          offsetX: 15, // 阴影水平偏移量为15
          offsetY: 15 // 阴影垂直偏移量为15
        })
        .fontColor('black') // 按钮字体颜色为黑色
        .onClick(() => {
          this.getTotalSize();
        })
      // getTotalSizeSync按钮
      Button('getTotalSizeSyncButton')
        .width('80%') // 按钮宽度占屏幕宽度80%
        .height('10%') // 按钮高度占屏幕高度10%
        .fontSize(25) // 按钮字体大小为25
        .borderRadius(25) // 按钮圆角半径为25
        .backgroundColor('white') // 按钮背景颜色为白色
        .shadow({
          radius: 10, // 阴影半径为10
          color: 'gray', // 阴影颜色为灰色
          offsetX: 15, // 阴影水平偏移量为15
          offsetY: 15 // 阴影垂直偏移量为15
        })
        .fontColor('black') // 按钮字体颜色为黑色
        .onClick(() => {
          this.getTotalSizeSync();
        })
      // getTotalSizeSync按钮
      Button('storageGetFreeSizeButton')
        .width('80%') // 按钮宽度占屏幕宽度80%
        .height('10%') // 按钮高度占屏幕高度10%
        .fontSize(25) // 按钮字体大小为25
        .borderRadius(25) // 按钮圆角半径为25
        .backgroundColor('white') // 按钮背景颜色为白色
        .shadow({
          radius: 10, // 阴影半径为10
          color: 'gray', // 阴影颜色为灰色
          offsetX: 15, // 阴影水平偏移量为15
          offsetY: 15 // 阴影垂直偏移量为15
        })
        .fontColor('black') // 按钮字体颜色为黑色
        .onClick(() => {
          this.storageGetFreeSize();
        })
      // getTotalSizeSync按钮
      Button('getFreeSizeSyncButton')
        .width('80%') // 按钮宽度占屏幕宽度80%
        .height('10%') // 按钮高度占屏幕高度10%
        .fontSize(25) // 按钮字体大小为25
        .borderRadius(25) // 按钮圆角半径为25
        .backgroundColor('white') // 按钮背景颜色为白色
        .shadow({
          radius: 10, // 阴影半径为10
          color: 'gray', // 阴影颜色为灰色
          offsetX: 15, // 阴影水平偏移量为15
          offsetY: 15 // 阴影垂直偏移量为15
        })
        .fontColor('black') // 按钮字体颜色为黑色
        .onClick(() => {
          this.getFreeSizeSync();
        })
      // 显示调用接口后的结果。
      Text(this.result)
        .fontSize(25) // 文本字体大小为50
        .fontWeight(FontWeight.Bold) // 文本字体加粗
        .margin({ top: 20 }) // 文本上边距为20
    }
    .width('100%') // 外层列布局宽度占满屏幕
    .height('100%') // 外层列布局高度占满屏幕
    .alignItems(HorizontalAlign.Center) // 水平居中对齐
    .justifyContent(FlexAlign.Center) // 垂直居中对齐
    .backgroundColor('lightGray') // 背景颜色为浅灰色
  }

  //获取当前应用的存储空间大小。
  getCurrentBundleStats() {
    try {
      // [Start storageStatistics_getCurrentBundleStats]
      storageStatistics.getCurrentBundleStats().then((BundleStats: storageStatistics.BundleStats) => {
        console.info("getCurrentBundleStats successfully:" + JSON.stringify(BundleStats));
      }).catch((err: Error): void => {
        console.error(`Failed to getCurrentBundleStats, code is: ${err.code}, message is: ${err.message}`);
      });
      // [End storageStatistics_getCurrentBundleStats]
    } catch (err) {
      console.error(`Failed to getCurrentBundleStats, code is: ${err.code}, message is: ${err.message}`);
    }

    this.result = 'getCurrentBundleStats success';
  }

  //获取文件系统数据分区剩余空间大小。
  storageGetFreeSize() {
    try {
      // [Start storageStatistics_statfs_getFreeSize]
      let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
      let path: string = context.filesDir;
      statfs.getFreeSize(path).then((freeSize: long) => {
        console.info(`getFreeSize successfully, freeSize is ${freeSize}`);
      }).catch((err: Error): void => {
        console.error(`Failed to getFreeSize, code is ${err.code}, message is ${err.message}`);
      });
      // [End storageStatistics_statfs_getFreeSize]
    } catch (err) {
      console.error(`Failed to getFreeSize, code is: ${err.code}, message is: ${err.message}`);
    }
    this.result = 'getFreeSize success';
  }
  //异步获取内置存储的总空间大小。
  getTotalSize() {
    try {
      // [Start storageStatistics_getTotalSize]
      storageStatistics.getTotalSize().then((totalSize: long) => {
        console.info(`getTotalSize successfully, totalSize is ${totalSize}`);
      }).catch((err: Error): void => {
        console.error(`Failed to getTotalSize, code is ${err.code}, message is ${err.message}`);
      });
      // [End storageStatistics_getTotalSize]
    } catch (err) {
      console.error(`Failed to getTotalSize, code is: ${err.code}, message is: ${err.message}`);
    }
    this.result = 'getTotalSize success';
  }

  getTotalSizeSync() {
    // [Start storageStatistics_getTotalSizeSync]
    try {
      let totalSize: long = storageStatistics.getTotalSizeSync();
      console.info(`getTotalSizeSync successfully, totalSize is ${totalSize}`);
    } catch (err) {
      console.error(`Failed to getTotalSizeSync, code is ${err.code}, message is ${err.message}`);
    }
    // [End storageStatistics_getTotalSizeSync]
    this.result = 'getTotalSizeSync success';
  }

  getFreeSize() {
    try {
      // [Start storageStatistics_getFreeSize]
      storageStatistics.getFreeSize().then((freeSize: long) => {
        console.info(`getFreeSize successfully, freeSize is ${freeSize}`);
      }).catch((err: Error): void => {
        console.error(`Failed to getFreeSize, code is ${err.code}, message is ${err.message}`);
      });
      // [End storageStatistics_getFreeSize]
    } catch (err) {
      console.error(`Failed to getFreeSize, code is: ${err.code}, message is: ${err.message}`);
    }
    this.result = 'storageGetFreeSize success';
  }

  getFreeSizeSync() {
    // [Start storageStatistics_getFreeSizeSync]
    try {
      let freeSize = storageStatistics.getFreeSizeSync();
      console.info(`getFreeSizeSync successfully, freeSize is ${freeSize}`);
    } catch (err) {
      console.error(`Failed to getFreeSizeSync, code is ${err.code}, message is ${err.message}`);
    }
    // [End storageStatistics_getFreeSizeSync]
    this.result = 'getFreeSizeSync success';
  }
}