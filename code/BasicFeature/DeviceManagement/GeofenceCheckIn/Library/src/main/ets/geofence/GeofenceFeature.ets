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

import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { geoLocationManager } from '@kit.LocationKit';
import { hiTraceMeter } from '@kit.PerformanceAnalysisKit';
import {
  CheckInRecord,
  CheckInResult,
  DaySummary,
  FenceConfig,
  FenceOperationResult,
  FenceTransitionAction,
  INVALID_FENCE_ID,
  LocationResult,
  MAX_RADIUS,
  MIN_RADIUS,
  NO_ERROR,
  PermissionSnapshot
} from './model/GeofenceTypes';
import { getDayStart } from './utils/TimeUtil';
import { Logger } from './utils/Logger';
import { CheckInService } from './feature/CheckInService';
import { FenceService, FenceTransitionListener } from './feature/FenceService';
import { NotificationService } from './feature/NotificationService';
import { RecordStore } from './feature/RecordStore';

// Module-level counter that produces a unique task id for every trace span.
let traceTaskIdCounter: number = 0;

/**
 * Facade of the geofence check-in feature.
 * It wires the fence service, check-in service, record store and notification service
 * into one entry point that the UI layer can use without knowing the internals.
 */
export class GeofenceFeature {
  /**
   * Check whether the device supports the GNSS geofence capability.
   * @returns true when the geofence system capability is available
   */
  static isSupported(): boolean {
    // Delegate the capability query to the fence service.
    return FenceService.isSupported();
  }

  /**
   * Check whether the location switch of the device is turned on.
   * @returns true when location service is enabled
   */
  static isLocationEnabled(): boolean {
    // Delegate the location switch query to the fence service.
    return FenceService.isLocationEnabled();
  }

  /**
   * Collect the current capability, switch and permission states into one snapshot.
   * @param context application context used for the permission checks
   * @returns a snapshot describing every precondition of the feature
   */
  static async getSnapshot(context: common.Context): Promise<PermissionSnapshot> {
    // Open a trace span so the permission scan can be measured as a whole.
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('GeofenceFeature#getSnapshot', taskId);
    try {
      // Check whether the geofence capability is supported at all.
      const capabilitySupported: boolean = FenceService.isSupported();
      // Only query the location switch when the capability exists.
      const locationEnabled: boolean = capabilitySupported ? FenceService.isLocationEnabled() : false;
      // Check the foreground location permissions.
      const foregroundGranted: boolean = await FenceService.hasForegroundPermission(context);
      // Check the background location permission.
      const backgroundGranted: boolean = await FenceService.hasBackgroundPermission(context);
      // Check whether notifications are enabled for this application.
      const notificationEnabled: boolean = await NotificationService.isEnabled();
      // Report the scanned states for later diagnosis.
      Logger.info('GeofenceFeature#getSnapshot: capability=' + capabilitySupported +
        ', location=' + locationEnabled + ', foreground=' + foregroundGranted +
        ', background=' + backgroundGranted + ', notification=' + notificationEnabled);
      // Assemble the snapshot for the dashboard.
      return {
        foregroundGranted: foregroundGranted,
        backgroundGranted: backgroundGranted,
        notificationEnabled: notificationEnabled,
        locationEnabled: locationEnabled,
        capabilitySupported: capabilitySupported
      };
    } finally {
      // Close the trace span whatever the permission scan outcome is.
      hiTraceMeter.finishTrace('GeofenceFeature#getSnapshot', taskId);
    }
  }

  /**
   * Request the foreground location permissions from the user.
   * @param context UI ability context used to show the permission dialog
   * @returns a promise resolving to true when every permission is granted
   */
  static async requestForegroundPermissions(context: common.Context): Promise<boolean> {
    // Open a trace span for the foreground permission request.
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('GeofenceFeature#requestForegroundPermissions', taskId);
    try {
      // Delegate the dialog flow to the fence service.
      const granted: boolean = await FenceService.requestForegroundPermissions(context);
      // Report the user decision for later diagnosis.
      Logger.info('GeofenceFeature#requestForegroundPermissions: granted=' + granted);
      return granted;
    } finally {
      // Close the trace span whatever the request outcome is.
      hiTraceMeter.finishTrace('GeofenceFeature#requestForegroundPermissions', taskId);
    }
  }

  /**
   * Request the background location permission from the user.
   * @param context UI ability context used to open the settings page
   * @returns a promise resolving to true when the permission is granted
   */
  static async requestBackgroundPermission(context: common.Context): Promise<boolean> {
    // Open a trace span for the background permission request.
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('GeofenceFeature#requestBackgroundPermission', taskId);
    try {
      // Delegate the settings page flow to the fence service.
      const granted: boolean = await FenceService.requestBackgroundPermission(context);
      // Report the user decision for later diagnosis.
      Logger.info('GeofenceFeature#requestBackgroundPermission: granted=' + granted);
      return granted;
    } finally {
      // Close the trace span whatever the request outcome is.
      hiTraceMeter.finishTrace('GeofenceFeature#requestBackgroundPermission', taskId);
    }
  }

