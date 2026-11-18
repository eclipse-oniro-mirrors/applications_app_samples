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
  FenceTransitionAction
} from '../model/GeofenceTypes';
import { formatDuration, formatTime } from '../utils/TimeUtil';
import { Logger } from '../utils/Logger';
import { NotificationService } from './NotificationService';
import { RecordStore } from './RecordStore';

// Module-level counter that produces a unique task id for every trace span.
let traceTaskIdCounter: number = 0;

/**
 * Check-in flow handler that turns fence transitions into records and notifications.
 * It also offers a simulate entry used by the demo buttons on the UI.
 */
export class CheckInService {
  /**
   * Handle one fence transition by writing the record and publishing the notification.
   * @param context application context used by the store and notification services
   * @param transition transition reported by the fence service or the simulator
   * @returns the check-in result describing what changed
   */
  static async handleTransition(context: common.Context,
    transition: geoLocationManager.GeofenceTransition): Promise<CheckInResult> {
    // Open a trace span for the whole check-in flow of this transition.
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('CheckInService#handleTransition', taskId);
    try {
      // Map the raw system event onto the internal action enum.
      const action: FenceTransitionAction = CheckInService.resolveAction(transition.transitionEvent);
      // Use one timestamp for the record and the result so they stay consistent.
      const timestamp: number = Date.now();
      // Report the incoming transition for later diagnosis.
      Logger.info('CheckInService#handleTransition: action=' + action + ', fenceId=' + transition.geofenceId);
      try {
        // Enter events start a new open check-in record and publish the enter notification.
        if (action === FenceTransitionAction.ENTER) {
          const record: CheckInRecord | undefined = await RecordStore.handleEnter(context, timestamp);
          // Publish the enter notification only when a new record was created.
          if (record !== undefined) {
            await NotificationService.publishEnter(context, formatTime(timestamp));
          }
          // Report the enter outcome to the caller.
          return {
            changed: record !== undefined,
            action: action,
            record: record,
            timestamp: timestamp
          };
        }
        // Exit events close the open record and publish the exit notification.
        if (action === FenceTransitionAction.EXIT) {
          const record: CheckInRecord | undefined = await RecordStore.handleExit(context, timestamp);
          // Publish the exit notification only when a record was closed.
          if (record !== undefined) {
            await NotificationService.publishExit(context, formatDuration(record.durationMs));
          }
          // Report the exit outcome to the caller.
          return {
            changed: record !== undefined,
            action: action,
            record: record,
            timestamp: timestamp
          };
        }
      } catch (error) {
        // Swallow storage or notification failures and fall through to the unchanged result.
        const err: BusinessError = error as BusinessError;
        Logger.error('CheckInService#handleTransition failed: ' + err.code + ', ' + err.message);
      }
      // Unrecognized events and failures both end with an unchanged result.
      return {
        changed: false,
        action: FenceTransitionAction.NONE,
        record: undefined,
        timestamp: timestamp
      };
    } finally {
      // Close the trace span whatever the transition outcome is.
      hiTraceMeter.finishTrace('CheckInService#handleTransition', taskId);
    }
  }

  /**
   * Simulate a fence transition so the demo buttons can run the check-in flow.
   * @param context application context used by the transition handler
   * @param action enter or exit action to simulate
   * @param fenceId id reported inside the simulated transition
   * @returns the check-in result produced by the simulated transition
   */
  static async simulate(context: common.Context, action: FenceTransitionAction,
    fenceId: number): Promise<CheckInResult> {
    // Open a trace span for the simulated check-in flow.
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('CheckInService#simulate', taskId);
    try {
      // Translate the action enum into the matching system event type.
      const transitionEvent: geoLocationManager.GeofenceTransitionEvent =
        action === FenceTransitionAction.ENTER ?
          geoLocationManager.GeofenceTransitionEvent.GEOFENCE_TRANSITION_EVENT_ENTER :
          geoLocationManager.GeofenceTransitionEvent.GEOFENCE_TRANSITION_EVENT_EXIT;
      // Build the transition object as if the system reported it.
      const transition: geoLocationManager.GeofenceTransition = {
        geofenceId: fenceId,
        transitionEvent: transitionEvent
      };
      // Report the simulated transition for later diagnosis.
      Logger.info('CheckInService#simulate: action=' + action + ', fenceId=' + fenceId);
      // Run the shared transition handler so the simulated flow matches the real one.
      return await CheckInService.handleTransition(context, transition);
    } finally {
      // Close the trace span whatever the simulation outcome is.
      hiTraceMeter.finishTrace('CheckInService#simulate', taskId);
    }
  }

  /**
   * Map a raw fence transition event onto the internal action enum.
   * @param event event value reported by the fence service
   * @returns the matching enter, exit or none action
   */
  private static resolveAction(event: geoLocationManager.GeofenceTransitionEvent): FenceTransitionAction {
    // Enter events map onto the enter action.
    if (event === geoLocationManager.GeofenceTransitionEvent.GEOFENCE_TRANSITION_EVENT_ENTER) {
      return FenceTransitionAction.ENTER;
    }
    // Exit events map onto the exit action.
    if (event === geoLocationManager.GeofenceTransitionEvent.GEOFENCE_TRANSITION_EVENT_EXIT) {
      return FenceTransitionAction.EXIT;
    }
    // Every other event falls back to none.
    return FenceTransitionAction.NONE;
  }
}
