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
import { hiTraceMeter } from '@kit.PerformanceAnalysisKit';
import {
  CheckInRecord,
  CheckInResult,
  DaySummary,
  DEFAULT_RADIUS,
  FENCE_CAPABILITY_UNSUPPORTED,
  FenceConfig,
  FenceOperationResult,
  GeofenceFeature,
  INVALID_FENCE_ID,
  LocationResult,
  Logger,
  PermissionSnapshot,
  createDefaultConfig
} from 'library';

// Number of decimal digits kept when formatting coordinate values.
const COORDINATE_DIGITS: number = 6;
// Error code reported when location permission is denied by the user.
const LOCATION_PERMISSION_DENIED: number = 201;
// Error code reported when the system location service switch is off.
const LOCATION_SERVICE_DISABLED: number = 3301100;
// Error code reported when no location fix could be obtained.
const LOCATION_NO_FIX: number = 3301200;
// Error code reported when the fence service itself is unavailable.
const FENCE_SERVICE_UNAVAILABLE: number = 3301000;
// Error code reported when the fence count limit has been reached.
const FENCE_LIMIT_EXCEEDED: number = 3301601;

// Module-level counter that produces a unique task id for every trace span.
let traceTaskIdCounter: number = 0;

/**
 * View model that owns all page state and business operations.
 *
 * It persists the fence configuration, talks to the feature layer for
 * permissions, fence control and records, and publishes observable
 * fields consumed by the main page UI.
 */
@ObservedV2
export class GeofenceViewModel {
  // Fence name entered by the user.
  @Trace public name: string = '';
  // Latitude input text entered by the user.
  @Trace public latitudeText: string = '';
  // Longitude input text entered by the user.
  @Trace public longitudeText: string = '';
  // Radius input text entered by the user.
  @Trace public radiusText: string = DEFAULT_RADIUS.toString();
  // Whether the fence is currently enabled in the system.
  @Trace public enabled: boolean = false;
  // Whether a configuration has been saved at least once.
  @Trace public hasConfig: boolean = false;
  // System identifier of the registered fence.
  @Trace public fenceId: number = INVALID_FENCE_ID;
  // Whether a fence operation is currently in progress.
  @Trace public busy: boolean = false;
  // Number of check-ins recorded today.
  @Trace public todayCount: number = 0;
  // Total time inside the fence today, in milliseconds.
  @Trace public todayDurationMs: number = 0;
  // Stored check-in records shown in the history list.
  @Trace public records: CheckInRecord[] = [];
  // Transient banner message shown on the configuration card.
  @Trace public message: string = '';
  // Whether the current banner message describes an error.
  @Trace public messageIsError: boolean = false;
  // Whether foreground location permission is granted.
  @Trace public foregroundGranted: boolean = false;
  // Whether background location permission is granted.
  @Trace public backgroundGranted: boolean = false;
  // Whether notifications are enabled for the app.
  @Trace public notificationEnabled: boolean = false;
  // Whether the system location service switch is on.
  @Trace public locationEnabled: boolean = false;
  // Whether the device supports geofence capabilities.
  @Trace public capabilitySupported: boolean = false;
  // Cached copy of the last saved or enabled fence configuration.
  private config: FenceConfig = createDefaultConfig();

  /**
   * Load the persisted fence configuration into the view model state.
   *
   * @param context - Application context used to read the stored configuration.
   * @returns A promise that resolves once the state has been synchronized.
   */
  async init(context: common.Context): Promise<void> {
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('GeofenceViewModel#init', taskId);
    try {
      // Load the persisted fence configuration from storage first.
      this.config = await GeofenceFeature.loadConfig(context);
      // Reflect the stored enablement flag in the observable state.
      this.enabled = this.config.enabled;
      // Keep the raw fence id so later operations can target the same fence.
      this.fenceId = this.config.fenceId;
      // A fence counts as configured only after it has been saved once.
      this.hasConfig = this.config.updatedAt > 0;
      if (this.config.updatedAt > 0) {
        Logger.info('GeofenceViewModel#init: restored saved config, fenceId ' + this.config.fenceId);
        // Restore the input fields so the card shows the saved values.
        this.name = this.config.name;
        this.latitudeText = this.config.latitude.toString();
        this.longitudeText = this.config.longitude.toString();
        this.radiusText = this.config.radius.toString();
      }
      // Refresh permissions, capability and history so the page starts live.
      await this.refreshData(context);
    } finally {
      hiTraceMeter.finishTrace('GeofenceViewModel#init', taskId);
    }
  }

