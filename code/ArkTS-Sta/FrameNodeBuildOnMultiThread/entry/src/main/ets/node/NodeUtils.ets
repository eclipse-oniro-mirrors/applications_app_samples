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

'use static'

import { UIContext, ScrollDirection, BarState, Alignment } from '@kit.ArkUI';
import { NodeContent, FrameNode, typeNode } from '@ohos.arkui.node';
import { CARD_INFOS } from '../data/MockData'
import { ServiceItemInfo, AppItemInfo, CardInfo, AppCardInfo, ServiceCardInfo } from '../models/CardInfo'

class NodeTreeInfo {
  constructor(root: FrameNode) {
    this.root_ = root;
  }

  getRootNode(): FrameNode {
    return this.root_;
  }

  getWorkerSet(): Set<EAWorker> | null {
    return this.workerSet_;
  }

  setWorkerSet(workerSet: Set<EAWorker>) {
    this.workerSet_ = workerSet;
  }

  private root_: FrameNode;
  private workerSet_: Set<EAWorker> | null = null;
}

export namespace NodeUtils {
  const NODE_INFO_MAP: Map<NodeContent, NodeTreeInfo> = new Map<NodeContent, NodeTreeInfo>();

  export function createNodeTreeOnUIThread(nodeContent: NodeContent, context: UIContext): void {
    const nodeTreeInfo = createNodeTree(context, true);
    nodeContent.addFrameNode(nodeTreeInfo.getRootNode());
    NODE_INFO_MAP.set(nodeContent, nodeTreeInfo);
  }

  export function createNodeTreeOnMultiThread(nodeContent: NodeContent, context: UIContext): void {
    const nodeTreeInfo = createNodeTree(context, false);
    nodeContent.addFrameNode(nodeTreeInfo.getRootNode());
    NODE_INFO_MAP.set(nodeContent, nodeTreeInfo);
  }

  function createNodeTree(context: UIContext, isOnUIThread: boolean): NodeTreeInfo {
    const scrollNode = typeNode.createScrollNode(context);
    scrollNode.initialize().scrollBar(BarState.Off);
    const nodeTreeInfo = new NodeTreeInfo(scrollNode);
    const columnNode = typeNode.createColumnNode(context);
    scrollNode.appendChild(columnNode);
    if (!isOnUIThread) {
      const workerSet = new Set<EAWorker>();
      nodeTreeInfo.setWorkerSet(workerSet);
    }

    for (let cardInfo of CARD_INFOS) {
      //UI线程创建子树根节点，保证scroll的子节点顺序
      const columnItem = typeNode.createColumnNode(context);
      columnItem.initialize()
        .margin({
          top: 8,
          right: 0,
          bottom: 8,
          left: 0
        });
      columnNode.appendChild(columnItem);
      if (isOnUIThread) {
        let child: FrameNode | null = null;
        if (cardInfo.type === 'App') {
          child = createAppCard(context, cardInfo.appCardInfo!);
        } else if (cardInfo.type === 'Service') {
          child = createServiceCard(context, cardInfo.serviceCardInfo!);
        }
        columnItem.appendChild(child!);
      } else {
        createCardNodeTreeOnMultiThread(context, cardInfo, columnItem, nodeTreeInfo.getWorkerSet()!);
      }
    }
    return nodeTreeInfo;
  }

  export function disposeNodeTree(nodeContent: NodeContent): void {
    const nodeTreeInfo = NODE_INFO_MAP.get(nodeContent);
    if (nodeTreeInfo) {
      const workerSet = nodeTreeInfo.getWorkerSet();
      if (workerSet) {
        for (const worker of workerSet) {
          worker.quit();
        }
        workerSet.clear();
      }
      NODE_INFO_MAP.delete(nodeContent);
    }
  }

