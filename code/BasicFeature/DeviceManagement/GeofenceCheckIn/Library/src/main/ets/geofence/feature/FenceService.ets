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

import { abilityAccessCtrl, common, PermissionRequestResult, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { geoLocationManager } from '@kit.LocationKit';
import { hiTraceMeter } from '@kit.PerformanceAnalysisKit';
import {
  FenceConfig,
  FenceOperationResult,
  FENCE_ALIVE_MS,
  FENCE_CAPABILITY_UNSUPPORTED,
  INVALID_FENCE_ID,
  LocationResult,
  NO_ERROR
} from '../model/GeofenceTypes';
import { Logger } from '../utils/Logger';

// Module-level counter that produces a unique task id for every trace span.
let traceTaskIdCounter: number = 0;

// Extension ability that receives fence status changes in the background.
const FENCE_ABILITY_NAME: string = 'GeofenceFenceAbility';
// System capability string checked before using any geofence API.
const GEOFENCE_SYSCAP: string = 'SystemCapability.Location.Location.Geofence';
// Fine location permission required for fence operations.
const PERMISSION_LOCATION: Permissions = 'ohos.permission.LOCATION';
// Coarse location permission required alongside the fine one.
const PERMISSION_APPROXIMATELY_LOCATION: Permissions = 'ohos.permission.APPROXIMATELY_LOCATION';
// Background location permission required for fence events in background.
const PERMISSION_LOCATION_IN_BACKGROUND: Permissions = 'ohos.permission.LOCATION_IN_BACKGROUND';
// Foreground permissions requested together in one dialog.
const FOREGROUND_PERMISSIONS: Permissions[] = [
  PERMISSION_APPROXIMATELY_LOCATION,
  PERMISSION_LOCATION
];
// Background permissions requested on the settings page.
const BACKGROUND_PERMISSIONS: Permissions[] = [PERMISSION_LOCATION_IN_BACKGROUND];
// Timeout of one current location request in milliseconds.
const CURRENT_LOCATION_TIMEOUT_MS: number = 10000;
// Error code reported when removing a fence id unknown to the system, for example an expired fence.
const FENCE_ID_NOT_FOUND: number = 3301602;

/**
 * Callback type invoked for every fence transition reported by the system.
 */
export type FenceTransitionListener = (transition: geoLocationManager.GeofenceTransition) => void;

/**
 * Wrapper around the location kit APIs used by the feature.
 * It hides capability checks, permission requests, location fixes and fence registration.
 */
export class FenceService {
  /**
   * Check whether the device supports the GNSS geofence capability.
   * @returns true when the system capability is available
   */
  static isSupported(): boolean {
    // Ask the system whether the geofence capability exists on this device.
    return canIUse(GEOFENCE_SYSCAP);
  }

  /**
   * Check whether the location switch of the device is turned on.
   * @returns true when location service is enabled
   */
  static isLocationEnabled(): boolean {
    // Without the geofence capability the switch state is meaningless.
    if (!FenceService.isSupported()) {
      return false;
    }
    // Query the location switch from the location service.
    return geoLocationManager.isLocationEnabled();
  }

  /**
   * Check whether one permission is granted for this application.
   * @param context application context carrying the token id
   * @param permission permission name to check
   * @returns a promise resolving to true when the permission is granted
   */
  static checkPermission(context: common.Context, permission: Permissions): Promise<boolean> {
    // Create the access token manager used for the check.
    const manager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
    // Compare the granted status of the token with the granted constant.
    return manager.checkAccessToken(context.applicationInfo.accessTokenId, permission)
      .then((status: abilityAccessCtrl.GrantStatus): boolean => {
        // The permission counts as granted only for the granted status value.
        return status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED;
      })
      .catch((error: BusinessError): boolean => {
        // Treat a failed check as not granted so callers stay on the safe side.
        Logger.error('FenceService#checkPermission failed: ' + error.code);
        return false;
      });
  }

  /**
   * Check whether both foreground location permissions are granted.
   * @param context application context carrying the token id
   * @returns a promise resolving to true when fine and coarse permissions are granted
   */
  static async hasForegroundPermission(context: common.Context): Promise<boolean> {
    // The fine location permission is the hard requirement.
    const fineGranted: boolean = await FenceService.checkPermission(context, PERMISSION_LOCATION);
    // Fail fast when the fine permission is missing.
    if (!fineGranted) {
      return false;
    }
    // The coarse permission must be granted as well.
    return await FenceService.checkPermission(context, PERMISSION_APPROXIMATELY_LOCATION);
  }

  /**
   * Check whether the background location permission is granted.
   * @param context application context carrying the token id
   * @returns a promise resolving to true when the background permission is granted
   */
  static hasBackgroundPermission(context: common.Context): Promise<boolean> {
    // Check the single background permission.
    return FenceService.checkPermission(context, PERMISSION_LOCATION_IN_BACKGROUND);
  }

  /**
   * Show the system dialog requesting the foreground location permissions.
   * @param context UI ability context used to show the dialog
   * @returns a promise resolving to true when every permission is granted
   */
  static requestForegroundPermissions(context: common.Context): Promise<boolean> {
    // Create the access token manager used for the request.
    const manager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
    // Show one dialog covering both foreground permissions.
    return manager.requestPermissionsFromUser(context, FOREGROUND_PERMISSIONS)
      .then((result: PermissionRequestResult): boolean => {
        // Start optimistic and require every permission to match the request list.
        let granted: boolean = result.authResults.length === FOREGROUND_PERMISSIONS.length;
        // Downgrade the flag as soon as one permission is denied.
        for (let index = 0; index < result.authResults.length; index++) {
          if (result.authResults[index] !== abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED) {
            granted = false;
          }
        }
        // Report the user decision for later diagnosis.
        Logger.info('FenceService#requestForegroundPermissions: granted=' + granted);
        return granted;
      })
      .catch((error: BusinessError): boolean => {
        // Treat a failed dialog flow as denied so the UI can guide the user.
        Logger.error('FenceService#requestForegroundPermissions failed: ' + error.code);
        return false;
      });
  }

  /**
   * Open the settings page asking the user to grant the background location permission.
   * @param context UI ability context used to open the settings page
   * @returns a promise resolving to true when the permission is granted
   */
  static requestBackgroundPermission(context: common.Context): Promise<boolean> {
    // Create the access token manager used for the request.
    const manager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
    // Background permission can only be granted on the settings page.
    return manager.requestPermissionOnSetting(context, BACKGROUND_PERMISSIONS)
      .then((statuses: abilityAccessCtrl.GrantStatus[]): boolean => {
        // The single permission counts as granted when the status list confirms it.
        const granted: boolean = statuses.length > 0 &&
          statuses[0] === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED;
        // Report the user decision for later diagnosis.
        Logger.info('FenceService#requestBackgroundPermission: granted=' + granted);
        return granted;
      })
      .catch((error: BusinessError): boolean => {
        // Treat a failed settings flow as denied so the UI can guide the user.
        Logger.warn('FenceService#requestBackgroundPermission failed: ' + error.code);
        return false;
      });
  }

  /**
   * Request one current location fix with a short timeout.
   * @returns a promise resolving to the location result or an error code
   */
  static getCurrentLocation(): Promise<LocationResult> {
    // Prefer the fastest possible fix and cap the waiting time.
    const request: geoLocationManager.CurrentLocationRequest = {
      priority: geoLocationManager.LocationRequestPriority.FIRST_FIX,
      scenario: geoLocationManager.LocationRequestScenario.UNSET,
      timeoutMs: CURRENT_LOCATION_TIMEOUT_MS
    };
    // Ask the location service for one fix.
    return geoLocationManager.getCurrentLocation(request)
      .then((location: geoLocationManager.Location): LocationResult => {
        // Report the successful fix without printing coordinates to keep privacy.
        Logger.info('FenceService#getCurrentLocation: success');
        // Map the location into the plain result object.
        return {
          success: true,
          latitude: location.latitude,
          longitude: location.longitude,
          errorCode: NO_ERROR
        };
      })
      .catch((error: BusinessError): LocationResult => {
        // Map every failure into a result carrying the system error code.
        Logger.error('FenceService#getCurrentLocation failed: ' + error.code);
        return {
          success: false,
          latitude: 0,
          longitude: 0,
          errorCode: error.code
        };
      });
  }

  /**
   * Register a GNSS geofence for the given configuration and report transitions to the listener.
   * @param config fence configuration with center, radius and expiration
   * @param listener callback invoked for every fence transition
   * @returns a promise resolving to the fence operation result
   */
  static addFence(config: FenceConfig, listener: FenceTransitionListener): Promise<FenceOperationResult> {
    // Open a trace span for the fence registration.
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('FenceService#addFence', taskId);
    // Reject the operation early when the device lacks the geofence capability.
    if (!FenceService.isSupported()) {
      Logger.warn('FenceService#addFence: capability unsupported');
      hiTraceMeter.finishTrace('FenceService#addFence', taskId);
      const unsupported: FenceOperationResult = {
        success: false,
        fenceId: INVALID_FENCE_ID,
        errorCode: FENCE_CAPABILITY_UNSUPPORTED
      };
      return Promise.resolve(unsupported);
    }
    // Subscribe to both enter and exit transition events.
    const transitionEvents: geoLocationManager.GeofenceTransitionEvent[] = [
      geoLocationManager.GeofenceTransitionEvent.GEOFENCE_TRANSITION_EVENT_ENTER,
      geoLocationManager.GeofenceTransitionEvent.GEOFENCE_TRANSITION_EVENT_EXIT
    ];
    // Describe the fence geometry with a one week lifetime.
    const geofence: geoLocationManager.Geofence = {
      latitude: config.latitude,
      longitude: config.longitude,
      radius: config.radius,
      expiration: FENCE_ALIVE_MS
    };
    // Bundle the fence, the events and the transition callback into one request.
    const request: geoLocationManager.GnssGeofenceRequest = {
      geofence: geofence,
      monitorTransitionEvents: transitionEvents,
      fenceExtensionAbilityName: FENCE_ABILITY_NAME,
      geofenceTransitionCallback: (error: BusinessError,
        transition: geoLocationManager.GeofenceTransition): void => {
        // Report callback level errors and stop before touching the listener.
        if (error) {
          Logger.error('FenceService#addFence: transition callback error: ' + error.code);
          return;
        }
        // Forward the transition to the listener registered by the feature layer.
        listener(transition);
      }
    };
    // Register the fence and close the trace span on every terminal branch.
    try {
      return geoLocationManager.addGnssGeofence(request)
        .then((fenceId: number): FenceOperationResult => {
          // Close the trace span when the registration succeeded.
          hiTraceMeter.finishTrace('FenceService#addFence', taskId);
          Logger.info('FenceService#addFence: success, fenceId=' + fenceId);
          return {
            success: true,
            fenceId: fenceId,
            errorCode: NO_ERROR
          };
        })
        .catch((error: BusinessError): FenceOperationResult => {
          // Close the trace span when the registration was rejected.
          hiTraceMeter.finishTrace('FenceService#addFence', taskId);
          Logger.error('FenceService#addFence failed: ' + error.code);
          return {
            success: false,
            fenceId: INVALID_FENCE_ID,
            errorCode: error.code
          };
        });
    } catch (error) {
      // Close the trace span when the registration call throws synchronously.
      hiTraceMeter.finishTrace('FenceService#addFence', taskId);
      const err: BusinessError = error as BusinessError;
      Logger.error('FenceService#addFence throw: ' + err.code);
      const failed: FenceOperationResult = {
        success: false,
        fenceId: INVALID_FENCE_ID,
        errorCode: err.code
      };
      return Promise.resolve(failed);
    }
  }

  /**
   * Remove a registered GNSS geofence by its id.
   * @param fenceId id of the fence to remove
   * @returns a promise resolving to the fence operation result
   */
  static removeFence(fenceId: number): Promise<FenceOperationResult> {
    // Nothing to remove for an invalid id, report the skip directly.
    if (fenceId < 0) {
      Logger.info('FenceService#removeFence: skipped for fenceId=' + fenceId);
      const skipped: FenceOperationResult = {
        success: true,
        fenceId: INVALID_FENCE_ID,
        errorCode: NO_ERROR
      };
      return Promise.resolve(skipped);
    }
    // Open a trace span for the fence removal.
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('FenceService#removeFence', taskId);
    // Remove the fence and close the trace span on every terminal branch.
    return geoLocationManager.removeGnssGeofence(fenceId)
      .then((): FenceOperationResult => {
        // Close the trace span when the removal succeeded.
        hiTraceMeter.finishTrace('FenceService#removeFence', taskId);
        Logger.info('FenceService#removeFence: success, fenceId=' + fenceId);
        return {
          success: true,
          fenceId: INVALID_FENCE_ID,
          errorCode: NO_ERROR
        };
      })
      .catch((error: BusinessError): FenceOperationResult => {
        // Close the trace span when the removal failed.
        hiTraceMeter.finishTrace('FenceService#removeFence', taskId);
        // An unknown id means the fence is already gone, so callers must not keep retrying it.
        if (error.code === FENCE_ID_NOT_FOUND) {
          Logger.warn('FenceService#removeFence: fence already absent, fenceId=' + fenceId);
          return {
            success: true,
            fenceId: INVALID_FENCE_ID,
            errorCode: NO_ERROR
          };
        }
        Logger.error('FenceService#removeFence failed: ' + error.code);
        return {
          success: false,
          fenceId: fenceId,
          errorCode: error.code
        };
      });
  }
}
