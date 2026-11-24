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
import SerialConfigValues from './SerialConfigValues';

export interface SerialProvider {
  getSerialPortList(): Promise<serial.SerialPort[]>;
}

export interface SerialSnapshot {
  portName: string;
  opened: boolean;
  dataSubscribed: boolean;
  disconnectSubscribed: boolean;
  receivedBytes: number;
  transmittedBytes: number;
  lastData: number[];
}

export function defaultSerialConfig(): serial.SerialConfigs {
  return {
    baudRate: 115200,
    dataBits: SerialConfigValues.dataBitsEight,
    stopBits: SerialConfigValues.stopBitsOne,
    parity: SerialConfigValues.parityNone
  };
}

export class SerialStateError extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'SerialStateError';
  }
}

export default class SerialController {
  private provider: SerialProvider;
  private port: serial.SerialPort | null = null;
  private opened: boolean = false;
  private dataCallback: ((data: Uint8Array) => void) | null = null;
  private disconnectedCallback: (() => void) | null = null;
  private receivedBytes: number = 0;
  private transmittedBytes: number = 0;
  private lastData: number[] = [];
  private queue: Promise<void> = Promise.resolve();

  constructor(provider: SerialProvider) {
    this.provider = provider;
  }

  private enqueue<T>(action: () => Promise<T>): Promise<T> {
    const result: Promise<T> = this.queue.then(action);
    this.queue = result.then(() => {}, () => {});
    return result;
  }

  private requirePort(): serial.SerialPort {
    if (this.port === null) {
      throw new SerialStateError('No serial port selected; enumerate ports first');
    }
    return this.port;
  }

  snapshot(): SerialSnapshot {
    return {
      portName: this.port === null ? '' : this.port.portInfo.portName,
      opened: this.opened,
      dataSubscribed: this.dataCallback !== null,
      disconnectSubscribed: this.disconnectedCallback !== null,
      receivedBytes: this.receivedBytes,
      transmittedBytes: this.transmittedBytes,
      lastData: this.lastData.slice()
    };
  }

  getSerialPortList(): Promise<serial.SerialPortInfo[]> {
    return this.enqueue(async () => {
      if (this.opened || this.dataCallback !== null || this.disconnectedCallback !== null) {
        throw new SerialStateError('Close or release the active session before enumeration');
      }
      const ports: serial.SerialPort[] = await this.provider.getSerialPortList();
      this.port = ports.length > 0 ? ports[0] : null;
      return ports.map((port: serial.SerialPort) => port.portInfo);
    });
  }

  portInfo(): Promise<serial.SerialPortInfo> {
    return this.enqueue(async () => this.requirePort().portInfo);
  }

  open(config: serial.SerialConfigs = defaultSerialConfig()): Promise<void> {
    const request: serial.SerialConfigs = {
      baudRate: config.baudRate,
      dataBits: config.dataBits,
      stopBits: config.stopBits,
      parity: config.parity
    };
    return this.enqueue(async () => {
      const port = this.requirePort();
      await port.open(request);
      this.opened = true;
    });
  }

  write(data: Uint8Array = new Uint8Array([0x48, 0x65, 0x6C, 0x6C, 0x6F]),
    timeout?: number): Promise<number> {
    const request: Uint8Array = new Uint8Array(data);
    return this.enqueue(async () => {
      const length: number = await this.requirePort().write(request, timeout);
      this.transmittedBytes += length;
      return length;
    });
  }

  onDataRead(): Promise<void> {
    return this.enqueue(async () => {
      const port = this.requirePort();
      if (this.dataCallback !== null) {
        return;
      }
      const callback = (data: Uint8Array): void => {
        if (this.dataCallback !== callback || this.port !== port) {
          return;
        }
        this.lastData = Array.from(data);
        this.receivedBytes += data.length;
      };
      port.onDataRead(callback);
      this.dataCallback = callback;
    });
  }

  offDataRead(): Promise<void> {
    return this.enqueue(async () => {
      const port = this.requirePort();
      if (this.dataCallback === null) {
        throw new SerialStateError('No data callback registered');
      }
      port.offDataRead(this.dataCallback);
      this.dataCallback = null;
    });
  }

  flush(): Promise<void> {
    return this.enqueue(async () => this.requirePort().flush());
  }

  drain(): Promise<void> {
    return this.enqueue(async () => this.requirePort().drain());
  }

  setRts(enable: boolean = true): Promise<void> {
    return this.enqueue(async () => this.requirePort().setRts(enable));
  }

  getCts(): Promise<boolean> {
    return this.enqueue(async () => this.requirePort().getCts());
  }

  setDtr(enable: boolean = true): Promise<void> {
    return this.enqueue(async () => this.requirePort().setDtr(enable));
  }

  getDsr(): Promise<boolean> {
    return this.enqueue(async () => this.requirePort().getDsr());
  }

  sendBrk(): Promise<void> {
    return this.enqueue(async () => this.requirePort().sendBrk());
  }

  onDisconnect(): Promise<void> {
    return this.enqueue(async () => {
      const port = this.requirePort();
      if (this.disconnectedCallback !== null) {
        return;
      }
      const callback = (): void => {
        if (this.disconnectedCallback !== callback || this.port !== port) {
          return;
        }
        this.port = null;
        this.opened = false;
        this.dataCallback = null;
        this.disconnectedCallback = null;
      };
      port.onDisconnect(callback);
      this.disconnectedCallback = callback;
    });
  }

  offDisconnect(): Promise<void> {
    return this.enqueue(async () => {
      const port = this.requirePort();
      if (this.disconnectedCallback === null) {
        throw new SerialStateError('No disconnect callback registered');
      }
      port.offDisconnect(this.disconnectedCallback);
      this.disconnectedCallback = null;
    });
  }

  close(): Promise<void> {
    return this.enqueue(async () => {
      await this.requirePort().close();
      this.port = null;
      this.opened = false;
      this.dataCallback = null;
      this.disconnectedCallback = null;
    });
  }

  dispose(): Promise<void> {
    return this.enqueue(async () => {
      if (this.port === null) {
        return;
      }
      const port = this.port;
      if (this.opened) {
        await port.close();
      } else {
        if (this.dataCallback !== null) {
          port.offDataRead(this.dataCallback);
        }
        if (this.disconnectedCallback !== null) {
          port.offDisconnect(this.disconnectedCallback);
        }
      }
      this.port = null;
      this.opened = false;
      this.dataCallback = null;
      this.disconnectedCallback = null;
    });
  }
}
