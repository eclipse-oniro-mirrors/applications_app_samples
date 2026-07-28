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
// [Start xcomponent_type_node_controller_ets]
// [StartExclude xcomponent_type_node_controller_ets]
import { FrameNode, NodeController, typeNode, UIContext } from '@kit.ArkUI';
// [EndExclude xcomponent_type_node_controller_ets]
// 重写XComponentController，设置生命周期回调
class MyXComponentController extends XComponentController {
  onSurfaceCreated(surfaceId: string): void {
    console.info(`onSurfaceCreated surfaceId: ${surfaceId}`);
  }

  onSurfaceChanged(surfaceId: string, rect: SurfaceRect): void {
    console.info(`onSurfaceChanged surfaceId: ${surfaceId}, rect: ${JSON.stringify(rect)}`);
  }

  onSurfaceDestroyed(surfaceId: string): void {
    console.info(`onSurfaceDestroyed surfaceId: ${surfaceId}`);
  }
}

class MyNodeController extends NodeController {
  public xComponent: typeNode.XComponent | undefined = undefined;
  public xComponentId: string = 'xcp' + (new Date().getTime());
  public node: FrameNode | undefined = undefined;
  public column: typeNode.Column | undefined = undefined;
  private xcController: MyXComponentController = new MyXComponentController();

  makeNode(uiContext: UIContext): FrameNode | null {
    this.node = new FrameNode(uiContext);
    this.column = typeNode.createNode(uiContext, 'Column')
    this.column.initialize()
      .width('100%')
      .height('100%')
    try {
      this.node.appendChild(this.column);
    } catch (error) {
      console.error('Fail to append child: ', error);
    }
    // 创建XComponent组件节点，并绑定XComponentController
    this.xComponent =
      typeNode.createNode(uiContext, 'XComponent', { type: XComponentType.SURFACE, controller: this.xcController });
    this.xComponent.attribute
    try {
      this.column.appendChild(this.xComponent);
    } catch (error) {
      console.error('Fail to append child: ', error);
    }
    return this.node;
  }
}

// [StartExclude xcomponent_type_node_controller_ets]
@Builder
export function XComponentTypeNodeControllerBuilder(name: string, param: Object) {
  XComponentTypeNodeController()
}

@Component
export struct XComponentTypeNodeController {
  @State isShow: boolean = true;
  myNodeController: MyNodeController = new MyNodeController();

  build() {
    NavDestination() {
      Column() {
        if (this.isShow) {
          NodeContainer(this.myNodeController)
            .width('100%')
            .height(200)
        }
        Button('创建/销毁')
          .onClick(() => {
            this.isShow = !this.isShow;
          })
          .width('40%')
          .margin(10)
      }
      .width('100%')
    }
  }
}
// [EndExclude xcomponent_type_node_controller_ets]
// [End xcomponent_type_node_controller_ets]
