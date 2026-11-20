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

const TAG = 'MiracastPlayerServiceProxy';

export default class MiracastPlayerServiceProxy implements IMiracastPlayerService {
  constructor(proxy: rpc.IRemoteObject) {
    this.proxy = proxy;
  }

  startMiracastService(callback: startMiracastServiceCallback): void {
    let option = new rpc.MessageOption();
    let dataSequence = rpc.MessageSequence.create();
    let replySequence = rpc.MessageSequence.create();
    this.proxy.sendMessageRequest(MiracastPlayerServiceProxy.COMMAND_START_MIRACAST_SERVICE, dataSequence,
      replySequence, option)
      .then((result: rpc.RequestResult) => {
        if (result.errCode === 0) {
          Log.info(TAG, 'sendMessageRequest startMiracastService success');
          let errCodeVar = result.reply.readInt();
          if (errCodeVar != 0) {
            let returnValueVar = -1;
            callback(errCodeVar, returnValueVar);
            return;
          }
          let returnValueVar = result.reply.readInt();
          callback(errCodeVar, returnValueVar);
        } else {
          Log.error(TAG, 'sendMessageRequest startMiracastService failed, errCode: ' + result.errCode);
        }
      })
      .catch((e: Error) => {
        Log.error(TAG, 'sendMessageRequest startMiracastService failed, message: ' + JSON.stringify(e));
      })
      .finally(() => {
        dataSequence.reclaim();
        replySequence.reclaim();
      });
  }

  stopMiracastService(callback: stopMiracastServiceCallback): void {
    let option = new rpc.MessageOption();
    let dataSequence = rpc.MessageSequence.create();
    let replySequence = rpc.MessageSequence.create();
    this.proxy.sendMessageRequest(MiracastPlayerServiceProxy.COMMAND_STOP_MIRACAST_SERVICE, dataSequence,
      replySequence, option)
      .then((result: rpc.RequestResult) => {
        if (result.errCode === 0) {
          Log.info(TAG, 'sendMessageRequest stopMiracastService success');
          let errCodeVar = result.reply.readInt();
          if (errCodeVar != 0) {
            let returnValueVar = -1;
            callback(errCodeVar, returnValueVar);
            return;
          }
          let returnValueVar = result.reply.readInt();
          callback(errCodeVar, returnValueVar);
        } else {
          Log.error(TAG, 'sendMessageRequest stopMiracastService failed, errCode: ' + result.errCode);
        }
      })
      .catch((e: Error) => {
        Log.error(TAG, 'sendMessageRequest stopMiracastService failed, message: ' + e.message);
      })
      .finally(() => {
        dataSequence.reclaim();
        replySequence.reclaim();
      });
  }

  registerDeviceConnectListener(listener: IDeviceConnectListener,
    callback: registerDeviceConnectListenerCallback): void {
    let option = new rpc.MessageOption();
    let dataSequence = rpc.MessageSequence.create();
    let replySequence = rpc.MessageSequence.create();
    dataSequence.writeRemoteObject(listener as Object as rpc.IRemoteObject);
    this.proxy.sendMessageRequest(MiracastPlayerServiceProxy.COMMAND_REGISTER_DEVICE_CONNECT_LISTENER, dataSequence,
      replySequence, option)
      .then((result: rpc.RequestResult) => {
        if (result.errCode === 0) {
          Log.info(TAG, 'sendMessageRequest registerDeviceConnectListener success');
          let errCodeVar = result.reply.readInt();
          if (errCodeVar != 0) {
            let returnValueVar = -1;
            callback(errCodeVar, returnValueVar);
            return;
          }
          let returnValueVar = result.reply.readInt();
          callback(errCodeVar, returnValueVar);
        } else {
          Log.error(TAG, 'sendMessageRequest registerDeviceConnectListener failed, errCode: ' + result.errCode);
        }
      })
      .catch((e: Error) => {
        Log.error(TAG, 'sendMessageRequest registerDeviceConnectListener failed, message: ' + e.message);
      })
      .finally(() => {
        dataSequence.reclaim();
        replySequence.reclaim();
      });
  }

