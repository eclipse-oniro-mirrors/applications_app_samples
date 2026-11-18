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

import { serial } from '@kit.BasicServicesKit';
import { expect } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import SerialController, { SerialProvider } from '../../../../main/ets/model/SerialController';

export class InjectedSerialError extends Error {
  code: number;

  constructor(code: number) {
    super('Injected serial service failure ' + code);
    this.name = 'BusinessError';
    this.code = code;
  }
}

export interface FailureRequest {
  operation: string;
  code: number;
}

export class FakeSerialPort implements serial.SerialPort {
  readonly portInfo: serial.SerialPortInfo;
  opened: boolean = false;
  calls: string[] = [];
  writes: Uint8Array[] = [];
  timeouts: (number | undefined)[] = [];
  configs: serial.SerialConfigs[] = [];
  dataCallbacks: ((data: Uint8Array) => void)[] = [];
  disconnectCallbacks: (() => void)[] = [];
  failures: FailureRequest[] = [];
  writeResult: number | null = null;
  cts: boolean = false;
  dsr: boolean = false;
  rts: boolean = false;
  dtr: boolean = false;
  delayMs: number = 0;

  constructor(name: string = 'ttyUSB0', vendorId?: number, productId?: number, manufacturer?: string) {
    this.portInfo = { portName: name, vendorId: vendorId, productId: productId, manufacturer: manufacturer };
  }

  failOnce(operation: string, code: number): void {
    this.failures.push({ operation: operation, code: code });
  }

  private record(operation: string): void {
    this.calls.push(operation);
    const index: number = this.failures.findIndex((item: FailureRequest) => item.operation === operation);
    if (index >= 0) {
      const failure: FailureRequest = this.failures.splice(index, 1)[0];
      throw new InjectedSerialError(failure.code);
    }
  }

  private async begin(operation: string): Promise<void> {
    this.record(operation);
    if (this.delayMs > 0) {
      await new Promise<void>((resolve: () => void) => setTimeout(resolve, this.delayMs));
    }
  }

  private requireOpen(): void {
    if (!this.opened) {
      throw new InjectedSerialError(35700005);
    }
  }

  async open(config?: serial.SerialConfigs): Promise<void> {
    await this.begin('open');
    if (this.opened) {
      throw new InjectedSerialError(35700004);
    }
    const value: serial.SerialConfigs = config === undefined ? {} : config;
    this.configs.push({ baudRate: value.baudRate, dataBits: value.dataBits,
      stopBits: value.stopBits, parity: value.parity });
    this.opened = true;
  }

  async close(): Promise<void> {
    await this.begin('close');
    this.requireOpen();
    this.opened = false;
    this.dataCallbacks = [];
    this.disconnectCallbacks = [];
  }

  async write(data: Uint8Array, timeout?: number): Promise<number> {
    await this.begin('write');
    this.requireOpen();
    this.writes.push(new Uint8Array(data));
    this.timeouts.push(timeout);
    return this.writeResult === null ? data.length : this.writeResult;
  }

  onDataRead(callback: (data: Uint8Array) => void): void {
    this.record('onDataRead');
    this.dataCallbacks.push(callback);
  }

  offDataRead(callback?: (data: Uint8Array) => void): void {
    this.record('offDataRead');
    this.dataCallbacks = callback === undefined ? [] :
      this.dataCallbacks.filter((item: (data: Uint8Array) => void) => item !== callback);
  }

  emitData(data: Uint8Array): void {
    this.dataCallbacks.slice().forEach((callback: (data: Uint8Array) => void) => callback(data));
  }

  async flush(): Promise<void> {
    await this.begin('flush');
    this.requireOpen();
  }

  async drain(): Promise<void> {
    await this.begin('drain');
    this.requireOpen();
  }

  async setRts(enable: boolean): Promise<void> {
    await this.begin('setRts');
    this.requireOpen();
    this.rts = enable;
  }

  async getCts(): Promise<boolean> {
    await this.begin('getCts');
    this.requireOpen();
    return this.cts;
  }

  async setDtr(enable: boolean): Promise<void> {
    await this.begin('setDtr');
    this.requireOpen();
    this.dtr = enable;
  }

  async getDsr(): Promise<boolean> {
    await this.begin('getDsr');
    this.requireOpen();
    return this.dsr;
  }

  async sendBrk(): Promise<void> {
    await this.begin('sendBrk');
    this.requireOpen();
  }

  onDisconnect(callback: () => void): void {
    this.record('onDisconnect');
    this.disconnectCallbacks.push(callback);
  }

  offDisconnect(callback?: () => void): void {
    this.record('offDisconnect');
    this.disconnectCallbacks = callback === undefined ? [] :
      this.disconnectCallbacks.filter((item: () => void) => item !== callback);
  }

  emitDisconnect(): void {
    this.opened = false;
    const callbacks: (() => void)[] = this.disconnectCallbacks.slice();
    this.dataCallbacks = [];
    this.disconnectCallbacks = [];
    callbacks.forEach((callback: () => void) => callback());
  }

