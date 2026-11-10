/*
 * Copyright (C) 2026 HiHope Open Source Organization.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { display, router } from '@kit.ArkUI';
import { Log } from 'library';
import { Callback, emitter } from '@kit.BasicServicesKit';
import { common, Want } from '@kit.AbilityKit';
import {
  DeviceConnectListener,
  onConnectCallback,
  onDisconnectCallback
} from '../serviceextability/DeviceConnectListener';
import MiracastPlayerServiceClient from '../serviceextability/MiracastPlayerServiceClient';
import { KeyCode } from '@kit.InputKit';

const TAG = 'PlayerPage';
// Render layer type: use the numeric surface rendering value of XComponentType instead of a platform enum literal
const PLAYER_RENDER_TYPE: XComponentType = 0;
type DisconnectCallback = (deviceId: string) => void;

class MyListener extends DeviceConnectListener {
  private disconnectCallback?: DisconnectCallback;

  setDisconnectCallback(callback: DisconnectCallback) {
    this.disconnectCallback = callback;
  }

  onConnect(deviceId: string, deviceName: string, deviceType: number, callback: onConnectCallback): void {
    Log.info(TAG, 'MyListener.onConnect');
    callback(0);
  }

  onDisconnect(deviceId: string, callback: onDisconnectCallback): void {
    Log.info(TAG, 'MyListener.onDisconnect');
    callback(0);
    if (this.disconnectCallback) {
      this.disconnectCallback(deviceId);
    }
  }
}

/**
 * Entity class for multi-stream data
 */
@Observed
class PlayerItem {
  public id: string;
  public deviceId: string;
  public surfaceId: string;
  public controller: CustomXComponentController;
  public isSurfaceSet: boolean;
  public index: number;
  public color: string;
  public isFocused: boolean = false;
  public layoutWidth: string = '100%';
  public layoutHeight: string = '100%';
  public layoutX: string | number = 0;
  public layoutY: string | number = 0;

  constructor(deviceId: string, color: string) {
    this.id = deviceId;
    this.deviceId = deviceId;
    this.surfaceId = '';
    this.controller = new CustomXComponentController(deviceId);
    this.isSurfaceSet = false;
    this.index = 0;
    this.color = color;
  }
}

@Entry
@Component
struct PlayerPage {
  @State screenWidth: number = display.getDefaultDisplaySync().width;
  @State screenHeight: number = display.getDefaultDisplaySync().height;
  @State playerList: PlayerItem[] = [];
  @State serviceIsConnected: boolean = false;
  private client: MiracastPlayerServiceClient | null = null;
  private listener = new MyListener('PlayerPage');
  private connectId: number = -1;
  private isExiting: boolean = false;
  @State currentIndex: number = 0;
  @State isFullScreen: boolean = false;

  // Mask device ID in logs: keep only the first 4 characters to avoid exposing the full ID
  private maskDeviceId(deviceId: string): string {
    if (!deviceId || deviceId.length <= 4) {
      return '****';
    }
    return deviceId.substring(0, 4) + '****';
  }

  private getRandomColor(): string {
    const r = Math.floor(Math.random() * 200);
    const g = Math.floor(Math.random() * 200);
    const b = Math.floor(Math.random() * 200);
    return `rgb(${r},${g},${b})`;
  }

  aboutToAppear(): void {
    globalThis.playerShow = true;
    globalThis.playerForceDisconnect = () => {
      this.exitAndDisconnect('abilityBackground', false);
    };
    Log.info(TAG, 'aboutToAppear');
    this.connectService();

    let event: emitter.InnerEvent = { eventId: 1001 };
    emitter.on(event, (eventData: emitter.EventData) => {
      // Entry for multi-stream mode, triggered when a device joins
      if (eventData && eventData.data) {
        Log.info(TAG, `event 1001 data.device: ${JSON.stringify(eventData.data.device)}`);
        let deviceId: string = eventData.data.device;
        this.addPlayer(deviceId);
      } else {
        Log.error(TAG, 'No data received from emitter event 1001');
      }
    });
  }

  aboutToDisappear(): void {
    Log.info(TAG, 'aboutToDisappear');
    this.exitAndDisconnect('aboutToDisappear', false);
  }

  onBackPress(): boolean | void {
    Log.info(TAG, 'onBackPress');
    if (this.isFullScreen) {
      Log.info(TAG, 'Exit FullScreen Mode');
      this.isFullScreen = false;
      this.updatePlayerLayout();
      this.refreshFocusAndAudio();
      return true;
    }
    this.exitAndDisconnect('onBackPress', true);
    return true;
  }

