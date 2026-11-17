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
  CallbackParam,
  TreeController,
  TreeListenerManager,
  TreeListenType,
  TreeView
} from '@ohos.arkui.advanced.TreeView';
import Logger from '../util/Logger';
import { BreakpointUtils } from '../utils/BreakpointUtils';
import { TreeNodeSpec, TreeSpecUtils } from '../utils/TreeSpecUtils';
import { TreeSortUtils } from '../utils/TreeSortUtils';

/** TreeView sample page. */
@Entry
@Component
struct TreeViewDemo {
  @State widthVp: number = 0;
  @State status: string = 'ready';
  @State operationCount: number = 0;
  @State lastNode: string = 'none';
  @State history: string[] = [];
  private controller: TreeController = new TreeController();
  private listener = TreeListenerManager.getInstance().getTreeListener();

  // Initialize page state and write the entry log.
  aboutToAppear(): void {
    Logger.enter('TreeViewDemo');
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
    this.listener.on(TreeListenType.NODE_CLICK, (param: CallbackParam) => {
      const label = this.nodeLabel(param.currentNodeId);
      this.status = TreeSortUtils.treeStatus(param.currentNodeId, label);
      this.record(`node ${param.currentNodeId} ${label}`);
      Logger.event('TreeViewDemo', 'nodeClick', this.status);
    });
    Logger.event('TreeViewDemo', 'treeReady', `nodes=${specs.length}`);
  }

  // Release page resources and write the exit log.
  aboutToDisappear(): void {
    this.listener.off(TreeListenType.NODE_CLICK);
    Logger.leave('TreeViewDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageShow(): void {
    Logger.show('TreeViewDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageHide(): void {
    Logger.hide('TreeViewDemo');
  }

  private record(action: string): void {
    this.operationCount++;
    this.lastNode = action;
    this.history = [`#${this.operationCount} ${action}`, ...this.history].slice(0, 3);
    Logger.event('TreeViewDemo', 'history', action);
  }

  @Builder
  statCard(label: string, kind: string, id: string) {
    Column({ space: 2 }) {
      Text(label)
        .fontSize(11)
        .fontColor('#666666')
      Text(kind === 'selected' ? this.lastNode : kind === 'events' ? `${this.operationCount}` : '6')
        .id(id)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor('#0A59F7')
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
    }
    .layoutWeight(1)
    .height(54)
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#F1F3F5')
    .borderRadius(10)
    .padding({ left: 6, right: 6 })
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
          .id('treeBack')
          .onClick(() => {
            Logger.event('TreeViewDemo', 'back');
            router.back();
          })
        Text($r('app.string.tree_title'))
          .id('treePageTitle')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .padding({ left: 12, right: 12, top: 12, bottom: 6 })

      Row({ space: 8 }) {
        this.statCard('Selected', 'selected', 'treeSelectedCard')
        this.statCard('Events', 'events', 'treeEventCount')
        this.statCard('Nodes', 'nodes', 'treeNodeCount')
      }
      .width('100%')
      .padding({ left: 12, right: 12, bottom: 8 })

      Text($r('app.string.tree_hint'))
        .fontSize(12)
        .fontColor('#666666')
        .width('100%')
        .padding({ left: 12, right: 12 })

      Column() {
        TreeView({ treeController: this.controller })
      }
      .id('treeView')
      .width('100%')
      .layoutWeight(1)
      .padding({ left: 12, right: 12 })

      Button($r('app.string.tree_reset'))
        .id('treeReset')
        .onClick(() => {
          this.status = 'ready';
          this.record('reset');
          Logger.event('TreeViewDemo', 'reset');
        })

      Text(this.status)
        .id('treeStatus')
        .fontSize(13)
        .fontColor('#666666')

      Column({ space: 2 }) {
        Row() {
          Text('Recent events')
            .fontSize(11)
            .fontColor('#666666')
          Blank()
          Button('Clear')
            .id('treeClearHistory')
            .fontSize(10)
            .height(22)
            .onClick(() => {
              this.history = [];
              this.operationCount = 0;
              this.lastNode = 'none';
            })
        }
        .width('100%')
        if (this.history.length === 0) {
          Text('No events yet')
            .fontSize(11)
            .fontColor('#999999')
            .width('100%')
        } else {
          ForEach(this.history, (item: string) => {
            Text(item)
              .fontSize(11)
              .fontColor('#666666')
              .maxLines(1)
              .width('100%')
          }, (item: string) => item)
        }
      }
      .id('treeHistory')
      .width('100%')
      .height(88)
      .padding({ left: 12, right: 12, bottom: 12 })
      .backgroundColor('#F7F8FA')
      .borderRadius(10)
      .margin({ left: 12, right: 12, bottom: 12 })
    }
    .width('100%')
    .height('100%')
  }
}
