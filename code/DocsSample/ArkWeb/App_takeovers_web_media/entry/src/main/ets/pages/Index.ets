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
// [Start Enable Native_Media_Player]
// [Start AVPlayer for Web Playback]
import { webview } from '@kit.ArkWeb';
// [StartExclude Enable Native_Media_Player]
import { BuilderNode, FrameNode, NodeController, NodeRenderType } from '@kit.ArkUI';
import { AVPlayerDemo, AVPlayerListener } from './PlayerDemo';

// 实现 webview.NativeMediaPlayerBridge 接口。
// ArkWeb 内核调用该类的方法来对 NativeMediaPlayer 进行播控。
class NativeMediaPlayerImpl implements webview.NativeMediaPlayerBridge {
  private surfaceId: string;
  mediaSource: string;
  private mediaHandler: webview.NativeMediaPlayerHandler;
  nativePlayerInfo: NativePlayerInfo;
  nativePlayer: AVPlayerDemo;
  httpHeaders: Record<string, string>;
  uiContext?: UIContext;

  constructor(nativePlayerInfo: NativePlayerInfo,
              handler: webview.NativeMediaPlayerHandler,
              mediaInfo: webview.MediaInfo,
              uiContext: UIContext) {
    this.uiContext = uiContext;
    console.info(`NativeMediaPlayerImpl.constructor, surfaceId[${mediaInfo.surfaceInfo.id}]`);
    this.nativePlayerInfo = nativePlayerInfo;
    this.mediaHandler = handler;
    this.surfaceId = mediaInfo.surfaceInfo.id;
    this.mediaSource = mediaInfo.mediaSrcList.find((item) => item.source.indexOf('.mp4') > 0)?.source ||
      mediaInfo.mediaSrcList[0].source;
    this.httpHeaders = mediaInfo.headers;
    this.nativePlayer = new AVPlayerDemo();

    // 使用同层渲染功能，将视频及其播控组件绘制到网页中
    this.nativePlayerInfo.node_controller = new MyNodeController(
      this.nativePlayerInfo, this.surfaceId, this.mediaHandler, this, NodeRenderType.RENDER_TYPE_TEXTURE);
    this.nativePlayerInfo.node_controller.build();
    this.nativePlayerInfo.show_native_media_player = true;

    console.info(`NativeMediaPlayerImpl.mediaSource: ${this.mediaSource}, headers: ${JSON.stringify(this.httpHeaders)}`);
  }

  updateRect(x: number, y: number, width: number, height: number) {
    // <video> 标签的位置和大小发生了变化。
    // 根据该信息变化，作出相应的改变。
    let widthInVp = this.uiContext!.px2vp(width);
    let heightInVp = this.uiContext!.px2vp(height);
    console.info(`updateRect(${x}, ${y}, ${width}, ${height}), vp:{${widthInVp}, ${heightInVp}}`);

    this.nativePlayerInfo.updateNativePlayerRect(x, y, width, height);
  }

  play() {
    // 启动本地播放器播放。
    console.info('NativeMediaPlayerImpl.play');
    this.nativePlayer.play();
  }
  pause() {
    // 暂停本地播放器播放。
    console.info('NativeMediaPlayerImpl.pause');
    this.nativePlayer.pause();
  }
  seek(targetTime: number) {
    // 本地播放器跳转到指定的时间点。
    console.info(`NativeMediaPlayerImpl.seek(${targetTime})`);
    this.nativePlayer.seek(targetTime);
  }
  setVolume(volume: number) {
    // ArkWeb 内核要求调整本地播放器的音量。
    // 设置本地播放器的音量。
    console.info(`NativeMediaPlayerImpl.setVolume(${volume})`);
    this.nativePlayer.setVolume(volume);
  }
  setMuted(muted: boolean) {
    // 将本地播放器静音或取消静音。
    console.info(`NativeMediaPlayerImpl.setMuted(${muted})`);
  }
  setPlaybackRate(playbackRate: number) {
    // 调整本地播放器的播放速度。
    console.info(`NativeMediaPlayerImpl.setPlaybackRate(${playbackRate})`);
    this.nativePlayer.setPlaybackRate(playbackRate);
  }
  release() {
    // 销毁本地播放器。
    console.info('NativeMediaPlayerImpl.release');
    this.nativePlayer?.release();
    this.nativePlayerInfo.show_native_media_player = false;
    this.nativePlayerInfo.node_width = 300;
    this.nativePlayerInfo.node_height = 150;
    this.nativePlayerInfo.destroyed();
  }
  enterFullscreen() {
    // 将本地播放器设置为全屏播放。
    console.info('NativeMediaPlayerImpl.enterFullscreen');
  }
  exitFullscreen() {
    // 将本地播放器退出全屏播放。
    console.info('NativeMediaPlayerImpl.exitFullscreen');
  }
}