  private exitAndDisconnect(reason: string, needBack: boolean): void {
    if (this.isExiting) {
      if (needBack) {
        router.back();
      }
      return;
    }
    this.isExiting = true;
    Log.info(TAG, `exitAndDisconnect reason:${reason}, needBack:${needBack}`);

    globalThis.playerShow = false;
    globalThis.playerForceDisconnect = undefined;
    emitter.off(1001);

    const context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
    let isFinished = false;
    const finalize = () => {
      if (isFinished) {
        return;
      }
      isFinished = true;
      // Mark that reconnect is needed after leaving the projection page, so Index does not reuse a stale client and cause races.
      globalThis.playerNeedReconnect = true;
      try {
        if (this.connectId >= 0) {
          context.disconnectServiceExtensionAbility(this.connectId);
          this.connectId = -1;
        }
      } catch (error) {
        Log.error(TAG, `disconnectServiceExtensionAbility failed: ${JSON.stringify(error)}`);
      }
      this.client = null;
      this.serviceIsConnected = false;
      this.playerList = [];
      if (needBack) {
        router.back();
      }
    };

    this.stopAll(() => {
      this.client?.stopMiracastService((errCode, returnValueVar) => {
        Log.info(TAG, `stopMiracastService callback errcode:${errCode}, returnValue:${returnValueVar}`);
        finalize();
      });
      // Prevent the page from hanging on exception callbacks
      setTimeout(() => {
        finalize();
      }, 1200);
    });
  }

  /**
   * Handle key events and move focus
   */
  private handleKeyEvent(event: KeyEvent) {
    if (event.type !== KeyType.Down) {
      return;
    }

    const count = this.playerList.length;
    if (count === 0) {
      return;
    }
    if (event.keyCode === KeyCode.KEYCODE_ENTER ||
      event.keyCode === KeyCode.KEYCODE_DPAD_CENTER) {
      if (!this.isFullScreen) {
        this.enterFullScreen();
        return;
      }
    }

    let nextIndex = this.currentIndex;

    // Full-screen mode
    if (this.isFullScreen) {
      switch (event.keyCode) {
        case KeyCode.KEYCODE_DPAD_LEFT:
          nextIndex = (this.currentIndex + 1) % count;
          break;
        case KeyCode.KEYCODE_DPAD_RIGHT:
          nextIndex = (this.currentIndex - 1 + count) % count;
          break;
      }
      if (nextIndex !== this.currentIndex) {
        Log.info(TAG, `FullScreen Switch: ${this.currentIndex} -> ${nextIndex}`);
        this.currentIndex = nextIndex;
        this.refreshFocusAndAudio();
        this.updatePlayerLayout();
      }
    } else {
      // Equal-split mode
      let columns = 1;
      if (count === 2) {
        columns = 2;
      } else if (count > 2 && count <= 4) {
        columns = 2;
      } else if (count > 4) {
        columns = 3;
      }
      switch (event.keyCode) {
        case KeyCode.KEYCODE_DPAD_LEFT:
          if (this.currentIndex % columns !== 0) {
            nextIndex = this.currentIndex - 1;
          }
          break;
        case KeyCode.KEYCODE_DPAD_RIGHT:
          if (this.currentIndex % columns !== (columns - 1) && (this.currentIndex + 1 < count)) {
            nextIndex = this.currentIndex + 1;
          }
          break;
        case KeyCode.KEYCODE_DPAD_UP:
          if (this.currentIndex - columns >= 0) {
            nextIndex = this.currentIndex - columns;
          }
          break;
        case KeyCode.KEYCODE_DPAD_DOWN:
          if (this.currentIndex + columns < count) {
            nextIndex = this.currentIndex + columns;
          }
          break;
      }
      if (nextIndex !== this.currentIndex) {
        Log.info(TAG, `Grid Focus moved: ${this.currentIndex} -> ${nextIndex}`);
        this.currentIndex = nextIndex;
        this.refreshFocusAndAudio();
      }
    }
  }

