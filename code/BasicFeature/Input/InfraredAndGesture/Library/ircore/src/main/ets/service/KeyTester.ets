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
import {
  IrCode,
  IrCompileResult,
  SendFrame,
  SendJob,
  SendProgress,
  SendSource,
  SendState,
  SendStep,
  TransmitResult,
  TransmitResultCode
} from '../model/IrTypes';
import { IrCapabilityProbe } from './IrCapabilityProbe';
import { IrCodeCompiler } from './IrCodeCompiler';
import { IrSendQueue } from './IrSendQueue';
import { TransmitErrorMapper } from './TransmitErrorMapper';

const SCOPE: string = 'KeyTester';

/**
 * Manual single-key test helper used by the console UI. Compiles one code,
 * checks the cached capability and sends it through the global serial queue.
 */
export class KeyTester {
  /** Single key test: compile -> capability check -> send through the global serial queue. */
  static async testCode(code: IrCode): Promise<TransmitResult> {
    AppLogger.info(SCOPE, `testCode enter: codeId=${code.id}, protocol=${code.protocol}, frequencyHz=${code.frequencyHz}`);
    const compiled: IrCompileResult = IrCodeCompiler.compile(code);
    if (!compiled.ok) {
      AppLogger.warn(SCOPE, `testCode compile failed: codeId=${code.id}, message=${compiled.message}`);
      return KeyTester.failure(TransmitResultCode.PARAM_ERROR, 0,
        compiled.message.length > 0 ?
          compiled.message : TransmitErrorMapper.toUserText(TransmitResultCode.PARAM_ERROR));
    }
    if (!IrCapabilityProbe.getCached().hasEmitter) {
      AppLogger.warn(SCOPE, `testCode blocked: device has no infrared emitter, codeId=${code.id}`);
      return KeyTester.failure(TransmitResultCode.NO_EMITTER, 0,
        TransmitErrorMapper.toUserText(TransmitResultCode.NO_EMITTER));
    }

    // Fall back to the default carrier when the code omits its frequency.
    const frequencyHz: number =
      code.frequencyHz > 0 ? code.frequencyHz : AppConstants.DEFAULT_FREQUENCY_HZ;
    const job: SendJob = new SendJob();
    job.source = SendSource.MANUAL;
    const step: SendStep = new SendStep();
    step.index = 0;
    // Every compiled frame becomes one SendFrame at the resolved carrier frequency.
    for (let i: number = 0; i < compiled.frames.length; i++) {
      const frame: SendFrame = new SendFrame();
      frame.frequencyHz = frequencyHz;
      frame.pattern = compiled.frames[i].pattern;
      step.frames.push(frame);
    }
    job.steps.push(step);

    const queue: IrSendQueue = IrSendQueue.getInstance();
    let state: SendState = SendState.PENDING;
    let resultCode: TransmitResultCode = TransmitResultCode.UNKNOWN;
    const listener: (ticketId: string, progress: SendProgress) => void =
      (_ticketId: string, progress: SendProgress): void => {
        // Track the latest state so the final result can be read after waitIdle().
        state = progress.state;
        resultCode = progress.resultCode;
      };
    queue.offProgress(listener);
    queue.onProgress(listener);
    const startedAt: number = Date.now();
    const accepted: boolean = queue.enqueue(job).accepted;
    if (!accepted) {
      queue.offProgress(listener);
      AppLogger.warn(SCOPE, `testCode rejected: send queue busy, codeId=${code.id}`);
      return KeyTester.failure(TransmitResultCode.BUSY, 0,
        TransmitErrorMapper.toUserText(TransmitResultCode.BUSY));
    }
    // Wait until the queue drains so the caller receives one final result.
    await queue.waitIdle();
    queue.offProgress(listener);

    const success: boolean = KeyTester.isSuccess(state);
    const result: TransmitResult = new TransmitResult();
    result.code = success ? TransmitResultCode.OK : resultCode;
    result.durationMs = Date.now() - startedAt;
    result.message = TransmitErrorMapper.toUserText(result.code);
    AppLogger.info(SCOPE, `testCode finished: codeId=${code.id}, code=${result.code}, durationMs=${result.durationMs}`);
    return result;
  }

  /** True only when the final step state is SUCCESS. */
  private static isSuccess(state: SendState): boolean {
    return state === SendState.SUCCESS;
  }

  /** Builds a failed TransmitResult. */
  private static failure(code: TransmitResultCode, durationMs: number,
    message: string): TransmitResult {
    const result: TransmitResult = new TransmitResult();
    result.code = code;
    result.durationMs = durationMs;
    result.message = message;
    return result;
  }
}