// 监听NativeMediaPlayer的状态，然后通过 webview.NativeMediaPlayerHandler 将状态上报给 ArkWeb 内核。
class AVPlayerListenerImpl implements AVPlayerListener {
  handler: webview.NativeMediaPlayerHandler;
  component: NativePlayerComponent;

  constructor(handler: webview.NativeMediaPlayerHandler, component: NativePlayerComponent) {
    this.handler = handler;
    this.component = component;
  }
  onPlaying() {
    // 通知ArkWeb内核，本地播放器开始播放
    console.info('AVPlayerListenerImpl.onPlaying');
    this.handler.handleStatusChanged(webview.PlaybackStatus.PLAYING);
  }
  onPaused() {
    // 通知ArkWeb内核，本地播放器暂停播放
    console.info('AVPlayerListenerImpl.onPaused');
    this.handler.handleStatusChanged(webview.PlaybackStatus.PAUSED);
  }
  onDurationChanged(duration: number) {
    // 通知ArkWeb内核，本地播放器解析到了新的媒体时长
    console.info(`AVPlayerListenerImpl.onDurationChanged(${duration})`);
    this.handler.handleDurationChanged(duration);
  }
  onBufferedTimeChanged(buffered: number) {
    // 通知ArkWeb内核，本地播放器的缓存时长变化
    console.info(`AVPlayerListenerImpl.onBufferedTimeChanged(${buffered})`);
    this.handler.handleBufferedEndTimeChanged(buffered);
  }
  onTimeUpdate(time: number) {
    // 通知ArkWeb内核，本地播放进度发生变化
    this.handler.handleTimeUpdate(time);
  }
  onEnded() {
    // 通知ArkWeb内核，本地播放器播放完成
    console.info('AVPlayerListenerImpl.onEnded');
    this.handler.handleEnded();
  }
  onError() {
    // 通知ArkWeb内核，本地播放器出错了
    console.error('AVPlayerListenerImpl.onError');
    this.component.has_error = true;
    setTimeout(()=>{
      this.handler.handleError(1, 'Oops!');
    }, 200);
  }
  onVideoSizeChanged(width: number, height: number) {
    // 通知ArkWeb内核，视频尺寸发生变化
    console.info(`AVPlayerListenerImpl.onVideoSizeChanged(${width}, ${height})`);
    this.handler.handleVideoSizeChanged(width, height);
    this.component.onSizeChanged(width, height);
  }
  onDestroyed(): void {
    // 播放器销毁
    console.info('AVPlayerListenerImpl.onDestroyed');
  }
}

interface ComponentParams {
  text: string;
  text2: string;
  playerInfo: NativePlayerInfo;
  handler: webview.NativeMediaPlayerHandler;
  player: NativeMediaPlayerImpl;
}

// 自定义的播放器组件
@Component
struct NativePlayerComponent {
  params?: ComponentParams;
  @State bgColor: Color = Color.Red;
  mXComponentController: XComponentController = new XComponentController();