  /**
   * Refresh focus state and control audio
   */
  private refreshFocusAndAudio() {
    if (this.playerList.length === 0) {
      Log.info(TAG, 'No playerList to refresh');
      return;
    }

    // 1. Fix out-of-range index
    if (this.currentIndex >= this.playerList.length) {
      this.currentIndex = this.playerList.length - 1;
    }
    if (this.currentIndex < 0) {
      this.currentIndex = 0;
    }

    // 2. Update UI state
    this.playerList.forEach((item, index) => {
      item.isFocused = (index === this.currentIndex);
    });

    // 3. Update audio state
    this.updateAudioOutput();
  }

  /**
   * Mutually exclusive audio control
   * Iterate all devices: only the focused device is unmuted, the others are muted
   */
  private updateAudioOutput() {
    if (!this.client || !this.serviceIsConnected) {
      return;
    }

    this.playerList.forEach((item) => {
      const needMute = !item.isFocused;
      Log.info(TAG, `[AudioControl] device:${this.maskDeviceId(item.deviceId)} ${needMute ? 'MUTE' : 'UNMUTE'}`);
      if (needMute) {
        this.client?.mute(item.deviceId, (errCode: number, returnValue: number) => {
          if (errCode == 0 && returnValue == 0) {
            Log.info(TAG, `[AudioControl] mute callback errcode:${errCode}, returnValue:${returnValue}`);
          } else {
            Log.error(TAG, `[AudioControl] mute callback errcode:${errCode}, returnValue:${returnValue}`);
          }
        });
      } else {
        this.client?.unMute(item.deviceId, (errCode: number, returnValue: number) => {
          if (errCode == 0 && returnValue == 0) {
            Log.info(TAG, `[AudioControl] unmute callback errcode:${errCode}, returnValue:${returnValue}`);
          } else {
            Log.error(TAG, `[AudioControl] unmute callback errcode:${errCode}, returnValue:${returnValue}`);
          }
        });
      }
    });
  }

  /**
   * Add one playback stream
   */
  private addPlayer(deviceId: string): void {
    if (!deviceId) {
      return;
    }
    let exist = this.playerList.find(item => item.deviceId === deviceId);
    if (exist) {
      Log.info(TAG, `addPlayer: device already exist, deviceId:${this.maskDeviceId(deviceId)}`);
      return;
    }

    Log.info(TAG, 'addPlayer');

    const newItem = new PlayerItem(
      deviceId,
      this.getRandomColor(),
    );

    this.playerList.push(newItem);

    // Select by default if this is the first device
    if (this.playerList.length === 1) {
      this.currentIndex = 0;
    }

    // Update layout immediately
    this.updatePlayerLayout();
    // Refresh focus and audio
    this.refreshFocusAndAudio();
  }

  /**
   * Remove one playback stream
   */
  private removePlayer(deviceId: string): void {
    const index = this.playerList.findIndex(item => item.deviceId === deviceId);
    if (index === -1) {
      return;
    }
    Log.info(TAG, 'removePlayer');

    this.playerList.splice(index, 1);
    if (this.playerList.length <= 1 && this.isFullScreen) {
      Log.info(TAG, 'Device count drops to 1, auto exit FullScreen');
      this.isFullScreen = false;
    }
    setTimeout(() => {
      Log.info(TAG, 'removePlayer: delay update layout start');
      this.updatePlayerLayout();
      this.refreshFocusAndAudio();
    }, 50);
  }

  /**
   * Core layout update method
   * Handles both full-screen mode and equal-split mode
   */
  private updatePlayerLayout(): void {
    const count = this.playerList.length;
    Log.info(TAG, `>>> updatePlayerLayout START: count=${count}`);
    this.playerList.forEach((item, idx) => {
      item.index = idx;
      if (this.isFullScreen) {
        // Full-screen mode
        if (idx === this.currentIndex) {
          item.layoutWidth = '100%';
          item.layoutHeight = '100%';
          item.layoutX = 0;
          item.layoutY = 0;
        } else {
          item.layoutWidth = '0%';
          item.layoutHeight = '0%';
          item.layoutX = '50%'; // Better visual effect when disappearing from the center
          item.layoutY = '50%';
        }
      } else {
        // Equal-split mode supports up to 9 streams
        if (count === 1) {
          // 1 stream: full screen
          item.layoutWidth = '100%';
          item.layoutHeight = '100%';
          item.layoutX = 0;
          item.layoutY = 0;
        } else if (count === 2) {
          // 2 streams: side by side, vertically centered
          item.layoutWidth = '50%';
          item.layoutHeight = '50%';
          item.layoutX = (idx === 0) ? 0 : '50%';
          item.layoutY = '25%';
        } else if (count <= 4) {
          // 3-4 streams: 2x2 grid
          item.layoutWidth = '50%';
          item.layoutHeight = '50%';
          item.layoutX = (idx % 2 === 0) ? 0 : '50%';
          item.layoutY = (Math.floor(idx / 2) === 0) ? 0 : '50%';
        } else {
          // 3x3 grid
          item.layoutWidth = '33.33%';
          item.layoutHeight = '33.33%';
          let col = idx % 3;
          item.layoutX = (col === 0) ? 0 : (col === 1 ? '33.33%' : '66.66%');
          let row = Math.floor(idx / 3);
          item.layoutY = (row === 0) ? 0 : (row === 1 ? '33.33%' : '66.66%');
        }
      }
    });
  }

