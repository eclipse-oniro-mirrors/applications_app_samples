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

// [Start Main_MemoryManagementPage]
import { BuilderNode, FrameNode, NodeContent } from '@kit.ArkUI';
import { ArrayList } from '@kit.ArkTS';

const CUSTOM_COMPONENT_CONT: string = 'CustomComponentCont';
AppStorage.setOrCreate<number>(CUSTOM_COMPONENT_CONT, 0);
let globalBuilderNodeList: ArrayList<BuilderNode<[]>> = new ArrayList<BuilderNode<[]>>();

@Component
struct BuilderNodePage {
  aboutToAppear(): void {
    const count: number | undefined = AppStorage.get<number>(CUSTOM_COMPONENT_CONT);
    const current: number = count ? count + 1 : 1;
    AppStorage.setOrCreate<number>(CUSTOM_COMPONENT_CONT, current);
    console.info('BuilderNodePage', 'aboutToAppear ' + AppStorage.get<number>(CUSTOM_COMPONENT_CONT));
  }

  aboutToDisappear(): void {
    setTimeout(() => {
      const count: number | undefined = AppStorage.get<number>(CUSTOM_COMPONENT_CONT);
      console.info('BuilderNodePage', 'aboutToDisappear ' + count);
      const current: number = count ? count - 1 : -1;
      AppStorage.set<number>(CUSTOM_COMPONENT_CONT, current);
      console.info('BuilderNodePage', 'aboutToDisappear ' + AppStorage.get<number>(CUSTOM_COMPONENT_CONT));
    }, 1)
  }

  build() {
    Text('This is a BuilderNode')
  }
}

@Builder
function builderNodeBuilder() {
  BuilderNodePage();
}

@Entry
@Component
struct NavigationExample {
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()
  private arr: number[] = [1, 2, 3];
  @StorageProp(CUSTOM_COMPONENT_CONT) customComponentCount: number | undefined =
    AppStorage.get<number>(CUSTOM_COMPONENT_CONT);

  @Builder
  pageMap(name: string) {
    if (name === 'NavDestinationTitle1') {
      pageOneTmp();
    } else if (name === 'NavDestinationTitle2') {
      pageTwoTmp();
    } else if (name === 'NavDestinationTitle3') {
      pageThreeTmp();
    }
  }

  onPageShow(): void {
    console.info('NavigationExample ' + this.customComponentCount);
  }

  build() {
    Column() {
      Navigation(this.pageInfos) {
        Text('Number of remaining custom components in BuilderNode ' + this.customComponentCount)
          .width('90%')
          .height(40)
          .backgroundColor('#FFFFFF')
        Button('Remove Global References')
          .onClick(() => {
            // 清除所有全局引用。
            // 可以使用hidumper指令触发GC验证引用关系是否清零。
            globalBuilderNodeList.clear();
          })
        List({ space: 12 }) {
          ForEach(this.arr, (item: number) => {
            ListItem() {
              Text('Page' + item)
                .width('100%')
                .height(72)
                .backgroundColor('#FFFFFF')
                .borderRadius(24)
                .fontSize(16)
                .fontWeight(500)
                .textAlign(TextAlign.Center)
                .onClick(() => {
                  this.pageInfos.pushPath({ name: 'NavDestinationTitle' + item });
                })
            }
          }, (item: number) => item.toString())
        }
        .width('100%')
        .margin({ top: 12 })
      }
      .title('Main Title')
      .mode(NavigationMode.Stack)
      .navDestination(this.pageMap)
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F1F3F5')
  }
}

@Component
export struct pageOneTmp {
  @Consume('pageInfos') pageInfos: NavPathStack;
  private builderNode: BuilderNode<[]> = new BuilderNode(this.getUIContext());
  private content: NodeContent = new NodeContent();

  aboutToAppear(): void {
    console.info('pageOneTmp', 'aboutToAppear')
    this.builderNode.build(wrapBuilder(builderNodeBuilder));
    if (this.builderNode.getFrameNode()) {
      this.content.addFrameNode(this.builderNode.getFrameNode());
    }
    // 添加全局引用，该对象在全局引用移除前无法被GC。
    globalBuilderNodeList.add(this.builderNode);
  }