  /**
   * Run the first-launch flow: initialize state, request missing permissions
   * and refresh all observable data.
   *
   * @param context - UI ability context used for permission dialogs and data access.
   * @returns A promise that resolves when the launch sequence completes.
   */
  async launch(context: common.UIAbilityContext): Promise<void> {
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('GeofenceViewModel#launch', taskId);
    try {
      // Initialize configuration and cached records before asking for permissions.
      await this.init(context);
      // Snapshot the current permission state to decide which dialogs are needed.
      const snapshot: PermissionSnapshot = await GeofenceFeature.getSnapshot(context);
      if (!snapshot.foregroundGranted) {
        Logger.info('GeofenceViewModel#launch: requesting foreground location permission');
        // Foreground location access is always required before anything else.
        const granted: boolean = await GeofenceFeature.requestForegroundPermissions(context);
        if (!granted) {
          Logger.warn('GeofenceViewModel#launch: foreground location permission denied');
          this.setMessage(context, $r('app.string.gc_msg_permission_denied'), true);
        }
      }
      // Re-read the snapshot because the first dialog may have changed the state.
      const latest: PermissionSnapshot = await GeofenceFeature.getSnapshot(context);
      if (latest.foregroundGranted && !latest.notificationEnabled) {
        Logger.info('GeofenceViewModel#launch: requesting notification permission');
        // Notifications are needed for fence reminders once location is granted.
        const enabled: boolean = await GeofenceFeature.requestNotificationPermission(context);
        if (!enabled) {
          Logger.warn('GeofenceViewModel#launch: notification permission denied');
          // Tell the user that fence reminders cannot be delivered without it.
          this.setMessage(context, $r('app.string.gc_msg_notification_denied'), true);
        }
      }
      // Refresh the dashboard once more so status rows show the final state.
      await this.refreshData(context);
    } finally {
      hiTraceMeter.finishTrace('GeofenceViewModel#launch', taskId);
    }
  }

  /**
   * Reload permissions, capability, today summary and check-in records.
   *
   * @param context - Context used by the feature layer to read system state.
   * @returns A promise that resolves when all observable fields are updated.
   */
  async refreshData(context: common.Context): Promise<void> {
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('GeofenceViewModel#refreshData', taskId);
    try {
      // Query a fresh permission snapshot so every status row shows real state.
      const snapshot: PermissionSnapshot = await GeofenceFeature.getSnapshot(context);
      // Publish each permission flag to the fields consumed by the page.
      this.foregroundGranted = snapshot.foregroundGranted;
      this.backgroundGranted = snapshot.backgroundGranted;
      this.notificationEnabled = snapshot.notificationEnabled;
      this.locationEnabled = snapshot.locationEnabled;
      this.capabilitySupported = snapshot.capabilitySupported;
      Logger.info('GeofenceViewModel#refreshData: foreground ' + snapshot.foregroundGranted + ', background ' +
        snapshot.backgroundGranted + ', notification ' + snapshot.notificationEnabled);
      // Load the check-in summary for today to feed the status card.
      const summary: DaySummary = await GeofenceFeature.getDaySummary(context);
      this.todayCount = summary.count;
      this.todayDurationMs = summary.durationMs;
      // Load the full record list so the history section stays current.
      this.records = await GeofenceFeature.getRecords(context);
      Logger.info('GeofenceViewModel#refreshData: today count ' + this.todayCount + ', records ' + this.records.length);
    } finally {
      hiTraceMeter.finishTrace('GeofenceViewModel#refreshData', taskId);
    }
  }