  private updatePlayerSurface(deviceId: string, surfaceId: string): void {
    if (!deviceId || !surfaceId) {
      Log.info(TAG, `updatePlayerSurface: deviceId:${this.maskDeviceId(deviceId)}, surfaceId:${surfaceId}`);
      return;
    }
    let index: number = this.playerList.findIndex((item: PlayerItem) => item.deviceId === deviceId);
    if (index === -1) {
      Log.info(TAG, `updatePlayerSurface: deviceId:${this.maskDeviceId(deviceId)} not found`);
      return;
    }

    if (this.playerList[index].surfaceId === surfaceId) {
      Log.info(TAG, `updatePlayerSurface: deviceId:${this.maskDeviceId(deviceId)}, surfaceId:${surfaceId} already set`);
      return;
    }

    this.playerList[index].surfaceId = surfaceId;
    Log.info(TAG, 'updatePlayerScreen');

    this.tryStartPlayer(deviceId);
  }

  private tryStartPlayer(deviceId: string): void {
    if (!this.client || !this.serviceIsConnected) {
      return;
    }
    const index = this.playerList.findIndex(item => item.deviceId === deviceId);
    if (index === -1) {
      Log.info(TAG, `tryStartPlayer: deviceId:${this.maskDeviceId(deviceId)} not found`);
      return;
    }
    const item = this.playerList[index];

    if (!item.surfaceId) {
      Log.info(TAG, `tryStartPlayer: deviceId:${this.maskDeviceId(deviceId)} has no surfaceId`);
      return;
    }
    if (item.isSurfaceSet) {
      Log.info(TAG, `tryStartPlayer: deviceId:${this.maskDeviceId(deviceId)} surfaceId:${item.surfaceId} already set`);
      return;
    }

    Log.info(TAG, `tryStartPlayer: start setSurface, deviceId:${this.maskDeviceId(deviceId)}, surfaceId:${item.surfaceId}`);

    this.setSurface(item.surfaceId, deviceId, () => {
      this.start(deviceId, () => {
        const idx = this.playerList.findIndex(p => p.deviceId === deviceId);
        if (idx !== -1) {
          this.playerList[idx].isSurfaceSet = true;
          // TODO No audio readiness callback yet, use a 1-second empirical delay
          setTimeout(() => {
            Log.info(TAG, `tryStartPlayer: delay executed, syncing audio for device:${this.maskDeviceId(deviceId)}`);
            this.updateAudioOutput();
          }, 1000);
        }
        Log.info(TAG, 'tryStartPlayer done');
      });
    });
  }

  private stopAll(callback?: Callback<void>): void {
    if (!this.client) {
      if (callback) {
        callback();
      }
      return;
    }
    const deviceIds: string[] = this.playerList.map(item => item.deviceId).filter(id => !!id);
    if (deviceIds.length === 0) {
      if (callback) {
        callback();
      }
      return;
    }
    let remain = deviceIds.length;
    deviceIds.forEach(deviceId => {
      this.client?.stop(deviceId, (errCode: number, returnValue: number) => {
        remain--;
        if (remain === 0 && callback) {
          callback();
        }
      });
    });
  }