  videoController: VideoController = new VideoController();
  offset_x: number = 0;
  offset_y: number = 0;
  @State video_width_percent: number = 100;
  @State video_height_percent: number = 100;
  view_width: number = 0;
  view_height: number = 0;
  video_width: number = 0;
  video_height: number = 0;

  fullscreen: boolean = false;
  @State has_error: boolean = false;

  onSizeChanged(width: number, height: number) {
    // 更新播放区域比例
    this.video_width = width;
    this.video_height = height;
    let scale: number = this.view_width / width;
    let scaledVideoHeight: number = scale * height;
    this.video_height_percent = scaledVideoHeight / this.view_height * 100;
    console.info(`NativePlayerComponent.onSizeChanged(${width},${height}), video_height_percent[${this.video_height_percent }]`);
  }

  build() {
    Column() {
      Stack() {
        XComponent({ id: 'video_player_id', type: 0 as XComponentType, controller: this.mXComponentController })
          .width(this.video_width_percent + '%')
          .height(this.video_height_percent + '%')
          .onLoad(()=>{
            if (!this.params) {
              console.info('this.params is null');
              return;
            }
            console.info('NativePlayerComponent.onLoad, params[' + this.params +
              '], text[' + this.params.text + '], text2[' + this.params.text2 +
              '], web_tab[' + this.params.playerInfo + '], handler[' + this.params.handler + ']');
            // 设置渲染表面ID到播放器
            this.params.player.nativePlayer.setSurfaceID(this.mXComponentController.getXComponentSurfaceId());

            this.params.player.nativePlayer.avPlayerLiveDemo({
              url: this.params.player.mediaSource,
              listener: new AVPlayerListenerImpl(this.params.handler, this),
              httpHeaders: this.params.player.httpHeaders,
            });
          })
        Column() {
          Row() {
            Button(this.params?.text)
              .height(50)
              .border({ width: 2, color: Color.Red })
              .backgroundColor(this.bgColor)
              .onClick(()=>{
                console.info(`NativePlayerComponent.Button[${this.params?.text}] is clicked`);
                this.params?.player.nativePlayer?.play();
              })
              .onTouch((event: TouchEvent) => {
                event.stopPropagation();
              })
            Button(this.params?.text2)
              .height(50)
              .border({ width: 2, color: Color.Red })
              .onClick(()=>{
                console.info(`NativePlayerComponent.Button[${this.params?.text2}] is clicked`);
                this.params?.player.nativePlayer?.pause();
              })
              .onTouch((event: TouchEvent) => {
                event.stopPropagation();
              })
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceEvenly)
        }
        if (this.has_error) {
          Column() {
            Text('Error')
              .fontSize(30)
          }
          .backgroundColor('#eb5555')
          .width('100%')
          .height('100%')
          .justifyContent(FlexAlign.Center)
        }
      }
    }
    .width('100%')
    .height('100%')
    .onAreaChange((oldValue: Area, newValue: Area) => {
      // 当组件区域发生变化时触发
      console.info(`NativePlayerComponent.onAreaChange(${JSON.stringify(oldValue)}, ${JSON.stringify(newValue)})`);
      this.view_width = Number(newValue.width);
      this.view_height = Number(newValue.height);
      this.onSizeChanged(this.video_width, this.video_height);
    })
  }
}

@Builder
function nativePlayerComponentBuilder(params: ComponentParams) {
  NativePlayerComponent({ params: params })
    .backgroundColor(Color.Green)
    .border({ width: 1, color: Color.Brown })
    .width('100%')
    .height('100%')
}

// 通过 NodeController 动态创建自定义的播放器组件，并将组件内容绘制到内核提供的渲染表面上。
class MyNodeController extends NodeController {
  private rootNode: BuilderNode<[ComponentParams]> | undefined;
  playerInfo: NativePlayerInfo;
  listener: webview.NativeMediaPlayerHandler;
  player: NativeMediaPlayerImpl;

