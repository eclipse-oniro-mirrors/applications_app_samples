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
import { bleTarget, accessTarget, promptTarget, rethrowCaught } from './SdkInterop';
import { runCleanup, runCleanupSequence } from './Cleanup';
import { MockKit, when, ArgumentMatchers } from '@ohos/hypium';
import { ble, access } from '@kit.ConnectivityKit';
import { promptAction } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

type ScanListener = (data: ble.ScanResult[]) => void;
type AdvertisingListener = (data: ble.AdvertisingStateChangeInfo) => void;
type ConnectionListener = (data: ble.BLEConnectionChangeState) => void;
type StateListener = (state: access.BluetoothState) => void;
type WriteListener = (error?: BusinessError) => void;

export class ControlledError extends Error {
  public code: number = 123;
  constructor() { super('controlled external SDK failure'); }
}

export function characteristic(bytes: number[] = []): ble.BLECharacteristic {
  return { serviceUuid: 'S', characteristicUuid: 'C', characteristicValue: new Uint8Array(bytes).buffer,
    descriptors: [] };
}
export function descriptor(bytes: number[] = []): ble.BLEDescriptor {
  return { serviceUuid: 'S', characteristicUuid: 'C', descriptorUuid: 'D',
    descriptorValue: new Uint8Array(bytes).buffer };
}

/** External SDK surface only; never implements a production manager or business algorithm. */
class ClientPort {
  public on(event: string, listener: ConnectionListener): void { throw new Error('SDK stub not installed'); }
  public off(event: string, listener: ConnectionListener): void { throw new Error('SDK stub not installed'); }
  public connect(): void { throw new Error('SDK stub not installed'); }
  public disconnect(): void { throw new Error('SDK stub not installed'); }
  public close(): void { throw new Error('SDK stub not installed'); }
  public getServices(): Promise<ble.GattService[]> { throw new Error('SDK stub not installed'); }
  public readCharacteristicValue(value: ble.BLECharacteristic): Promise<ble.BLECharacteristic> {
    throw new Error('SDK stub not installed');
  }
  public readDescriptorValue(value: ble.BLEDescriptor): Promise<ble.BLEDescriptor> {
    throw new Error('SDK stub not installed');
  }
  public writeCharacteristicValue(value: ble.BLECharacteristic, mode: ble.GattWriteType,
    listener: WriteListener): void { throw new Error('SDK stub not installed'); }
  public writeDescriptorValue(value: ble.BLEDescriptor, listener: WriteListener): void {
    throw new Error('SDK stub not installed');
  }
}

/** One kit per external object. All event delivery uses callbacks captured from real production on calls. */
export class BluetoothSdk {
  private bleKit: MockKit = new MockKit();
  private accessKit: MockKit = new MockKit();
  private promptKit: MockKit = new MockKit();
  private clientKit: MockKit = new MockKit();
  private clientPort: ClientPort = new ClientPort();
  public calls: string[] = [];
  public toasts: promptAction.ShowToastOptions[] = [];
  public throwAt: string = '';
  public rejectAt: string = '';
  public error: ControlledError = new ControlledError();
  public resolveHandle: number = 7;
  public filters: ble.ScanFilter[] = [];
  public options: ble.ScanOptions | undefined = undefined;
  public advertising: ble.AdvertisingParams | undefined = undefined;
  public disableIds: number[] = [];
  public enableIds: number[] = [];
  public durations: number[] = [];
  public stopIds: number[] = [];
  public peers: string[] = [];
  public services: ble.GattService[] = [];
  public readCharacteristic: ble.BLECharacteristic = characteristic();
  public readDescriptor: ble.BLEDescriptor = descriptor();
  public sentCharacteristic: ble.BLECharacteristic | undefined = undefined;
  public sentDescriptor: ble.BLEDescriptor | undefined = undefined;
  public writeType: ble.GattWriteType | undefined = undefined;
  public callbackError: boolean = false;
  public scanListener: ScanListener | undefined = undefined;
  public advertisingListener: AdvertisingListener | undefined = undefined;
  public connectionListener: ConnectionListener | undefined = undefined;
  public stateListener: StateListener | undefined = undefined;
  public offMatchesRegistration: boolean[] = [];

  public get client(): ble.GattClientDevice { return this.clientPort as ble.GattClientDevice; }

  private record(stage: string): void {
    this.calls.push(stage);
    if (this.throwAt === stage) {
      throw this.error;
    }
  }