  aboutToDisappear(): void {
    console.info('pageOneTmp', 'aboutToDisappear')
  }

  build() {
    NavDestination() {
      Column() {
        Text('pageOneTmp')
        ContentSlot(this.content)
      }.width('100%').height('100%')
    }.title('NavDestinationTitle1')
    .onBackPressed(() => {
      const popDestinationInfo = this.pageInfos.pop(); // 弹出路由栈栈顶元素。
      console.info('pop returnValue: ' + JSON.stringify(popDestinationInfo));
      return true;
    })
  }
}

@Component
export struct pageTwoTmp {
  @Consume('pageInfos') pageInfos: NavPathStack;
  private builderNode: BuilderNode<[]> = new BuilderNode(this.getUIContext());
  private content: NodeContent = new NodeContent();

  aboutToAppear(): void {
    console.info('pageTwoTmp', 'aboutToAppear')
    this.builderNode!.build(wrapBuilder(builderNodeBuilder));
    if (this.builderNode!.getFrameNode()) {
      // 将BuilderNode的根节点挂载至NodeContent对象中。
      // 如果要触发builderNode的根节点的析构，需要主动从NodeContent对象中移除该节点，或者等待NodeContent对象被GC。
      // 否则，BuilderNode的根节点无法触发析构。
      this.content.addFrameNode(this.builderNode!.getFrameNode());
    }
  }

  aboutToDisappear(): void {
    console.info('pageTwoTmp', 'aboutToDisappear')
    if (this.builderNode?.getFrameNode()) {
      // 将BuilderNode的根节点从NodeContent对象中移除。
      // 需要在BuilderNode的dispose操作之前执行，否则无法获得该BuilderNode的根节点。
      this.content.removeFrameNode(this.builderNode?.getFrameNode());
    }
    this.builderNode?.dispose();
  }

  build() {
    NavDestination() {
      Column() {
        Text('pageTwoTmp')
        ContentSlot(this.content)
      }.width('100%').height('100%')
    }.title('NavDestinationTitle2')
    .onBackPressed(() => {
      const popDestinationInfo = this.pageInfos.pop(); // 弹出路由栈栈顶元素。
      console.info('pop returnValue: ' + JSON.stringify(popDestinationInfo));
      return true;
    })
  }
}

@Component
export struct pageThreeTmp {
  @Consume('pageInfos') pageInfos: NavPathStack;
  private builderNode: BuilderNode<[]> = new BuilderNode(this.getUIContext());
  private content: NodeContent = new NodeContent();
  private rootNode: FrameNode = new FrameNode(this.getUIContext());

  aboutToAppear(): void {
    console.info('pageThreeTmp', 'aboutToAppear');
    this.builderNode!.build(wrapBuilder(builderNodeBuilder));
    if (this.builderNode!.getFrameNode()) {
      this.content.addFrameNode(this.rootNode);
      // BuilderNode的根节点被挂载至FrameNode对象对应的节点中。
      // BuilderNode的根节点如果要触发析构需要主动从FrameNode对象对应的节点中移除，或者等待FrameNode对象对应的节点析构。
      // 否则，BuilderNode的根节点无法触发析构。
      this.rootNode.appendChild(this.builderNode.getFrameNode());
    }
  }

  aboutToDisappear(): void {
    console.info('pageThreeTmp', 'aboutToDisappear');
    if (this.builderNode?.getFrameNode()) {
      // 将BuilderNode的根节点从FrameNode对象对应的节点中移除。
      // 需要在BuilderNode的dispose操作以及FrameNode对象dispose之前执行，否则无法获得他们对应的节点。
      this.rootNode.removeChild(this.builderNode?.getFrameNode());
    }
    this.builderNode?.dispose();
  }

  build() {
    NavDestination() {
      Column() {
        Text('pageThreeTmp')
        ContentSlot(this.content)
      }.width('100%').height('100%')
    }.title('NavDestinationTitle3')
    .onBackPressed(() => {
      const popDestinationInfo = this.pageInfos.pop(); // 弹出路由栈栈顶元素。
      console.info('pop returnValue: ' + JSON.stringify(popDestinationInfo));
      return true;
    })
  }
}
// [End Main_MemoryManagementPage]