  function createCardNodeTreeOnMultiThread(context: UIContext, cardInfo: CardInfo, parent: FrameNode,
    workerSet: Set<EAWorker>): void {
    const worker = new EAWorker();
    workerSet.add(worker);
    worker.start();
    worker.postTask(() => {
      let child: FrameNode | null = null;
      if (cardInfo.type === 'App') {
        child = createAppCard(context, cardInfo.appCardInfo!, true);
      } else if (cardInfo.type === 'Service') {
        child = createServiceCard(context, cardInfo.serviceCardInfo!, true);
      }
      EAWorker.main().postTask(() => {
        parent.appendChild(child!);
      });
    });
  }

  function createAppCard(context: UIContext, appCardInfo: AppCardInfo, supportMultiThread: boolean = false): FrameNode {
    const columnNode = typeNode.createColumnNode(context, { supportMultiThread: supportMultiThread });
    columnNode.initialize()
      .height('40%')
      .width('95%')
      .backgroundColor('#ffffffff')
      .borderRadius(10)
      .padding(5);

    const titleTextNode = typeNode.createTextNode(context, { supportMultiThread: supportMultiThread });
    titleTextNode.initialize(appCardInfo.name).width('90%').height('10%').fontSize(16);
    columnNode.appendChild(titleTextNode);

    const homeGridNode = typeNode.createGridNode(context, { supportMultiThread: supportMultiThread });
    homeGridNode.initialize()
      .width('100%')
      .height('90%')
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .columnsGap(3.0)
      .rowsGap(0);
    columnNode.appendChild(homeGridNode);

    for (let itemsElement of appCardInfo.items) {
      const appItemNode = typeNode.createGridItemNode(context, { supportMultiThread: supportMultiThread });
      appItemNode.initialize().width('20%').height('24%');
      homeGridNode.appendChild(appItemNode);
      appItemNode.appendChild(createAppItem(context, itemsElement, supportMultiThread));
    }
    return columnNode;
  }

  function createAppItem(context: UIContext, itemInfo: AppItemInfo, supportMultiThread: boolean = false): FrameNode {
    const appItemColumnNode =
      typeNode.createColumnNode(context, { supportMultiThread: supportMultiThread });
    appItemColumnNode.initialize()
      .width('100%')
      .height('100%')
      .padding(5)
      .backgroundColor('#ffffffff');

    const stackNode = typeNode.createStackNode(context, { supportMultiThread: supportMultiThread });
    stackNode.initialize()
      .width('70%')
      .height('80%')
      .backgroundColor('#ffeeeeee')
      .clip(true)
      .borderRadius(10);
    appItemColumnNode.appendChild(stackNode);

    const appIconNode = typeNode.createImageNode(context, { supportMultiThread: supportMultiThread });
    appIconNode.initialize(itemInfo.iconSrc)
      .width('100%')
      .height('100%')
      .autoResize(true)
      .borderRadius(5);
    stackNode.appendChild(appIconNode);

    const colorNode = typeNode.createColumnNode(context, { supportMultiThread: supportMultiThread });
    colorNode.initialize()
      .width('100%')
      .height('100%')
      .backgroundColor(itemInfo.iconColor)
      .borderRadius(10);
    stackNode.appendChild(colorNode);

    const appNameNode = typeNode.createTextNode(context, { supportMultiThread: supportMultiThread });
    appNameNode.initialize(itemInfo.name).width('80%').height('20%').fontSize(10);
    appItemColumnNode.appendChild(appNameNode);

    return appItemColumnNode;
  }

