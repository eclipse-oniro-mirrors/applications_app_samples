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

import { muteCallback, startMiracastServiceCallback, unMuteCallback } from './IMiracastPlayerService';
import { stopMiracastServiceCallback } from './IMiracastPlayerService';
import { registerDeviceConnectListenerCallback } from './IMiracastPlayerService';
import { unRegisterDeviceConnectListenerCallback } from './IMiracastPlayerService';
import { setSurfaceCallback } from './IMiracastPlayerService';
import { playCallback } from './IMiracastPlayerService';
import { pauseCallback } from './IMiracastPlayerService';
import { stopCallback } from './IMiracastPlayerService';
import IMiracastPlayerService from './IMiracastPlayerService';
import { rpc } from '@kit.IPCKit';
import IDeviceConnectListener from './IDeviceConnectListener';
import DeviceConnectListenerStub from './DeviceConnectListenerStub';
import { Log } from 'library';

const TAG = 'MiracastPlayerServiceStub';

export default class MiracastPlayerServiceStub extends rpc.RemoteObject implements IMiracastPlayerService {
  constructor(des: string) {
    super(des);
  }

  async onRemoteMessageRequest(code: number, data: rpc.MessageSequence,
    reply: rpc.MessageSequence, option: rpc.MessageOption): Promise<boolean> {
    Log.info(TAG, 'MiracastPlayerServiceStub onRemoteMessageRequest called, code = ' + code);
    switch (code) {
      case MiracastPlayerServiceStub.COMMAND_START_MIRACAST_SERVICE: {
        let promise = new Promise<void>((resolve, reject) => {
          this.startMiracastService((errCode, returnValue) => {
            reply.writeInt(errCode);
            if (errCode == 0) {
              reply.writeInt(returnValue);
            }
            resolve();
          });
        });
        await promise;
        return true;
      }
      case MiracastPlayerServiceStub.COMMAND_STOP_MIRACAST_SERVICE: {
        let promise = new Promise<void>((resolve, reject) => {
          this.stopMiracastService((errCode, returnValue) => {
            reply.writeInt(errCode);
            if (errCode == 0) {
              reply.writeInt(returnValue);
            }
            resolve();
          });
        });
        await promise;
        return true;
      }
      case MiracastPlayerServiceStub.COMMAND_REGISTER_DEVICE_CONNECT_LISTENER: {
        let listenerVar = data.readRemoteObject();
        let promise = new Promise<void>((resolve, reject) => {
          this.registerDeviceConnectListener(listenerVar as DeviceConnectListenerStub,
            (errCode: number, returnValue: number) => {
              reply.writeInt(errCode);
              if (errCode == 0) {
                reply.writeInt(returnValue);
              }
              resolve();
            });
        });
        await promise;
        return true;
      }
      case MiracastPlayerServiceStub.COMMAND_UN_REGISTER_DEVICE_CONNECT_LISTENER: {
        let listenerVar = data.readRemoteObject();
        let promise = new Promise<void>((resolve, reject) => {
          this.unRegisterDeviceConnectListener(listenerVar as DeviceConnectListenerStub,
            (errCode: number, returnValue: number) => {
              reply.writeInt(errCode);
              if (errCode == 0) {
                reply.writeInt(returnValue);
              }
              resolve();
            });
        });
        await promise;
        return true;
      }
      case MiracastPlayerServiceStub.COMMAND_SET_SCREEN: {
        let surfaceIdVar = data.readString();
        let deviceIdVar = data.readString();
        let promise = new Promise<void>((resolve, reject) => {
          this.setSurface(surfaceIdVar, (errCode, returnValue) => {
            reply.writeInt(errCode);
            if (errCode == 0) {
              reply.writeInt(returnValue);
            }
            resolve();
          }, deviceIdVar);
        });
        await promise;
        return true;
      }
      case MiracastPlayerServiceStub.COMMAND_PLAY: {
        let deviceIdVar = data.readString();
        let promise = new Promise<void>((resolve, reject) => {
          this.play(deviceIdVar, (errCode, returnValue) => {
            reply.writeInt(errCode);
            if (errCode == 0) {
              reply.writeInt(returnValue);
            }
            resolve();
          });
        });
        await promise;
        return true;
      }
      case MiracastPlayerServiceStub.COMMAND_PAUSE: {
        let deviceIdVar = data.readString();
        let promise = new Promise<void>((resolve, reject) => {
          this.pause(deviceIdVar, (errCode, returnValue) => {
            reply.writeInt(errCode);
            if (errCode == 0) {
              reply.writeInt(returnValue);
            }
            resolve();
          });
        });
        await promise;
        return true;
      }
      case MiracastPlayerServiceStub.COMMAND_STOP: {
        let deviceIdVar = data.readString();
        let promise = new Promise<void>((resolve, reject) => {
          this.stop(deviceIdVar, (errCode, returnValue) => {
            reply.writeInt(errCode);
            if (errCode == 0) {
              reply.writeInt(returnValue);
            }
            resolve();
          });
        });
        await promise;
        return true;
      }
      case MiracastPlayerServiceStub.COMMAND_MUTE: {
        let deviceIdVar = data.readString();
        let promise = new Promise<void>((resolve, reject) => {
          this.mute(deviceIdVar, (errCode, returnValue) => {
            reply.writeInt(errCode);
            if (errCode == 0) {
              reply.writeInt(returnValue);
            }
            resolve();
          });
        });
        await promise;
        return true;
      }
      case MiracastPlayerServiceStub.COMMAND_UN_MUTE: {
        let deviceIdVar = data.readString();
        let promise = new Promise<void>((resolve, reject) => {
          this.unMute(deviceIdVar, (errCode, returnValue) => {
            reply.writeInt(errCode);
            if (errCode == 0) {
              reply.writeInt(returnValue);
            }
            resolve();
          });
        });
        await promise;
        return true;
      }
      default: {
        Log.error(TAG, 'invalid request code' + code);
        break;
      }
    }
    return false;
  }

  startMiracastService(callback: startMiracastServiceCallback): void {
  }

  stopMiracastService(callback: stopMiracastServiceCallback): void {
  }

  registerDeviceConnectListener(listener: IDeviceConnectListener,
    callback: registerDeviceConnectListenerCallback): void {
  }

  unRegisterDeviceConnectListener(listener: IDeviceConnectListener,
    callback: unRegisterDeviceConnectListenerCallback): void {
  }

  setSurface(surfaceId: string, callback: setSurfaceCallback, deviceId: string): void {
  }

  play(deviceId: string, callback: playCallback): void {
  }

  pause(deviceId: string, callback: pauseCallback): void {
  }

  stop(deviceId: string, callback: stopCallback): void {
  }

  mute(deviceId: string, callback: muteCallback): void {
  }

  unMute(deviceId: string, callback: unMuteCallback): void {
  }

  private static readonly COMMAND_START_MIRACAST_SERVICE = 1;
  private static readonly COMMAND_STOP_MIRACAST_SERVICE = 2;
  private static readonly COMMAND_REGISTER_DEVICE_CONNECT_LISTENER = 3;
  private static readonly COMMAND_UN_REGISTER_DEVICE_CONNECT_LISTENER = 4;
  private static readonly COMMAND_SET_SCREEN = 5;
  private static readonly COMMAND_PLAY = 6;
  private static readonly COMMAND_PAUSE = 7;
  private static readonly COMMAND_STOP = 8;
  private static readonly COMMAND_MUTE = 9;
  private static readonly COMMAND_UN_MUTE = 10;
}
