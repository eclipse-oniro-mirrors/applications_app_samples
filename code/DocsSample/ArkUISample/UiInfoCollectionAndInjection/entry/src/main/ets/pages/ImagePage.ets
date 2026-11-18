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

import { NodeContent } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';
import nativeUi from 'libentry.so';
import type { ImageCollectionResult, ImageItemResult } from 'libentry.so';
import { failure } from '../common/Collection';

const TAG = '[Sample_UiInfoCollectionAndInjection]';
const DOMAIN = 0xF811;
// Time for the page to apply a state change before the next request reads the node ids again.
const LAYOUT_SETTLE_MS = 100;
// Time to keep the temporary node removed, so that removing and restoring it does not look like a
// rendering glitch.
const GHOST_RESTORE_MS = 600;
// Size of each capture target, and height of the slot that hosts the removable node.
const TARGET_SIZE = 96;
const GHOST_SLOT_HEIGHT = 32;

@Entry
@Component
struct ImagePage {
  @State busy: boolean = false;
  @State active: boolean = false;
  /** The temporary node is conditionally created so that a request can refer to a removed node. */
  @State showGhost: boolean = true;
  @State status: string = '';
  @State items: ImageItemResult[] = [];

  /** Hosts the native anchor node that provides the ArkUI context of this page. */
  private anchorContent: NodeContent = new NodeContent();

  aboutToAppear(): void {
    this.active = true;
    nativeUi.attachImageAnchor(this.anchorContent);
  }

  aboutToDisappear(): void {
    this.active = false;
    nativeUi.detachImageAnchor();
  }

  // The integer node id differs from the string id configured by .id(). Each request reads it again,
  // because the id is only valid while the node exists.
  private nodeId(componentId: string): number {
    const node = this.getUIContext().getFrameNodeById(componentId);
    return node === null ? -1 : node.getUniqueId();
  }

  private async wait(millis: number): Promise<void> {
    await new Promise<void>((resolve) => {
      setTimeout(() => {
        resolve();
      }, millis);
    });
  }

  // [Start ndk_image_page_collect]
  private async capture(nodeIds: number[]): Promise<void> {
    if (this.busy) {
      return;
    }
    this.busy = true;
    this.status = 'pending';
    hilog.info(DOMAIN, TAG, 'collectImages begin, nodes=%{public}d', nodeIds.length);
    try {
      const result: ImageCollectionResult = await nativeUi.collectImages(nodeIds);
      if (!this.active) {
        return;
      }
      this.items = result.items;
      this.status = `submitError=${result.submitError}; overallError=${result.overallError}; ` +
        `items=${result.items.length}`;
      hilog.info(DOMAIN, TAG, 'collectImages done, submitError=%{public}d, overallError=%{public}d, items=%{public}d',
        result.submitError, result.overallError, result.items.length);
    } catch (error) {
      const reason: string = failure(error);
      if (this.active) {
        this.status = reason;
        hilog.error(DOMAIN, TAG, 'collectImages failed, reason=%{public}s', reason);
      }
    } finally {
      if (this.active) {
        this.busy = false;
      }
    }
  }
  // [End ndk_image_page_collect]

  private captureImage(): void {
    this.capture([this.nodeId('captureImage')]);
  }

  private async captureBatch(): Promise<void> {
    const nodeIds: number[] = [this.nodeId('captureImage'), this.nodeId('captureCard'), this.nodeId('captureText')];
    await this.capture(nodeIds);
  }

  // Reads the node id first, removes the node, then requests it together with a live node. The removed
  // id still has exactly one result item, and its itemError reports that the node is gone.
  private async captureStale(): Promise<void> {
    const staleId = this.nodeId('captureGhost');
    if (staleId < 0) {
      return;
    }
    this.showGhost = false;
    await this.wait(LAYOUT_SETTLE_MS);
    await this.capture([this.nodeId('captureImage'), staleId]);
    await this.wait(GHOST_RESTORE_MS);
    this.showGhost = true;
  }

  build() {
    Scroll() {
      Column({ space: 12 }) {
        Text($r('app.string.image_page_title'))
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        Row({ space: 8 }) {
          // The source image is larger than the displayed size, so a successful collection returns
          // the complete source image instead of the displayed 96vp square.
          Image($rawfile('ndk_image_source.png'))
            .id('captureImage')
            .width(TARGET_SIZE)
            .height(TARGET_SIZE)
            .objectFit(ImageFit.Contain)
            .borderRadius(8)
          Text($r('app.string.image_card_label'))
            .id('captureCard')
            .width(TARGET_SIZE)
            .height(TARGET_SIZE)
            .textAlign(TextAlign.Center)
            .fontColor(Color.White)
            .borderRadius(8)
            .backgroundColor($r('app.color.image_capture_card_background'))
          Text($r('app.string.image_text_label'))
            .id('captureText')
            .width(TARGET_SIZE)
            .height(TARGET_SIZE)
            .textAlign(TextAlign.Center)
            .borderRadius(8)
            .backgroundColor($r('app.color.image_capture_text_background'))
        }
        Column({ space: 8 }) {
          Button($r('app.string.capture_image_button'))
            .id('captureImageButton')
            .width('100%')
            .enabled(!this.busy)
            .onClick(() => {
              this.captureImage();
            })
          Button($r('app.string.capture_batch_button'))
            .id('captureBatchButton')
            .width('100%')
            .enabled(!this.busy)
            .onClick(() => {
              this.captureBatch();
            })
          Button($r('app.string.capture_stale_button'))
            .id('captureStaleButton')
            .width('100%')
            .enabled(!this.busy)
            .onClick(() => {
              this.captureStale();
            })
        }
        .width('100%')
        // Removed by the third button and restored after a delay. The slot keeps its size so that
        // creating or destroying the node does not reflow the rest of the page.
        Row() {
          if (this.showGhost) {
            Text($r('app.string.image_ghost_label'))
              .id('captureGhost')
              .width(TARGET_SIZE)
              .height(GHOST_SLOT_HEIGHT)
              .fontSize(12)
              .textAlign(TextAlign.Center)
              .borderRadius(8)
              .backgroundColor($r('app.color.image_capture_result_background'))
          }
        }
        .width('100%')
        .height(GHOST_SLOT_HEIGHT)
        Text(this.status)
          .id('captureStatus')
          .fontSize(13)
        // Hosts the native anchor node. The wrapper keeps it invisible; ContentSlot itself has no
        // size attributes.
        Row() {
          ContentSlot(this.anchorContent)
        }
        .width(1)
        .height(1)
        ForEach(this.items, (item: ImageItemResult, index: number) => {
          Column({ space: 4 }) {
            if (item.pixelMap !== undefined) {
              Image(item.pixelMap)
                .width('100%')
                .height(120)
                .objectFit(ImageFit.Contain)
                .backgroundColor($r('app.color.image_capture_result_background'))
                .borderRadius(8)
            }
            Text(`nodeId=${item.nodeId}; itemError=${item.itemError}; ` +
              `${item.width === undefined ? 0 : item.width}x${item.height === undefined ? 0 : item.height}`)
              .id(`captureItem${index}`)
              .fontSize(12)
              .fontColor(Color.Gray)
          }
          .width('100%')
          .alignItems(HorizontalAlign.Start)
        }, (item: ImageItemResult, index: number) => `${item.nodeId}_${index}`)
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
      .padding(16)
    }
    .width('100%')
    .height('100%')
  }
}
