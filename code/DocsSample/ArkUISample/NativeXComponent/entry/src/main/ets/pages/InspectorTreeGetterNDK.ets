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

import nativeNode from 'libnativerender.so';
import { NodeContent } from '@kit.ArkUI';

const INSPECTOR_TAG: string = 'InspectorTreeGetterNDK';

@Builder
export function InspectorTreeGetterNDKBuilder(name: string, param: Object) {
  InspectorTreeGetterNDK()
}

@Component
export struct InspectorTreeGetterNDK {
  @State currentStatus: string = 'init';
  @State inspectorTree: string = '';
  private nodeContent: NodeContent = new NodeContent();

  aboutToAppear(): void {
    nativeNode.createNativeNode(this.nodeContent, INSPECTOR_TAG);
  }

  build() {
    NavDestination() {
      Column() {
        Row() {
          Text('InspectorTreeGetter Sample')
            .fontSize('24fp')
            .fontWeight(500)
            .margin({
              left: 24,
              top: 12
            })
        }
        .margin({ top: 24 })
        .width('100%')
        .height(56)

        Column({ space: 10 }) {
          ContentSlot(this.nodeContent);
          Text(this.currentStatus)
            .fontSize('16fp')
            .fontWeight(500)
        }
        .margin({
          top: 27,
          left: 12,
          right: 12
        })
        .width('90%')

        Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Center }) {
          Button('Register')
            .fontSize('16fp')
            .fontWeight(500)
            .margin(5)
            .onClick(() => {
              // 在Native侧的XComponent宿主节点上注册InspectorTreeGetter回调
              let ret: number = nativeNode.registerInspectorTreeGetter(INSPECTOR_TAG);
              if (ret === 0) {
                this.currentStatus = 'register success';
              } else {
                this.currentStatus = 'register failed, errorCode: ' + ret;
              }
              this.inspectorTree = ''; // 清空已展示的组件树，避免残留的JSON文本影响后续结果判断
            })
            .height(40)

          Button('Unregister')
            .fontSize('16fp')
            .fontWeight(500)
            .margin(5)
            .onClick(() => {
              // 注销Native侧XComponent宿主节点上的InspectorTreeGetter回调
              let ret: number = nativeNode.unregisterInspectorTreeGetter(INSPECTOR_TAG);
              if (ret === 0) {
                this.currentStatus = 'unregister success';
              } else {
                this.currentStatus = 'unregister failed, errorCode: ' + ret;
              }
              this.inspectorTree = ''; // 清空已展示的组件树，避免残留的JSON文本影响后续结果判断
            })
            .height(40)

          Button('Get Inspector Tree')
            .fontSize('16fp')
            .fontWeight(500)
            .margin(5)
            .onClick(() => {
              // 获取组件树，注册回调后组件树会合并回调上报的第三方框架组件子树
              this.inspectorTree = this.getUIContext().getFilteredInspectorTree();
              if (this.inspectorTree.includes('FlutterView')) {
                this.currentStatus = 'tree contains external framework subtree';
              } else {
                this.currentStatus = 'tree does not contain external framework subtree';
              }
            })
            .height(40)
        }
        .width('100%')
        .margin({ top: 20 })

        Scroll() {
          Text(this.inspectorTree)
            .fontSize('12fp')
            .width('100%')
        }
        .height('30%')
        .width('90%')
        .margin({
          top: 12,
          bottom: 12
        })
        .align(Alignment.TopStart)
      }
      .width('100%')
      .height('100%')
    }
  }
}
