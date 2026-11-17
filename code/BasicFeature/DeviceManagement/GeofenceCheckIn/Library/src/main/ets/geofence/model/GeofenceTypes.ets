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
 * Fence transition actions derived from system fence events.
 */
export enum FenceTransitionAction {
  // Event does not map to a known transition.
  NONE = 0,
  // Device entered the fence area.
  ENTER = 1,
  // Device left the fence area.
  EXIT = 2
}

/**
 * Persisted geofence configuration edited on the configuration page.
 */
export interface FenceConfig {
  // User readable fence name.
  name: string;
  // Fence center latitude in degrees.
  latitude: number;
  // Fence center longitude in degrees.
  longitude: number;
  // Fence radius in meters.
  radius: number;
  // System fence id, negative when no fence is registered.
  fenceId: number;
  // Whether the fence is currently enabled.
  enabled: boolean;
  // Timestamp of the last configuration update in milliseconds.
  updatedAt: number;
}

/**
 * One check-in stay inside the fence.
 */
export interface CheckInRecord {
  // Database row id of the record.
  id: number;
  // Enter time in milliseconds since epoch.
  enterTime: number;
  // Exit time in milliseconds, or the open marker while still inside.
  exitTime: number;
  // Stay duration in milliseconds, zero while the record is open.
  durationMs: number;
}

/**
 * Outcome of one fence transition processed by the check-in flow.
 */
export interface CheckInResult {
  // Whether a record was created or closed by the transition.
  changed: boolean;
  // Action recognized from the transition event.
  action: FenceTransitionAction;
  // Created or closed record, undefined when nothing changed.
  record: CheckInRecord | undefined;
  // Timestamp when the transition was processed in milliseconds.
  timestamp: number;
}

/**
 * Aggregated check-in statistics of one day.
 */
export interface DaySummary {
  // Number of check-ins inside the day window.
  count: number;
  // Total stay duration inside the day window in milliseconds.
  durationMs: number;
}

/**
 * Snapshot of every precondition state of the feature, shown on the dashboard.
 */
export interface PermissionSnapshot {
  // Whether the foreground location permissions are granted.
  foregroundGranted: boolean;
  // Whether the background location permission is granted.
  backgroundGranted: boolean;
  // Whether notifications are enabled for this application.
  notificationEnabled: boolean;
  // Whether the system location switch is turned on.
  locationEnabled: boolean;
  // Whether the device supports the geofence capability.
  capabilitySupported: boolean;
}

/**
 * Outcome of one fence registration or removal call.
 */
export interface FenceOperationResult {
  // Whether the operation finished successfully.
  success: boolean;
  // System fence id on success, invalid marker otherwise.
  fenceId: number;
  // System error code, or the no error marker on success.
  errorCode: number;
}

/**
 * Outcome of one current location request.
 */
export interface LocationResult {
  // Whether a location fix was acquired.
  success: boolean;
  // Fix latitude in degrees, zero on failure.
  latitude: number;
  // Fix longitude in degrees, zero on failure.
  longitude: number;
  // System error code, or the no error marker on success.
  errorCode: number;
}

// Exit time marker of a check-in record that is still open.
export const OPEN_END: number = -1;
// Fence id marker used when no fence is registered.
export const INVALID_FENCE_ID: number = -1;
// Error code meaning the operation finished without error.
export const NO_ERROR: number = 0;
// Error code reported when the geofence capability is missing on the device.
export const FENCE_CAPABILITY_UNSUPPORTED: number = 801;
// Default fence radius in meters for a fresh configuration.
export const DEFAULT_RADIUS: number = 200;
// Smallest fence radius in meters accepted by the validation.
export const MIN_RADIUS: number = 50;
// Largest fence radius in meters accepted by the validation.
export const MAX_RADIUS: number = 5000;
// Maximum number of records kept for the history list.
export const MAX_RECORDS: number = 20;
// Length of one day in milliseconds, used for the daily summary window.
export const ONE_DAY_MS: number = 24 * 60 * 60 * 1000;
// Lifetime of one registered fence in milliseconds, one week.
export const FENCE_ALIVE_MS: number = 7 * ONE_DAY_MS;

/**
 * Build the default fence configuration used before anything is saved.
 * @returns a configuration with empty location fields and the default radius
 */
export function createDefaultConfig(): FenceConfig {
  // Empty name and center, default radius, no fence registered yet.
  return {
    name: '',
    latitude: 0,
    longitude: 0,
    radius: DEFAULT_RADIUS,
    fenceId: INVALID_FENCE_ID,
    enabled: false,
    updatedAt: 0
  };
}

/**
 * Build the empty day summary used before any record is counted.
 * @returns a summary with zero count and zero duration
 */
export function createEmptySummary(): DaySummary {
  // Zero count and zero duration until records are loaded.
  return {
    count: 0,
    durationMs: 0
  };
}