  constructor(playerInfo: NativePlayerInfo,
                surfaceId: string,
                listener: webview.NativeMediaPlayerHandler,
                player: NativeMediaPlayerImpl,
                renderType: NodeRenderType) {
    super();
    this.playerInfo = playerInfo;
    this.listener = listener;
    this.player = player;
    let uiContext = AppStorage.get<UIContext>('UIContext');
    this.rootNode = new BuilderNode(uiContext as UIContext, { surfaceId: surfaceId, type: renderType });
    console.info(`MyNodeController, rootNode[${this.rootNode}], playerInfo[${playerInfo}], listener[${listener}], surfaceId[${surfaceId}]`);
  }

  makeNode(): FrameNode | null {
    if (this.rootNode) {
      return this.rootNode.getFrameNode() as FrameNode;
    }
    return null;
  }

  build() {
    let params: ComponentParams = {
      'text': 'play',
      'text2': 'pause',
      playerInfo: this.playerInfo,
      handler: this.listener,
      player: this.player
    };
    if (this.rootNode) {
      this.rootNode.build(wrapBuilder(nativePlayerComponentBuilder), params);
    }
  }

  postTouchEvent(event: TouchEvent) {
    return this.rootNode?.postTouchEvent(event);
  }
}

class Rect {
  x: number = 0;
  y: number = 0;
  width: number = 0;
  height: number = 0;

  static toNodeRect(rectInPx: webview.RectEvent, uiContext: UIContext) : Rect {
    let rect = new Rect();
    rect.x = uiContext.px2vp(rectInPx.x);
    rect.y = uiContext.px2vp(rectInPx.y);
    rect.width = uiContext.px2vp(rectInPx.width);
    rect.height = uiContext.px2vp(rectInPx.height);
    return rect;
  }
}

@Observed
class NativePlayerInfo {
  public web: WebComponent;
  public embed_id: string;
  public player: webview.NativeMediaPlayerBridge;
  public node_controller?: MyNodeController;
  public show_native_media_player: boolean = false;
  public node_pos_x: number;
  public node_pos_y: number;
  public node_width: number;
  public node_height: number;

  playerComponent?: NativeMediaPlayerComponent;

  constructor(web: WebComponent,
              handler: webview.NativeMediaPlayerHandler,
              videoInfo: webview.MediaInfo,
              uiContext: UIContext) {
    this.web = web;
    this.embed_id = videoInfo.embedID;

    let nodeRect = Rect.toNodeRect(videoInfo.surfaceInfo.rect, uiContext);
    this.node_pos_x = nodeRect.x;
    this.node_pos_y = nodeRect.y;
    this.node_width = nodeRect.width;
    this.node_height = nodeRect.height;

    this.player = new NativeMediaPlayerImpl(this, handler, videoInfo, uiContext);
  }

  updateNativePlayerRect(x: number, y: number, width: number, height: number) {
    // 更新播放器的位置和大小
    this.playerComponent?.updateNativePlayerRect(x, y, width, height);
  }

  destroyed() {
    let infoList = this.web.native_player_info_list;
    console.info(`NativePlayerInfo[${this.embed_id}] destroyed, list.size[${infoList.length}]`);
    this.web.native_player_info_list = infoList.filter((item) => item.embed_id != this.embed_id);
    console.info(`NativePlayerInfo after destroyed, new_list.size[${this.web.native_player_info_list.length}]`);
  }
}

@Component
struct NativeMediaPlayerComponent {
  @ObjectLink playerInfo: NativePlayerInfo;

  aboutToAppear() {
    this.playerInfo.playerComponent = this;
  }

  build() {
    NodeContainer(this.playerInfo.node_controller)
      .width(this.playerInfo.node_width)
      .height(this.playerInfo.node_height)
      .offset({x: this.playerInfo.node_pos_x, y: this.playerInfo.node_pos_y})
      .backgroundColor(Color.Transparent)
      .border({ width: 2, color: Color.Orange })
      .onAreaChange((oldValue, newValue) => {
        console.info(`NodeContainer[${this.playerInfo.embed_id}].onAreaChange([${oldValue.width} x ${oldValue.height}]->[${newValue.width} x ${newValue.height}])`);
      })
  }

