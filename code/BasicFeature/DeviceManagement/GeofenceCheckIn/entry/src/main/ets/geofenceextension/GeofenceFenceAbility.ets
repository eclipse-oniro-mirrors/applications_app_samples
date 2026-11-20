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

import { FenceExtensionAbility, geoLocationManager } from '@kit.LocationKit';
import { hiTraceMeter } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { CheckInResult, CheckInService, Logger } from 'library';

// Module-level counter that produces a unique task id for every trace span.
let traceTaskIdCounter: number = 0;

/**
 * Fence extension ability that receives geofence transition callbacks.
 *
 * It runs without any visible UI and forwards every enter or exit
 * transition to the shared check-in service so records are kept even
 * while the application itself is not visible.
 */
export default class GeofenceFenceAbility extends FenceExtensionAbility {
  /**
   * Called by the system when the device enters or exits a registered fence.
   *
   * @param transition - Transition descriptor carrying the fence id and event.
   * @param additions - Extra key-value data attached to the transition.
   */
  onFenceStatusChange(transition: geoLocationManager.GeofenceTransition, additions: Record<string, string>): void {
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('GeofenceFenceAbility#onFenceStatusChange', taskId);
    try {
      // Log the incoming transition so background fence events stay traceable.
      Logger.info('GeofenceFenceAbility#onFenceStatusChange: transition received, fenceId ' + transition.geofenceId +
        ', event: ' + transition.transitionEvent);
      // Forward the transition to the shared service and report the outcome.
      CheckInService.handleTransition(this.context, transition)
        .then((result: CheckInResult) => {
          Logger.info('GeofenceFenceAbility#onFenceStatusChange: transition handled, action ' + result.action +
            ', changed: ' + result.changed);
        })
        .catch((error: BusinessError) => {
          Logger.error('GeofenceFenceAbility#onFenceStatusChange: handle transition failed: ' + error.code +
            ', ' + error.message);
        });
    } finally {
      hiTraceMeter.finishTrace('GeofenceFenceAbility#onFenceStatusChange', taskId);
    }
  }

  /**
   * Called when the fence extension ability is destroyed.
   */
  onDestroy(): void {
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('GeofenceFenceAbility#onDestroy', taskId);
    try {
      // Record the teardown moment for lifecycle diagnostics.
      Logger.info('GeofenceFenceAbility#onDestroy: fence extension destroyed');
    } finally {
      hiTraceMeter.finishTrace('GeofenceFenceAbility#onDestroy', taskId);
    }
  }
}