  /**
   * Validate and persist the fence configuration entered on the page.
   *
   * @param context - Context used for persistence and localized messages.
   * @returns A promise that resolves when the configuration is saved or rejected.
   */
  async saveConfig(context: common.Context): Promise<void> {
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('GeofenceViewModel#saveConfig', taskId);
    try {
      // Build a candidate configuration from the current input fields.
      const config: FenceConfig = this.buildConfig();
      if (!GeofenceFeature.validateConfig(config)) {
        Logger.warn('GeofenceViewModel#saveConfig: config validation failed');
        // Reject invalid inputs early with a localized error message.
        this.setMessage(context, $r('app.string.gc_msg_params_invalid'), true);
        return;
      }
      // Persist the validated configuration through the feature layer.
      await GeofenceFeature.saveConfig(context, config);
      // Cache the saved config and mark the view model as configured.
      this.config = config;
      this.hasConfig = true;
      Logger.info('GeofenceViewModel#saveConfig: config saved for fence ' + config.name);
      this.setMessage(context, $r('app.string.gc_msg_config_saved'), false);
    } finally {
      hiTraceMeter.finishTrace('GeofenceViewModel#saveConfig', taskId);
    }
  }

  /**
   * Enable the geofence with the current configuration and update the state.
   *
   * @param context - Context used by the feature layer to reach the fence service.
   * @returns A promise that resolves when the enable flow finishes.
   */
  async enableFence(context: common.Context): Promise<void> {
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('GeofenceViewModel#enableFence', taskId);
    // Ignore repeated clicks while another fence operation is still running.
    if (this.busy) {
      Logger.warn('GeofenceViewModel#enableFence: skipped because an operation is running');
      hiTraceMeter.finishTrace('GeofenceViewModel#enableFence', taskId);
      return;
    }
    // Validate the current inputs before touching the fence service.
    const config: FenceConfig = this.buildConfig();
    if (!GeofenceFeature.validateConfig(config)) {
      Logger.warn('GeofenceViewModel#enableFence: config validation failed');
      // Show a localized error when the inputs do not form a usable fence.
      this.setMessage(context, $r('app.string.gc_msg_params_invalid'), true);
      hiTraceMeter.finishTrace('GeofenceViewModel#enableFence', taskId);
      return;
    }
    // Mark the view model busy so the page disables the action buttons.
    this.busy = true;
    Logger.info('GeofenceViewModel#enableFence: enabling fence ' + config.name);
    try {
      // Ask the feature layer to register the fence with the system service.
      const result: FenceOperationResult = await GeofenceFeature.enableFence(context, config);
      if (!result.success) {
        Logger.error('GeofenceViewModel#enableFence: enable failed, code ' + result.errorCode);
        // Translate the service error code into a user-readable message.
        this.setMessage(context, this.fenceErrorText(result.errorCode), true);
        return;
      }
      // Adopt the validated config and publish the enabled state to the UI.
      this.config = config;
      this.enabled = true;
      this.hasConfig = true;
      this.fenceId = result.fenceId;
      Logger.info('GeofenceViewModel#enableFence: fence enabled, fenceId ' + result.fenceId);
      this.setMessage(context, $r('app.string.gc_msg_fence_enabled'), false);
    } finally {
      // Always clear the busy flag and close the trace span, whatever the outcome.
      this.busy = false;
      hiTraceMeter.finishTrace('GeofenceViewModel#enableFence', taskId);
    }
  }

