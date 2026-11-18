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

import { onConnectCallback } from './IDeviceConnectListener';
import { onDisconnectCallback } from './IDeviceConnectListener';
import { onPlayCallback } from './IDeviceConnectListener';
import { onPauseCallback } from './IDeviceConnectListener';
import { onStoppedCallback } from './IDeviceConnectListener';
import IDeviceConnectListener from './IDeviceConnectListener';
import { rpc } from '@kit.IPCKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Log } from 'library/src/main/ets/utils/Log';

const TAG = 'DeviceConnectListenerProxy';

export default class DeviceConnectListenerProxy implements IDeviceConnectListener {
  constructor(proxy: rpc.IRemoteObject) {
    this.proxy = proxy;
  }

  onConnect(deviceId: string, deviceName: string, deviceType: number, callback: onConnectCallback): void {
    let option = new rpc.MessageOption();
    let dataSequence = rpc.MessageSequence.create();
    let replySequence = rpc.MessageSequence.create();
    dataSequence.writeString(deviceId);
    dataSequence.writeString(deviceName);
    dataSequence.writeInt(deviceType);
    this.proxy.sendMessageRequest(DeviceConnectListenerProxy.COMMAND_ON_CONNECT, dataSequence,
      replySequence, option)
      .then((result: rpc.RequestResult) => {
        if (result.errCode === 0) {
          let errCodeVar = result.reply.readInt();
          callback(errCodeVar);
        } else {
          Log.error(TAG, 'sendMessageRequest failed, errCode: ' + result.errCode);
        }
      })
      .catch((e: Error) => {
        Log.error(TAG, 'sendMessageRequest failed, message: ' + e.message);
      })
      .finally(() => {
        dataSequence.reclaim();
        replySequence.reclaim();
      });
  }

  onDisconnect(deviceId: string, callback: onDisconnectCallback): void {
    Log.info(TAG, 'onDisconnect');
    let option = new rpc.MessageOption();
    let dataSequence = rpc.MessageSequence.create();
    let replySequence = rpc.MessageSequence.create();
    dataSequence.writeString(deviceId);
    this.proxy.sendMessageRequest(DeviceConnectListenerProxy.COMMAND_ON_DISCONNECT, dataSequence,
      replySequence, option)
      .then((result: rpc.RequestResult) => {
        if (result.errCode === 0) {
          let errCodeVar = result.reply.readInt();
          callback(errCodeVar);
        } else {
          Log.error(TAG, 'sendMessageRequest failed, errCode: ' + result.errCode);
        }
      })
      .catch((e: BusinessError) => {
        Log.error(TAG, 'sendMessageRequest failed, message: ' + JSON.stringify(e));
      })
      .finally(() => {
        dataSequence.reclaim();
        replySequence.reclaim();
      });
  }

  onPlay(deviceId: string, callback: onPlayCallback): void {
    let option = new rpc.MessageOption();
    let dataSequence = rpc.MessageSequence.create();
    let replySequence = rpc.MessageSequence.create();
    dataSequence.writeString(deviceId);
    this.proxy.sendMessageRequest(DeviceConnectListenerProxy.COMMAND_ON_PLAY, dataSequence,
      replySequence, option)
      .then((result: rpc.RequestResult) => {
        if (result.errCode === 0) {
          let errCodeVar = result.reply.readInt();
          callback(errCodeVar);
        } else {
          Log.error(TAG, 'sendMessageRequest failed, errCode: ' + result.errCode);
        }
      })
      .catch((e: Error) => {
        Log.error(TAG, 'sendMessageRequest failed, message: ' + e.message);
      })
      .finally(() => {
        dataSequence.reclaim();
        replySequence.reclaim();
      });
  }

  onPause(deviceId: string, callback: onPauseCallback): void {
    let option = new rpc.MessageOption();
    let dataSequence = rpc.MessageSequence.create();
    let replySequence = rpc.MessageSequence.create();
    dataSequence.writeString(deviceId);
    this.proxy.sendMessageRequest(DeviceConnectListenerProxy.COMMAND_ON_PAUSE, dataSequence,
      replySequence, option)
      .then((result: rpc.RequestResult) => {
        if (result.errCode === 0) {
          let errCodeVar = result.reply.readInt();
          callback(errCodeVar);
        } else {
          Log.error(TAG, 'sendMessageRequest failed, errCode: ' + result.errCode);
        }
      })
      .catch((e: Error) => {
        Log.error(TAG, 'sendMessageRequest failed, message: ' + e.message);
      })
      .finally(() => {
        dataSequence.reclaim();
        replySequence.reclaim();
      });
  }

  onStopped(deviceId: string, callback: onStoppedCallback): void {
    let option = new rpc.MessageOption();
    let dataSequence = rpc.MessageSequence.create();
    let replySequence = rpc.MessageSequence.create();
    dataSequence.writeString(deviceId);
    this.proxy.sendMessageRequest(DeviceConnectListenerProxy.COMMAND_ON_STOPPED, dataSequence,
      replySequence, option)
      .then((result: rpc.RequestResult) => {
        if (result.errCode === 0) {
          let errCodeVar = result.reply.readInt();
          callback(errCodeVar);
        } else {
          Log.error(TAG, 'sendMessageRequest failed, errCode: ' + result.errCode);
        }
      })
      .catch((e: Error) => {
        Log.error(TAG, 'sendMessageRequest failed, message: ' + JSON.stringify(e));
      })
      .finally(() => {
        dataSequence.reclaim();
        replySequence.reclaim();
      });
  }

  private static readonly COMMAND_ON_CONNECT = 1;
  private static readonly COMMAND_ON_DISCONNECT = 2;
  private static readonly COMMAND_ON_PLAY = 3;
  private static readonly COMMAND_ON_PAUSE = 4;
  private static readonly COMMAND_ON_STOPPED = 5;
  private proxy: rpc.IRemoteObject;
}