  /**
   * Request the notification permission from the user.
   * @param context UI ability context used to show the enable dialog
   * @returns a promise resolving to true when notifications are enabled
   */
  static async requestNotificationPermission(context: common.UIAbilityContext): Promise<boolean> {
    // Open a trace span for the notification permission request.
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('GeofenceFeature#requestNotificationPermission', taskId);
    try {
      // Delegate the enable dialog flow to the notification service.
      const enabled: boolean = await NotificationService.requestEnable(context);
      // Report the user decision for later diagnosis.
      Logger.info('GeofenceFeature#requestNotificationPermission: enabled=' + enabled);
      return enabled;
    } finally {
      // Close the trace span whatever the request outcome is.
      hiTraceMeter.finishTrace('GeofenceFeature#requestNotificationPermission', taskId);
    }
  }

  /**
   * Request one current location fix through the fence service.
   * @returns a promise resolving to the location result or an error code
   */
  static async getCurrentLocation(): Promise<LocationResult> {
    // Open a trace span for the location request.
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('GeofenceFeature#getCurrentLocation', taskId);
    try {
      // Request a single current location fix through the fence service.
      const result: LocationResult = await FenceService.getCurrentLocation();
      // Report the fix outcome without printing coordinates to keep privacy.
      if (result.success) {
        Logger.info('GeofenceFeature#getCurrentLocation: success');
      } else {
        Logger.warn('GeofenceFeature#getCurrentLocation: failed, code=' + result.errorCode);
      }
      return result;
    } finally {
      // Close the trace span whatever the location outcome is.
      hiTraceMeter.finishTrace('GeofenceFeature#getCurrentLocation', taskId);
    }
  }

  /**
   * Load the persisted fence configuration.
   * @param context application context used to open the database
   * @returns the stored configuration, or a default one when nothing exists
   */
  static loadConfig(context: common.Context): Promise<FenceConfig> {
    // Delegate the database read to the record store.
    return RecordStore.getConfig(context);
  }

  /**
   * Stamp the configuration with the current time and persist it.
   * @param context application context used to open the database
   * @param config configuration to persist
   * @returns a promise that resolves when the configuration is stored
   */
  static async saveConfig(context: common.Context, config: FenceConfig): Promise<void> {
    // Refresh the update timestamp so the UI can show the latest change time.
    config.updatedAt = Date.now();
    // Persist the configuration through the record store.
    await RecordStore.saveConfig(context, config);
    // Report the persisted state without printing coordinates for privacy.
    Logger.info('GeofenceFeature#saveConfig: saved fence ' + config.name +
      ', enabled=' + config.enabled + ', fenceId=' + config.fenceId);
  }

  /**
   * Validate latitude, longitude and radius ranges of a fence configuration.
   * @param config configuration to validate
   * @returns true when every field stays inside its allowed range
   */
  static validateConfig(config: FenceConfig): boolean {
    // Latitude must stay inside the [-90, 90] range.
    const latitudeValid: boolean = config.latitude >= -90 && config.latitude <= 90;
    // Longitude must stay inside the [-180, 180] range.
    const longitudeValid: boolean = config.longitude >= -180 && config.longitude <= 180;
    // Radius must stay inside the supported fence radius range.
    const radiusValid: boolean = config.radius >= MIN_RADIUS && config.radius <= MAX_RADIUS;
    // The configuration is valid only when every check passes.
    return latitudeValid && longitudeValid && radiusValid;
  }

  /**
   * Register the geofence for the given configuration and persist the enabled state.
   * @param context application context used for persistence and transitions
   * @param config fence configuration to enable
   * @returns the fence operation result with the new fence id or an error code
   */
  static async enableFence(context: common.Context, config: FenceConfig): Promise<FenceOperationResult> {
    // Open a trace span for the whole enable flow.
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('GeofenceFeature#enableFence', taskId);
    try {
      // Reject configurations that are outside the supported ranges.
      if (!GeofenceFeature.validateConfig(config)) {
        Logger.warn('GeofenceFeature#enableFence: config validation failed');
        return {
          success: false,
          fenceId: INVALID_FENCE_ID,
          errorCode: NO_ERROR
        };
      }
      // Remove the previous fence first so it will not be registered twice.
      if (config.fenceId >= 0) {
        await FenceService.removeFence(config.fenceId);
      }
      // Build the transition listener that feeds every fence event into the check-in service.
      const listener: FenceTransitionListener =
        (transition: geoLocationManager.GeofenceTransition): void => {
          CheckInService.handleTransition(context, transition)
            .then((result: CheckInResult) => {
              Logger.info('GeofenceFeature: fence transition handled, action=' + result.action +
                ', changed=' + result.changed);
            })
            .catch((error: BusinessError) => {
              Logger.error('GeofenceFeature: handle fence transition failed, code=' + error.code);
            });
        };
      // Register the fence with the system location service.
      const result: FenceOperationResult = await FenceService.addFence(config, listener);
      // Persist the fence id and enabled flag only when registration succeeded.
      if (result.success) {
        config.fenceId = result.fenceId;
        config.enabled = true;
        await GeofenceFeature.saveConfig(context, config);
        Logger.info('GeofenceFeature#enableFence: fence enabled, fenceId=' + result.fenceId);
      } else {
        Logger.error('GeofenceFeature#enableFence: enable failed, code=' + result.errorCode);
      }
      return result;
    } finally {
      // Close the trace span whatever the enable outcome is.
      hiTraceMeter.finishTrace('GeofenceFeature#enableFence', taskId);
    }
  }

