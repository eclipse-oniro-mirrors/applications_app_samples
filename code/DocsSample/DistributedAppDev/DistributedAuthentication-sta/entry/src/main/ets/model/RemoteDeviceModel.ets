'use static'

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

import { BusinessError } from '@kit.BasicServicesKit';
import { distributedDeviceManager } from '@kit.DistributedServiceKit';
import { AppStorage } from '@kit.ArkUI';
import logger from '../common/Logger';

export class RemoteDeviceModel {
  private static dmInstance: RemoteDeviceModel | undefined = undefined;
  private discoverSuccessCallback: (data: distributedDeviceManager.DiscoverySuccessResult) => void = () => {};
  private discoverFailureCallback: (data: distributedDeviceManager.DiscoveryFailureResult) => void = () => {};
  private serviceDieCallback: () => void = () => {};
  trustedDeviceList: Array<distributedDeviceManager.DeviceBasicInfo> = [];
  discoverList: Array<distributedDeviceManager.DeviceBasicInfo> = [];
  localDevice: distributedDeviceManager.DeviceBasicInfo | undefined = undefined;
  deviceManager: distributedDeviceManager.DeviceManager | undefined = undefined;
  isSupportRange: boolean = false;

  static getInstance(): RemoteDeviceModel {
    if (RemoteDeviceModel.dmInstance === undefined) {
      RemoteDeviceModel.dmInstance = new RemoteDeviceModel();
    }
    return RemoteDeviceModel.dmInstance!;
  }

  async createDeviceManager(): Promise<void> {
    if (this.deviceManager !== undefined) {
      return;
    }
    logger.info('createDeviceManager begin');
    try {
      let dmInstance = distributedDeviceManager.createDeviceManager('com.samples.distributedauthenticationsta');
      this.deviceManager = dmInstance;
      this.getLocalDeviceInfo();
      this.registerDeviceStateListener();
      this.getTrustedDeviceList();
      logger.info('createDeviceManager callback returned');
    } catch (err) {
      logger.error('createDeviceManager throw error, message=' + err.message);
    }
    logger.info('createDeviceManager end');
  }

  getLocalDeviceInfo(): void {
    if (this.deviceManager === undefined) {
      logger.error('deviceManager has not initialized');
      return;
    }
    logger.info('getLocalDeviceInfo begin');
    let dm = this.deviceManager!;
    let deviceId: string = dm.getLocalDeviceId();
    let deviceName: string = dm.getLocalDeviceName();
    let deviceType: int = dm.getLocalDeviceType();
    let networkId: string = dm.getLocalDeviceNetworkId();
    logger.info('getLocalDeviceInfo deviceType: ' + deviceType);
    this.localDevice = {
      deviceId: deviceId,
      deviceName: deviceName,
      deviceType: deviceType.toString(),
      networkId: networkId
    };
    AppStorage.setOrCreate('localDevice', this.localDevice);
    logger.info('getLocalDeviceInfo end');
  }

  getTrustedDeviceList(): void {
    if (this.deviceManager === undefined) {
      logger.error('deviceManager has not initialized');
      return;
    }
    logger.info('getTrustedDeviceList begin');
    let dm = this.deviceManager!;
    try {
      this.trustedDeviceList = dm.getAvailableDeviceListSync();
      AppStorage.setOrCreate('trustedDeviceList', this.trustedDeviceList);
    } catch (err) {
      let error: BusinessError = err as BusinessError;
      logger.error('getTrustedDeviceList error: ' + error.toString());
    }
  }

  deviceStateChangeActionOnline(device: distributedDeviceManager.DeviceBasicInfo): void {
    logger.info(`Device online event: ${device.deviceId}`);
    this.discoverList = this.discoverList.filter(item => item.deviceId !== device.deviceId);
    const index = this.trustedDeviceList.findIndex(item => item.deviceId === device.deviceId);
    if (index !== -1) {
      this.trustedDeviceList[index] = device;
      logger.info(`Update existing device: ${device.deviceId}`);
    } else {
      this.trustedDeviceList.push(device);
      logger.info(`Add new device: ${device.deviceId}`);
    }
    AppStorage.setOrCreate('discoverDeviceList', [...this.discoverList]);
    AppStorage.setOrCreate('trustedDeviceList', [...this.trustedDeviceList]);
  }

  deviceStateChangeActionOffline(device: distributedDeviceManager.DeviceBasicInfo): void {
    logger.info(`Device offline: ${device.deviceId}`);
    this.trustedDeviceList = this.trustedDeviceList.filter(item => item.deviceId !== device.deviceId);
    AppStorage.setOrCreate('trustedDeviceList', [...this.trustedDeviceList]);
    logger.info(`Device removed from trusted list: ${device.deviceId}`);
  }

