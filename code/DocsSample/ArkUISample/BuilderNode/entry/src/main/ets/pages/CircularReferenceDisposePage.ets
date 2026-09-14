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

// [Start Main_CircularReferenceDisposePage]
import { FrameNode, NodeController, BuilderNode } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

// 定义传递参数的接口
interface ParamsInterface {
  builderRootNode: BuilderNode<[ParamsInterface]> | null;
}

// 自定义组件
@Component
struct TestComponent {
  builderRootNode: BuilderNode<[ParamsInterface]> | null = null;
  build() {
    Column() {
      Text('This is a BuilderNode.')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
    }
    .width('100%')
    .backgroundColor(Color.Gray)
  }

  // 自定义组件实例创建时的回调
  aboutToAppear() {
    hilog.info(0x0000, 'testTag', 'aboutToAppear');
  }

  // 自定义组件实例析构时的回调
  aboutToDisappear() {
    hilog.info(0x0000, 'testTag', 'aboutToDisappear');
  }
}

@Builder
function buildComponent(params: ParamsInterface) {
  TestComponent(params)
}

// 继承NodeController实现自定义UI控制器
class MyNodeController extends NodeController {
  private builderNode: BuilderNode<[ParamsInterface]> | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.builderNode = new BuilderNode(uiContext);

    // 将builderNode自身作为参数传递给自定义组件，产生前后端循环引用场景
    this.builderNode.build(new WrappedBuilder(buildComponent), {builderRootNode: this.builderNode});

    return this.builderNode.getFrameNode();
  }

  // 解除当前builderNode与后端实体的引用关系，并置空为null
  dispose() {
    if (this.builderNode !== null) {
      this.builderNode.dispose();
      this.builderNode = null;
    }
  }

  // 清理builderNode对象持有的参数，解除参数对象对builderNode对象的引用
  clearParams() {
    this.builderNode?.update({builderRootNode: null} as ParamsInterface)
  }
}

@Entry
@Component
struct Index {
  @State myNodeController: MyNodeController | undefined = new MyNodeController();
  build() {
    Column({ space: 4 }) {
      NodeContainer(this.myNodeController)
      Button('Destroy')
        .onClick(() => {
          this.myNodeController?.clearParams();
          // 通过将传入NodeContainer的NodeController置为undefined，使BuilderNode节点下树
          this.myNodeController = undefined;
        })
        .width('100%')
      Button('Destroy with dispose')
        .onClick(() => {
          this.myNodeController?.clearParams();
          this.myNodeController?.dispose();
          this.myNodeController = undefined;
        })
        .width('100%')
      Button('Create')
        .onClick(() => {
          if (this.myNodeController === undefined) {
            this.myNodeController = new MyNodeController();
          }
        })
        .width('100%')
    }
  }
}
// [End Main_CircularReferenceDisposePage]