  unRegisterDeviceConnectListener(listener: IDeviceConnectListener,
    callback: unRegisterDeviceConnectListenerCallback): void {
    let option = new rpc.MessageOption();
    let dataSequence = rpc.MessageSequence.create();
    let replySequence = rpc.MessageSequence.create();
    dataSequence.writeRemoteObject(listener as Object as rpc.IRemoteObject);
    this.proxy.sendMessageRequest(
      MiracastPlayerServiceProxy.COMMAND_UN_REGISTER_DEVICE_CONNECT_LISTENER, dataSequence,
      replySequence, option)
      .then((result: rpc.RequestResult) => {
        if (result.errCode === 0) {
          Log.info(TAG, 'sendMessageRequest unRegisterDeviceConnectListener success');
          let errCodeVar = result.reply.readInt();
          if (errCodeVar != 0) {
            let returnValueVar = -1;
            callback(errCodeVar, returnValueVar);
            return;
          }
          let returnValueVar = result.reply.readInt();
          callback(errCodeVar, returnValueVar);
        } else {
          Log.error(TAG, 'sendMessageRequest unRegisterDeviceConnectListener failed, errCode: ' + result.errCode);
        }
      })
      .catch((e: Error) => {
        Log.error(TAG, 'sendMessageRequest unRegisterDeviceConnectListener failed, message: ' + e.message);
      })
      .finally(() => {
        dataSequence.reclaim();
        replySequence.reclaim();
      });
  }

  setSurface(surfaceId: string, callback: setSurfaceCallback, deviceId: string): void {
    let option = new rpc.MessageOption();
    let dataSequence = rpc.MessageSequence.create();
    let replySequence = rpc.MessageSequence.create();
    dataSequence.writeString(surfaceId);
    dataSequence.writeString(deviceId);
    this.proxy.sendMessageRequest(MiracastPlayerServiceProxy.COMMAND_SET_SCREEN, dataSequence,
      replySequence, option)
      .then((result: rpc.RequestResult) => {
        if (result.errCode === 0) {
          Log.info(TAG, 'sendMessageRequest setSurface success');
          let errCodeVar = result.reply.readInt();
          if (errCodeVar != 0) {
            let returnValueVar = -1;
            callback(errCodeVar, returnValueVar);
            return;
          }
          let returnValueVar = result.reply.readInt();
          callback(errCodeVar, returnValueVar);
        } else {
          Log.error(TAG, 'sendMessageRequest setSurface failed, errCode: ' + result.errCode);
        }
      })
      .catch((e: Error) => {
        Log.error(TAG, 'sendMessageRequest setSurface failed, message: ' + e.message);
      })
      .finally(() => {
        dataSequence.reclaim();
        replySequence.reclaim();
      });
  }

  play(deviceId: string, callback: playCallback): void {
    let option = new rpc.MessageOption();
    let dataSequence = rpc.MessageSequence.create();
    let replySequence = rpc.MessageSequence.create();
    dataSequence.writeString(deviceId);
    this.proxy.sendMessageRequest(MiracastPlayerServiceProxy.COMMAND_PLAY, dataSequence,
      replySequence, option)
      .then((result: rpc.RequestResult) => {
        if (result.errCode === 0) {
          Log.info(TAG, 'sendMessageRequest play success');
          let errCodeVar = result.reply.readInt();
          if (errCodeVar != 0) {
            let returnValueVar = -1;
            callback(errCodeVar, returnValueVar);
            return;
          }
          let returnValueVar = result.reply.readInt();
          callback(errCodeVar, returnValueVar);
        } else {
          Log.error(TAG, 'sendMessageRequest play failed, errCode: ' + result.errCode);
        }
      })
      .catch((e: Error) => {
        Log.error(TAG, 'sendMessageRequest play failed, message: ' + e.message);
      })
      .finally(() => {
        dataSequence.reclaim();
        replySequence.reclaim();
      });
  }

