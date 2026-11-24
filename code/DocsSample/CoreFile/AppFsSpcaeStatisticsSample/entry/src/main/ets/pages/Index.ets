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

// [Start import_interface_storage]
import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { formatStorageSize, queryStorage, StorageOperation } from '../model/StorageQuery';
// [End import_interface_storage]

@Entry
@Component
struct Index {
  @State text: string = '';
  @State documentResult: string = '';
  @State result: string = '';

  build() {
    Column({ space: $r('app.float.size_10') }) {
      Row({ space: $r('app.float.size_10') }) {
        // getFreeSize按钮
        Button($r('app.string.getFreeSizeButton'))
          .width('50%') // 按钮宽度占屏幕宽度50%
          .height('10%') // 按钮高度占屏幕高度10%
          .fontSize($r('app.float.size_25')) // 按钮字体大小为25
          .borderRadius($r('app.float.size_25')) // 按钮圆角半径为25
          .backgroundColor($r('app.color.whiteColor')) // 按钮背景颜色为白色
          .shadow({
            radius: $r('app.float.size_10'), // 阴影半径为10
            color: $r('app.color.grayColor'), // 阴影颜色为灰色
            offsetX: $r('app.float.size_15'), // 阴影水平偏移量为15
            offsetY: $r('app.float.size_15') // 阴影垂直偏移量为15
          })
          .fontColor($r('app.color.blackColor')) // 按钮字体颜色为黑色
          .onClick(() => {
            this.getFreeSize();
          })
      }
      // getCurrentBundleStats按钮
      Button($r('app.string.getCurrentBundleStatsButton'))
        .width('80%') // 按钮宽度占屏幕宽度30%
        .height('10%') // 按钮高度占屏幕高度10%
        .fontSize($r('app.float.size_25')) // 按钮字体大小为25
        .borderRadius($r('app.float.size_25')) // 按钮圆角半径为25
        .backgroundColor($r('app.color.whiteColor')) // 按钮背景颜色为白色
        .shadow({
          radius: $r('app.float.size_10'), // 阴影半径为10
          color: $r('app.color.grayColor'), // 阴影颜色为灰色
          offsetX: $r('app.float.size_15'), // 阴影水平偏移量为15
          offsetY: $r('app.float.size_15') // 阴影垂直偏移量为15
        })
        .fontColor($r('app.color.blackColor')) // 按钮字体颜色为黑色
        .onClick(() => {
          this.getCurrentBundleStats();
        })
      // getTotalSize按钮
      Button($r('app.string.getTotalSizeButton'))
        .width('80%') // 按钮宽度占屏幕宽度80%
        .height('10%') // 按钮高度占屏幕高度10%
        .fontSize($r('app.float.size_25')) // 按钮字体大小为25
        .borderRadius($r('app.float.size_25')) // 按钮圆角半径为25
        .backgroundColor($r('app.color.whiteColor')) // 按钮背景颜色为白色
        .shadow({
          radius: $r('app.float.size_10'), // 阴影半径为10
          color: $r('app.color.grayColor'), // 阴影颜色为灰色
          offsetX: $r('app.float.size_15'), // 阴影水平偏移量为15
          offsetY: $r('app.float.size_15') // 阴影垂直偏移量为15
        })
        .fontColor($r('app.color.blackColor')) // 按钮字体颜色为黑色
        .onClick(() => {
          this.getTotalSize();
        })
      // getTotalSizeSync按钮
      Button($r('app.string.getTotalSizeSyncButton'))
        .width('80%') // 按钮宽度占屏幕宽度80%
        .height('10%') // 按钮高度占屏幕高度10%
        .fontSize($r('app.float.size_25')) // 按钮字体大小为25
        .borderRadius($r('app.float.size_25')) // 按钮圆角半径为25
        .backgroundColor($r('app.color.whiteColor')) // 按钮背景颜色为白色
        .shadow({
          radius: $r('app.float.size_10'), // 阴影半径为10
          color: $r('app.color.grayColor'), // 阴影颜色为灰色
          offsetX: $r('app.float.size_15'), // 阴影水平偏移量为15
          offsetY: $r('app.float.size_15') // 阴影垂直偏移量为15
        })
        .fontColor($r('app.color.blackColor')) // 按钮字体颜色为黑色
        .onClick(() => {
          this.getTotalSizeSync();
        })
      // getTotalSizeSync按钮
      Button($r('app.string.storageGetFreeSizeButton'))
        .width('80%') // 按钮宽度占屏幕宽度80%
        .height('10%') // 按钮高度占屏幕高度10%
        .fontSize($r('app.float.size_25')) // 按钮字体大小为25
        .borderRadius($r('app.float.size_25')) // 按钮圆角半径为25
        .backgroundColor($r('app.color.whiteColor')) // 按钮背景颜色为白色
        .shadow({
          radius: $r('app.float.size_10'), // 阴影半径为10
          color: $r('app.color.grayColor'), // 阴影颜色为灰色
          offsetX: $r('app.float.size_15'), // 阴影水平偏移量为15
          offsetY: $r('app.float.size_15') // 阴影垂直偏移量为15
        })
        .fontColor($r('app.color.blackColor')) // 按钮字体颜色为黑色
        .onClick(() => {
          this.storageGetFreeSize();
        })
      // getTotalSizeSync按钮
      Button($r('app.string.getFreeSizeSyncButton'))
        .width('80%') // 按钮宽度占屏幕宽度80%
        .height('10%') // 按钮高度占屏幕高度10%
        .fontSize($r('app.float.size_25')) // 按钮字体大小为25
        .borderRadius($r('app.float.size_25')) // 按钮圆角半径为25
        .backgroundColor($r('app.color.whiteColor')) // 按钮背景颜色为白色
        .shadow({
          radius: $r('app.float.size_10'), // 阴影半径为10
          color: $r('app.color.grayColor'), // 阴影颜色为灰色
          offsetX: $r('app.float.size_15'), // 阴影水平偏移量为15
          offsetY: $r('app.float.size_15') // 阴影垂直偏移量为15
        })
        .fontColor($r('app.color.blackColor')) // 按钮字体颜色为黑色
        .onClick(() => {
          this.getFreeSizeSync();
        })
      // 显示调用接口后的结果。
      Text(this.result)
        .fontSize($r('app.float.size_25')) // 文本字体大小为50
        .fontWeight(FontWeight.Bold) // 文本字体加粗
        .margin({ top: $r('app.float.size_20') }) // 文本上边距为20
    }
    .width('100%') // 外层列布局宽度占满屏幕
    .height('100%') // 外层列布局高度占满屏幕
    .alignItems(HorizontalAlign.Center) // 水平居中对齐
    .justifyContent(FlexAlign.Center) // 垂直居中对齐
    .backgroundColor($r('app.color.lightGrayColor')) // 背景颜色为浅灰色
  }

