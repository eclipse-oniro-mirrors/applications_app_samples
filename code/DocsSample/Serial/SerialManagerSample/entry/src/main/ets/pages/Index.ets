/*
* Copyright (C) 2026 Huawei Device Co., Ltd.
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

// [Start head]
import hilog from '@ohos.hilog';
import SerialController from '../model/SerialController';
import SystemSerialProvider from '../model/SystemSerialProvider';
// [End head]

const TAG = '[SerialSample]';

@Entry
@Component
struct Index {
  private controller: SerialController = new SerialController(new SystemSerialProvider());
  @State private status: string = 'Ready';

  aboutToDisappear(): void {
    this.controller.dispose().catch((error: Error) => {
      hilog.error(0xF811, TAG, 'Session cleanup failed: %{public}s', error.message);
    });
  }

  build() {
    Scroll() {
      Column({ space: 10 }) {
        Text('Serial Manager Sample')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20, bottom: 10 })

        Text(this.status)
          .id('serialStatus')
          .fontSize(14)
          .width('90%')

        Text('Basic')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .width('90%')

        Button('getSerialPortList')
          .id('serial_getSerialPortList')
          .width('90%')
          .onClick(() => this.testGetSerialPortList())

        Button('portInfo')
          .id('serial_portInfo')
          .width('90%')
          .onClick(() => this.testPortInfo())

        Button('open')
          .id('serial_open')
          .width('90%')
          .onClick(() => this.testOpen())

        Text('Data Transfer')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .width('90%')
          .margin({ top: 10 })

        Button('write')
          .id('serial_write')
          .width('90%')
          .onClick(() => this.testWrite())

        Button('onDataRead')
          .id('serial_onDataRead')
          .width('90%')
          .onClick(() => this.testOnDataRead())

        Button('offDataRead')
          .id('serial_offDataRead')
          .width('90%')
          .onClick(() => this.testOffDataRead())

        Text('Buffer & Signal')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .width('90%')
          .margin({ top: 10 })

        Button('flush')
          .id('serial_flush')
          .width('90%')
          .onClick(() => this.testFlush())

        Button('drain')
          .id('serial_drain')
          .width('90%')
          .onClick(() => this.testDrain())

        Button('setRts')
          .id('serial_setRts')
          .width('90%')
          .onClick(() => this.testSetRts())

        Button('getCts')
          .id('serial_getCts')
          .width('90%')
          .onClick(() => this.testGetCts())

        Button('setDtr')
          .id('serial_setDtr')
          .width('90%')
          .onClick(() => this.testSetDtr())

        Button('getDsr')
          .id('serial_getDsr')
          .width('90%')
          .onClick(() => this.testGetDsr())

        Button('sendBrk')
          .id('serial_sendBrk')
          .width('90%')
          .onClick(() => this.testSendBrk())

        Text('Close')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .width('90%')
          .margin({ top: 10 })

        Button('close')
          .id('serial_close')
          .width('90%')
          .onClick(() => this.testClose())

        Button('onDisconnect')
          .id('serial_onDisconnect')
          .width('90%')
          .onClick(() => this.testOnDisconnect())

        Button('offDisconnect')
          .id('serial_offDisconnect')
          .width('90%')
          .onClick(() => this.testOffDisconnect())
      }
      .width('100%')
      .padding({ left: '5%', right: '5%', bottom: 30 })
    }
    .width('100%')
    .height('100%')
  }

  private async invoke(name: string, action: () => Promise<void>): Promise<void> {
    try {
      await action();
      this.status = name + ' success';
      hilog.info(0xF811, TAG, '%{public}s', this.status);
    } catch (error) {
      const failure = error as Error;
      this.status = name + ' failed: ' + failure.message;
      hilog.error(0xF811, TAG, '%{public}s', this.status);
    }
  }

  async testGetSerialPortList(): Promise<void> {
    await this.invoke('getSerialPortList', async () => {
      await this.controller.getSerialPortList();
    });
  }

  async testPortInfo(): Promise<void> {
    await this.invoke('portInfo', async () => {
      await this.controller.portInfo();
    });
  }

  async testOpen(): Promise<void> {
    await this.invoke('open', async () => {
      await this.controller.open();
    });
  }

  async testWrite(): Promise<void> {
    await this.invoke('write', async () => {
      await this.controller.write();
    });
  }

  async testOnDataRead(): Promise<void> {
    await this.invoke('onDataRead', async () => {
      await this.controller.onDataRead();
    });
  }

  async testOffDataRead(): Promise<void> {
    await this.invoke('offDataRead', async () => {
      await this.controller.offDataRead();
    });
  }

  async testFlush(): Promise<void> {
    await this.invoke('flush', async () => {
      await this.controller.flush();
    });
  }

  async testDrain(): Promise<void> {
    await this.invoke('drain', async () => {
      await this.controller.drain();
    });
  }

  async testSetRts(): Promise<void> {
    await this.invoke('setRts', async () => {
      await this.controller.setRts();
    });
  }

  async testGetCts(): Promise<void> {
    await this.invoke('getCts', async () => {
      await this.controller.getCts();
    });
  }

  async testSetDtr(): Promise<void> {
    await this.invoke('setDtr', async () => {
      await this.controller.setDtr();
    });
  }

  async testGetDsr(): Promise<void> {
    await this.invoke('getDsr', async () => {
      await this.controller.getDsr();
    });
  }

  async testSendBrk(): Promise<void> {
    await this.invoke('sendBrk', async () => {
      await this.controller.sendBrk();
    });
  }

  async testClose(): Promise<void> {
    await this.invoke('close', async () => {
      await this.controller.close();
    });
  }

  async testOnDisconnect(): Promise<void> {
    await this.invoke('onDisconnect', async () => {
      await this.controller.onDisconnect();
    });
  }

  async testOffDisconnect(): Promise<void> {
    await this.invoke('offDisconnect', async () => {
      await this.controller.offDisconnect();
    });
  }
}
