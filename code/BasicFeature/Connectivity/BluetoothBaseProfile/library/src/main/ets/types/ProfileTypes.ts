/**
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
 * @interface ManagerHealthStatus
 * @description Shared health status shape returned by every Profile manager.
 *              Replaces the previously untyped `object` return of getHealthStatus().
 */
export interface ManagerHealthStatus {
  /** Overall health flag (true when score >= configured threshold). */
  isHealthy: boolean;
  /** Health score in [0, 100]. */
  healthScore: number;
  /** Manager uptime in milliseconds. */
  uptimeMs: number;
  /** Connection success rate as a percentage (0-100). */
  connectionSuccessRate: number;
  /** Operation success rate as a percentage (0-100). */
  operationSuccessRate: number;
  /** Error rate as a percentage (0-100). */
  errorRate: number;
  /** Number of currently managed devices. */
  managedDeviceCount: number;
  /** Number of queued pending operations. */
  queuedOperationCount: number;
  /** Number of retry attempts recorded during the current session. */
  retryAttempts: number;
  /** Message of the most recent failure, or an empty string. */
  lastError: string;
}

/**
 * @interface ManagerFilterCriteria
 * @description Optional filter criteria carried on the page state. Reserved for
 *              device-list filtering; the default instance is an empty object.
 */
export interface ManagerFilterCriteria {
  /** Filter by device type (e.g. 'Audio', 'Input'). */
  deviceType?: string;
  /** Minimum RSSI threshold in dBm. */
  minRssi?: number;
  /** Only include connected devices when true. */
  isConnected?: boolean;
}

/**
 * @interface OperationHistoryEntry
 * @description Shape returned by every service's getOperationHistory() and used
 *              by pages to render Recent Activity lists.
 */
export interface OperationHistoryEntry {
  /** Human readable operation name (e.g. 'connect', 'disconnect'). */
  operation: string;
  /** Operation completion timestamp in milliseconds since epoch. */
  timestamp: number;
  /** Whether the operation succeeded. */
  success: boolean;
  /** Additional details or error message. */
  details: string;
}