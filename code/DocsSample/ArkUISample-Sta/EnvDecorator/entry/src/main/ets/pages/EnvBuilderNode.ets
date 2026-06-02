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

import { NavDestination, $r } from '@kit.ArkUI';
// [Start env_builder_node]
// EnvBuilderNode.ets
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  ComponentV2,
  NodeContainer,
  State,
  Env,
  IMonitor,
  Require,
  Param,
  SystemProperties,
  AppStorage,
  wrapBuilder,
  ColumnOptions
} from '@kit.ArkUI';
import window from '@ohos.window';
import hilog from '@ohos.hilog';
import uiObserver from '@ohos.arkui.observer';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { UIContext } from '@ohos.arkui.UIContext';
import { BuilderNode, FrameNode, NodeController } from '@ohos.arkui.node';

const DOMAIN = 0x0000;

let windowStage_: window.WindowStage | undefined = undefined;
let sub_windowClass: window.Window | undefined = undefined;
let globalBuilderNode: BuilderNode<ParamsInt> | undefined = undefined;

// BuilderNode的参数类，用于传递构建参数
class ParamsInt {
  text: int = 0;

  constructor(text: int) {
    this.text = text;
  }
}

// 自定义NodeController类，用于控制节点容器的行为
export class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private uiContext: UIContext | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    // 根据uiContext创建FrameNode
    this.rootNode = new FrameNode(uiContext);
    this.uiContext = uiContext;
    return this.rootNode;
  }

  // 如果globalBuilderNode尚未创建，则创建一个新的BuilderNode
  // 然后将BuilderNode的FrameNode添加到根节点的子节点中
  addBuilderNode(): void {
    if (!globalBuilderNode && this.uiContext) {
      // 创建参数对象
      let num: int = 0;
      let params: ParamsInt = new ParamsInt(num);
      // 创建新的BuilderNode实例
      globalBuilderNode = new BuilderNode<ParamsInt>(this.uiContext!);
      // 使用wrapBuilder包装buildComponent函数，构建组件并传入参数
      globalBuilderNode!.build(wrapBuilder(buildComponent), params);
    }
    // 如果根节点和globalBuilderNode都存在，将globalBuilderNode添加到根节点
    if (this.rootNode && globalBuilderNode) {
      this.rootNode!.appendChild(globalBuilderNode!.getFrameNode()!);
    }
  }

  // 将globalBuilderNode的FrameNode从根节点的子节点中移除
  removeBuilderNode(): void {
    if (this.rootNode && globalBuilderNode) {
      // 从根节点移除globalBuilderNode的FrameNode
      this.rootNode!.removeChild(globalBuilderNode!.getFrameNode()!);
    }
  }

  // 释放BuilderNode占用的资源，并将globalBuilderNode重置为undefined
  disposeNode(): void {
    if (this.rootNode && globalBuilderNode) {
      // 调用dispose方法释放BuilderNode的资源
      globalBuilderNode!.dispose();
      // 将globalBuilderNode重置为undefined，标记为已销毁
      globalBuilderNode = undefined;
    }
  }
}

@Builder
function buildComponent(params: ParamsInt) {
  Column() {
    ComponentUnderBuilderNode()
  }
}

@Entry
@ComponentV2
struct EnvBuilderNodeExample {
  // 创建MyNodeController实例，用于控制NodeContainer中的节点
  private nodeController: MyNodeController = new MyNodeController();