  callCount(operation: string): number {
    return this.calls.filter((item: string) => item === operation).length;
  }
}

export class FakeSerialProvider implements SerialProvider {
  ports: serial.SerialPort[] = [];
  calls: number = 0;
  failureCode: number | null = null;

  async getSerialPortList(): Promise<serial.SerialPort[]> {
    this.calls++;
    if (this.failureCode !== null) {
      const code: number = this.failureCode;
      this.failureCode = null;
      throw new InjectedSerialError(code);
    }
    return this.ports.slice();
  }
}

export class SerialFixture {
  provider: FakeSerialProvider = new FakeSerialProvider();
  port: FakeSerialPort = new FakeSerialPort();
  controller: SerialController = new SerialController(this.provider);

  constructor() {
    this.provider.ports = [this.port];
  }

  async select(): Promise<void> {
    await this.controller.getSerialPortList();
  }

  async open(): Promise<void> {
    await this.select();
    await this.controller.open();
  }

  async dispose(): Promise<void> {
    await this.controller.dispose();
    /* A positive delay lets the native timer handler return before the next case. */
    await new Promise<void>((resolve: () => void) => setTimeout(resolve, 20));
  }
}

export function expectBytes(actual: Uint8Array | number[], expected: number[]): void {
  expect(actual.length).assertEqual(expected.length);
  const bytes: number[] = Array.from(actual);
  expect(bytes).assertDeepEquals(expected);
}

export async function expectFailure<T>(action: () => Promise<T>, expectedName: string,
  expectedCode?: number): Promise<void> {
  let failure: Error | null = null;
  try {
    await action();
  } catch (error) {
    failure = error as Error;
  }
  if (failure === null) {
    throw new Error('Expected rejection: ' + expectedName);
  }
  expect(failure.name).assertEqual(expectedName);
  if (expectedCode !== undefined) {
    expect((failure as InjectedSerialError).code).assertEqual(expectedCode);
  }
}

export function payload(length: number, seed: number): Uint8Array {
  const bytes: Uint8Array = new Uint8Array(length);
  for (let index: number = 0; index < length; index++) {
    bytes[index] = (seed + index * 17) % 256;
  }
  return bytes;
}

export function logSuite(name: string, phase: string): void {
  hilog.info(0xF811, 'SerialTests', '%{public}s %{public}s', name, phase);
}

export type SerialOperation = 'portInfo' | 'open' | 'write' | 'onDataRead' | 'offDataRead' |
  'flush' | 'drain' | 'setRts' | 'getCts' | 'setDtr' | 'getDsr' | 'sendBrk' |
  'close' | 'onDisconnect' | 'offDisconnect';

export const SERIAL_OPERATIONS: SerialOperation[] = [
  'portInfo', 'open', 'write', 'onDataRead', 'offDataRead', 'flush', 'drain',
  'setRts', 'getCts', 'setDtr', 'getDsr', 'sendBrk', 'close', 'onDisconnect', 'offDisconnect'
];

export async function invokeOperation(controller: SerialController, operation: SerialOperation): Promise<void> {
  switch (operation) {
    case 'portInfo':
      await controller.portInfo();
      break;
    case 'open':
      await controller.open();
      break;
    case 'write':
      await controller.write();
      break;
    case 'onDataRead':
      await controller.onDataRead();
      break;
    case 'offDataRead':
      await controller.offDataRead();
      break;
    case 'flush':
      await controller.flush();
      break;
    case 'drain':
      await controller.drain();
      break;
    case 'setRts':
      await controller.setRts();
      break;
    case 'getCts':
      await controller.getCts();
      break;
    case 'setDtr':
      await controller.setDtr();
      break;
    case 'getDsr':
      await controller.getDsr();
      break;
    case 'sendBrk':
      await controller.sendBrk();
      break;
    case 'close':
      await controller.close();
      break;
    case 'onDisconnect':
      await controller.onDisconnect();
      break;
    case 'offDisconnect':
      await controller.offDisconnect();
      break;
  }
}

export function expectReleased(fixture: SerialFixture): void {
  const state = fixture.controller.snapshot();
  expect(state.portName).assertEqual('');
  expect(state.opened).assertFalse();
  expect(state.lastData.length <= state.receivedBytes).assertTrue();
  expect(state.dataSubscribed).assertFalse();
  expect(state.disconnectSubscribed).assertFalse();
  expect(fixture.port.dataCallbacks.length).assertEqual(0);
  expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
  expect(fixture.port.opened).assertFalse();
}

export function expectSession(fixture: SerialFixture): void {
  const state = fixture.controller.snapshot();
  expect(state.portName).assertEqual(fixture.port.portInfo.portName);
  expect(state.opened).assertTrue();
  expect(fixture.port.opened).assertTrue();
}

export function expectCallSequence(port: FakeSerialPort, expected: string[]): void {
  expect(port.calls.length).assertEqual(expected.length);
  for (let index: number = 0; index < expected.length; index++) {
    expect(port.calls[index]).assertEqual(expected[index]);
  }
}
