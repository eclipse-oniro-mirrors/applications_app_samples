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
import { BusinessError } from '@kit.BasicServicesKit';
import { hiTraceMeter } from '@kit.PerformanceAnalysisKit';
import { AppConstants, AppLogger } from 'common';
import { IrFrame, TransmitResult, TransmitResultCode } from '../model/IrTypes';
import { TransmitErrorMapper } from './TransmitErrorMapper';

const SCOPE: string = 'IrTransmitter';
/** hiTraceMeter span name wrapped around one native transmit call. */
const TRANSMIT_TRACE_NAME: string = 'MeetingScene.IrTransmit';
/** Independent hiTraceMeter task id so the transmit span is easy to filter. */
const TRANSMIT_TRACE_TASK_ID: number = 4401;

/**
 * Thin synchronous wrapper over infraredEmitter.transmitInfrared. Validates the
 * waveform before reaching the system API and maps every failure to TransmitResult.
 */
export class IrTransmitter {
  /**
   * Sends one microsecond-level waveform synchronously. Empty waveforms or non-positive
   * values are rejected before reaching the system API (which ignores zeros).
   */
  static transmitPattern(frequencyHz: number, pattern: number[]): TransmitResult {
    AppLogger.info(SCOPE, `transmit enter: frequencyHz=${frequencyHz}, patternLength=${pattern.length}`);
    if (pattern.length === 0) {
      AppLogger.warn(SCOPE, 'transmit rejected: IR waveform is empty');
      return IrTransmitter.fail(TransmitResultCode.PARAM_ERROR, 'IR waveform is empty');
    }
    if (pattern.length > AppConstants.MAX_PATTERN_LENGTH) {
      AppLogger.warn(SCOPE, `transmit rejected: IR waveform length ${pattern.length} exceeds ${AppConstants.MAX_PATTERN_LENGTH}`);
      return IrTransmitter.fail(TransmitResultCode.PARAM_ERROR,
        `IR waveform length exceeds ${AppConstants.MAX_PATTERN_LENGTH}`);
    }
    for (let i: number = 0; i < pattern.length; i++) {
      const value: number = pattern[i];
      if (Number.isNaN(value) || !Number.isFinite(value) || value <= 0) {
        // The system API silently ignores zero or negative values, so reject them early.
        AppLogger.warn(SCOPE, `transmit rejected: IR waveform value at index ${i} is invalid`);
        return IrTransmitter.fail(TransmitResultCode.PARAM_ERROR,
          `IR waveform value at index ${i} is invalid`);
      }
    }

    // Fall back to the default carrier when the caller passes a non-positive frequency.
    const frequency: number = frequencyHz > 0 ? frequencyHz : AppConstants.DEFAULT_FREQUENCY_HZ;
    const startedAt: number = Date.now();
    hiTraceMeter.startTrace(TRANSMIT_TRACE_NAME, TRANSMIT_TRACE_TASK_ID); // Open the MeetingScene.IrTransmit span around the native transmit call.
    let result: TransmitResult = new TransmitResult();
    try {
      AppLogger.info(SCOPE, `transmit call begin: frequencyHz=${frequency}, patternLength=${pattern.length}`);
      infraredEmitter.transmitInfrared(frequency, pattern); // Hand the waveform to the system infrared emitter API.
      result.code = TransmitResultCode.OK;
      result.durationMs = Date.now() - startedAt;
      result.message = TransmitErrorMapper.toUserText(TransmitResultCode.OK);
      AppLogger.info(SCOPE, `transmit call success: frequencyHz=${frequency}, durationMs=${result.durationMs}`);
    } catch (error) {
      const bizError: BusinessError = error as BusinessError;
      const code: TransmitResultCode = TransmitErrorMapper.fromError(bizError);
      result.code = code;
      result.durationMs = Date.now() - startedAt;
      result.message = TransmitErrorMapper.toUserText(code);
      AppLogger.error(SCOPE, `transmit call failed: frequencyHz=${frequency}, resultCode=${code}, bizErrorCode=${bizError.code}, durationMs=${result.durationMs}`);
    } finally {
      hiTraceMeter.finishTrace(TRANSMIT_TRACE_NAME, TRANSMIT_TRACE_TASK_ID);
    }
    return result;
  }

  /** IrFrame carries no frequency; send at the default 38 kHz. */
  static transmitFrame(frame: IrFrame): TransmitResult {
    return IrTransmitter.transmitPattern(AppConstants.DEFAULT_FREQUENCY_HZ, frame.pattern);
  }

  /** Builds a failed TransmitResult with zero duration. */
  private static fail(code: TransmitResultCode, message: string): TransmitResult {
    const result: TransmitResult = new TransmitResult();
    result.code = code;
    result.durationMs = 0;
    result.message = message;
    return result;
  }
}