  // [Start device_state_change]
  registerDeviceStateListener(): void {
    logger.info('registerDeviceStateListener');
    if (this.deviceManager === undefined) {
      logger.error('deviceManager has not initialized');
      return;
    }

    let self = this;
    try {
      this.deviceManager!.onDeviceStateChange((data: distributedDeviceManager.DeviceStateChangeResult): void => {
        if (data == null) {
          return;
        }
        logger.info('deviceStateChange data received');
        switch (data.action) {
          case distributedDeviceManager.DeviceStateChange.AVAILABLE:
            logger.info('deviceStateChange ONLINE');
            // [StartExclude device_state_change]
            self.deviceStateChangeActionOnline(data.device);
            // [EndExclude device_state_change]
            break;
          case distributedDeviceManager.DeviceStateChange.UNAVAILABLE:
            logger.info('deviceStateChange OFFLINE');
            // [StartExclude device_state_change]
            self.deviceStateChangeActionOffline(data.device);
            // [EndExclude device_state_change]
            break;
          default:
            break;
        }
      });
    } catch(e) {
      logger.error('deviceStateChange failed err: ' + e.toString());
    }
  }
  // [End device_state_change]

  deviceFound(device: distributedDeviceManager.DeviceBasicInfo): void {
    if (!device || !device.deviceId) {
      logger.error('Invalid device info provided');
      return;
    }
    const isAlreadyExists = this.discoverList.some(item => item.deviceId === device.deviceId);
    if (isAlreadyExists) {
      logger.info('device founded, ignored');
      return;
    }
    this.discoverList.push(device);
    AppStorage.setOrCreate('discoverDeviceList', this.discoverList);
    logger.info('deviceFound successfully');
  }

  private getFilterOptions(): Record<string, int | string> {
    let filterOptions: Record<string, int | string> = {};
    let filterOptionsMap = AppStorage.get<Map<string, int>>('filterOptions');
    let authFormName: string = AppStorage.get<string>('authFormName') ?? 'Auth Form';
    let isOnlineName: string = AppStorage.get<string>('isOnlineName') ?? 'Online Status';
    let isTrustedName: string = AppStorage.get<string>('isTrustedName') ?? 'Trusted Status';
    let rangeName: string = AppStorage.get<string>('rangeName') ?? 'Range';
    if (filterOptionsMap === undefined) {
      return filterOptions;
    }
    let authForm: int = filterOptionsMap.get(authFormName) ?? 0;
    let isOnline: int = filterOptionsMap.get(isOnlineName) ?? 0;
    let isTrusted: int = filterOptionsMap.get(isTrustedName) ?? 0;
    let range: int = filterOptionsMap.get(rangeName) ?? 0;

    if (authForm == 1) {
      filterOptions['authorizationType'] = 1;
    } else if (authForm == 2) {
      filterOptions['authorizationType'] = 2;
    } else if (authForm == 3) {
      filterOptions['authorizationType'] = 0;
    }

    if (isOnline == 1) {
      filterOptions['availableStatus'] = 1;
    } else if (isOnline == 2) {
      filterOptions['availableStatus'] = 0;
    }

    if (isTrusted == 1) {
      filterOptions['authenticationStatus'] = 1;
    } else if (isTrusted == 2) {
      filterOptions['authenticationStatus'] = 0;
    }

    if (range == 1) {
      filterOptions['discoverDistance'] = 50;
    } else if (range == 2) {
      filterOptions['discoverDistance'] = 80;
    } else if (range == 3) {
      filterOptions['discoverDistance'] = 100;
    }

    return filterOptions;
  }

  // [Start start_discovering]
  startDeviceDiscovery(): void {
    if (this.deviceManager === undefined) {
      logger.error('deviceManager has not initialized');
      return;
    }
    this.discoverSuccessCallback = (data: distributedDeviceManager.DiscoverySuccessResult) => {
      if (data === null) {
        logger.info('onDiscoverSuccess data is null');
        return;
      }
      logger.info('onDiscoverSuccess callback, device: ' + JSON.stringify(data.device));
      this.deviceFound(data.device);
    };

    this.discoverFailureCallback = (data: distributedDeviceManager.DiscoveryFailureResult) => {
      logger.info('onDiscoverFailure callback, reason: ' + data.reason);
    };

    this.serviceDieCallback = () => {
      logger.error('serviceDie');
    };
    try {
      logger.info('registering callbacks');
      this.deviceManager!.onDiscoverSuccess(this.discoverSuccessCallback);
      this.deviceManager!.onDiscoverFailure(this.discoverFailureCallback);
      this.deviceManager!.onServiceDie(this.serviceDieCallback);
      this.discoverList = [];
      AppStorage.setOrCreate('discoverDeviceList', this.discoverList);
      let discoverParam: Record<string, int | string> = {
        'discoverTargetType': 1
      };
      let filterOptions: Record<string, int | string> = this.getFilterOptions();
      if (Object.entries(filterOptions).length == 0) {
        this.deviceManager!.startDiscovering(discoverParam);
      } else {
        this.deviceManager!.startDiscovering(discoverParam, filterOptions);
      }
    } catch (e) {
      logger.error('startDeviceDiscovery failed err: ' + e.toString());
    }
  }
  // [End start_discovering]

