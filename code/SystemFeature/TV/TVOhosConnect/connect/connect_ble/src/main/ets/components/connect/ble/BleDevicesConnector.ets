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
import BleDevice from './BleDevice';
import BleDevicesController from './BleDevicesController';
import { ble } from '@kit.ConnectivityKit';
import { BusinessError, Callback } from '@kit.BasicServicesKit';
import { InfDevice, InfDevicesConnector, Logger } from '@ohos/common/index';
import BleConstants from './constants/BleConstants';

const TAG = 'BleDevicesConnector';

export default class BleDevicesConnector implements InfDevicesConnector {
  public controller: BleDevicesController;
  public connectedClient: ble.GattClientDevice | undefined;
  public connectedDevice: InfDevice | undefined;
  public onBleDataCallBacks: Array<Callback<ArrayBuffer>> = [];

  constructor(controller: BleDevicesController) {
    this.controller = controller;
  }

  public getCurrentConnectedDevice(): InfDevice | undefined {
    return this.connectedDevice;
  }

  public async stopConnect(device: InfDevice): Promise<boolean> {
    const bleDevice: BleDevice = device as BleDevice;
    try {
      let device: ble.GattClientDevice = ble.createGattClientDevice(bleDevice.macAddress);
      device.disconnect();
      device.close();
      return true;
    } catch (err) {
      Logger.error(TAG, 'BleDevicesConnector ,errCode: ' + (err as BusinessError).code + ', errMessage: ' +
        (err as BusinessError).message);
      return false;
    }
  }

  public async connect(device: InfDevice): Promise<boolean> {
    const bleDevice: BleDevice = device as BleDevice;
    try {
      this.connectedClient = ble.createGattClientDevice(bleDevice.macAddress);
      this.connectedClient.connect();
      //设置单个数据包最大size
      this.connectedClient.setBLEMtuSize(BleConstants.BLE_MTU_SIZE);
      this.initListener();
      return true;
    } catch (err) {
      Logger.error(TAG, 'BleDevicesConnector ,errCode: ' + (err as BusinessError).code + ', errMessage: ' +
        (err as BusinessError).message);
      return false;
    }
  }

  public addOnDataCallback(callback: Callback<ArrayBuffer>) {
    this.onBleDataCallBacks.push(callback);
  }

  public sendData(ab: ArrayBuffer) {
    if (this.connectedClient == null) {
      Logger.error(TAG, 'BleDevicesConnector ,this.this.connectedClient == null');
    }
    const descriptors: ble.BLEDescriptor[] = [];
    let characteristic: ble.BLECharacteristic = {
      serviceUuid: BleConstants.GATT_SERVICE_UUID,
      characteristicUuid: BleConstants.GATT_CHARACTERISTIC_READ_UUID,
      characteristicValue: ab,
      descriptors: descriptors
    };
    try {
      this.connectedClient!.writeCharacteristicValue(characteristic, ble.GattWriteType.WRITE, () => {
        Logger.debug(TAG, 'writeCharacteristicValue success');
      });
    } catch (err) {
      Logger.error(TAG, 'errCode: ' + (err as BusinessError).code + ', errMessage: ' + (err as BusinessError).message);
    }
  }

  private notifyOnDataCallback(ab: ArrayBuffer) {
    for (let i = 0; i < this.onBleDataCallBacks.length; i++) {
      this.onBleDataCallBacks[i](ab);
    }
  }

  private initListener() {
    const characteristic = BleConstants.GATT_CHARACTERISTIC_READ_UUID;
    const descriptors: ble.BLEDescriptor[] = [];
    let notifyCharacter: ble.BLECharacteristic = {
      serviceUuid: BleConstants.GATT_SERVICE_UUID,
      characteristicUuid: BleConstants.GATT_CHARACTERISTIC_READ_UUID,
      characteristicValue: new ArrayBuffer(8),
      descriptors: descriptors,
      properties: {
        read: true,
      }
    };
    try {
      this.connectedClient!.setCharacteristicChangeNotification(notifyCharacter, true, (err: BusinessError) => {
        //订阅失败
        if (err) {
          Logger.debug(TAG, 'setCharacteristicChangeNotification() failed to subscribe');
        }
      });
      this.connectedClient!.on('BLECharacteristicChange', (characteristicChangeReq: ble.BLECharacteristic) => {
        let value: ArrayBuffer = characteristicChangeReq.characteristicValue;
        this.notifyOnDataCallback(value);
      });
    } catch (err) {
      Logger.error(TAG, 'errCode: ' + (err as BusinessError).code + ', errMessage: ' + (err as BusinessError).message);
    }
  }
};