  constructor() {
    try {
    when(this.promptKit.mockFunc(promptTarget, promptAction.showToast))(ArgumentMatchers.anyObj)
      .afterAction((options: promptAction.ShowToastOptions): void => {
        this.record('prompt.showToast'); this.toasts.push(options);
      });
    when(this.bleKit.mockFunc(bleTarget, ble.on))(ArgumentMatchers.anyString)
      .afterAction((event: string, listener: ScanListener | AdvertisingListener): void => {
        this.record('ble.on');
        if (event === 'BLEDeviceFind') {
          this.scanListener = listener as ScanListener;
        }
        if (event === 'advertisingStateChange') {
          this.advertisingListener = listener as AdvertisingListener;
        }
      });
    when(this.bleKit.mockFunc(bleTarget, ble.off))(ArgumentMatchers.anyString)
      .afterAction((event: string, listener: ScanListener | AdvertisingListener): void => {
        this.record('ble.off');
        if (event === 'BLEDeviceFind') {
          this.offMatchesRegistration.push(listener === this.scanListener);
        }
        if (event === 'advertisingStateChange') {
          this.offMatchesRegistration.push(listener === this.advertisingListener);
        }
      });
    when(this.bleKit.mockFunc(bleTarget, ble.startBLEScan))(ArgumentMatchers.anyObj)
      .afterAction((filters: ble.ScanFilter[], options: ble.ScanOptions): void => {
        this.record('ble.startBLEScan'); this.filters = filters; this.options = options;
      });
    when(this.bleKit.mockFunc(bleTarget, ble.stopBLEScan))().afterAction((): void => {
      this.record('ble.stopBLEScan');
    });
    when(this.bleKit.mockFunc(bleTarget, ble.startAdvertising))(ArgumentMatchers.anyObj)
      .afterAction((params: ble.AdvertisingParams): Promise<number> => {
        this.record('ble.startAdvertising'); this.advertising = params;
        if (this.rejectAt === 'ble.startAdvertising') {
          return Promise.reject(this.error);
        }
        return Promise.resolve(this.resolveHandle);
      });
    when(this.bleKit.mockFunc(bleTarget, ble.disableAdvertising))(ArgumentMatchers.anyObj)
      .afterAction((params: ble.AdvertisingDisableParams): Promise<void> => {
        this.record('ble.disableAdvertising'); this.disableIds.push(params.advertisingId);
        if (this.rejectAt === 'ble.disableAdvertising') {
          return Promise.reject(this.error);
        }
        return Promise.resolve();
      });
    when(this.bleKit.mockFunc(bleTarget, ble.enableAdvertising))(ArgumentMatchers.anyObj)
      .afterAction((params: ble.AdvertisingEnableParams): Promise<void> => {
        this.record('ble.enableAdvertising'); this.enableIds.push(params.advertisingId);
        this.durations.push(params.duration === undefined ? 0 : params.duration);
        if (this.rejectAt === 'ble.enableAdvertising') {
          return Promise.reject(this.error);
        }
        return Promise.resolve();
      });
    when(this.bleKit.mockFunc(bleTarget, ble.stopAdvertising))(ArgumentMatchers.anyNumber)
      .afterAction((id: number): Promise<void> => {
        this.record('ble.stopAdvertising'); this.stopIds.push(id);
        if (this.rejectAt === 'ble.stopAdvertising') {
          return Promise.reject(this.error);
        }
        return Promise.resolve();
      });
    when(this.bleKit.mockFunc(bleTarget, ble.createGattClientDevice))(ArgumentMatchers.anyString)
      .afterAction((peer: string): ble.GattClientDevice => {
        this.record('ble.createGattClientDevice'); this.peers.push(peer); return this.client;
      });
    when(this.accessKit.mockFunc(accessTarget, access.off))(ArgumentMatchers.anyString)
      .afterAction((event: string): void => { this.record('access.off ' + event); });
    when(this.accessKit.mockFunc(accessTarget, access.on))(ArgumentMatchers.anyString)
      .afterAction((event: string, listener: StateListener): void => {
        this.record('access.on ' + event); this.stateListener = listener;
      });
    when(this.accessKit.mockFunc(accessTarget, access.enableBluetooth))().afterAction((): void => {
      this.record('access.enableBluetooth');
    });
    when(this.accessKit.mockFunc(accessTarget, access.disableBluetooth))().afterAction((): void => {
      this.record('access.disableBluetooth');
    });
    when(this.clientKit.mockFunc(this.clientPort, this.clientPort.on))(ArgumentMatchers.anyString)
      .afterAction((event: string, listener: ConnectionListener): void => {
        this.record('client.on'); this.connectionListener = listener;
      });
    when(this.clientKit.mockFunc(this.clientPort, this.clientPort.off))(ArgumentMatchers.anyString)
      .afterAction((event: string, listener: ConnectionListener): void => {
        this.record('client.off'); this.offMatchesRegistration.push(listener === this.connectionListener);
      });
    when(this.clientKit.mockFunc(this.clientPort, this.clientPort.connect))().afterAction((): void => {
      this.record('client.connect');
    });
    when(this.clientKit.mockFunc(this.clientPort, this.clientPort.disconnect))().afterAction((): void => {
      this.record('client.disconnect');
    });
    when(this.clientKit.mockFunc(this.clientPort, this.clientPort.close))().afterAction((): void => {
      this.record('client.close');
    });
    when(this.clientKit.mockFunc(this.clientPort, this.clientPort.getServices))()
      .afterAction((): Promise<ble.GattService[]> => {
        this.record('client.getServices');
        if (this.rejectAt === 'client.getServices') {
          return Promise.reject(this.error);
        }
        return Promise.resolve(this.services);
      });
    when(this.clientKit.mockFunc(this.clientPort, this.clientPort.readCharacteristicValue))(ArgumentMatchers.anyObj)
      .afterAction((value: ble.BLECharacteristic): Promise<ble.BLECharacteristic> => {
        this.record('client.readCharacteristicValue'); this.sentCharacteristic = value;
        return Promise.resolve(this.readCharacteristic);
      });
    when(this.clientKit.mockFunc(this.clientPort, this.clientPort.readDescriptorValue))(ArgumentMatchers.anyObj)
      .afterAction((value: ble.BLEDescriptor): Promise<ble.BLEDescriptor> => {
        this.record('client.readDescriptorValue'); this.sentDescriptor = value;
        return Promise.resolve(this.readDescriptor);
      });
    when(this.clientKit.mockFunc(this.clientPort, this.clientPort.writeCharacteristicValue))(ArgumentMatchers.anyObj)
      .afterAction((value: ble.BLECharacteristic, mode: ble.GattWriteType, listener: WriteListener): void => {
        this.record('client.writeCharacteristicValue'); this.sentCharacteristic = value; this.writeType = mode;
        listener(this.callbackError ? this.error : undefined);
      });
    when(this.clientKit.mockFunc(this.clientPort, this.clientPort.writeDescriptorValue))(ArgumentMatchers.anyObj)
      .afterAction((value: ble.BLEDescriptor, listener: WriteListener): void => {
        this.record('client.writeDescriptorValue'); this.sentDescriptor = value;
        listener(this.callbackError ? this.error : undefined);
      });
    } catch (error) {
      // Installation failures are not test success; restore partial mocks and propagate.
      runCleanup((): void => { this.dispose(); }, true);
      rethrowCaught(error);
    }
  }