  /**
   * Disable the currently registered geofence and reset the fence state.
   *
   * @param context - Context used by the feature layer to reach the fence service.
   * @returns A promise that resolves when the disable flow finishes.
   */
  async disableFence(context: common.Context): Promise<void> {
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('GeofenceViewModel#disableFence', taskId);
    // Ignore repeated clicks while another fence operation is still running.
    if (this.busy) {
      Logger.warn('GeofenceViewModel#disableFence: skipped because an operation is running');
      hiTraceMeter.finishTrace('GeofenceViewModel#disableFence', taskId);
      return;
    }
    // Mark the view model busy so the page disables the action buttons.
    this.busy = true;
    Logger.info('GeofenceViewModel#disableFence: disabling fenceId ' + this.config.fenceId);
    try {
      // Ask the feature layer to remove the fence registration.
      await GeofenceFeature.disableFence(context, this.config);
      // Publish the disabled state and clear the fence id.
      this.enabled = false;
      this.fenceId = INVALID_FENCE_ID;
      Logger.info('GeofenceViewModel#disableFence: fence disabled');
      this.setMessage(context, $r('app.string.gc_msg_fence_disabled'), false);
    } finally {
      // Always clear the busy flag and close the trace span, whatever the outcome.
      this.busy = false;
      hiTraceMeter.finishTrace('GeofenceViewModel#disableFence', taskId);
    }
  }

  /**
   * Fill the coordinate inputs with the device current location.
   *
   * @param context - Context used for localized messages and data refresh.
   * @returns A promise that resolves when the inputs are filled or an error is shown.
   */
  async useCurrentLocation(context: common.Context): Promise<void> {
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('GeofenceViewModel#useCurrentLocation', taskId);
    try {
      // Request a single current location fix from the feature layer.
      const result: LocationResult = await GeofenceFeature.getCurrentLocation();
      if (result.success) {
        Logger.info('GeofenceViewModel#useCurrentLocation: location acquired');
        // Write the formatted coordinates back into the input fields.
        this.latitudeText = result.latitude.toFixed(COORDINATE_DIGITS);
        this.longitudeText = result.longitude.toFixed(COORDINATE_DIGITS);
        this.setMessage(context, $r('app.string.gc_msg_location_filled'), false);
      } else {
        Logger.warn('GeofenceViewModel#useCurrentLocation: location failed, code ' + result.errorCode);
        // Translate the location error code into a user-readable message.
        this.setMessage(context, this.locationErrorText(result.errorCode), true);
      }
      // Refresh the dashboard so permission and service rows stay accurate.
      await this.refreshData(context);
    } finally {
      hiTraceMeter.finishTrace('GeofenceViewModel#useCurrentLocation', taskId);
    }
  }

  /**
   * Request the foreground location permission and refresh the status rows.
   *
   * @param context - UI ability context used to show the permission dialog.
   * @returns A promise that resolves when the request flow finishes.
   */
  async requestForegroundPermission(context: common.Context): Promise<void> {
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('GeofenceViewModel#requestForegroundPermission', taskId);
    try {
      // Ask the user for foreground location access through the feature layer.
      const granted: boolean = await GeofenceFeature.requestForegroundPermissions(context);
      Logger.info('GeofenceViewModel#requestForegroundPermission: granted ' + granted);
      // Report the outcome so the banner explains the new state.
      this.setMessage(context, granted ? $r('app.string.gc_msg_permission_granted') :
        $r('app.string.gc_msg_permission_denied'), !granted);
      // Refresh the status rows to reflect the user's decision.
      await this.refreshData(context);
    } finally {
      hiTraceMeter.finishTrace('GeofenceViewModel#requestForegroundPermission', taskId);
    }
  }

  /**
   * Request the background location permission and refresh the status rows.
   *
   * @param context - UI ability context used to show the permission dialog.
   * @returns A promise that resolves when the request flow finishes.
   */
  async requestBackgroundPermission(context: common.Context): Promise<void> {
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('GeofenceViewModel#requestBackgroundPermission', taskId);
    try {
      // Ask the user for background location access so fences work off-screen.
      const granted: boolean = await GeofenceFeature.requestBackgroundPermission(context);
      Logger.info('GeofenceViewModel#requestBackgroundPermission: granted ' + granted);
      // Report the outcome so the banner explains the new state.
      this.setMessage(context, granted ? $r('app.string.gc_msg_permission_granted') :
        $r('app.string.gc_msg_permission_denied'), !granted);
      // Refresh the status rows to reflect the user's decision.
      await this.refreshData(context);
    } finally {
      hiTraceMeter.finishTrace('GeofenceViewModel#requestBackgroundPermission', taskId);
    }
  }

