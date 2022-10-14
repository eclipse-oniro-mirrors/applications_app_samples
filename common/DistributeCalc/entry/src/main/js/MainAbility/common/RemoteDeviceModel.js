/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import prompt from '@ohos.prompt';
import deviceManager from '@ohos.distributedHardware.deviceManager';

let SUBSCRIBE_ID = 100;

export default class RemoteDeviceModel {
  deviceList = [];
  discoverList = [];
  callback;
  authCallback;
  deviceManager = undefined;

  registerDeviceListCallback(callback) {
    if (typeof (this.deviceManager) === 'undefined') {
      console.log("Calc[RemoteDeviceModel] deviceManager.createDeviceManager begin");
      try {
        deviceManager.createDeviceManager("ohos.samples.distributedcalc", (error, value) => {
          if (error) {
            console.error("Calc[RemoteDeviceModel] createDeviceManager failed.");
            return;
          }
          this.deviceManager = value;
          this.registerDeviceListCallback_(callback);
          console.log("Calc[RemoteDeviceModel] createDeviceManager callback returned, error=" + error + " value=" + value);
        });
      } catch (error) {
        console.error('Calc[RemoteDeviceModel] createDeviceManager throw error,  error.code=' + JSON.stringify(error))
      }
      console.log("Calc[RemoteDeviceModel] deviceManager.createDeviceManager end");
    } else {
      this.registerDeviceListCallback_(callback);
    }
  }

  registerDeviceListCallback_(callback) {
    console.info('Calc[RemoteDeviceModel] registerDeviceListCallback');
    this.callback = callback;
    if (this.deviceManager === undefined) {
      console.error('Calc[RemoteDeviceModel] deviceManager has not initialized');
      this.callback();
      return;
    }

    console.info('Calc[RemoteDeviceModel] getTrustedDeviceListSync begin');
    try {
      let list = this.deviceManager.getTrustedDeviceListSync();
      console.debug('Calc[RemoteDeviceModel] getTrustedDeviceListSync end, deviceList=' + JSON.stringify(list));
      if (typeof (list) !== 'undefined' && typeof (list.length) !== 'undefined') {
        this.deviceList = list;
      }
    } catch (error) {
      console.error('Calc[RemoteDeviceModel] getTrustedDeviceListSync throw error,  error.code=' + JSON.stringify(error))
    }
    this.callback()
    console.info('Calc[RemoteDeviceModel] callback finished');
    try {
      this.deviceManager.on('deviceStateChange', (data) => {
        console.debug('Calc[RemoteDeviceModel] deviceStateChange data=' + JSON.stringify(data));
        switch (data.action) {
          case deviceManager.DeviceStateChangeAction.READY:
            this.discoverList = []
            this.deviceList.push(data.device)
            console.debug('Calc[RemoteDeviceModel] ready, updated device list=' + JSON.stringify(this.deviceList));
            try {
              let list = this.deviceManager.getTrustedDeviceListSync();
              console.debug('Calc[RemoteDeviceModel] getTrustedDeviceListSync end, deviceList=' + JSON.stringify(list));
              if (typeof (list) !== 'undefined' && typeof (list.length) !== 'undefined') {
                this.deviceList = list;
              }
            } catch (error) {
              console.error('Calc[RemoteDeviceModel] getTrustedDeviceListSync throw error,  error.code=' + JSON.stringify(error))
            }
            this.callback();
            break;
          case deviceManager.DeviceStateChangeAction.OFFLINE:
            if (this.deviceList.length > 0) {
              let list = [];
              for (let j = 0; j < this.deviceList.length; j++) {
                if (this.deviceList[j].deviceId !== data.device.deviceId) {
                  list[j] = data.device;
                }
              }
              this.deviceList = list;
            }
            console.debug('Calc[RemoteDeviceModel] offline, updated device list=' + JSON.stringify(data.device));
            this.callback();
            break;
          default:
            break;
        }
      });
      this.deviceManager.on('deviceFound', (data) => {
        console.debug('Calc[RemoteDeviceModel] deviceFound data=' + JSON.stringify(data));
        console.debug('Calc[RemoteDeviceModel] deviceFound this.discoverList=' + this.discoverList);
        for (let i = 0;i < this.discoverList.length; i++) {
          if (this.discoverList[i].deviceId === data.device.deviceId) {
            console.info('Calc[RemoteDeviceModel] device founded ignored');
            return;
          }
        }
        this.discoverList[this.discoverList.length] = data.device;
        console.debug('Calc[RemoteDeviceModel] deviceFound this.discoverList=' + this.discoverList);
        this.callback();
      });
      this.deviceManager.on('discoverFail', (data) => {
        prompt.showToast({
          message: 'discoverFail reason=' + data.reason,
          duration: 3000,
        });
        console.debug('Calc[RemoteDeviceModel] discoverFail data=' + JSON.stringify(data));
      });
      this.deviceManager.on('serviceDie', () => {
        prompt.showToast({
          message: 'serviceDie',
          duration: 3000,
        });
        console.error('Calc[RemoteDeviceModel] serviceDie');
      });
    } catch (error) {
      console.error('Calc[RemoteDeviceModel] on throw error,  error.code=' + JSON.stringify(error))
    }

    SUBSCRIBE_ID = Math.floor(65536 * Math.random()); // Generate a random number
    let info = {
      subscribeId: SUBSCRIBE_ID,
      mode: 0xAA,
      medium: 2,
      freq: 2,
      isSameAccount: false,
      isWakeRemote: true,
      capability: 0
    };
    console.debug('Calc[RemoteDeviceModel] startDeviceDiscovery ' + SUBSCRIBE_ID);
    try {
      this.deviceManager.startDeviceDiscovery(info);
    } catch (error) {
      console.error('Calc[RemoteDeviceModel] startDeviceDiscovery throw error,  error.code=' + JSON.stringify(error))
    }
  }

