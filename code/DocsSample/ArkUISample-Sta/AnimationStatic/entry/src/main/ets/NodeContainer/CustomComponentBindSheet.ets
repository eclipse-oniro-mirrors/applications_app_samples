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

// [Start bind_custom_component]
// CustomComponent.ets
// 自定义占位节点，跨容器迁移能力
import {
  BuilderNode,
  FrameNode,
  NodeController,
  UIContext,
  wrapBuilder,
  WrappedBuilder,
  Image,
  Builder,
  $r,
  CustomBuilder
} from '@kit.ArkUI';

@Builder
function flowerBuilder(): void {
  // 请将$r('app.media.longevity_flower')替换为实际资源文件
  Image($r('app.media.longevity_flower'))
    // 避免第一次加载图片时图片闪烁
    .syncLoad(true);
}

export class MyNodeController extends NodeController {
  private flowerNode: BuilderNode | null = null;
  private wrapBuilder: WrappedBuilder<CustomBuilder> = wrapBuilder(flowerBuilder);
  private needCreate: boolean = false;
  private isRemove: boolean = false;

  constructor(create: boolean) {
    super();
    this.needCreate = create;
  }

  makeNode(uiContext: UIContext): FrameNode | null {
    if (this.isRemove === true) {
      return null;
    }
    if (this.needCreate && this.flowerNode === null) {
      this.flowerNode = new BuilderNode(uiContext);
      this.flowerNode!.build(this.wrapBuilder);
    }
    if (this.flowerNode === null) {
      return null;
    }
    return this.flowerNode!.getFrameNode()!;
  }

  getNode(): BuilderNode | null {
    return this.flowerNode;
  }

  setNode(node: BuilderNode | null): void {
    this.flowerNode = node;
    this.rebuild();
  }

  onRemove(): void {
    this.isRemove = true;
    this.rebuild();
    this.isRemove = false;
  }

  init(uiContext: UIContext): void {
    this.flowerNode = new BuilderNode(uiContext);
    this.flowerNode!.build(this.wrapBuilder);
  }
}

let myNode: MyNodeController | undefined;

export const createMyNode: (uiContext: UIContext) => void =
  (uiContext: UIContext): void => {
    myNode = new MyNodeController(false);
    myNode!.init(uiContext);
  };

export const getMyNode: () => MyNodeController | undefined = (): MyNodeController | undefined => {
  return myNode;
};

// [End bind_custom_component]
