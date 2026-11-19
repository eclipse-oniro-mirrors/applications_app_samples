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
import { rethrowCaught } from '../fixtures/SdkInterop';
import { runCleanup } from '../fixtures/Cleanup';
import { expect } from '@ohos/hypium';
import { BluetoothSdk } from '../fixtures/BluetoothSdk';
import { BleAdvertisingManager } from '../../../../../main/ets/bluetoothService/BluetoothAdvertising';
import { ble } from '@kit.ConnectivityKit';
/**
 * @tc.number V2_BT_ADVERTISING_007
 * @tc.name EXP_V2_BT_ADVERTISING_007
 * @tc.desc Inspect two real advertising builds, buffer alias snapshots, handle replacement, ordered current/old events and awaited recovery. Scenario: {"handle":1,"duration":100,"manufacturer":4567,"includeName":false,"recoveryStage":"ble.disableAdvertising"}
 * @tc.size MediumTest
 * @tc.type Function
 * @tc.level Level1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const sdk = new BluetoothSdk();
    let primaryFailed2: boolean = false;
    try {
      const manager = new BleAdvertisingManager();
      const hadState = AppStorage.has('advertiserState');
      const previousState = AppStorage.get<number>('advertiserState');
      let primaryFailed1: boolean = false;
      try {
        const manufacturerBytes = new Uint8Array([7,0,255]);
        const serviceBytes = new Uint8Array([65,73]);
        manager.setAdvertisingParameter(
          4567,
          manufacturerBytes,
          '00001888-0000-1000-8000-00805f9b34fb',
          serviceBytes,
          false
        );
        sdk.resolveHandle = 1;
        await manager.startAdvertising();
        const first = sdk.advertising;
        expect(first !== undefined).assertTrue();
        if (first === undefined) {
          throw new Error('Expected first from real production call');
        }
        const firstListener = sdk.advertisingListener;
        if (firstListener === undefined) {
          throw new Error('Actual advertising listener missing');
        }
        const manufacturers = first.advertisingData.manufactureData;
        expect(manufacturers !== undefined).assertTrue();
        if (manufacturers === undefined) {
          throw new Error('Expected manufacturers from real production call');
        }
        const services = first.advertisingData.serviceData;
        expect(services !== undefined).assertTrue();
        if (services === undefined) {
          throw new Error('Expected services from real production call');
        }
        expect(manufacturers[0].manufactureId).assertEqual(4567);
        expect(new Uint8Array(manufacturers[0].manufactureValue).join(',')).assertEqual('7,0,255');
        expect(manufacturers[0].manufactureValue === manufacturerBytes.buffer).assertTrue();
        expect(services[0].serviceUuid).assertEqual('00001888-0000-1000-8000-00805f9b34fb');
        expect(new Uint8Array(services[0].serviceValue).join(',')).assertEqual('65,73');
        expect(services[0].serviceValue === serviceBytes.buffer).assertTrue();
        expect(first.advertisingData.includeDeviceName).assertEqual(false);
        expect(first.advertisingSettings.interval).assertEqual(160);
        expect(first.advertisingSettings.txPower).assertEqual(0);
        expect(first.advertisingSettings.connectable).assertEqual(true);
        expect(first.duration).assertEqual(0);
        sdk.emitAdvertising({ advertisingId: 1, state: 1 as ble.AdvertisingState });
        expect(AppStorage.get<number>('advertiserState')).assertEqual(1);
        manufacturerBytes[0] = 42;
        serviceBytes[0] = 90;
        expect(new Uint8Array(manufacturers[0].manufactureValue).join(',')).assertEqual('42,0,255');
        expect(new Uint8Array(services[0].serviceValue).join(',')).assertEqual('90,73');
        await manager.enableAdvertising(100);
        await manager.disableAdvertising();
        expect(JSON.stringify(sdk.enableIds)).assertEqual('[1]');
        expect(JSON.stringify(sdk.disableIds)).assertEqual('[1]');
        expect(JSON.stringify(sdk.durations)).assertEqual('[100]');
        manager.setAdvertisingParameter();
        sdk.resolveHandle = 2;
        await manager.startAdvertising();
        const second = sdk.advertising;
        expect(second !== undefined).assertTrue();
        if (second === undefined) {
          throw new Error('Expected second from real production call');
        }
        expect(second !== first).assertTrue();
        expect(sdk.advertisingListener !== firstListener).assertTrue();
        expect(second.advertisingData.includeDeviceName).assertEqual(false);
        const nextManufacturers = second.advertisingData.manufactureData;
        expect(nextManufacturers !== undefined).assertTrue();
        if (nextManufacturers === undefined) {
          throw new Error('Expected nextManufacturers from real production call');
        }
        const nextServices = second.advertisingData.serviceData;
        expect(nextServices !== undefined).assertTrue();
        if (nextServices === undefined) {
          throw new Error('Expected nextServices from real production call');
        }
        expect(nextManufacturers[0].manufactureId).assertEqual(4567);
        expect(new Uint8Array(nextManufacturers[0].manufactureValue).join(',')).assertEqual('42,0,255');
        expect(new Uint8Array(nextServices[0].serviceValue).join(',')).assertEqual('90,73');
        expect(nextManufacturers[0].manufactureValue === manufacturers[0].manufactureValue).assertTrue();
        expect(first.advertisingData.includeDeviceName).assertEqual(false);
        firstListener({ advertisingId: 1, state: 2 as ble.AdvertisingState });
        expect(AppStorage.get<number>('advertiserState')).assertEqual(2);
        sdk.emitAdvertising({ advertisingId: 2, state: 0 as ble.AdvertisingState });
        expect(AppStorage.get<number>('advertiserState')).assertEqual(0);
        sdk.rejectAt = 'ble.disableAdvertising';
        await manager.disableAdvertising();
        expect(sdk.toasts[sdk.toasts.length - 1].message).assertEqual('bluetooth disableAdvertising fail');
        sdk.rejectAt = '';
        await manager.disableAdvertising();
        expect(sdk.toasts[sdk.toasts.length - 1].message).assertEqual('bluetooth disableAdvertising');
        expect(sdk.disableIds[sdk.disableIds.length - 1]).assertEqual(2);
        expect(sdk.enableIds[0]).assertEqual(1);
        expect(sdk.stopIds.length).assertEqual(0);
        expect(sdk.offMatchesRegistration.length).assertEqual(0);
        expect(manufacturerBytes.join(',')).assertEqual('42,0,255');
        expect(serviceBytes.join(',')).assertEqual('90,73');
      } catch (primaryError) {
        primaryFailed1 = true;
        rethrowCaught(primaryError);
      } finally {
        runCleanup((): void => {
          if (hadState) {
            if (previousState === undefined) {
              throw new Error('Existing advertiser state missing');
            }
            AppStorage.setOrCreate('advertiserState', previousState);
          } else {
            AppStorage.delete('advertiserState');
          }
        }, primaryFailed1);
      }
    } catch (primaryError) {
      primaryFailed2 = true;
      rethrowCaught(primaryError);
    } finally {
      runCleanup((): void => {
        sdk.dispose();
      }, primaryFailed2);
    }
  };

export default runExpansionCase;