  // [Start stop_discovering]
  stopDeviceDiscovery(): void {
    if (this.deviceManager === undefined) {
      logger.error('deviceManager has not initialized');
      return;
    }
    logger.info('stopDeviceDiscovery');

    try {
      this.deviceManager!.stopDiscovering();
      if (this.discoverSuccessCallback !== undefined) {
        this.deviceManager!.offDiscoverSuccess(this.discoverSuccessCallback);
        this.discoverSuccessCallback = () => {};
      }

      if (this.discoverFailureCallback !== undefined) {
        this.deviceManager!.offDiscoverFailure(this.discoverFailureCallback);
        this.discoverFailureCallback = () => {};
      }

      if (this.serviceDieCallback !== undefined) {
        this.deviceManager!.offServiceDie(this.serviceDieCallback);
        this.serviceDieCallback = () => {};
      }
    } catch (e) {
      logger.error('stopDeviceDiscovery failed error: ' + e.toString());
    }
  }
  // [End stop_discovering]

  unregisterDeviceListCallback(): void {
    if (this.deviceManager === undefined) {
      logger.error('deviceManager has not initialized');
      return;
    }
    try {
      this.stopDeviceDiscovery();
      this.deviceManager!.offDeviceStateChange();
      if (this.serviceDieCallback !== undefined) {
        this.deviceManager!.offServiceDie(this.serviceDieCallback);
        this.serviceDieCallback = ():undefined => {};
      }
      this.trustedDeviceList = [];
      this.discoverList = [];
    } catch (e) {
      logger.error('stopDeviceDiscovery failed err: ' + e.toString());
    }
  }

  // [Start release_device_manager]
  releaseDeviceManager(): void {
    if (this.deviceManager === undefined) {
      return;
    }

    this.deviceManager!.offDeviceStateChange();
    this.discoverSuccessCallback = () => {};
    this.discoverFailureCallback = () => {};
    this.serviceDieCallback = () => {};
    let dm = this.deviceManager;
    if (dm !== undefined) {
      distributedDeviceManager.releaseDeviceManager(dm);
    }
    this.deviceManager = undefined;
  }
  // [End release_device_manager]

  // [Start bind_target]
  authenticateDevice(device: distributedDeviceManager.DeviceBasicInfo): void {
    if (this.deviceManager === undefined) {
      logger.error('deviceManager has not initialized');
      return;
    }
    for (let i = 0; i < this.discoverList.length; i++) {
      if (this.discoverList[i].deviceId != device.deviceId) {
        continue;
      }
      let bindParam: Record<string, int | string> = {
        'bindLevel': 3,
        'bindType': 1,
        'targetPkgName': 'com.samples.distributedauthenticationsta',
        'appName': 'DeviceManager-sta',
      };
      try {
        this.deviceManager!.bindTarget(device.deviceId, bindParam, (err: BusinessError | null, data: distributedDeviceManager.BindTargetResult | undefined) => {
          if (err) {
            return;
          }
        });
      } catch (e) {
        logger.error('authenticateDevice failed err: ' + e.toString());
      }
    }
  }
  // [End bind_target]

  // [End unbind_target]
  unAuthenticateDevice(device: distributedDeviceManager.DeviceBasicInfo): void {
    if (this.deviceManager === undefined) {
      logger.error('deviceManager has not initialized');
      return;
    }

    for (let i = 0; i < this.trustedDeviceList.length; i++) {
      if (this.trustedDeviceList[i].deviceId != device.deviceId) {
        continue;
      }
      try {
        this.deviceManager!.unbindTarget(device.deviceId);
      } catch (e) {
        logger.error('unAuthenticateDevice failed err: ' + e.toString());
      }
    }
  }
  // [End unbind_target]
}

let remoteDeviceModelInstance: RemoteDeviceModel = RemoteDeviceModel.getInstance();
export default remoteDeviceModelInstance;
