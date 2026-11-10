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

import { AppConstants, AppLogger } from 'common';
import { hiTraceMeter } from '@kit.PerformanceAnalysisKit';
import {
  Device,
  RoomKey,
  Scene,
  SceneStep,
  SceneValidation
} from '../model/RoomTypes';
import { DeviceDao } from '../data/DeviceDao';
import { KeyDao } from '../data/KeyDao';
import { SceneDao } from '../data/SceneDao';
import { SceneStepDao } from '../data/SceneStepDao';

const SCOPE: string = 'SceneValidator';
/** hiTraceMeter span name for one scene validation run (db reads + rules). */
const SCENE_VALIDATE_TRACE_NAME: string = 'MeetingScene.SceneValidate';
/** Independent hiTraceMeter task id so the validation span is easy to filter. */
const SCENE_VALIDATE_TRACE_TASK_ID: number = 4605;

/**
 * Validates a scene before execution: enabled step limits and referential
 * integrity of device and key ids, and reports every broken reference.
 */
export class SceneValidator {
  /**
   * Checks enabled step count against the configured limit and verifies that
   * every enabled step references an existing device and a matching key.
   *
   * @param steps steps of the scene, in execution order
   * @param devices all devices of the room database
   * @param keys all keys of the room database
   * @returns a validation object whose valid flag summarizes the outcome
   */
  static validateSteps(steps: SceneStep[], devices: Device[],
    keys: RoomKey[]): SceneValidation {
    const result: SceneValidation = new SceneValidation();
    result.valid = true;

    if (steps.length > AppConstants.MAX_SCENE_STEPS) {
      result.tooManySteps = true;
      result.valid = false;
      result.messages.push(`Scene has more than ${AppConstants.MAX_SCENE_STEPS} steps`);
    }

    let enabledCount: number = 0;
    for (let i = 0; i < steps.length; i++) {
      const step: SceneStep = steps[i];
      if (!step.enabled) {
        continue;
      }
      enabledCount++;
      if (!SceneValidator.containsDevice(devices, step.deviceId)) {
        result.valid = false;
        if (result.missingDeviceIds.indexOf(step.deviceId) < 0) {
          result.missingDeviceIds.push(step.deviceId);
          result.messages.push(`Scene references a missing device: ${step.deviceId}`);
        }
        continue;
      }
      const key: RoomKey | undefined = SceneValidator.findKey(keys, step.keyId);
      if (key === undefined || key.deviceId !== step.deviceId) {
        result.valid = false;
        if (result.missingKeyIds.indexOf(step.keyId) < 0) {
          result.missingKeyIds.push(step.keyId);
          result.messages.push(`Scene key is invalid: ${step.keyId} (device ${step.deviceId})`);
        }
      }
    }

    if (enabledCount === 0) {
      result.valid = false;
      result.messages.push('Scene has no executable steps');
    }
    if (result.valid) {
      AppLogger.debug(SCOPE, `validateSteps ok: steps=${steps.length}, enabled=${enabledCount}`);
    } else {
      AppLogger.warn(SCOPE,
        `validateSteps invalid: problems=${result.messages.length}, missingDevices=${result.missingDeviceIds.length}, missingKeys=${result.missingKeyIds.length}`);
    }
    return result;
  }

  /**
   * Loads the scene and its dependencies from the database and validates it.
   * Wrapped in the MeetingScene.SceneValidate hiTraceMeter span.
   */
  static async validate(sceneId: string): Promise<SceneValidation> {
    AppLogger.info(SCOPE, `validate enter: sceneId=${sceneId}`);
    hiTraceMeter.startTrace(SCENE_VALIDATE_TRACE_NAME, SCENE_VALIDATE_TRACE_TASK_ID); // Open the MeetingScene.SceneValidate span for this validation.
    try {
      const scene: Scene | undefined = await SceneDao.get(sceneId);
      if (scene === undefined) {
        const missing: SceneValidation = new SceneValidation();
        missing.valid = false;
        missing.messages.push('Scene does not exist');
        AppLogger.warn(SCOPE, `validate rejected: scene does not exist, sceneId=${sceneId}`);
        return missing;
      }
      const steps: SceneStep[] = await SceneStepDao.listByScene(sceneId);
      const devices: Device[] = await DeviceDao.listAll();
      const keys: RoomKey[] = await KeyDao.listAll();
      const validation: SceneValidation =
        SceneValidator.validateSteps(steps, devices, keys);
      AppLogger.info(SCOPE, `validate done: sceneId=${sceneId}, valid=${validation.valid}`);
      return validation;
    } finally {
      hiTraceMeter.finishTrace(SCENE_VALIDATE_TRACE_NAME, SCENE_VALIDATE_TRACE_TASK_ID);
    }
  }

  /** Linear device-id lookup; small lists make a map unnecessary. */
  private static containsDevice(devices: Device[], deviceId: string): boolean {
    for (let i = 0; i < devices.length; i++) {
      if (devices[i].id === deviceId) {
        return true;
      }
    }
    return false;
  }

  /** Linear key lookup that also returns the key for device checks. */
  private static findKey(keys: RoomKey[], keyId: string): RoomKey | undefined {
    for (let i = 0; i < keys.length; i++) {
      if (keys[i].id === keyId) {
        return keys[i];
      }
    }
    return undefined;
  }
}