  private async updateStorageResult(operation: StorageOperation, successMessage: Resource): Promise<void> {
    const context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;
    this.result = '';
    try {
      const bytes: number = await queryStorage(operation, context.filesDir);
      const message: string = context.resourceManager.getStringSync(successMessage.id);
      hilog.info(0xF811, '[Sample_Storage]', 'Storage query succeeded.');
      this.result = `${message}: ${formatStorageSize(bytes)}`;
    } catch (error) {
      this.result = context.resourceManager.getStringSync($r('app.string.storage_query_failed').id);
      hilog.error(0xF811, '[Sample_Storage]', 'Storage query failed code=%{public}s message=%{private}s',
        String((error as BusinessError).code ?? 'validation'), (error as Error).message);
    }
  }

  getCurrentBundleStats(): void {
    this.updateStorageResult(StorageOperation.BUNDLE, $r('app.string.bundle_stats_success'));
  }

  storageGetFreeSize(): void {
    this.updateStorageResult(StorageOperation.FILESYSTEM_FREE, $r('app.string.filesystem_free_success'));
  }

  getTotalSize(): void {
    this.updateStorageResult(StorageOperation.TOTAL, $r('app.string.total_size_success'));
  }

  getTotalSizeSync(): void {
    this.updateStorageResult(StorageOperation.TOTAL_SYNC, $r('app.string.total_size_sync_success'));
  }

  getFreeSize(): void {
    this.updateStorageResult(StorageOperation.FREE, $r('app.string.free_size_success'));
  }

  getFreeSizeSync(): void {
    this.updateStorageResult(StorageOperation.FREE_SYNC, $r('app.string.free_size_sync_success'));
  }
}