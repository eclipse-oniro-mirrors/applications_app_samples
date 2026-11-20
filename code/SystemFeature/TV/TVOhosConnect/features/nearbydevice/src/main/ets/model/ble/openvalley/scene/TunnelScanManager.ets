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
import { InfAccessManagerBluetooth, InfDevice, Logger } from '@ohos/common';
import Point from '../../../../viewmodel/Point';

import { ControllerItem } from '../entity/ControllerItem';
import { PayloadDevInfo } from '../model/payload/PayloadDevInfo';
import { ControllerDevReq, DevControlInformation } from '../model/req/ControllerDevReq';
import OpenValleyDevicesConnector from '../OpenValleyDevicesConnector';
import OpenValleyDevicesController from '../OpenValleyDevicesController';
import OpenValleyDevice from '../OpenValleyDevice';
import { GlobalStore } from '../util/GlobalStore';
import TunnelSceneModel, {
  getControlInformation,
  getTunnelDeviceName,
  getTunnelDeviceTypeByType,
  isSensing,
  TunnelDevice,
  TunnelDeviceType,
  TunnelSlot
} from './model/TunnelSceneModel';
import WaterDetectorSKH from './model/WaterDetector';
import TunnelPointModel from './model/TunnelPointModel';

/**
 * 发现该设备后，直接连接
 */
const TEST_DEVICE_NAME = 'ccBle-E3D23A';
const TAG = 'TunnelScanManager';

export default class TunnelScanManager {
  private static instance: TunnelScanManager;
  public controller: OpenValleyDevicesController = new OpenValleyDevicesController();
  public bleManager: InfAccessManagerBluetooth = new InfAccessManagerBluetooth();
  public connectingDevice: InfDevice | undefined;
  public model: TunnelSceneModel | undefined;
  public pointModel: TunnelPointModel;
  //场景是否设置
  public isSceneSet: boolean = false;
  //浸水传感器
  public waterDetector: WaterDetectorSKH = new WaterDetectorSKH();
  //是否初始化浸水器
  public hasInitWaterDetector: boolean = false;
  //浸水器状态
  public waterDetectorState: boolean = false;
  //当前执行状态
  public currentInvokeState: boolean = false;

  private constructor() {
    this.pointModel = TunnelPointModel.getInstance();
    this.pointModel.init();
  }

  public static getInstance(): TunnelScanManager {
    if (TunnelScanManager.instance == null) {
      TunnelScanManager.instance = new TunnelScanManager();
    }
    return TunnelScanManager.instance;
  }

  public getModel(): TunnelSceneModel {
    if (!this.model) {
      this.model = new TunnelSceneModel();
    }
    return this.model;
  }

  public getSceneSetState(): boolean {
    return this.isSceneSet;
  }

  public setSceneSetState(b: boolean) {
    this.isSceneSet = b;
    if (this.model) {
      this.model.isSetFinish = b;
    }
  }

  public release() {
    this.controller.discover.stopScan();
    if (this.connectingDevice) {
      this.controller.connector.stopConnect(this.connectingDevice);
      this.connectingDevice = undefined;
    }
    this.model?.reset();
    this.pointModel.init();
  }

  /**
   * 开始扫描，发现控制器和子设备
   */
  public async startScan(context: Context) {
    this.initWaterDetector();
    if (await this.bleManager.isEnable()) {
      this.scanAction();
    } else {
      const result = await this.bleManager.applyAccess(context);
      if (result) {
        this.scanAction();
      }
    }
  }

  public async initWaterDetector() {
    if (!this.hasInitWaterDetector) {
      const result: boolean = await this.waterDetector.startConnect();
      if (result) {
        this.hasInitWaterDetector = true;
        Logger.debug(TAG, 'Water immersion sensor available');
        this.addWaterDetectorDevice();
        const state: boolean = await this.waterDetector.queryState();
        Logger.debug(TAG, 'Current water immersion sensor state: ' + state);
        this.waterDetectorState = state;
        this.onWaterDetectorStateChange(state);
        this.waterDetector.registerStateChange((state: boolean) => {
          Logger.debug(TAG, 'Water immersion sensor state changed: ' + state);
          this.onWaterDetectorStateChange(state);
        });
      } else {
        Logger.debug(TAG, 'Water immersion sensor unavailable');
      }
    }
  }

  public addWaterDetectorDevice() {
    const device: TunnelDevice | null = this.generateDevice(TunnelDeviceType.Sensing);
    if (device) {
      this.model?.addDevice(device);
    }
  }