  private createSubWindow() {
    // 从AppStorage中获取windowStage实例
    const windowStage_: window.WindowStage | undefined = AppStorage.get<window.WindowStage>('windowStage');
    if (windowStage_ === undefined) {
      // 如果windowStage不存在，打印错误日志
      hilog.error(DOMAIN, 'testTag', 'Failed to create the subwindow. Cause: windowStage_ is null');
    } else {
      // windowStage存在，调用createSubWindow方法创建子窗口
      windowStage_!.createSubWindow('mySubWindow').then((data: window.Window | undefined): void => {
        sub_windowClass = data;
        // 检查子窗口是否创建成功
        if (!sub_windowClass) {
          hilog.error(DOMAIN, 'testTag', 'sub_windowClass is undefined');
          return;
        }
        // 子窗口创建成功，打印成功日志和窗口数据
        hilog.info(DOMAIN, 'testTag', 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
        try {
          // 移动子窗口到指定位置
          sub_windowClass!.moveWindowTo(200, 1300);
          // 调整子窗口大小
          sub_windowClass!.resize(900, 1800);
        } catch (err) {
          // 如果移动或调整窗口大小失败，打印错误日志
          hilog.error(DOMAIN, 'testTag', 'Failed to move or change the window. Cause:' + JSON.stringify(err));
        }
        // 子窗口加载对应的目标页面
        sub_windowClass!.setUIContent('pages/SubWindow', (err: BusinessError<void> | null): void => {
          // 检查加载页面是否成功
          if (err?.code) {
            hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause:' + JSON.stringify(err));
            return;
          }
          // 页面加载成功，打印成功日志
          hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
          // 显示子窗口
          sub_windowClass!.showWindow((err: BusinessError<void> | null): void => {
            // 检查显示子窗口是否成功
            if (err?.code) {
              hilog.error(DOMAIN, 'testTag', 'Failed to show the window. Cause: ' + JSON.stringify(err));
              return;
            }
            // 子窗口显示成功，打印成功日志
            hilog.info(DOMAIN, 'testTag', 'Succeeded in showing the window.');
          })
        })
      })
    }
  }

  private destroySubWindow() {
    // 检查子窗口实例是否存在
    if (!sub_windowClass) {
      hilog.error(DOMAIN, 'testTag', 'sub_windowClass is undefined');
      return;
    }
    // 调用destroyWindow方法销毁子窗口
    try {
      sub_windowClass!.destroyWindow();
    } catch(err) {
      // 检查销毁是否成功
      let errCode: number = err.code;
      if (errCode) {
        hilog.error(DOMAIN, 'testTag', 'Failed to destroy the window. Cause: ' + JSON.stringify(err));
        return;
      }
      // 窗口销毁成功，打印成功日志
      hilog.info(DOMAIN, 'testTag', 'Succeeded in destroying the window.');
    }
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Text(`Index`)
      // 第一步：创建globalBuilderNode，并将globalBuilderNode下的节点挂在NodeContainer的占位节点下
      Button('add node to tree').width(200)
        .onClick((e: ClickEvent) => {
          this.nodeController.addBuilderNode();
        })
      // 第二步：从NodeContainer的占位节点下移除globalBuilderNode下的节点
      Button('remove node from tree').width(200)
        .onClick((e: ClickEvent) => {
          this.nodeController.removeBuilderNode();
        })
      // 销毁globalBuilderNode下的节点
      Button('dispose node').width(200)
        .onClick((e: ClickEvent) => {
          this.nodeController.disposeNode();
        })
      // 第三步：创建子窗
      Button(`create sub window`).width(200)
        .onClick((e: ClickEvent) => {
          this.createSubWindow();
        })
      // 销毁子窗
      Button(`destroy sub window`).width(200)
        .onClick((e: ClickEvent) => {
          this.destroySubWindow();
        })
      NodeContainer(this.nodeController).backgroundColor('#FFEEF0')
    }
    .width('100%')
    .height('100%')
  }
}

@Component
struct ComponentUnderBuilderNode {
  // 使用@Env装饰器监听窗口的断点信息
  @Env(SystemProperties.BREAK_POINT) breakpoint: uiObserver.WindowSizeLayoutBreakpointInfo;

  build() {
    Column() {
      // 打印当前窗口宽度所在的布局断点枚举值
      Text(`ComponentUnderBuilderNode breakpoint width: ${this.breakpoint.widthBreakpoint}`)
      // 打印当前窗口高度所在的布局断点枚举值
      Text(`ComponentUnderBuilderNode breakpoint height: ${this.breakpoint.heightBreakpoint}`)

      CompV2({ breakpoint: this.breakpoint })
      Comp({ breakpoint: this.breakpoint })
    }
  }
}

@ComponentV2
struct CompV2 {
  @Require @Param breakpoint: uiObserver.WindowSizeLayoutBreakpointInfo;

  build() {
    Column() {
      // 打印当前窗口宽度所在的布局断点枚举值
      Text(`CompV2 breakpoint width: ${this.breakpoint.widthBreakpoint}`)
      // 打印当前窗口高度所在的布局断点枚举值
      Text(`CompV2 breakpoint height: ${this.breakpoint.heightBreakpoint}`)
    }
  }
}

@Component
struct Comp {
  // 仅使用@Require装饰器，不能响应父组件@Env变量的改值
  @Require breakpoint: uiObserver.WindowSizeLayoutBreakpointInfo;

  build() {
    Column() {
      // 打印首次传递进来的宽度断点信息
      Text(`Comp breakpoint width: ${this.breakpoint.widthBreakpoint}`)
      // 打印首次传递进来的高度断点信息
      Text(`Comp breakpoint height: ${this.breakpoint.heightBreakpoint}`)
    }
  }
}
// [End env_builder_node]

@Builder
export function envBuilderNode(): void {
  NavDestination() {
    EnvBuilderNodeExample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.env_builder_node_title'))
}