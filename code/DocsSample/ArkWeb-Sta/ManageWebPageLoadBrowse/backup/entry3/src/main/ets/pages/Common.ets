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

// [Start dynamic_web_module_manage_static]
// Common.ets
import { Builder, Column, Entry, Component, Web } from '@ohos.arkui.component';
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
import webview from '@ohos.web.webview';
import hilog from '@ohos.hilog'

export const defaultUrl : string = 'https://www.example.com';

// Data为入参封装类
class Data{
  public url: string = '';	
  public webController: webview.WebviewController = new webview.WebviewController(undefined);

  constructor(url: string, webController: webview.WebviewController) {
    this.url = url;
    this.webController = webController;
  }
}

// @Builder中为动态组件的具体组件内容
@Builder
function webBuilder(data:Data): void {
  Web({ src: data.url, controller: data.webController })
    .width('100%')
    .height('100%')
    .borderWidth(2)
}

const wrap: WrappedBuilder<@Builder (data: Data) => void> = wrapBuilder(webBuilder);

// 用于控制和反馈对应的NodeContainer上的节点的行为，需要与NodeContainer一起使用
export class MyNodeController extends NodeController {
  private builderNode: BuilderNode<Data> | null | undefined = null;
  private webController : webview.WebviewController | null | undefined = null;
  private rootNode : FrameNode | null = null;

  constructor(builderNode : BuilderNode<Data> | undefined, webController : webview.WebviewController | undefined) {
    super();
    this.builderNode = builderNode;
    this.webController = webController;
  }

  // 必须要重写的方法，用于构建节点树、返回节点挂载在对应NodeContainer中
  // 在对应NodeContainer创建的时候调用或者通过rebuild方法调用刷新
  makeNode(uiContext: UIContext): FrameNode | null {
    // 该节点会被挂载在NodeContainer的父节点下
    return this.rootNode;
  }

  // 挂载Webview
  attachWeb() : void {
    if (this.builderNode) {
      let frameNode : FrameNode | null | undefined = this.builderNode?.getFrameNode();
      if (frameNode?.getParent() != null) {
        // 挂载自定义节点前判断该节点是否已经被挂载
        hilog.error(0x0000, 'testTag', '%{public}s', 'The frameNode is already attached');
        return;
      }
      this.rootNode = this.builderNode!.getFrameNode();
    }
  }

  // 卸载Webview
  detachWeb() : void {
    this.rootNode = null;
  }

  getWebController() : webview.WebviewController | null | undefined {
    return this.webController;
  }
}

// 创建Map保存所需要的BuilderNode
let builderNodeMap : Map<string, BuilderNode<Data> | undefined> = new Map<string, BuilderNode<Data> | undefined>();
// 创建Map保存所需要的webview.WebviewController
let webControllerMap : Map<string, webview.WebviewController | undefined> = new Map<string, webview.WebviewController | undefined>();

// 初始化需要UIContext对象，UIContext对象可通过窗口或自定义组件的getUIContext方法获取
export const createNWeb = (url: string, uiContext: UIContext) => {
  // 创建WebviewController
  let webController = new webview.WebviewController(undefined);
  // 创建BuilderNode
  let builderNode : BuilderNode<Data> = new BuilderNode<Data>(uiContext);
  // 创建动态Web组件
  builderNode?.build(wrap, new Data(url, webController));

  // 保存BuilderNode
  builderNodeMap.set(url, builderNode);
  // 保存WebviewController
  webControllerMap.set(url, webController);
}

// 自定义获取BuilderNode的接口
export const getBuilderNode = (url: string) : BuilderNode<Data> | undefined => {
  return builderNodeMap.get(url);
}
// 自定义获取WebviewController的接口
export const getWebviewController = (url : string) : webview.WebviewController | undefined => {
  return webControllerMap.get(url);
}
// [End dynamic_web_module_manage_static]

