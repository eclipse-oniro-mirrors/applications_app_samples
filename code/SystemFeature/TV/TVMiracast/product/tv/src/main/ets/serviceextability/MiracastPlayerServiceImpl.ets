/*
 * Copyright (C) 2026 HiHope Open Source Organization.
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

import { DeviceConnectListener } from './DeviceConnectListener';
import MiracastPlayerServiceStub from './idl/MiracastPlayerServiceStub';
import { common } from '@kit.AbilityKit';
import { rpc } from '@kit.IPCKit';
import type { Want } from '@kit.AbilityKit';
import Cast from '@ohos.cast';
import { process } from '@kit.ArkTS';
import { Log, TrustDeviceManager, PermissionType } from 'library';
import { PermissionWindowManager } from '../utils/PermissionWindowManager';
import DeviceConnectListenerStub from './idl/DeviceConnectListenerStub';
import DeviceConnectListenerProxy from './idl/DeviceConnectListenerProxy';
import { HashMap } from '@kit.ArkTS';

type InterfaceCallback = (errCode: number, returnValue: number) => void;

const TAG = 'ServiceImpl';
const MOCK = false;

export default class MiracastPlayerServiceImpl extends MiracastPlayerServiceStub {
  private context?: common.ServiceExtensionContext;
  private session?: Cast.CastSession;
  private players: HashMap<string, Cast.MirrorPlayer> = new HashMap();
  private started: boolean = false;
  private listeners: Array<DeviceConnectListener> = [];
  private deviceMap: HashMap<string, Cast.CastRemoteDevice> = new HashMap();

  setContext(context: common.ServiceExtensionContext) {
    this.context = context;
  }

  checkCaller(): boolean {
    return (process.uid == this.getCallingUid());
  }

  private onServiceDieCallback = () => {
    Log.info(TAG, 'onServiceDie');
  }
  private onDeviceFoundCallback = (deviceList: Array<Cast.CastRemoteDevice>) => {
    Log.info(TAG, 'onDeviceFound ' + JSON.stringify(deviceList));
  }
  private onSessionCreateCallback = (castSession: Cast.CastSession) => {
    Log.info(TAG, 'onSessionCreate ' + JSON.stringify(castSession));
  }
  private onDeviceOfflineCallback = (deviceId: string) => {
    Log.info(TAG, 'onDeviceOffline');
  }
  private onEventCallback = (eventId: Cast.EventId, eventInfo: string) => {
    Log.info(TAG, 'onEvent eventId:' + eventId + ', eventInfo:' + eventInfo);
  }
  private onDeviceRequestCallback = (deviceList: Array<Cast.CastRemoteDevice>) => {
    Log.info(TAG, 'onDeviceRequest deviceList:' + JSON.stringify(deviceList));
    if (!this.context) {
      Log.error(TAG, 'no context!');
      return;
    }
    if (deviceList && deviceList.length > 0) {
      let device: Cast.CastRemoteDevice = deviceList[0];
      if (TrustDeviceManager.getIns().isDeviceTrusted(device.deviceId)) {
        this.deviceMap.set(device.deviceId, device);
        this.acceptDevice(device, true);
        return;
      }
      PermissionWindowManager.getIns().createWindow(this.context, device.deviceName, (type: PermissionType) => {
        Log.debug(TAG, 'onAuthResult:' + type);
        switch (type) {
          case PermissionType.FOREVER:
            TrustDeviceManager.getIns().addDeviceDataItem({
              id: device.deviceId,
              name: device.deviceName,
              type: device.deviceType,
              date: new Date()
            });
            this.acceptDevice(device, true);
            break;
          case PermissionType.ONCE:
            this.acceptDevice(device, true);
            break;
          case PermissionType.CANCEL:
            this.acceptDevice(device, false);
            break;
        }
      });
    }
  }
  private onDeviceStateCallback = (stateEvent: Cast.DeviceStateInfo) => {
    Log.info(TAG, 'onDeviceState state:' + JSON.stringify(stateEvent));
    if (stateEvent) {
      if (stateEvent.deviceState == Cast.DeviceState.CONNECTED) {
        let device = this.deviceMap.get(stateEvent.deviceId);
        for (let listener of this.listeners) {
          Log.debug(TAG, 'calling DeviceConnectListenerProxy.onConnect, listener:' + listener);
          new DeviceConnectListenerProxy(listener as rpc.IRemoteObject).onConnect(
            device.deviceId, device.deviceName, device.deviceType, (errCode: number) => {
          });
        }
        this.startMirrorPlayer(device);
      }
      if (stateEvent.deviceState == Cast.DeviceState.DISCONNECTED) {
        this.deviceMap.remove(stateEvent.deviceId);
        for (let listener of this.listeners) {
          Log.debug(TAG, 'calling DeviceConnectListenerProxy.onDisconnect, listener:' + listener);
          new DeviceConnectListenerProxy(listener as rpc.IRemoteObject).onDisconnect(stateEvent.deviceId, () => {
          });
        }
      }
    }
  }

  private acceptDevice(device: Cast.CastRemoteDevice, accept: boolean) {
    Log.info(TAG, 'acceptDevice deviceId:' + this.maskDeviceId(device.deviceId) + ', accept:' + accept);
    if (MOCK) {
      for (let listener of this.listeners) {
        Log.debug(TAG, 'calling DeviceConnectListenerProxy.onConnect, listener:' + listener);
        new DeviceConnectListenerProxy(listener as rpc.IRemoteObject)
          .onConnect(device.deviceId, device.deviceName, device.deviceType, (errCode: number) => undefined);
      }
      this.startMirrorPlayer(device);
      return;
    }
    if (this.session) {
      this.session.accept(device.deviceId, accept, (e: Error) => {
        if (e) {
          Log.error(TAG, 'accept failed e:' + e);
        } else {
          Log.debug(TAG, 'accept success');
          if (accept) {
            this.startMirrorPlayer(device);
          }
        }
      });
    } else {
      Log.error(TAG, 'Internal error: session not exist!');
    }
  }

  // 设备标识脱敏：日志中只保留前 4 位，避免泄露完整设备 ID
  private maskDeviceId(deviceId: string): string {
    if (!deviceId || deviceId.length <= 4) {
      return '****';
    }
    return deviceId.substring(0, 4) + '****';
  }

  mute(deviceId: string, callback: InterfaceCallback): void {
    // TODO 这里暂时不调用，需要底层实现
    Log.info(TAG, 'mute');
    if (!this.checkCaller()) {
      Log.error(TAG, 'caller invalid.');
      callback(0, -1);
      return;
    }

    if (this.session) {
      this.session.mute(deviceId, (e) => {
        if (e) {
          Log.error(TAG, 'mute failed, e:' + JSON.stringify(e));
          callback(0, -1);
        } else {
          Log.debug(TAG, 'mute success');
          callback(0, 0);
        }
      });
    } else {
      Log.error(TAG, 'Internal error: session not exist!');
      callback(0, -1);
    }
  }

  unMute(deviceId: string, callback: InterfaceCallback): void {
    Log.info(TAG, 'unMute');
    // TODO 这里暂时不调用，需要底层实现
    if (!this.checkCaller()) {
      Log.error(TAG, 'caller invalid.');
      callback(0, -1);
      return;
    }

    if (this.session) {
      this.session.unMute(deviceId, (e) => {
        if (e) {
          Log.error(TAG, 'unMute failed, e:' + JSON.stringify(e));
          callback(0, -1);
        } else {
          Log.debug(TAG, 'unMute success');
          callback(0, 0);
        }
      });
    } else {
      Log.error(TAG, 'Internal error: session not exist!');
      callback(0, -1);
    }
  }

  private startMirrorPlayer(device: Cast.CastRemoteDevice) {
    if (MOCK) {
      this.startPlayerPage(device);
    }
    if (this.session) {
      this.session.createMirrorPlayer((e, player) => {
        if (e) {
          Log.error(TAG, 'createMirrorPlayer failed, e:' + e);
          return;
        } else {
          Log.debug(TAG, 'createMirrorPlayer success');
          this.players.set(device.deviceId, player);
          this.startPlayerPage(device);
        }
      });
    } else {
      Log.error(TAG, 'Internal error: session not exist!');
    }
  }

  private startPlayerPage(device: Cast.CastRemoteDevice) {
    let want: Want = {
      bundleName: 'com.ohos.miracastplayer',
      abilityName: 'TvAbility',
      parameters: {
        'startPlayer': true,
        'deviceId': device.deviceId,
        'deviceName': device.deviceName,
        'deviceType': device.deviceType,
      }
    } as Want;
    this.context?.startAbility(want);
  }

  private createCastSession() {
    Cast.createCastSession({
      protocolType: Cast.ProtocolType.MIRACAST,
      endType: Cast.EndType.CAST_SINK,
      audioProperty: {
        sampleRate: 0,
        sampleBitWidth: 0,
        channelConfig: 0,
        bitrate: 0,
        codec: 0,
      },
      videoProperty: {
        videoWidth: 1920,
        videoHeight: 1080,
        fps: 20,
        codecType: Cast.VideoCodecType.H264,
        gop: 0,
        bitrate: 0,
        minBitrate: 0,
        maxBitrate: 0,
        dpi: 0,
        colorStandard: Cast.ColorStandard.BT709,
        screenWidth: 0,
        screenHeight: 0,
        profile: 0,
        level: 0,
      },
      windowProperty: {
        startX: 0,
        startY: 0,
        width: 1920,
        height: 1280,
      },
    }, (e, session: Cast.CastSession) => {
      if (e || !session) {
        Log.error(TAG, 'createCastSession failed, e: ' + e);
        return;
      } else {
        Log.info(TAG, 'createCastSession success');
        this.session = session;
        this.session.on('event', this.onEventCallback);
        this.session.on('deviceRequest', this.onDeviceRequestCallback);
        this.session.on('deviceState', this.onDeviceStateCallback);
      }
    });

    if (MOCK) {
      setTimeout(() => {
        let device: Cast.CastRemoteDevice = {
          deviceId: '123',
          deviceName: 'testDevice',
          deviceType: Cast.DeviceType.DEVICE_OTHERS,
          subDeviceType: Cast.SubDeviceType.SUB_DEVICE_DEFAULT,
          ipAddress: '',
          channelType: Cast.ChannelType.SOFT_BUS,
          networkId: '',
          isLeagacy: false
        }
        this.onDeviceRequestCallback([device]);
      }, 1000);
    }
  }

  private destroySession() {
    if (this.session) {
      this.session.off('event', this.onEventCallback);
      this.session.off('deviceRequest', this.onDeviceRequestCallback);
      this.session.off('deviceState', this.onDeviceStateCallback);
      this.session.release();
      this.session = undefined;
    }
  }

  startMiracastService(callback: InterfaceCallback): void {
    Log.info(TAG, 'startMiracastService');
    if (!this.checkCaller()) {
      Log.error(TAG, 'caller invalid.');
      callback(0, -1);
      return;
    }

    if (this.started) {
      Log.warn(TAG, 'service already started.');
      callback(0, 0);
      return;
    }

    Cast.on('serviceDie', this.onServiceDieCallback);
    Cast.on('deviceFound', this.onDeviceFoundCallback);
    Cast.on('sessionCreate', this.onSessionCreateCallback);
    Cast.on('deviceOffline', this.onDeviceOfflineCallback);
    Cast.setDiscoverable(true, (e) => {
      if (e) {
        Log.error(TAG, 'setDiscoverable(true) failed, e:' + e);
        return;
      } else {
        Log.info(TAG, 'setDiscoverable(true) success');
        this.started = true;
        this.createCastSession();
      }
    });

    Log.debug(TAG, 'service started.');
    callback(0, 0);
  }

  stopMiracastService(callback: InterfaceCallback): void {
    Log.info(TAG, 'stopMiracastService');
    if (!this.checkCaller()) {
      Log.error(TAG, 'caller invalid.');
      callback(0, -1);
      return;
    }
    if (!this.started) {
      Log.warn(TAG, 'service not started.');
      callback(0, 0);
      return;
    }
    if (this.session) {
      this.destroySession();
    }
    Cast.setDiscoverable(false, (e) => {
      if (e) {
        Log.error(TAG, 'setDiscoverable(false) failed, e:' + e);
      } else {
        Log.debug(TAG, 'setDiscoverable(false) success');
        Cast.off('serviceDie', this.onServiceDieCallback);
        Cast.off('deviceFound', this.onDeviceFoundCallback);
        Cast.off('sessionCreate', this.onSessionCreateCallback);
        Cast.off('deviceOffline', this.onDeviceOfflineCallback);
        Cast.release();
      }
    });
    this.started = false;
    Log.debug(TAG, 'service stopped.');
    callback(0, 0);
  }

  registerDeviceConnectListener(listener: DeviceConnectListener, callback: InterfaceCallback): void {
    Log.info(TAG, 'registerDeviceConnectListener');
    if (!this.checkCaller()) {
      Log.error(TAG, 'caller invalid.');
      callback(0, -1);
      return;
    }
    if (this.listeners.indexOf(listener) >= 0) {
      Log.warn(TAG, 'registerDeviceConnectListener skipped by aleady registered');
    } else {
      this.listeners.push(listener);
    }
    callback(0, 0);
  }

  unRegisterDeviceConnectListener(listener: DeviceConnectListener, callback: InterfaceCallback): void {
    Log.info(TAG, 'unRegisterDeviceConnectListener');
    if (!this.checkCaller()) {
      Log.error(TAG, 'caller invalid.');
      callback(0, -1);
      return;
    }
    if (this.listeners.indexOf(listener) >= 0) {
      this.listeners.splice(this.listeners.indexOf(listener));
    } else {
      Log.warn(TAG, 'unRegisterDeviceConnectListener skipped by not exist');
    }
    callback(0, 0);
  }

  setSurface(surfaceId: string, callback: InterfaceCallback, deviceId: string): void {
    Log.info(TAG, 'setSurface, surfaceId: ' + surfaceId);
    if (!this.checkCaller()) {
      Log.error(TAG, 'caller invalid.');
      callback(0, -1);
      return;
    }
    let player = this.players.get(deviceId);
    if (player) {
      player.setSurface(surfaceId, (e: Error) => {
        if (e) {
          Log.error(TAG, 'setSurface failed, e:' + e);
          callback(0, -1);
          return;
        } else {
          Log.debug(TAG, 'setSurface success');
          callback(0, 0);
        }
      });
    } else {
      Log.error(TAG, 'Internal error: player not exist!');
      callback(0, -1);
    }
  }

  play(deviceId: string, callback: InterfaceCallback): void {
    Log.info(TAG, 'play');
    if (!this.checkCaller()) {
      Log.error(TAG, 'caller invalid.');
      callback(0, -1);
      return;
    }
    let player = this.players.get(deviceId);
    if (player) {
      player.play(deviceId, (e) => {
        if (e) {
          Log.error(TAG, 'play failed, e:' + e);
          callback(0, -1);
        } else {
          Log.debug(TAG, 'play success');
          callback(0, 0);
          for (let listener of this.listeners) {
            Log.debug(TAG, 'calling DeviceConnectListenerProxy.onPlay, listener:' + listener);
            new DeviceConnectListenerProxy(listener as rpc.IRemoteObject).onPlay(deviceId, () => undefined);
          }
        }
      });
    } else {
      Log.error(TAG, 'Internal error: player not exist!');
      callback(0, -1);
    }
  }

  pause(deviceId: string, callback: InterfaceCallback): void {
    Log.info(TAG, 'pause');
    if (!this.checkCaller()) {
      Log.error(TAG, 'caller invalid.');
      callback(0, -1);
      return;
    }
    let player = this.players.get(deviceId);
    if (player) {
      player.pause(deviceId, (e) => {
        if (e) {
          Log.error(TAG, 'pause failed, e:' + e);
          callback(0, -1);
        } else {
          Log.debug(TAG, 'pause success');
          callback(0, 0);
          for (let listener of this.listeners) {
            Log.debug(TAG, 'calling DeviceConnectListenerProxy.onPause, listener:' + listener);
            new DeviceConnectListenerProxy(listener as rpc.IRemoteObject).onPause(deviceId, () => undefined);
          }
        }
      });
    } else {
      Log.error(TAG, 'Internal error: player not exist!');
      callback(0, -1);
    }
  }

  stop(deviceId: string, callback: InterfaceCallback): void {
    Log.info(TAG, 'stop');
    if (!this.checkCaller()) {
      Log.error(TAG, 'caller invalid.');
      callback(0, -1);
      return;
    }
    let player = this.players.get(deviceId);
    if (player) {
      player.release((e) => {
        if (e) {
          Log.error(TAG, 'release failed, e:' + e);
          callback(0, -1);
        } else {
          Log.debug(TAG, 'release success');
          this.players.remove(deviceId);
          callback(0, 0);
          for (let listener of this.listeners) {
            Log.debug(TAG, 'calling DeviceConnectListenerProxy.onStopped, listener:' + listener);
            new DeviceConnectListenerProxy(listener as rpc.IRemoteObject).onStopped(deviceId, () => undefined);
          }
        }
      });
    } else {
      Log.error(TAG, 'Internal error: player not exist!');
      callback(0, -1);
    }
  }
}