  function createServiceCard(context: UIContext, serviceCardInfo: ServiceCardInfo,
    supportMultiThread: boolean = false): FrameNode {
    const columnNode = typeNode.createColumnNode(context, { supportMultiThread: supportMultiThread });
    columnNode.initialize()
      .width('95%')
      .height('20%')
      .backgroundColor('#ffffffff')
      .borderRadius(10)
      .padding({
        top: 5,
        right: 5,
        bottom: 5,
        left: 5
      });

    const titleTextNode = typeNode.createTextNode(context, { supportMultiThread: supportMultiThread });
    titleTextNode.initialize(serviceCardInfo.name).width('90%').height('10%').fontSize(16);
    columnNode.appendChild(titleTextNode);

    const scrollNode = typeNode.createScrollNode(context, { supportMultiThread: supportMultiThread });
    scrollNode.initialize()
      .width('100%')
      .height('90%')
      .scrollable(ScrollDirection.Horizontal)
      .scrollBar(BarState.Off);
    columnNode.appendChild(scrollNode);

    const rowNode = typeNode.createRowNode(context, { supportMultiThread: supportMultiThread });
    scrollNode.appendChild(rowNode);
    for (let serviceItem of serviceCardInfo.items) {
      rowNode.appendChild(createServiceItem(context, serviceItem, supportMultiThread));
    }
    return columnNode;
  }

  function createServiceItem(context: UIContext, itemInfo: ServiceItemInfo,
    supportMultiThread: boolean = false): FrameNode {
    const stackNode = typeNode.createStackNode(context, { supportMultiThread: supportMultiThread });
    stackNode.initialize()
      .width('30%')
      .height('80%')
      .backgroundColor('#ffeeeeee')
      .clip(true)
      .margin({
        top: 0,
        right: 8,
        bottom: 8,
        left: 0
      })
      .borderRadius(10);

    const imageNode = typeNode.createImageNode(context, { supportMultiThread: supportMultiThread });
    imageNode.initialize(itemInfo.backgroundImageSrc)
      .width('100%')
      .height('100%')
      .backgroundColor('#ffff0000')
      .borderRadius(10);
    stackNode.appendChild(imageNode);

    const colorNode = typeNode.createColumnNode(context, { supportMultiThread: supportMultiThread });
    colorNode.initialize()
      .width('100%')
      .height('100%')
      .backgroundColor(itemInfo.iconColor)
      .borderRadius(10);
    stackNode.appendChild(colorNode);

    const columnNode = typeNode.createColumnNode(context, { supportMultiThread: supportMultiThread });
    columnNode.initialize()
      .width('100%')
      .height('40%')
      .backgroundColor('#ffeeeeee')
      .position({ top: '60%' })
      .borderRadius({ bottomLeft: 10, bottomRight: 10 });
    stackNode.appendChild(columnNode);

    const textNode = typeNode.createTextNode(context, { supportMultiThread: supportMultiThread });
    textNode.initialize(itemInfo.describeInfo).width(100).height(20).fontSize(11);
    columnNode.appendChild(textNode);

    const rowNode = typeNode.createRowNode(context, { supportMultiThread: supportMultiThread });
    rowNode.initialize().width(60).height(20).position({ x: 20, y: 20 });
    columnNode.appendChild(rowNode);

    const stackNode2 = typeNode.createStackNode(context, { supportMultiThread: supportMultiThread });
    stackNode2.initialize()
      .width('30%')
      .height('80%')
      .backgroundColor('#ffeeeeee')
      .clip(true)
      .borderRadius(5);
    rowNode.appendChild(stackNode2);

    const image2Node = typeNode.createImageNode(context, { supportMultiThread: supportMultiThread });
    image2Node.initialize(itemInfo.iconSrc).width('100%').height('100%').borderRadius(5);
    stackNode2.appendChild(image2Node);

    const colorNode2 = typeNode.createColumnNode(context, { supportMultiThread: supportMultiThread });
    colorNode2.initialize()
      .width('100%')
      .height('100%')
      .backgroundColor(itemInfo.iconColor)
      .borderRadius(5);
    stackNode2.appendChild(colorNode2);

    const text2Node = typeNode.createTextNode(context, { supportMultiThread: supportMultiThread });
    text2Node.initialize(itemInfo.name).width(70).height(20).fontSize(10);
    rowNode.appendChild(text2Node);

    return stackNode;
  }
}