  /**
   * Request the notification permission and refresh the status rows.
   *
   * @param context - UI ability context used to show the permission dialog.
   * @returns A promise that resolves when the request flow finishes.
   */
  async requestNotificationPermission(context: common.UIAbilityContext): Promise<void> {
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('GeofenceViewModel#requestNotificationPermission', taskId);
    try {
      // Ask the user to allow notifications for fence reminders.
      const granted: boolean = await GeofenceFeature.requestNotificationPermission(context);
      Logger.info('GeofenceViewModel#requestNotificationPermission: granted ' + granted);
      // Report the outcome so the banner explains the new state.
      this.setMessage(context, granted ? $r('app.string.gc_msg_notification_granted') :
        $r('app.string.gc_msg_notification_denied'), !granted);
      // Refresh the status rows to reflect the user's decision.
      await this.refreshData(context);
    } finally {
      hiTraceMeter.finishTrace('GeofenceViewModel#requestNotificationPermission', taskId);
    }
  }

  /**
   * Simulate a fence enter transition to produce a demo check-in record.
   *
   * @param context - Context used by the feature layer to record the check-in.
   * @returns A promise that resolves when the simulation is processed.
   */
  async simulateEnter(context: common.Context): Promise<void> {
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('GeofenceViewModel#simulateEnter', taskId);
    try {
      // Simulation is only meaningful once a fence configuration exists.
      if (!this.hasConfig) {
        Logger.warn('GeofenceViewModel#simulateEnter: skipped because no config is saved');
        // Tell the user to save a configuration before simulating transitions.
        this.setMessage(context, $r('app.string.gc_msg_simulate_disabled'), true);
        return;
      }
      // Trigger the simulated enter transition in the feature layer.
      const result: CheckInResult = await GeofenceFeature.simulateEnter(context);
      Logger.info('GeofenceViewModel#simulateEnter: changed ' + result.changed);
      // Report whether the transition actually created a new check-in.
      this.setMessage(context, result.changed ? $r('app.string.gc_msg_simulate_enter') :
        $r('app.string.gc_msg_simulate_ignored'), !result.changed);
      // Refresh so today counters and the record list include the new entry.
      await this.refreshData(context);
    } finally {
      hiTraceMeter.finishTrace('GeofenceViewModel#simulateEnter', taskId);
    }
  }

  /**
   * Simulate a fence exit transition to close the open demo check-in.
   *
   * @param context - Context used by the feature layer to update the record.
   * @returns A promise that resolves when the simulation is processed.
   */
  async simulateExit(context: common.Context): Promise<void> {
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('GeofenceViewModel#simulateExit', taskId);
    try {
      // Simulation is only meaningful once a fence configuration exists.
      if (!this.hasConfig) {
        Logger.warn('GeofenceViewModel#simulateExit: skipped because no config is saved');
        // Tell the user to save a configuration before simulating transitions.
        this.setMessage(context, $r('app.string.gc_msg_simulate_disabled'), true);
        return;
      }
      // Trigger the simulated exit transition in the feature layer.
      const result: CheckInResult = await GeofenceFeature.simulateExit(context);
      Logger.info('GeofenceViewModel#simulateExit: changed ' + result.changed);
      // Report whether the transition actually closed the open check-in.
      this.setMessage(context, result.changed ? $r('app.string.gc_msg_simulate_exit') :
        $r('app.string.gc_msg_simulate_ignored'), !result.changed);
      // Refresh so today counters and the record list reflect the update.
      await this.refreshData(context);
    } finally {
      hiTraceMeter.finishTrace('GeofenceViewModel#simulateExit', taskId);
    }
  }

