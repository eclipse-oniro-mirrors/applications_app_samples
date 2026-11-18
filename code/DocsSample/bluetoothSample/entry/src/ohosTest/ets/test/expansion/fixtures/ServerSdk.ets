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
import { bleTarget, promptTarget, rethrowCaught } from './SdkInterop';
import { runCleanup, runCleanupSequence } from './Cleanup';
import { MockKit, when, ArgumentMatchers } from '@ohos/hypium';
import { ble } from '@kit.ConnectivityKit';
import { promptAction } from '@kit.ArkUI';
import { ControlledError } from './BluetoothSdk';

type ConnectionListener = (event: ble.BLEConnectionChangeState) => void;
type CharacteristicReadListener = (event: ble.CharacteristicReadRequest) => void;
type CharacteristicWriteListener = (event: ble.CharacteristicWriteRequest) => void;
type DescriptorReadListener = (event: ble.DescriptorReadRequest) => void;
type DescriptorWriteListener = (event: ble.DescriptorWriteRequest) => void;
type ServerListener = ConnectionListener | CharacteristicReadListener | CharacteristicWriteListener |
  DescriptorReadListener | DescriptorWriteListener;

/** External GattServer API port only. No service/response business logic exists in this class. */
export class ServerPort {
  public on(event: string, listener: ServerListener): void { throw new Error('Server SDK stub not installed'); }
  public off(event: string, listener: ConnectionListener): void { throw new Error('Server SDK stub not installed'); }
  public addService(service: ble.GattService): void { throw new Error('Server SDK stub not installed'); }
  public removeService(uuid: string): void { throw new Error('Server SDK stub not installed'); }
  public sendResponse(response: ble.ServerResponse): void { throw new Error('Server SDK stub not installed'); }
  public close(): void { throw new Error('Server SDK stub not installed'); }
}

export class ServerSdk {
  private bleKit: MockKit = new MockKit();
  private serverKit: MockKit = new MockKit();
  private promptKit: MockKit = new MockKit();
  private port: ServerPort = new ServerPort();
  public calls: string[] = [];
  public toasts: promptAction.ShowToastOptions[] = [];
  public services: ble.GattService[] = [];
  public removed: string[] = [];
  public responses: ble.ServerResponse[] = [];
  public throwAt: string = '';
  public error: ControlledError = new ControlledError();
  public connectionListener: ConnectionListener | undefined = undefined;
  public characteristicReadListener: CharacteristicReadListener | undefined = undefined;
  public characteristicWriteListener: CharacteristicWriteListener | undefined = undefined;
  public descriptorReadListener: DescriptorReadListener | undefined = undefined;
  public descriptorWriteListener: DescriptorWriteListener | undefined = undefined;
  public offMatchesRegistration: boolean[] = [];
  public get server(): ble.GattServer { return this.port as ble.GattServer; }

  private record(stage: string): void {
    this.calls.push(stage);
    if (this.throwAt === stage) {
      throw this.error;
    }
  }
  constructor() {
    try {
      when(this.bleKit.mockFunc(bleTarget, ble.createGattServer))().afterAction((): ble.GattServer => {
        this.record('ble.createGattServer'); return this.server;
      });
      when(this.promptKit.mockFunc(promptTarget, promptAction.showToast))(ArgumentMatchers.anyObj)
        .afterAction((options: promptAction.ShowToastOptions): void => {
          this.record('prompt.showToast'); this.toasts.push(options);
        });
      when(this.serverKit.mockFunc(this.port, this.port.on))(ArgumentMatchers.anyString)
        .afterAction((event: string, listener: ServerListener): void => {
          this.record('server.on ' + event);
          if (event === 'connectionStateChange') {
            this.connectionListener = listener as ConnectionListener;
          }
          if (event === 'characteristicRead') {
            this.characteristicReadListener = listener as CharacteristicReadListener;
          }
          if (event === 'characteristicWrite') {
            this.characteristicWriteListener = listener as CharacteristicWriteListener;
          }
          if (event === 'descriptorRead') {
            this.descriptorReadListener = listener as DescriptorReadListener;
          }
          if (event === 'descriptorWrite') {
            this.descriptorWriteListener = listener as DescriptorWriteListener;
          }
        });
      when(this.serverKit.mockFunc(this.port, this.port.off))(ArgumentMatchers.anyString)
        .afterAction((event: string, listener: ConnectionListener): void => {
          this.record('server.off ' + event); this.offMatchesRegistration.push(listener === this.connectionListener);
        });
      when(this.serverKit.mockFunc(this.port, this.port.addService))(ArgumentMatchers.anyObj)
        .afterAction((service: ble.GattService): void => { this.record('server.addService'); this.services.push(service); });
      when(this.serverKit.mockFunc(this.port, this.port.removeService))(ArgumentMatchers.anyString)
        .afterAction((uuid: string): void => { this.record('server.removeService'); this.removed.push(uuid); });
      when(this.serverKit.mockFunc(this.port, this.port.sendResponse))(ArgumentMatchers.anyObj)
        .afterAction((response: ble.ServerResponse): void => {
          // Record the SDK attempt even when the external service rejects it synchronously.
          this.responses.push(response); this.record('server.sendResponse');
        });
      when(this.serverKit.mockFunc(this.port, this.port.close))().afterAction((): void => { this.record('server.close'); });
    } catch (error) {
      runCleanup((): void => { this.dispose(); }, true); rethrowCaught(error);
    }
  }
  public emitConnection(event: ble.BLEConnectionChangeState): void {
    const listener = this.connectionListener;
    if (listener === undefined) {
      throw new Error('Production connectionStateChange listener missing');
    }
    listener(event);
  }
  public emitCharacteristicRead(event: ble.CharacteristicReadRequest): void {
    const listener = this.characteristicReadListener;
    if (listener === undefined) {
      throw new Error('Production characteristicRead listener missing');
    }
    listener(event);
  }
  public emitCharacteristicWrite(event: ble.CharacteristicWriteRequest): void {
    const listener = this.characteristicWriteListener;
    if (listener === undefined) {
      throw new Error('Production characteristicWrite listener missing');
    }
    listener(event);
  }
  public emitDescriptorRead(event: ble.DescriptorReadRequest): void {
    const listener = this.descriptorReadListener;
    if (listener === undefined) {
      throw new Error('Production descriptorRead listener missing');
    }
    listener(event);
  }
  public emitDescriptorWrite(event: ble.DescriptorWriteRequest): void {
    const listener = this.descriptorWriteListener;
    if (listener === undefined) {
      throw new Error('Production descriptorWrite listener missing');
    }
    listener(event);
  }
  public dispose(): void {
    runCleanupSequence([
      (): void => { this.serverKit.clear(this.port); this.serverKit.clearAll(); },
      (): void => { this.bleKit.clear(bleTarget); this.bleKit.clearAll(); },
      (): void => { this.promptKit.clear(promptTarget); this.promptKit.clearAll(); },
      (): void => {
        this.connectionListener = undefined;
        this.characteristicReadListener = undefined;
        this.characteristicWriteListener = undefined;
        this.descriptorReadListener = undefined;
        this.descriptorWriteListener = undefined;
      }
    ]);
  }
}
