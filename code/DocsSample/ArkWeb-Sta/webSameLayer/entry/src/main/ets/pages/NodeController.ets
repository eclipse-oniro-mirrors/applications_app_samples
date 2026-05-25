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
// [Start nodecontroller]
import { webview } from '@kit.ArkWeb';
import { UIContext, Observed, $rawfile, Entry, Component, Row, Web, Column, Button, State,
  TouchEvent, MouseEvent, NodeController, BuilderNode, NodeRenderType, RenderOptions,
  FrameNode, Color, Stack, ForEach, NodeContainer, NativeEmbedStatus, NativeEmbedDataInfo,
  NativeEmbedTouchInfo, NativeEmbedMouseInfo, Edges, wrapBuilder, ObjectLink, XComponentController,
  XComponent, XComponentType, XComponentParameters } from '@kit.ArkUI';
import { AVPlayerDemo } from './PlayerDemo';

@Observed
export class Params{
  public textOne: string = ''
  public textTwo: string = ''
  public width: double = 0
  public height: double = 0
}

export class NodeControllerParams {
  public surfaceId: string = ''
  public type: string = ''
  public renderType: NodeRenderType = NodeRenderType.RENDER_TYPE_DISPLAY
  public embedId: string = ''
  public width: double = 0
  public height: double = 0
}

// 用于控制和反馈对应的NodeContainer上的节点的行为，需要与NodeContainer一起使用。
export class MyNodeController extends NodeController {
  private rootNode: BuilderNode<Params> | undefined | null;
  private embedId_: string = '';
  private surfaceId_: string = '';
  private renderType_: NodeRenderType = NodeRenderType.RENDER_TYPE_DISPLAY;
  private width_: double = 0;
  private height_: double = 0;
  private type_: string = '';
  private isDestroy_: boolean = false;

  setRenderOption(params: NodeControllerParams) {
    this.surfaceId_ = params.surfaceId;
    this.renderType_ = params.renderType;
    this.embedId_ = params.embedId;
    this.width_ = params.width;
    this.height_ = params.height;
    this.type_ = params.type;
  }

  // 必须要重写的方法，用于构建节点数、返回节点数挂载在对应NodeContainer中。
  // 在对应NodeContainer创建的时候调用、或者通过rebuild方法调用刷新。
  makeNode(uiContext: UIContext): FrameNode | null {
    if (this.isDestroy_) { // rootNode为null。
      return null;
    }
    if (!this.rootNode) { // rootNode 为undefined时。
      this.rootNode = new BuilderNode<Params>(uiContext, { surfaceId: this.surfaceId_, type: this.renderType_ } as RenderOptions);
      if (this.type_ === 'native/video') {
        this.rootNode?.build(wrapBuilder(videoBuilder), {textOne: 'myButton', width : this.width_, height : this.height_} as Params);
      } else {
        // other
      }
    }
    // 返回FrameNode节点。
    return this.rootNode?.getFrameNode() ?? null;
  }

  updateNode(arg: Params): void {
    this.rootNode?.update(arg);
  }

  getEmbedId(): string {
    return this.embedId_;
  }

  setDestroy(isDestroy: boolean): void {
    this.isDestroy_ = isDestroy;
    if (this.isDestroy_) {
      this.rootNode = null;
    }
  }

  postEvent(event: TouchEvent): boolean {
    return this.rootNode?.postTouchEvent(event) as boolean;
  }

  postInputEvent(event: MouseEvent): boolean {
    return this.rootNode?.postInputEvent(event) as boolean;
  }
}

@Component
struct VideoComponent {
  @ObjectLink params: Params;
  @State bkColor: Color = Color.Red;
  mXComponentController: XComponentController = new XComponentController();
  @State playerChanged: boolean = false;
  player?: AVPlayerDemo;

  build() {
    Column() {
      Button(this.params.textOne);

      XComponent({ id: 'video_player_id', type: XComponentType.SURFACE, controller: this.mXComponentController, nativeXComponentHandler: (id) => {return undefined;}} as XComponentParameters)
        .border({width: 1, color: Color.Red})
        .onLoad(() => {
          this.player = new AVPlayerDemo();
          this.player?.setSurfaceID(this.mXComponentController.getXComponentSurfaceId());
          this.playerChanged = !this.playerChanged;
          this.player?.avPlayerLiveDemo();
        })
        .width(300)
        .height(200)
    }
    // 自定义组件中的最外层容器组件宽高应该为同层标签的宽高。
    .width(this.params.width)
    .height(this.params.height)
  }
}
// @Builder中为动态组件的具体组件内容。
@Builder
function videoBuilder(params: Params) {
  VideoComponent({ params: params })
    .backgroundColor(Color.Gray)
}

@Entry
@Component
struct WebIndex {
  browserTabController: webview.WebviewController = new webview.WebviewController()
  private nodeControllerMap: Map<string, MyNodeController> = new Map<string, MyNodeController>();
  @State componentIdArr: Array<string> = new Array<string>();
  @State widthMap: Map<string, double> = new Map<string, double>();
  @State heightMap: Map<string, double> = new Map<string, double>();
  @State positionMap: Map<string, Edges> = new Map<string, Edges>();
  @State edges: Edges = {} as Edges;
  uiContext: UIContext = this.getUIContext();

  aboutToAppear() {
    // 配置Web开启调试模式。
    webview.WebviewController.setWebDebuggingAccess(true);
  }

