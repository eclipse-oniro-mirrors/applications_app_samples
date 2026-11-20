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

import { router } from '@kit.ArkUI';
import {
  CallbackParamV2,
  TreeControllerV2,
  TreeListenerManagerV2,
  TreeViewV2
} from '@ohos.arkui.advanced.TreeViewV2';
import Logger from '../util/Logger';
import { BreakpointUtils } from '../utils/BreakpointUtils';
import { TreeNodeSpec, TreeSpecUtils } from '../utils/TreeSpecUtils';
import { TreeSortUtils } from '../utils/TreeSortUtils';

/** TreeViewV2 sample page. */
@Entry
@ComponentV2
struct TreeViewV2Demo {
  @Local widthVp: number = 0;
  @Local status: string = 'ready';
  private controller: TreeControllerV2 = new TreeControllerV2();
  private listener = TreeListenerManagerV2.getInstance().getTreeListener();

  // Initialize page state and write the entry log.
  aboutToAppear(): void {
    Logger.enter('TreeViewV2Demo');
    const specs: TreeNodeSpec[] = TreeSpecUtils.create([
      $r('app.string.tree_documents'),
      $r('app.string.tree_reports'),
      $r('app.string.tree_images'),
      $r('app.string.tree_photo'),
      $r('app.string.tree_downloads'),
      $r('app.string.tree_archive')
    ]);
    for (let i = 0; i < specs.length; i++) {
      this.controller.addNode({
        parentNodeId: specs[i].parentId,
        currentNodeId: specs[i].nodeId,
        isFolder: specs[i].isFolder,
        primaryTitle: specs[i].title
      });
    }
    this.controller.buildDone();
    this.listener.onNodeClick((param: CallbackParamV2) => {
      this.status = TreeSortUtils.treeStatus(param.currentNodeId, this.nodeLabel(param.currentNodeId));
      Logger.event('TreeViewV2Demo', 'nodeClick', this.status);
    });
    Logger.event('TreeViewV2Demo', 'treeReady', `nodes=${specs.length}`);
  }

  // Release page resources and write the exit log.
  aboutToDisappear(): void {
    this.listener.offNodeClick();
    Logger.leave('TreeViewV2Demo');
  }

  // Track page visibility for lifecycle logging.
  onPageShow(): void {
    Logger.show('TreeViewV2Demo');
  }

  // Track page visibility for lifecycle logging.
  onPageHide(): void {
    Logger.hide('TreeViewV2Demo');
  }

  private nodeLabel(id: number): string {
    const labels: string[] = ['Documents', 'Reports', 'Images', 'Photo.png', 'Downloads', 'Archive.zip'];
    if (id >= 0 && id < labels.length) {
      return labels[id];
    }
    return 'unknown';
  }

  // Compose the page layout and responsive controls.
  build() {
    Column({ space: 10 }) {
      Row({ space: 12 }) {
        Button($r('app.string.back'))
          .id('treeV2Back')
          .onClick(() => {
            Logger.event('TreeViewV2Demo', 'back');
            router.back();
          })
        Text($r('app.string.tree_v2_title'))
          .id('treeV2PageTitle')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .padding(12)

      Text($r('app.string.tree_hint'))
        .fontSize(12)
        .fontColor('#666666')
        .width('100%')
        .padding({ left: 12, right: 12 })

      Column() {
        TreeViewV2({ treeControllerV2: this.controller })
      }
      .id('treeViewV2')
      .width('100%')
      .layoutWeight(1)
      .padding({ left: 12, right: 12 })

      Button($r('app.string.tree_reset'))
        .id('treeV2Reset')
        .onClick(() => {
          this.status = 'ready';
          Logger.event('TreeViewV2Demo', 'reset');
        })

      Text(this.status)
        .id('treeV2Status')
        .fontSize(13)
        .fontColor('#666666')
        .padding({ bottom: 12 })
    }
    .width('100%')
    .height('100%')
  }
}
