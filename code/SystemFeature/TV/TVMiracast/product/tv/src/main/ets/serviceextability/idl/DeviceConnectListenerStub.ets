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
import { Log } from 'library';

const TAG = 'DeviceConnectListenerStub';

export default class DeviceConnectListenerStub extends rpc.RemoteObject implements IDeviceConnectListener {
  constructor(des: string) {
    super(des);
  }

  async onRemoteMessageRequest(code: number, data: rpc.MessageSequence,
    reply: rpc.MessageSequence, option: rpc.MessageOption): Promise<boolean> {
    Log.info(TAG, 'onRemoteMessageRequest called, code = ' + code);
    switch (code) {
      case DeviceConnectListenerStub.COMMAND_ON_CONNECT: {
        let deviceIdVar = data.readString();
        let deviceNameVar = data.readString();
        let deviceTypeVar = data.readInt();
        let promise = new Promise<void>((resolve, reject) => {
          this.onConnect(deviceIdVar, deviceNameVar, deviceTypeVar, (errCode) => {
            reply.writeInt(errCode);
            resolve();
          });
        });
        await promise;
        return true;
      }
      case DeviceConnectListenerStub.COMMAND_ON_DISCONNECT: {
        let deviceIdVar = data.readString();
        let promise = new Promise<void>((resolve, reject) => {
          this.onDisconnect(deviceIdVar, (errCode) => {
            reply.writeInt(errCode);
            resolve();
          });
        });
        await promise;
        return true;
      }
      case DeviceConnectListenerStub.COMMAND_ON_PLAY: {
        let deviceIdVar = data.readString();
        let promise = new Promise<void>((resolve, reject) => {
          this.onPlay(deviceIdVar, (errCode) => {
            reply.writeInt(errCode);
            resolve();
          });
        });
        await promise;
        return true;
      }
      case DeviceConnectListenerStub.COMMAND_ON_PAUSE: {
        let deviceIdVar = data.readString();
        let promise = new Promise<void>((resolve, reject) => {
          this.onPause(deviceIdVar, (errCode) => {
            reply.writeInt(errCode);
            resolve();
          });
        });
        await promise;
        return true;
      }
      case DeviceConnectListenerStub.COMMAND_ON_STOPPED: {
        let deviceIdVar = data.readString();
        let promise = new Promise<void>((resolve, reject) => {
          this.onStopped(deviceIdVar, (errCode) => {
            reply.writeInt(errCode);
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

  onConnect(deviceId: string, deviceName: string, deviceType: number, callback: onConnectCallback): void {
  }

  onDisconnect(deviceId: string, callback: onDisconnectCallback): void {
  }

  onPlay(deviceId: string, callback: onPlayCallback): void {
  }

  onPause(deviceId: string, callback: onPauseCallback): void {
  }

  onStopped(deviceId: string, callback: onStoppedCallback): void {
  }

  private static readonly COMMAND_ON_CONNECT = 1;
  private static readonly COMMAND_ON_DISCONNECT = 2;
  private static readonly COMMAND_ON_PLAY = 3;
  private static readonly COMMAND_ON_PAUSE = 4;
  private static readonly COMMAND_ON_STOPPED = 5;
}
