'use static'

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file or copy of the License.
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
  private discoverSuccessCallback: (data: distributedDeviceManager.DiscoverySuccessResult) => undefined = ():undefined => {};
  private discoverFailureCallback: (data: distributedDeviceManager.DiscoveryFailureResult) => undefined = ():undefined => {};
  private serviceDieCallback: () => undefined = ():undefined => {};
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

    logger.info('[DeviceManager.RemoteDeviceModel] deviceManager.createDeviceManager begin');
    try {
      let dmInstance = distributedDeviceManager.createDeviceManager('com.samples.devicemanager');
      this.deviceManager = dmInstance;
      this.getLocalDeviceInfo();
      this.registerDeviceStateListener();
      this.getTrustedDeviceList();
      logger.info('[DeviceManager.RemoteDeviceModel] createDeviceManager callback returned');
    } catch (err) {
      logger.error('[DeviceManager.RemoteDeviceModel] createDeviceManager throw error, message=' + err.message);
    }
    logger.info('[DeviceManager.RemoteDeviceModel] distributedDeviceManager.createDeviceManager end');
  }

  getLocalDeviceInfo(): void {
    if (this.deviceManager === undefined) {
      logger.error('[DeviceManager.RemoteDeviceModel] deviceManager has not initialized');
      return;
    }

    logger.info('[DeviceManager.RemoteDeviceModel] getLocalDeviceInfo begin');
    let dm = this.deviceManager!;
    let deviceId: string = dm.getLocalDeviceId();
    let deviceName: string = dm.getLocalDeviceName();
    let deviceType: int = dm.getLocalDeviceType();
    let networkId: string = dm.getLocalDeviceNetworkId();
    logger.info('[DeviceManager.RemoteDeviceModel] getLocalDeviceInfo deviceType: ' + deviceType);
    this.localDevice = {
      deviceId: deviceId,
      deviceName: deviceName,
      deviceType: deviceType.toString(),
      networkId: networkId
    };
    AppStorage.setOrCreate('localDevice', this.localDevice);
    logger.info('[DeviceManager.RemoteDeviceModel] getLocalDeviceInfo end');
  }

  getTrustedDeviceList(): void {
    if (this.deviceManager === undefined) {
      logger.error('[DeviceManager.RemoteDeviceModel] deviceManager has not initialized');
      return;
    }

    logger.info('[DeviceManager.RemoteDeviceModel] getTrustedDeviceList begin');
    let dm = this.deviceManager!;
    try {
      this.trustedDeviceList = dm.getAvailableDeviceListSync();
      AppStorage.setOrCreate('trustedDeviceList', this.trustedDeviceList);
    } catch (err) {
      let error: BusinessError = err as BusinessError;
      logger.error('[DeviceManager.RemoteDeviceModel] getTrustedDeviceList error: ' + error.toString());
    }
  }

  deviceStateChangeActionOnline(device: distributedDeviceManager.DeviceBasicInfo): void {
    this.trustedDeviceList[this.trustedDeviceList.length] = device;
    logger.info('[DeviceManager.RemoteDeviceModel] online, device list updated');
    for (let i = this.discoverList.length - 1; i >= 0; i--) {
      if (this.discoverList[i].deviceId == device.deviceId) {
        this.discoverList.splice(i, 1);
        break;
      }
    }
    for (let j = 0; j < this.trustedDeviceList.length; j++) {
      if (this.trustedDeviceList[j].deviceId === device.deviceId) {
        this.trustedDeviceList[j] = device;
        break;
      }
    }
    AppStorage.setOrCreate('discoverDeviceList', this.discoverList);
    AppStorage.setOrCreate('trustedDeviceList', this.trustedDeviceList);
  }

  deviceStateChangeActionOffline(device: distributedDeviceManager.DeviceBasicInfo): void {
    logger.info('[DeviceManager.RemoteDeviceModel] offline');
    let list: Array<distributedDeviceManager.DeviceBasicInfo> = [];
    for (let i = 0; i < this.trustedDeviceList.length; i++) {
      if (this.trustedDeviceList[i].deviceId !== device.deviceId) {
        list.push(this.trustedDeviceList[i]);
      }
    }
    this.trustedDeviceList = list;
    AppStorage.setOrCreate('trustedDeviceList', this.trustedDeviceList);
  }

  registerDeviceStateListener(): void {
    logger.info('[DeviceManager.RemoteDeviceModel] registerDeviceStateListener');
    if (this.deviceManager === undefined) {
      logger.error('[DeviceManager.RemoteDeviceModel] deviceManager has not initialized');
      return;
    }

    let self = this;
    try {
      this.deviceManager!.onDeviceStateChange((data: distributedDeviceManager.DeviceStateChangeResult): void => {
        if (data == null) {
          return;
        }
        logger.info('[DeviceManager.RemoteDeviceModel] deviceStateChange data received');
        switch (data.action) {
          case distributedDeviceManager.DeviceStateChange.AVAILABLE:
            logger.info('[DeviceManager.RemoteDeviceModel] deviceStateChange ONLINE');
            self.deviceStateChangeActionOnline(data.device);
            break;
          case distributedDeviceManager.DeviceStateChange.UNAVAILABLE:
            logger.info('[DeviceManager.RemoteDeviceModel] deviceStateChange OFFLINE');
            self.deviceStateChangeActionOffline(data.device);
            break;
          default:
            break;
        }
      });
    } catch(e) {
      logger.error('[DeviceManager.RemoteDeviceModel] deviceStateChange failed err: ' + e.toString());
    }
  }

  deviceFound(device: distributedDeviceManager.DeviceBasicInfo): void {
    for (let i = 0; i < this.discoverList.length; i++) {
      if (this.discoverList[i].deviceId == device.deviceId) {
        logger.info('[DeviceManager.RemoteDeviceModel] device founded ignored');
        return;
      }
    }
    this.discoverList[this.discoverList.length] = device;
    AppStorage.setOrCreate('discoverDeviceList', this.discoverList);
    logger.info('[DeviceManager.RemoteDeviceModel] deviceFound');
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

  startDeviceDiscovery(): void {
    logger.info('[DEBUG] RemoteDeviceModel.startDeviceDiscovery CALLED');
    if (this.deviceManager === undefined) {
      logger.error('[DeviceManager.RemoteDeviceModel] deviceManager has not initialized');
      return;
    }
    this.discoverSuccessCallback = (data: distributedDeviceManager.DiscoverySuccessResult) => {
      if (data === null) {
        logger.info('[DEBUG] onDiscoverSuccess data is null');
        return undefined;
      }
      logger.info('[DEBUG] onDiscoverSuccess callback, device: ' + JSON.stringify(data.device));
      this.deviceFound(data.device);
      return undefined;
    };

    this.discoverFailureCallback = (data: distributedDeviceManager.DiscoveryFailureResult) => {
      logger.info('[DEBUG] onDiscoverFailure callback, reason: ' + data.reason);
    };

    this.serviceDieCallback = () => {
      logger.error('[DeviceManager.RemoteDeviceModel] serviceDie');
    };

    try {
      logger.info('[DEBUG] startDeviceDiscovery: registering callbacks');

      // 正确注册所有callback（使用on而不是off）
      this.deviceManager!.onDiscoverSuccess(this.discoverSuccessCallback);
      logger.info('wbdwbd 111 - onDiscoverSuccess registered');

      this.deviceManager!.onDiscoverFailure(this.discoverFailureCallback);
      logger.info('wbdwbd 222 - onDiscoverFailure registered');

      this.deviceManager!.onServiceDie(this.serviceDieCallback);
      logger.info('wbdwbd 333 - onServiceDie registered');

      this.discoverList = [];
      AppStorage.setOrCreate('discoverDeviceList', this.discoverList);
      let discoverParam: Record<string, int | string> = {
        'discoverTargetType': 1
      };
      logger.info('wbdwbd 444');
      let filterOptions: Record<string, int | string> = this.getFilterOptions();
      logger.info('[DeviceManager.RemoteDeviceModel] startDeviceDiscovery filterOptions = ' + JSON.stringify(filterOptions));
      if (Object.entries(filterOptions).length == 0) {
        logger.info('wbdwbd 555');
        this.deviceManager!.startDiscovering(discoverParam);
        logger.info('wbdwbd 666');
      } else {
        logger.info('wbdwbd 777');
        this.deviceManager!.startDiscovering(discoverParam, filterOptions);
        logger.info('wbdwbd 888');
      }
    } catch (e) {
      logger.error('[DeviceManager.RemoteDeviceModel] startDeviceDiscovery failed err: ' + e.toString());
    }
  }

  stopDeviceDiscovery(): void {
    if (this.deviceManager === undefined) {
      logger.error('[DeviceManager.RemoteDeviceModel] deviceManager has not initialized');
      return;
    }
    logger.info('[DeviceManager.RemoteDeviceModel] stopDeviceDiscovery');

    try {
      this.deviceManager!.stopDiscovering();
      logger.info('[DEBUG] stopDiscovering called');

      if (this.discoverSuccessCallback !== undefined) {
        this.deviceManager!.offDiscoverSuccess(this.discoverSuccessCallback);
        this.discoverSuccessCallback = ():undefined => {};
        logger.info('[DEBUG] offDiscoverSuccess called');
      }

      if (this.discoverFailureCallback !== undefined) {
        this.deviceManager!.offDiscoverFailure(this.discoverFailureCallback);
        this.discoverFailureCallback = ():undefined => {};
        logger.info('[DEBUG] offDiscoverFailure called');
      }

      if (this.serviceDieCallback !== undefined) {
        this.deviceManager!.offServiceDie(this.serviceDieCallback);
        this.serviceDieCallback = ():undefined => {};
        logger.info('[DEBUG] offServiceDie called');
      }
    } catch (e) {
      logger.error('[DeviceManager.RemoteDeviceModel] stopDeviceDiscovery failed error: ' + e.toString());
    }
  }

  unregisterDeviceListCallback(): void {
    if (this.deviceManager === undefined) {
      logger.error('[DeviceManager.RemoteDeviceModel] deviceManager has not initialized');
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
      logger.error('[DeviceManager.RemoteDeviceModel] stopDeviceDiscovery failed err: ' + e.toString());
    }
  }

  releaseDeviceManager(): void {
    if (this.deviceManager === undefined) {
      return;
    }

    this.deviceManager!.offDeviceStateChange();
    this.discoverSuccessCallback = ():undefined => {};
    this.discoverFailureCallback = ():undefined => {};
    this.serviceDieCallback = ():undefined => {};
    let dm = this.deviceManager;
    if (dm !== undefined) {
      distributedDeviceManager.releaseDeviceManager(dm);
    }
    this.deviceManager = undefined;
  }

  authenticateDevice(device: distributedDeviceManager.DeviceBasicInfo): void {
    logger.info('[DeviceManager.RemoteDeviceModel] authenticateDevice');
    if (this.deviceManager === undefined) {
      logger.error('[DeviceManager.RemoteDeviceModel] deviceManager has not initialized');
      return;
    }

    for (let i = 0; i < this.discoverList.length; i++) {
      if (this.discoverList[i].deviceId != device.deviceId) {
        continue;
      }

      let bindParam: Record<string, int | string> = {
        'bindLevel': 3,
        'bindType': 1,
        'targetPkgName': 'com.samples.devicemanager',
        'appName': 'DeviceManager-sta',
      };
      try {
        this.deviceManager!.bindTarget(device.deviceId, bindParam, (err: BusinessError | null, data: distributedDeviceManager.BindTargetResult | undefined) => {
          if (err) {
            logger.error('[DeviceManager.RemoteDeviceModel] authenticateDevice error');
            return;
          }
          logger.info('[DeviceManager.RemoteDeviceModel] authenticateDevice succeed');
        });
      } catch (e) {
        logger.error('[DeviceManager.RemoteDeviceModel] authenticateDevice failed err: ' + e.toString());
      }
    }
  }

  unAuthenticateDevice(device: distributedDeviceManager.DeviceBasicInfo): void {
    logger.info('[DeviceManager.RemoteDeviceModel] unAuthenticateDevice');
    if (this.deviceManager === undefined) {
      logger.error('[DeviceManager.RemoteDeviceModel] deviceManager has not initialized');
      return;
    }

    for (let i = 0; i < this.trustedDeviceList.length; i++) {
      if (this.trustedDeviceList[i].deviceId != device.deviceId) {
        continue;
      }
      try {
        this.deviceManager!.unbindTarget(device.deviceId);
      } catch (e) {
        logger.error('[DeviceManager.RemoteDeviceModel] unAuthenticateDevice failed err: ' + e.toString());
      }
    }
  }
}

let remoteDeviceModelInstance: RemoteDeviceModel = RemoteDeviceModel.getInstance();
export default remoteDeviceModelInstance;
