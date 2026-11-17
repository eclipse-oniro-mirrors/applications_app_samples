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

import { infraredEmitter } from '@kit.InputKit';
import { hiTraceMeter } from '@kit.PerformanceAnalysisKit';
import { AppConstants, AppLogger } from 'common';
import { IrCapability } from '../model/IrTypes';

const SCOPE: string = 'IrCapabilityProbe';
/** hiTraceMeter span name for one capability probe. */
const PROBE_TRACE_NAME: string = 'MeetingScene.IrProbe';
/** Independent hiTraceMeter task id so the probe span is easy to filter. */
const PROBE_TRACE_TASK_ID: number = 4501;

/**
 * Probes and caches the device infrared emission capability once. The cached
 * result decides whether the whole UI can send IR frames.
 */
export class IrCapabilityProbe {
  // Last probe result, initialized to a safe read-only default.
  private static cached: IrCapability = IrCapabilityProbe.safeDefault('Infrared emission capability has not been probed yet');

  /**
   * Combines hasIrEmitter() and getInfraredFrequencies() into the device capability.
   * Any error or an all-zero frequency range is treated as non-emissive to avoid false sends.
   */
  static async probe(): Promise<IrCapability> {
    AppLogger.info(SCOPE, 'probe enter: querying infrared emitter capability');
    hiTraceMeter.startTrace(PROBE_TRACE_NAME, PROBE_TRACE_TASK_ID);
    try {
      const hasEmitter: boolean = await infraredEmitter.hasIrEmitter();
      if (!hasEmitter) {
        AppLogger.warn(SCOPE, 'probe result: device has no infrared emitter');
        IrCapabilityProbe.cached = IrCapabilityProbe.safeDefault('This device cannot emit infrared');
        return IrCapabilityProbe.cached;
      }

      const ranges: infraredEmitter.InfraredFrequency[] = infraredEmitter.getInfraredFrequencies();
      // Aggregate all supported ranges into one min/max frequency envelope.
      let minHz: number = 0;
      let maxHz: number = 0;
      let supportsDefault: boolean = false;
      let hasValidRange: boolean = false;
      for (let i: number = 0; i < ranges.length; i++) {
        const range: infraredEmitter.InfraredFrequency = ranges[i];
        // Skip malformed ranges instead of failing the whole probe.
        if (range.min <= 0 || range.max <= 0) {
          continue;
        }
        hasValidRange = true;
        if (minHz === 0 || range.min < minHz) {
          minHz = range.min;
        }
        if (range.max > maxHz) {
          maxHz = range.max;
        }
        if (range.min <= AppConstants.DEFAULT_FREQUENCY_HZ &&
          AppConstants.DEFAULT_FREQUENCY_HZ <= range.max) {
          supportsDefault = true;
        }
      }

      if (!hasValidRange) {
        AppLogger.warn(SCOPE, 'probe result: no valid infrared frequency range found');
        IrCapabilityProbe.cached =
          IrCapabilityProbe.safeDefault('No valid infrared frequency range found; the device may not support emission');
        return IrCapabilityProbe.cached;
      }

      const capability: IrCapability = new IrCapability();
      capability.hasEmitter = true;
      capability.minFrequencyHz = minHz;
      capability.maxFrequencyHz = maxHz;
      capability.supportsDefaultFrequency = supportsDefault;
      capability.readOnly = false;
      capability.reason = '';
      IrCapabilityProbe.cached = capability;
      AppLogger.info(SCOPE, `probe success: minHz=${minHz}, maxHz=${maxHz}, supportsDefault=${supportsDefault}`);
      return capability;
    } catch (error) {
      const detail: string = error instanceof Error ? error.message : 'unknown error';
      AppLogger.error(SCOPE, `probe failed: ${detail}`);
      IrCapabilityProbe.cached = IrCapabilityProbe.safeDefault(`Infrared capability probe failed: ${detail}`);
      return IrCapabilityProbe.cached;
    } finally {
      hiTraceMeter.finishTrace(PROBE_TRACE_NAME, PROBE_TRACE_TASK_ID);
    }
  }

  /** Returns a safe readOnly=true default before probing. */
  static getCached(): IrCapability {
    return IrCapabilityProbe.cached;
  }

  /** Test-only helper that replaces the cached capability result. */
  static setCachedForTest(capability: IrCapability): void {
    IrCapabilityProbe.cached = capability;
  }

  /** Builds the read-only safe capability used whenever emission is unavailable. */
  private static safeDefault(reason: string): IrCapability {
    const capability: IrCapability = new IrCapability();
    capability.hasEmitter = false;
    capability.minFrequencyHz = 0;
    capability.maxFrequencyHz = 0;
    capability.supportsDefaultFrequency = false;
    capability.readOnly = true;
    capability.reason = reason;
    return capability;
  }
}