  private connectService() {
    Log.info(TAG, 'connectService');
    let want: Want = {
      bundleName: 'com.samples.miracast',
      abilityName: 'ServiceExtTvAbility'
    };

    let options: common.ConnectOptions = {
      onConnect: (elementName, remote) => {
        Log.info(TAG, 'ServiceExtensionAbility callback onConnect');
        this.client = new MiracastPlayerServiceClient(remote);

        this.listener.setDisconnectCallback((deviceId: string) => {
          Log.info(TAG, 'setDisconnectCallback');
          this.removePlayer(deviceId);
          Log.info(TAG, 'setDisconnectCallback device count is ' + this.playerList.length);
          if (this.playerList.length === 0) {
            Log.info(TAG, 'All players disconnected, back');
            let context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
            context.disconnectServiceExtensionAbility(this.connectId);
            router.back();
          }
        });

        this.client.registerDeviceConnectListener(this.listener, (errCode: number, returnValue: number) => {
          Log.info(TAG, `registerDeviceConnectListener ret:${returnValue}`);
        });

        this.serviceIsConnected = true;
        this.playerList.forEach(item => {
          this.tryStartPlayer(item.deviceId);
        });
      },

      onDisconnect: (elementName) => {
        this.client = null;
        this.serviceIsConnected = false;
      },
      onFailed: (code) => {
        this.serviceIsConnected = false;
      }
    };

    let context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
    this.connectId = context.connectServiceExtensionAbility(want, options);
  }

  private setSurface(surfaceId: string, deviceId: string, callback: Callback<void>) {
    this.client?.setSurface(surfaceId, (errCode: number, returnValue: number) => {
      if (returnValue == 0) {
        callback();
      } else {
        Log.error(TAG, `setSurface failed: ${returnValue}`);
      }
    }, deviceId);
  }

  private start(deviceId: string, callback?: Callback<void>) {
    this.client?.play(deviceId, (errCode: number, returnValue: number) => {
      if (returnValue == 0) {
        if (callback) {
          callback();
        }
      } else {
        Log.error(TAG, `play failed: ${returnValue}`);
      }
    });
  }

  build() {
    Stack() {
      ForEach(this.playerList, (item: PlayerItem) => {
        VideoWindow({
          item: item,
          totalCount: this.playerList.length,
          onSurfaceReady: (deviceId, surfaceId) => {
            this.updatePlayerSurface(deviceId, surfaceId);
          },
          onItemClick: () => {
            this.currentIndex = item.index;
            this.enterFullScreen();
          }
        });
      }, (item: PlayerItem) => item.id);
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
    .focusable(true)
    .defaultFocus(true)
    .onKeyEvent((event: KeyEvent) => {
      this.handleKeyEvent(event);
    });
  }

  private enterFullScreen() {
    if (this.playerList.length <= 1) {
      Log.info(TAG, 'Only one player, ignore Enter FullScreen');
      return;
    }
    Log.info(TAG, 'Enter FullScreen Mode');
    this.isFullScreen = true;
    this.updatePlayerLayout();
    this.refreshFocusAndAudio();
  }
}

@Component
struct VideoWindow {
  @ObjectLink item: PlayerItem;
  @Prop totalCount: number;
  @Prop isFullScreen: boolean;
  onItemClick: () => void = () => {
  };
  onSurfaceReady: (deviceId: string, surfaceId: string) => void = () => {
  };

  build() {
    Stack() {
      XComponent({
        type: PLAYER_RENDER_TYPE,
        controller: this.item.controller
      })
        .onLoad(() => {
          const surfaceId = this.item.controller.getXComponentSurfaceId();
          this.onSurfaceReady(this.item.deviceId, surfaceId);
        })
        .width('100%')
        .height('100%');
    }
    .width(this.item.layoutWidth)
    .height(this.item.layoutHeight)
    .position({ x: this.item.layoutX, y: this.item.layoutY })
    .backgroundColor(this.item.color)
    .border({
      width: (!this.isFullScreen && this.totalCount > 1 && this.item.isFocused) ? 2 : 0,
      color: Color.Gray,
      style: BorderStyle.Solid
    })
    .zIndex(this.isFullScreen ? (this.item.isFocused ? 2 : 0) : (this.item.isFocused ? 2 : 1))
    .onClick(() => {
      this.onItemClick();
    });
  }
}

class CustomXComponentController extends XComponentController {
  private tagDeviceId: string;

  constructor(deviceId?: string) {
    super();
    this.tagDeviceId = deviceId || 'unknown';
  }

  onSurfaceCreated(surfaceId: string): void {
    Log.info(TAG, '[Screen] Created');
  }

  onSurfaceChanged(surfaceId: string, rect: SurfaceRect): void {
    Log.info(TAG, '[Screen] Changed');
  }

  onSurfaceDestroyed(surfaceId: string): void {
    Log.info(TAG, '[Screen] Destroyed');
  }
}