  public emitScan(results: ble.ScanResult[]): void {
    const listener = this.scanListener;
    if (listener === undefined) {
      throw new Error('Production BLEDeviceFind listener was not registered');
    }
    listener(results);
  }
  public emitAdvertising(info: ble.AdvertisingStateChangeInfo): void {
    const listener = this.advertisingListener;
    if (listener === undefined) {
      throw new Error('Production advertising listener was not registered');
    }
    listener(info);
  }
  public emitConnection(info: ble.BLEConnectionChangeState): void {
    const listener = this.connectionListener;
    if (listener === undefined) {
      throw new Error('Production client listener was not registered');
    }
    listener(info);
  }
  public emitState(state: access.BluetoothState): void {
    const listener = this.stateListener;
    if (listener === undefined) {
      throw new Error('Production access listener was not registered');
    }
    listener(state);
  }
  public dispose(): void {
    // clear(target) must precede destructive clearAll; kits never mix SDK objects.
    runCleanupSequence([
      (): void => { this.clientKit.clear(this.clientPort); this.clientKit.clearAll(); },
      (): void => { this.accessKit.clear(accessTarget); this.accessKit.clearAll(); },
      (): void => { this.bleKit.clear(bleTarget); this.bleKit.clearAll(); },
      (): void => { this.promptKit.clear(promptTarget); this.promptKit.clearAll(); },
      (): void => {
        this.scanListener = undefined;
        this.advertisingListener = undefined;
        this.connectionListener = undefined;
        this.stateListener = undefined;
      }
    ]);
  }
}