  /**
   * Delete all stored check-in records and refresh the history section.
   *
   * @param context - Context used by the feature layer to clear storage.
   * @returns A promise that resolves when the records are cleared.
   */
  async clearRecords(context: common.Context): Promise<void> {
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('GeofenceViewModel#clearRecords', taskId);
    try {
      // Remove every stored record through the feature layer.
      await GeofenceFeature.clearRecords(context);
      Logger.info('GeofenceViewModel#clearRecords: records cleared');
      this.setMessage(context, $r('app.string.gc_msg_records_cleared'), false);
      // Refresh so the history list and today counters show the empty state.
      await this.refreshData(context);
    } finally {
      hiTraceMeter.finishTrace('GeofenceViewModel#clearRecords', taskId);
    }
  }

  /**
   * Build a candidate fence configuration from the current input fields.
   *
   * @returns The configuration assembled from user input and stored metadata.
   */
  private buildConfig(): FenceConfig {
    // Parse the text inputs into numbers and carry over the stored metadata.
    const config: FenceConfig = {
      name: this.name,
      latitude: Number.parseFloat(this.latitudeText),
      longitude: Number.parseFloat(this.longitudeText),
      radius: Number.parseFloat(this.radiusText),
      fenceId: this.config.fenceId,
      enabled: this.config.enabled,
      updatedAt: this.config.updatedAt
    };
    return config;
  }

  /**
   * Map a location error code to a localized error message.
   *
   * @param errorCode - Error code reported by the location service.
   * @returns The localized message resource matching the error code.
   */
  private locationErrorText(errorCode: number): Resource {
    // The user denied location permission.
    if (errorCode === LOCATION_PERMISSION_DENIED) {
      return $r('app.string.gc_msg_location_permission_denied');
    }
    // The system location service switch is off.
    if (errorCode === LOCATION_SERVICE_DISABLED) {
      return $r('app.string.gc_msg_location_disabled');
    }
    // No location fix could be obtained.
    if (errorCode === LOCATION_NO_FIX) {
      return $r('app.string.gc_msg_location_no_fix');
    }
    // Any other code falls back to a generic failure message.
    return $r('app.string.gc_msg_location_failed');
  }

  /**
   * Map a fence enable error code to a localized error message.
   *
   * @param errorCode - Error code reported by the fence service.
   * @returns The localized message resource matching the error code.
   */
  private fenceErrorText(errorCode: number): Resource {
    // The user denied the permission required to enable the fence.
    if (errorCode === LOCATION_PERMISSION_DENIED) {
      return $r('app.string.gc_msg_fence_permission_denied');
    }
    // The device does not support the geofence capability.
    if (errorCode === FENCE_CAPABILITY_UNSUPPORTED) {
      return $r('app.string.gc_msg_fence_unsupported');
    }
    // The system location service switch is off.
    if (errorCode === LOCATION_SERVICE_DISABLED) {
      return $r('app.string.gc_msg_location_disabled');
    }
    // The fence service is currently unavailable.
    if (errorCode === FENCE_SERVICE_UNAVAILABLE) {
      return $r('app.string.gc_msg_fence_service_unavailable');
    }
    // The fence count limit has been reached.
    if (errorCode === FENCE_LIMIT_EXCEEDED) {
      return $r('app.string.gc_msg_fence_limit');
    }
    // Any other code falls back to a generic enable failure message.
    return $r('app.string.gc_msg_fence_enable_failed');
  }

  /**
   * Publish a localized status message to the page banner.
   *
   * @param context - Context used to resolve the localized string.
   * @param message - Message resource to display.
   * @param isError - Whether the message describes an error.
   */
  private setMessage(context: common.Context, message: Resource, isError: boolean): void {
    // Resolve the localized text synchronously so the banner updates immediately.
    this.message = context.resourceManager.getStringSync(message.id);
    // Remember the severity so the UI can color the banner accordingly.
    this.messageIsError = isError;
    Logger.debug('GeofenceViewModel#setMessage: banner "' + this.message + '", isError ' + isError);
  }
}
