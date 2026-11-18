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

/**
 * @interface ProfileDeviceItem
 * @description Represents a device item in the device list.
 * Shared by all Bluetooth profile pages.
 */
export interface ProfileDeviceItem {
  deviceId: string;
  deviceName: string;
  macAddress: string;
  isConnected: boolean;
  rssi: number;
  deviceType: string;
  lastSeen: number;
  batteryLevel: number;
  supportsProfile: boolean;
  manufacturer: string;
  model: string;
  firmwareVersion: string;
  iconResource: string;
  description: string;
  isFavorite: boolean;
  tags: string[];
}

/**
 * @interface ProfileOperationLogEntry
 * @description Represents an operation log entry for display.
 * Shared by all Bluetooth profile pages.
 */
export interface ProfileOperationLogEntry {
  id: string;
  operation: string;
  timestamp: number;
  success: boolean;
  details: string;
  durationMs: number;
  deviceId: string;
  errorCode: number;
  errorMessage: string;
  metadata: Map<string, string>;
}