  pause(deviceId: string, callback: pauseCallback): void {
    let option = new rpc.MessageOption();
    let dataSequence = rpc.MessageSequence.create();
    let replySequence = rpc.MessageSequence.create();
    dataSequence.writeString(deviceId);
    this.proxy.sendMessageRequest(MiracastPlayerServiceProxy.COMMAND_PAUSE, dataSequence,
      replySequence, option)
      .then((result: rpc.RequestResult) => {
        if (result.errCode === 0) {
          Log.info(TAG, 'sendMessageRequest pause success');
          let errCodeVar = result.reply.readInt();
          if (errCodeVar != 0) {
            let returnValueVar = -1;
            callback(errCodeVar, returnValueVar);
            return;
          }
          let returnValueVar = result.reply.readInt();
          callback(errCodeVar, returnValueVar);
        } else {
          Log.error(TAG, 'sendMessageRequest pause failed, errCode: ' + result.errCode);
        }
      })
      .catch((e: Error) => {
        Log.error(TAG, 'sendMessageRequest pause failed, message: ' + e.message);
      })
      .finally(() => {
        dataSequence.reclaim();
        replySequence.reclaim();
      });
  }

  stop(deviceId: string, callback: stopCallback): void {
    let option = new rpc.MessageOption();
    let dataSequence = rpc.MessageSequence.create();
    let replySequence = rpc.MessageSequence.create();
    dataSequence.writeString(deviceId);
    this.proxy.sendMessageRequest(MiracastPlayerServiceProxy.COMMAND_STOP, dataSequence,
      replySequence, option)
      .then((result: rpc.RequestResult) => {
        if (result.errCode === 0) {
          Log.info(TAG, 'sendMessageRequest stop success');
          let errCodeVar = result.reply.readInt();
          if (errCodeVar != 0) {
            let returnValueVar = -1;
            callback(errCodeVar, returnValueVar);
            return;
          }
          let returnValueVar = result.reply.readInt();
          callback(errCodeVar, returnValueVar);
        } else {
          Log.error(TAG, 'sendMessageRequest stop failed, errCode: ' + result.errCode);
        }
      })
      .catch((e: Error) => {
        Log.error(TAG, 'sendMessageRequest stop failed, message: ' + e.message);
      })
      .finally(() => {
        dataSequence.reclaim();
        replySequence.reclaim();
      });
  }

  mute(deviceId: string, callback: muteCallback): void {
    let option = new rpc.MessageOption();
    let dataSequence = rpc.MessageSequence.create();
    let replySequence = rpc.MessageSequence.create();
    dataSequence.writeString(deviceId);
    this.proxy.sendMessageRequest(MiracastPlayerServiceProxy.COMMAND_MUTE, dataSequence,
      replySequence, option)
      .then((result: rpc.RequestResult) => {
        if (result.errCode === 0) {
          Log.info(TAG, 'sendMessageRequest mute success');
          let errCodeVar = result.reply.readInt();
          if (errCodeVar != 0) {
            let returnValueVar = -1;
            callback(errCodeVar, returnValueVar);
            return;
          }
          let returnValueVar = result.reply.readInt();
          callback(errCodeVar, returnValueVar);
        } else {
          Log.error(TAG, 'sendMessageRequest mute failed, errCode: ' + result.errCode);
        }
      })
      .catch((e: Error) => {
        Log.error(TAG, 'sendMessageRequest mute failed, message: ' + e.message);
      })
      .finally(() => {
        dataSequence.reclaim();
        replySequence.reclaim();
      });
  }

  unMute(deviceId: string, callback: unMuteCallback): void {
    let option = new rpc.MessageOption();
    let dataSequence = rpc.MessageSequence.create();
    let replySequence = rpc.MessageSequence.create();
    dataSequence.writeString(deviceId);
    this.proxy.sendMessageRequest(MiracastPlayerServiceProxy.COMMAND_UN_MUTE, dataSequence,
      replySequence, option)
      .then((result: rpc.RequestResult) => {
        if (result.errCode === 0) {
          Log.info(TAG, 'sendMessageRequest unMute success');
          let errCodeVar = result.reply.readInt();
          if (errCodeVar != 0) {
            let returnValueVar = -1;
            callback(errCodeVar, returnValueVar);
            return;
          }
          let returnValueVar = result.reply.readInt();
          callback(errCodeVar, returnValueVar);
        } else {
          Log.error(TAG, 'sendMessageRequest unMute failed, errCode: ' + result.errCode);
        }
      })
      .catch((e: Error) => {
        Log.error(TAG, 'sendMessageRequest unMute failed, message: ' + e.message);
      })
      .finally(() => {
        dataSequence.reclaim();
        replySequence.reclaim();
      });
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
  private proxy: rpc.IRemoteObject;
}