  /**
   * Remove the registered geofence and persist the disabled state.
   * @param context application context used for persistence
   * @param config configuration holding the fence id to remove
   * @returns a promise that resolves when the fence is disabled
   */
  static async disableFence(context: common.Context, config: FenceConfig): Promise<void> {
    // Open a trace span for the whole disable flow.
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('GeofenceFeature#disableFence', taskId);
    try {
      // Remove the registered fence when one exists.
      if (config.fenceId >= 0) {
        await FenceService.removeFence(config.fenceId);
      }
      // Reset the fence id and the enabled flag in the configuration.
      config.fenceId = INVALID_FENCE_ID;
      config.enabled = false;
      // Persist the disabled state through the record store.
      await GeofenceFeature.saveConfig(context, config);
      // Report the disabled state for later diagnosis.
      Logger.info('GeofenceFeature#disableFence: fence disabled');
    } finally {
      // Close the trace span whatever the disable outcome is.
      hiTraceMeter.finishTrace('GeofenceFeature#disableFence', taskId);
    }
  }

  /**
   * Load the latest check-in records.
   * @param context application context used to open the database
   * @returns the stored check-in records ordered by enter time
   */
  static getRecords(context: common.Context): Promise<Array<CheckInRecord>> {
    // Delegate the database read to the record store.
    return RecordStore.getRecords(context);
  }

  /**
   * Load the check-in summary of the current day.
   * @param context application context used to open the database
   * @returns the count and total duration of today's check-ins
   */
  static getDaySummary(context: common.Context): Promise<DaySummary> {
    // Compute today's start time and delegate the summary query to the record store.
    return RecordStore.getDaySummary(context, getDayStart(Date.now()));
  }

  /**
   * Delete every stored check-in record.
   * @param context application context used to open the database
   * @returns a promise that resolves when the records are deleted
   */
  static clearRecords(context: common.Context): Promise<void> {
    // Delegate the delete statement to the record store.
    return RecordStore.clearRecords(context);
  }

  /**
   * Simulate a fence enter event for demo purposes.
   * @param context application context used by the check-in service
   * @returns the check-in result produced by the simulated transition
   */
  static async simulateEnter(context: common.Context): Promise<CheckInResult> {
    // Load the persisted configuration to check whether a fence was ever configured.
    const config: FenceConfig = await RecordStore.getConfig(context);
    // Without any saved configuration there is nothing to simulate.
    if (config.updatedAt <= 0) {
      Logger.warn('GeofenceFeature#simulateEnter: skipped, no saved config');
      return {
        changed: false,
        action: FenceTransitionAction.NONE,
        record: undefined,
        timestamp: Date.now()
      };
    }
    // Run the simulated enter transition through the check-in service.
    Logger.info('GeofenceFeature#simulateEnter: triggered');
    return CheckInService.simulate(context, FenceTransitionAction.ENTER, config.fenceId);
  }

  /**
   * Simulate a fence exit event for demo purposes.
   * @param context application context used by the check-in service
   * @returns the check-in result produced by the simulated transition
   */
  static async simulateExit(context: common.Context): Promise<CheckInResult> {
    // Load the persisted configuration to check whether a fence was ever configured.
    const config: FenceConfig = await RecordStore.getConfig(context);
    // Without any saved configuration there is nothing to simulate.
    if (config.updatedAt <= 0) {
      Logger.warn('GeofenceFeature#simulateExit: skipped, no saved config');
      return {
        changed: false,
        action: FenceTransitionAction.NONE,
        record: undefined,
        timestamp: Date.now()
      };
    }
    // Run the simulated exit transition through the check-in service.
    Logger.info('GeofenceFeature#simulateExit: triggered');
    return CheckInService.simulate(context, FenceTransitionAction.EXIT, config.fenceId);
  }
}
