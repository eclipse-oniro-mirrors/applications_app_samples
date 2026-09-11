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

export interface UsbEndpointInfo {
  address: number;
  attributes: number;
  interval: number;
  maxPacketSize: number;
  direction: number;
  number: number;
  type: number;
  interfaceId: number;
}

export interface UsbInterfaceInfo {
  id: number;
  protocol: number;
  clazz: number;
  subClass: number;
  alternateSetting: number;
  name: string;
  endpointCount: number;
  endpoints: UsbEndpointInfo[];
}

export interface UsbConfigInfo {
  id: number;
  name: string;
  attributes: number;
  maxPower: number;
  isRemoteWakeup: boolean;
  isSelfPowered: boolean;
  interfaceCount: number;
  interfaces: UsbInterfaceInfo[];
}

export interface UsbDeviceInfo {
  name: string;
  busNum: number;
  devAddress: number;
  manufacturerName: string;
  productName: string;
  version: string;
  vendorId: number;
  productId: number;
  clazz: number;
  subClass: number;
  protocol: number;
  configCount: number;
  configs: UsbConfigInfo[];
}

export interface UsbPipeInfo {
  busNum: number;
  devAddress: number;
}

export interface FreeResult {
  freed: boolean;
  deviceCount: number;
}

export const getDeviceList: () => Array<UsbDeviceInfo>;
export const freeDeviceList: () => FreeResult;
export const hasPermission: (deviceName: string) => boolean;
export const requestPermission: (deviceName: string) => Promise<boolean>;
export const connectDevice: (busNum: number, devAddress: number) => UsbPipeInfo;
export const getFileDescriptor: () => number;
export const closePipe: () => boolean;
export const isPipeConnected: () => boolean;