  build() {
    Row() {
      Column() {
        Stack() {
          ForEach(this.componentIdArr, (componentId: string) => {
            NodeContainer(this.nodeControllerMap.get(componentId) as MyNodeController)
              .position(this.positionMap.get(componentId))
              .width(this.widthMap.get(componentId))
              .height(this.heightMap.get(componentId))
          }, (embedId: string) => embedId)
          Web({src: $rawfile('test3.html'), controller: this.browserTabController})
             // 配置同层渲染开关开启。
            .enableNativeEmbedMode(true)
             // 获取embed标签的生命周期变化数据。
            .onNativeEmbedLifecycleChange((embed: NativeEmbedDataInfo):void => {
              console.info('NativeEmbed surfaceId' + embed.surfaceId);
              // 1. 如果使用embed.info.id作为映射nodeController的key，请在H5页面显式指定id。
              const componentId = embed.info?.id?.toString() as string;
              if (embed.status === NativeEmbedStatus.CREATE) {
                console.info('NativeEmbed create' + JSON.stringify(embed.info));
                // 创建节点控制器、设置参数。
                let nodeController = new MyNodeController();
                nodeController.setRenderOption({
                  surfaceId : embed.surfaceId as string, type : embed.info?.type as string,
                  renderType : NodeRenderType.RENDER_TYPE_TEXTURE, embedId : embed.embedId as string,
                  width : this.uiContext.px2vp(embed.info?.width as int),
                  height : this.uiContext.px2vp(embed.info?.height as int)} as NodeControllerParams);
                this.edges = {left: `${embed.info?.position?.x as number}px`, top: `${embed.info?.position?.y as number}px`};
                nodeController.setDestroy(false);
                // 根据Web传入的embed的id属性作为key，将nodeController存入Map。
                this.nodeControllerMap.set(componentId, nodeController);
                this.widthMap.set(componentId, this.uiContext.px2vp(embed.info?.width as int));
                this.heightMap.set(componentId, this.uiContext.px2vp(embed.info?.height as int));
                this.positionMap.set(componentId, this.edges);
                // 将Web传入的embed的id属性存入@State状态数组变量中，用于动态创建nodeContainer节点容器,需要将push动作放在set之后。
                this.componentIdArr.push(componentId);
              } else if (embed.status === NativeEmbedStatus.UPDATE) {
                let nodeController = this.nodeControllerMap.get(componentId);
                this.edges = { left: `${embed.info?.position?.x as double}px`, top: `${embed.info?.position?.y as double}px` };
                this.positionMap.set(componentId, this.edges);
                this.widthMap.set(componentId, this.uiContext.px2vp(embed.info?.width as int));
                this.heightMap.set(componentId, this.uiContext.px2vp(embed.info?.height as int));
                const updateParams: Params = {
                  textOne: 'update',
                  width: this.uiContext.px2vp(embed.info?.width as int),
                  height: this.uiContext.px2vp(embed.info?.height as int)
                }
                nodeController?.updateNode(updateParams);
              } else if (embed.status === NativeEmbedStatus.DESTROY) {
                let nodeController = this.nodeControllerMap.get(componentId);
                nodeController?.setDestroy(true);
                this.nodeControllerMap.delete(componentId);
                this.positionMap.delete(componentId);
                this.widthMap.delete(componentId);
                this.heightMap.delete(componentId);
                this.componentIdArr = this.componentIdArr.filter((value: string) => value != componentId);
              } else {
                console.info('NativeEmbed status' + embed.status);
              }
            })
            // 获取同层渲染组件触摸事件信息。
            .onNativeEmbedGestureEvent((touch: NativeEmbedTouchInfo):void => {
              console.info('NativeEmbed onNativeEmbedGestureEvent' + JSON.stringify(touch.touchEvent));
              this.componentIdArr.forEach((componentId: string) => {
                let nodeController = this.nodeControllerMap.get(componentId);
                // 将获取到的同层区域的事件发送到该区域embedId对应的nodeController上。
                if (nodeController?.getEmbedId() === touch.embedId) {
                  let ret = nodeController?.postEvent(touch.touchEvent as TouchEvent);
                  if (ret) {
                    console.info('onNativeEmbedGestureEvent success ' + componentId);
                  } else {
                    console.info('onNativeEmbedGestureEvent fail ' + componentId);
                  }
                  if (touch.result) {
                    // 通知Web组件手势事件消费结果。
                    touch.result?.setGestureEventResult(ret as boolean);
                  }
                }
              })
            })
            .onNativeEmbedMouseEvent((mouse: NativeEmbedMouseInfo):void => {
              console.info('NativeEmbed onNativeEmbedMouseEvent' + JSON.stringify(mouse.mouseEvent));
              this.componentIdArr.forEach((componentId: string) => {
                let nodeController = this.nodeControllerMap.get(componentId);
                // 将获取到的同层区域的事件发送到该区域embedId对应的nodeController上。
                if (nodeController?.getEmbedId() === mouse.embedId) {
                  let ret = nodeController?.postInputEvent(mouse.mouseEvent as MouseEvent);
                  if (ret) {
                    console.info('onNativeEmbedMouseEvent success ' + componentId);
                  } else {
                    console.info('onNativeEmbedMouseEvent fail ' + componentId);
                  }
                  if (mouse.result) {
                    // 通知Web组件鼠标事件消费结果。
                    mouse.result?.setMouseEventResult(ret as boolean);
                  }
                }
              })
            })
        }
      }
    }
  }
}
// [End nodecontroller]