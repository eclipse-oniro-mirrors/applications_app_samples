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
// [Start entry1_preload_render_custom_node_controller_static]
// 创建NodeController
import {
  UIContext,
  NodeController,
  BuilderNode,
  Size,
  FrameNode,
  ResourceStr,
  Column,
  Web,
  Builder,
  wrapBuilder,
  WrappedBuilder
} from '@kit.ArkUI';
import { webview } from '@kit.ArkWeb';

// @Builder中为动态组件的具体组件内容
// Data为入参封装类
export class Data {
  public url: ResourceStr = 'www.example.com';
  public controller: webview.WebviewController = new webview.WebviewController(undefined);
}

@Builder
function webBuilder(data: Data): void {
  Column() {
    Web({ src: data.url, controller: data.controller })
      .width('100%')
      .height('100%')
  }
}

let wrap: WrappedBuilder<@Builder
(data: Data) => void> = wrapBuilder(webBuilder);

// 用于控制和反馈对应的NodeContainer上的节点的行为，需要与NodeContainer一起使用
export class MyNodeController extends NodeController {
  private rootNode?: BuilderNode<Data>;

  // 必须要重写的方法，用于构建节点数、返回节点挂载在对应NodeContainer中
  // 在对应NodeContainer创建的时候调用、或者通过rebuild方法调用刷新
  makeNode(uiContext: UIContext): FrameNode | null {
    console.info('uiContext is undefined : ' + (uiContext === undefined));
    if (this.rootNode !== undefined && this.rootNode !== null) {
      // 返回FrameNode节点
      return this.rootNode!.getFrameNode();
    }
    // 返回null控制动态组件脱离绑定节点
    return null;
  }

  // 当布局大小发生变化时进行回调
  aboutToResize(size: Size): void {
    console.info('aboutToResize width : ' + size.width + ' height : ' + size.height);
  }

  // 当controller对应的NodeContainer在Appear的时候进行回调
  aboutToAppear(): void {
    console.info('aboutToAppear');
  }

  // 当controller对应的NodeContainer在Disappear的时候进行回调
  aboutToDisappear(): void {
    console.info('aboutToDisappear');
  }

  // 此函数为自定义函数，可作为初始化函数使用
  // 通过UIContext初始化BuilderNode，再通过BuilderNode中的build接口初始化@Builder中的内容
  initWeb(url: ResourceStr, uiContext: UIContext, control: webview.WebviewController): void {
    if (this.rootNode !== null && this.rootNode !== undefined) {
      return;
    }
    // 创建节点，需要uiContext
    this.rootNode = new BuilderNode<Data>(uiContext);
    // 创建动态Web组件
    this.rootNode?.build(wrap, { url: url, controller: control });
  }
}

// 创建Map保存所需要的NodeController
let nodeMap: Map<ResourceStr, MyNodeController | undefined> = new Map<ResourceStr, MyNodeController | undefined>();
// 创建Map保存所需要的WebViewController
let controllerMap: Map<ResourceStr, webview.WebviewController | undefined> =
  new Map<ResourceStr, webview.WebviewController | undefined>();

// 初始化需要UIContext 需在Ability获取
export function createNWeb(url: ResourceStr, uiContext: UIContext): void {
  // 创建NodeController
  let baseNode = new MyNodeController();
  let controller = new webview.WebviewController(undefined);
  // 初始化自定义Web组件
  baseNode.initWeb(url, uiContext, controller);
  controllerMap.set(url, controller);
  nodeMap.set(url, baseNode);
}

// 自定义获取NodeController接口
export function getNWeb(url: ResourceStr): MyNodeController | undefined {
  return nodeMap.get(url);
}

// [End entry1_preload_render_custom_node_controller_static]