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

import { manager, advertising, scan } from '@kit.ConnectivityKit';
import {
  ADV_INTERVAL_DEFAULT,
  NEARLINK_SERVICE_UUID,
  SSAP_MANUFACTURER_ID,
  DT_MANUFACTURER_ID
} from './feature/NearLinkConstants';

/**
 * NearLink feature facade class.
 * Encapsulates common NearLink operations for reuse across entry pages.
 */
export class NearLinkFeature {
  /**
   * Query current NearLink state
   */
  static getState(): manager.NearlinkState {
    return manager.getState();
  }

  /**
   * Check if NearLink is supported on this device
   */
  static isSupported(): boolean {
    return manager.isNearLinkSupported();
  }

  /**
   * Get local device NearLink name
   */
  static getLocalName(): string {
    return manager.getLocalName();
  }

  /**
   * Get paired NearLink devices
   */
  static getPairedDevices(): string[] {
    return manager.getPairedDevices();
  }

  /**
   * Subscribe to NearLink state changes
   */
  static onStateChange(callback: (state: manager.NearlinkState) => void): void {
    manager.onStateChange(callback);
  }

  /**
   * Unsubscribe from NearLink state changes
   */
  static offStateChange(callback: (state: manager.NearlinkState) => void): void {
    manager.offStateChange(callback);
  }

  /**
   * Build standard advertising parameters with manufacturer data
   */
  static buildAdvertisingParams(
    serviceUuid: string,
    manufacturerId: number,
    manufacturerData: number[],
    serviceData?: advertising.ServiceData[]
  ): advertising.AdvertisingParams {
    let setting: advertising.AdvertisingSettings = {
      interval: ADV_INTERVAL_DEFAULT,
      power: advertising.TxPowerMode.ADV_TX_POWER_MEDIUM,
      isConnectable: true
    };

    let mfrDataBuffer = new Uint8Array(manufacturerData);
    let mfrData: advertising.ManufacturerData = {
      manufacturerId: manufacturerId,
      manufacturerData: mfrDataBuffer.buffer
    };

    let advData: advertising.AdvertisingData = {
      serviceUuids: [serviceUuid],
      manufacturerData: [mfrData],
      includeDeviceName: true
    };
    if (serviceData !== undefined) {
      advData.serviceData = serviceData;
    }

    return {
      advertisingSettings: setting,
      advertisingData: advData
    };
  }

  /**
   * Build scan filter by manufacturer ID
   */
  static buildManufacturerFilter(manufacturerId: number): scan.ScanFilters[] {
    let filter: scan.ScanFilters[] = [{
      manufacturerId: manufacturerId
    }];
    return filter;
  }

  /**
   * Get SSAP manufacturer ID
   */
  static getSsapManufacturerId(): number {
    return SSAP_MANUFACTURER_ID;
  }

  /**
   * Get DataTransfer manufacturer ID
   */
  static getDtManufacturerId(): number {
    return DT_MANUFACTURER_ID;
  }

  /**
   * Get default NearLink service UUID
   */
  static getServiceUuid(): string {
    return NEARLINK_SERVICE_UUID;
  }
}
