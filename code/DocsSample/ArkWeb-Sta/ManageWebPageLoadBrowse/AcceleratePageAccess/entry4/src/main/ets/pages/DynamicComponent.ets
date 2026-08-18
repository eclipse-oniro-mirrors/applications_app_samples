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

// [Start underlying_code_required_for_dynamic_components]
import { Builder, UIContext, Web, WebviewController, wrapBuilder, BuilderNode } from '@kit.ArkUI';
import { LocalStorage, WrappedBuilder, FrameNode, NodeController } from '@kit.ArkUI';
import { CustomBuilderT } from '@kit.ArkUI';
import { webview } from '@kit.ArkWeb';

export interface BuilderData {
  url: string;
  controller: WebviewController;
  context: UIContext;
}

let storage : LocalStorage | undefined = undefined;

export class NodeControllerImpl extends NodeController {
  private rootNode: BuilderNode<BuilderData> | null = null;
  private wrappedBuilder: WrappedBuilder<CustomBuilderT<BuilderData>> | null = null;

  constructor(wrappedBuilder: WrappedBuilder<CustomBuilderT<BuilderData>>, context: UIContext) {
    super();
    storage = context.getSharedLocalStorage();
    this.wrappedBuilder = wrappedBuilder;
  }

  makeNode(uiContext: UIContext): FrameNode | null {
    if (this.rootNode != null) {
      return this.rootNode!.getFrameNode();
    }
    return null;
  }

  initWeb(url: string, controller: WebviewController): void {
    if(this.rootNode != null) {
      return;
    }

    const uiContext: UIContext = storage!.get<UIContext>('uiContext') as UIContext;
    if (!uiContext) {
      return;
    }
    this.rootNode = new BuilderNode<BuilderData>(uiContext);
    this.rootNode!.build(this.wrappedBuilder!, { url: url, controller: controller, context: uiContext} as BuilderData);
  }
}

export const createNode: (wrappedBuilder: WrappedBuilder<CustomBuilderT<BuilderData>>, data: BuilderData) => NodeController = (wrappedBuilder: WrappedBuilder<CustomBuilderT<BuilderData>>, data: BuilderData): NodeController => {
  const baseNode = new NodeControllerImpl(wrappedBuilder, data.context);
  baseNode.initWeb(data.url, data.controller);
  return baseNode;
}
// [End underlying_code_required_for_dynamic_components]