  updateNativePlayerRect(x: number, y: number, width: number, height: number) {
    let nodeRect = Rect.toNodeRect({x, y, width, height}, this.getUIContext());
    this.playerInfo.node_pos_x = nodeRect.x;
    this.playerInfo.node_pos_y = nodeRect.y;
    this.playerInfo.node_width = nodeRect.width;
    this.playerInfo.node_height = nodeRect.height;
  }
}

// [EndExclude Enable Native_Media_Player]
@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();

  // [StartExclude Enable Native_Media_Player]
  @State native_player_info_list: NativePlayerInfo[] = [];

  area?: Area;

  // [EndExclude Enable Native_Media_Player]
  build() {
    Column() {
      // [StartExclude Enable Native_Media_Player]
      Stack({alignContent: Alignment.TopStart}) {
        ForEach(this.native_player_info_list, (item: NativePlayerInfo) => {
          if (item.show_native_media_player) {
            NativeMediaPlayerComponent({ playerInfo: item })
          }
        }, (item: NativePlayerInfo) => {
          return item.embed_id;
        })
        // [EndExclude Enable Native_Media_Player]
        Web({ src: $rawfile('main.html'), controller: this.controller })
          .cacheMode(CacheMode.Online)
          .enableNativeMediaPlayer({ enable: true, shouldOverlay: true })
          // [StartExclude Enable Native_Media_Player]
          .onPageBegin(() => {
            // 页面开始加载时，注册播放器创建回调
            this.controller.onCreateNativeMediaPlayer((handler: webview.NativeMediaPlayerHandler, mediaInfo: webview.MediaInfo) => {
              console.info('onCreateNativeMediaPlayer(' + JSON.stringify(mediaInfo) + ')');
              let nativePlayerInfo = new NativePlayerInfo(this, handler, mediaInfo, this.getUIContext());
              this.native_player_info_list.push(nativePlayerInfo);
              return nativePlayerInfo.player;
            });
          })
          .onNativeEmbedGestureEvent((event)=>{
            // 处理触摸事件
            if (!event.touchEvent || !event.embedId) {
              event.result?.setGestureEventResult(false);
              return;
            }
            console.info(`WebComponent.onNativeEmbedGestureEvent, embedId[${event.embedId}]`);
            // 查找对应的播放器信息
            let nativePlayerInfo = this.getNativePlayerInfoByEmbedId(event.embedId);
            if (!nativePlayerInfo && this.native_player_info_list.length == 1) {
              nativePlayerInfo = this.native_player_info_list[0];
            }
            if (!nativePlayerInfo) {
              console.info(`WebComponent.onNativeEmbedGestureEvent, embedId[${event.embedId}], no native_player_info`);
              event.result?.setGestureEventResult(false);
              return;
            }
            if (!nativePlayerInfo.node_controller) {
              console.info(`WebComponent.onNativeEmbedGestureEvent, embedId[${event.embedId}], no node_controller`);
              event.result?.setGestureEventResult(false);
              return;
            }
            // 将触摸事件传递给NodeController
            let ret = nativePlayerInfo.node_controller.postTouchEvent(event.touchEvent);
            console.info(`WebComponent.postTouchEvent, ret[${ret}], touchEvent[${JSON.stringify(event.touchEvent)}]`);
            event.result?.setGestureEventResult(ret);
          })
          .width('100%')
          .height('100%')
          .onAreaChange((oldValue: Area, newValue: Area) => {
            oldValue;
            this.area = newValue;
          })
          // [EndExclude Enable Native_Media_Player]
      }
    }
  }
  // [End Enable Native_Media_Player]

  getNativePlayerInfoByEmbedId(embedId: string) : NativePlayerInfo | undefined {
    return this.native_player_info_list.find((item)=> item.embed_id == embedId);
  }
}
// [End AVPlayer for Web Playback]