  unregisterDeviceListCallback() {
    console.debug('Calc[RemoteDeviceModel] stopDeviceDiscovery ' + SUBSCRIBE_ID);
    if (this.deviceManager === undefined) {
      return
    }
    try {
      this.deviceManager.stopDeviceDiscovery(SUBSCRIBE_ID);
      this.deviceManager.off('deviceStateChange');
      this.deviceManager.off('deviceFound');
      this.deviceManager.off('discoverFail');
      this.deviceManager.off('serviceDie');
      this.deviceList = [];
    } catch (error) {
      console.error('Calc[RemoteDeviceModel] throw error, error.code=' + JSON.stringify(error.code))
    }
  }

  authenticateDevice(device, callBack) {
    console.debug('Calc[RemoteDeviceModel] authenticateDevice ' + JSON.stringify(device));
    for (let i = 0; i < this.discoverList.length; i++) {
      if (this.discoverList[i].deviceId === device.deviceId) {
        let extraInfo = {
          'targetPkgName': 'ohos.samples.distributedcalc',
          'appName': 'Distributed Calc',
          'appDescription': 'Distributed Calc',
          'business': '0'
        };
        let authParam = {
          'authType': 1,
          'extraInfo': extraInfo
        };
        if (this.deviceManager === undefined) {
          return
        }
        try {
          this.deviceManager.authenticateDevice(device, authParam, (err, data) => {
            if (err) {
              console.error('Calc[RemoteDeviceModel] authenticateDevice error:' + JSON.stringify(err));
              this.authCallback = null;
              return;
            }
            console.debug('Calc[RemoteDeviceModel] authenticateDevice succeed:' + JSON.stringify(data));
            this.authCallback = callBack;
          })
        } catch (error) {
          console.error('Calc[RemoteDeviceModel] authenticateDevice throw error:' + JSON.stringify(error))
        }
      }
    }
  }
}