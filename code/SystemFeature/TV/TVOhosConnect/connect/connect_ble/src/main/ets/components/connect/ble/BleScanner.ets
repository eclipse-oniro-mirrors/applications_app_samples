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
import { HashMap } from '@kit.ArkTS';
import { ble } from '@kit.ConnectivityKit';
import { Logger } from '@ohos/common/src/main/ets/utils/Logger';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = 'BleScanner';

export default class BleScanner {
  public static instance: BleScanner;
  public scanCallbackMap: HashMap<string, (result: ble.ScanResult) => Promise<boolean>> =
    new HashMap<string, (result: ble.ScanResult) => Promise<boolean>>();
  public isScanning: boolean = false;

  private constructor() {
  }

  public static getInstance(): BleScanner {
    if (BleScanner.instance == null) {
      BleScanner.instance = new BleScanner();
    }
    return BleScanner.instance;
  }

  public registerScanCallback(key: string, callback: (result: ble.ScanResult) => Promise<boolean>) {
    this.scanCallbackMap.set(key, callback);
  }

  public unregisterScanCallback(key: string) {
    this.scanCallbackMap.remove(key);
  }

  public startScan() {
    if (this.isScanning) {
      return;
    }
    let scanOptions: ble.ScanOptions = {
      interval: 0,
      //低延迟模式
      dutyMode: ble.ScanDuty.SCAN_MODE_LOW_LATENCY,
      matchMode: ble.MatchMode.MATCH_MODE_AGGRESSIVE,
    };
    ble.on('BLEDeviceFind', (data: Array<ble.ScanResult>) => {
      this.onReceiveEvent(data);
    });
    ble.startBLEScan(null, scanOptions);
    this.isScanning = true;
  }

  public stopScan() {
    if (this.isScanning) {
      try {
        ble.stopBLEScan();
      } catch (err) {
        Logger.error(TAG,
          'errCode: ' + (err as BusinessError).code + ', errMessage: ' + (err as BusinessError).message);
      }
      this.isScanning = false;
    }
  }

  public onReceiveEvent(data: Array<ble.ScanResult>) {
    if (!data || data.length == 0) {
      return;
    }
    for (let i = 0; i < data.length; i++) {
      const result: ble.ScanResult = data[i];
      Logger.debug(TAG, 'Found BLE device: ' + JSON.stringify(result));
      this.handleResult(result);
    }
  }

  public async handleResult(result: ble.ScanResult): Promise<boolean> {
    Logger.debug(TAG, 'handleResult:' + result.deviceName);
    const iterator: IterableIterator<string> = this.scanCallbackMap.keys();
    let next = iterator.next();
    while (!next.done) {
      const key: string = next.value;
      const callback = this.scanCallbackMap.get(key);
      if (await callback(result)) {
        return true;
      }
      next = iterator.next();
    }
    return false;
  }
};