  /**
   * 当浸水器状态变化,state:是否浸水
   */
  public onWaterDetectorStateChange(state: boolean, isFirstSet: boolean = false) {
    this.waterDetectorState = state;
    Logger.debug(TAG, `onWaterDetectorStateChange() ${!this.isSceneSet}`);
    if (!this.isSceneSet) {
      return;
    }
    this.invokeAction(state, isFirstSet);
  }

  public scanAction() {
    this.controller.discover.startScan(null, (device: InfDevice) => {
      const openValleyDevice: OpenValleyDevice = device as OpenValleyDevice;
      //发现指定控制器，就停止扫描
      if (openValleyDevice.getDeviceName() == TEST_DEVICE_NAME && !this.connectingDevice) {
        Logger.debug(TAG, 'Target controller found, ready to connect');
        this.connectingDevice = device;
        this.controller.discover.stopScan();
        this.startConnect(device);
      }
    });
  }

  public stopScan() {
    this.controller.discover.stopScan();
  }

  public async startConnect(device: InfDevice) {
    const result = await this.controller.connector.connect(device);
    if (result) {
      Logger.debug(TAG, 'Device connected successfully');
      const connector: OpenValleyDevicesConnector = this.controller.connector as OpenValleyDevicesConnector;
      connector.registerDevFindCallback((device) => {
        this.onDevFind(device);
      });
      connector.pre(device);
    }
  }

  public onDevFind(devInfo: PayloadDevInfo) {
    if (this.model && devInfo.type) {
      const type: TunnelDeviceType = getTunnelDeviceTypeByType(devInfo.type);
      const device: TunnelDevice | null = this.generateDevice(type, devInfo.sn!);
      if (device != null) {
        this.model.addDevice(device);
      }
    }
  }


  /**
   * 生成一个device
   * @param type
   * @param sn
   */
  public generateDevice(type: TunnelDeviceType, sn?: string): TunnelDevice | null {
    let device: TunnelDevice | null = null;
    if (this.model) {
      const isSensingB: boolean = isSensing(type);
      let point: Point | null = this.pointModel.getTopOrBottomPoint(isSensingB);
      if (isSensingB && point) {
        device = new TunnelDevice('TunnelDeviceType.Sensing', getTunnelDeviceName(type), type, point!,
          ['TunnelDeviceType.Sensing']);
      } else if (sn && point) {
        device = new TunnelDevice(sn, getTunnelDeviceName(type), type, point, [sn]);
      }
    }
    return device;
  }

  public getAllControllerDevice(): Array<TunnelDevice> {
    const arr: TunnelDevice[] = [];
    if (this.model) {
      const controllers: TunnelSlot[] = this.model.controlDeviceSlots;
      for (let i = 0; i < controllers.length; i++) {
        const slot: TunnelSlot = controllers[i];
        if (slot.device) {
          arr.push(slot.device);
        }
      }
    }
    return arr;
  }

  /**
   * 执行或者停止场景
   */
  public invokeOrStopScene(isSet: boolean) {
    this.setSceneSetState(isSet);
    if (isSet) {
      this.onWaterDetectorStateChange(this.waterDetectorState, true);
      //停止场景时，关闭子设备
    } else if (!isSet) {
      this.invokeAction(false);
    }
  }

  public invokeAction(onOrOff: boolean, isFirstSet: boolean = false) {
    if (this.currentInvokeState != onOrOff || isFirstSet) {
      Logger.debug(TAG, 'Execute action on ZaHong controller: ' + onOrOff);
      const arr: TunnelDevice[] = this.getAllControllerDevice();
      this.execute(arr, onOrOff);
      this.currentInvokeState = onOrOff;
    }
  }

  /**
   * 打开所有设备
   */
  public execute(arr: TunnelDevice[], onOrOff: boolean) {
    if (!arr || arr.length == 0) {
      return;
    }
    const id: string | null = this.getLocalId();
    if (id) {
      const devArray: DevControlInformation[] = [];
      for (let i = 0; i < arr.length; i++) {
        const tunnelDevice: TunnelDevice = arr[i];
        for (let j = 0; j < tunnelDevice.snList.length; j++) {
          const information: DevControlInformation =
            new DevControlInformation(tunnelDevice.snList[j], getControlInformation(onOrOff, tunnelDevice.type));
          devArray.push(information);
        }
      }
      const connector: OpenValleyDevicesConnector = this.controller.connector as OpenValleyDevicesConnector;
      const req: ControllerDevReq = new ControllerDevReq(id, id, devArray);
      connector.invokeMsg(JSON.stringify(req));
    }
  }

  public getLocalId(): string | null {
    const item: ControllerItem | null = GlobalStore.getInstance().getLocalControllerItem();
    if (item) {
      return item.id;
    }
    return null;
  }
};