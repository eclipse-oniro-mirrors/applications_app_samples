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

import { AppLogger } from 'common';
import {
  DeviceExpectedState,
  KeySemantic,
  PowerState,
  StateSource
} from '../model/RoomTypes';
import { ExpectedStateDao } from '../data/ExpectedStateDao';

/** First-run default level used when the device has no level yet. */
const DEFAULT_LEVEL: number = 50;
/** Lower bound of the normalized level range. */
const MIN_LEVEL: number = 0;
/** Upper bound of the normalized level range. */
const MAX_LEVEL: number = 100;
/** Level change applied per volume/temperature step. */
const LEVEL_STEP: number = 5;
const SCOPE: string = 'ExpectedStateService';
/** Sentinel level meaning the device has no level concept. */
const NO_LEVEL: number = -1;

/**
 * Derives and stores the expected power/level state of devices after scene
 * runs and manual corrections; manual states are never overwritten.
 */
export class ExpectedStateService {
  /** Advances the expected state by key semantic; manual states are never overwritten. */
  static nextState(current: DeviceExpectedState, semantic: KeySemantic,
    now: number): DeviceExpectedState {
    if (current.source === StateSource.MANUAL) {
      return current;
    }
    const next: DeviceExpectedState = new DeviceExpectedState();
    next.deviceId = current.deviceId;
    next.power = current.power;
    next.level = current.level;
    next.source = StateSource.SCENE;
    next.updatedAt = now;

    switch (semantic) {
      case KeySemantic.POWER_ON:
        next.power = PowerState.ON;
        break;
      case KeySemantic.POWER_OFF:
        next.power = PowerState.OFF;
        break;
      case KeySemantic.POWER_TOGGLE:
        next.power = current.power === PowerState.ON ? PowerState.OFF : PowerState.ON;
        break;
      case KeySemantic.VOL_UP:
      case KeySemantic.TEMP_UP:
        next.level = ExpectedStateService.adjustLevel(current.level, LEVEL_STEP);
        break;
      case KeySemantic.VOL_DOWN:
      case KeySemantic.TEMP_DOWN:
        next.level = ExpectedStateService.adjustLevel(current.level, -LEVEL_STEP);
        break;
      default:
        break;
    }
    return next;
  }

  /**
   * Records the expected state after the user pressed one key on a device.
   * Manual states are kept unchanged by nextState, so a manual correction
   * always wins over scene-derived state.
   */
  static async applyKey(deviceId: string, semantic: KeySemantic): Promise<DeviceExpectedState> {
    AppLogger.info(SCOPE, 'applyKey enter: semantic=' + semantic);
    const current: DeviceExpectedState = await ExpectedStateService.loadOrDefault(deviceId);
    const next: DeviceExpectedState =
      ExpectedStateService.nextState(current, semantic, Date.now());
    await ExpectedStateDao.upsert(next);
    AppLogger.info(SCOPE, 'applyKey done: power=' + next.power + ', level=' + next.level.toString());
    return next;
  }

  /** Overwrites the expected state as a manual user correction. */
  static async correct(deviceId: string, power: PowerState,
    level: number): Promise<DeviceExpectedState> {
    AppLogger.info(SCOPE, 'correct enter: power=' + power + ', level=' + level.toString());
    const current: DeviceExpectedState = await ExpectedStateService.loadOrDefault(deviceId);
    const next: DeviceExpectedState = new DeviceExpectedState();
    next.deviceId = deviceId;
    next.power = power;
    next.level = ExpectedStateService.normalizeLevel(level);
    next.source = StateSource.MANUAL;
    next.updatedAt = Date.now();
    await ExpectedStateDao.upsert(next);
    AppLogger.info(SCOPE, 'correct done: source=MANUAL, level=' + next.level.toString());
    return next;
  }

  /** Applies a bounded level step from the current level or a default. */
  private static adjustLevel(current: number, delta: number): number {
    const base: number = current < MIN_LEVEL ? DEFAULT_LEVEL : current;
    return Math.max(MIN_LEVEL, Math.min(MAX_LEVEL, base + delta));
  }

  /** Maps a raw user level to a bounded 0-100 level or the no-level sentinel. */
  private static normalizeLevel(level: number): number {
    if (level < MIN_LEVEL) {
      return NO_LEVEL;
    }
    return Math.min(MAX_LEVEL, Math.round(level));
  }

  /** Loads the stored state or builds the neutral first-run default. */
  private static async loadOrDefault(deviceId: string): Promise<DeviceExpectedState> {
    const existing: DeviceExpectedState | undefined = await ExpectedStateDao.get(deviceId);
    if (existing !== undefined) {
      return existing;
    }
    const state: DeviceExpectedState = new DeviceExpectedState();
    state.deviceId = deviceId;
    state.power = PowerState.UNKNOWN;
    state.level = NO_LEVEL;
    state.source = StateSource.SCENE;
    state.updatedAt = 0;
    return state;
  }
}
