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

import { hiTraceMeter } from '@kit.PerformanceAnalysisKit';
import { AppConstants, AppLogger } from 'common';
import {
  SendFrame,
  SendJob,
  SendProgress,
  SendState,
  SendStep,
  SendTicket,
  TransmitResult,
  TransmitResultCode
} from '../model/IrTypes';
import { IrTransmitter } from './IrTransmitter';

/** Progress listener signature used by send job observers. */
type ProgressListener = (ticketId: string, progress: SendProgress) => void;

const SCOPE: string = 'IrSendQueue';
/** hiTraceMeter span name covering one send task from dequeue to completion. */
const SEND_TASK_TRACE_NAME: string = 'MeetingScene.IrSendTask';
/** Independent hiTraceMeter task id so the send task span is easy to filter. */
const SEND_TASK_TRACE_TASK_ID: number = 4301;
/** Polling interval in milliseconds used by waitIdle(). */
const WAIT_IDLE_POLL_MS: number = 10;

/**
 * Strictly serial in-process send queue. Only one job runs at a time and new
 * jobs are rejected with BUSY instead of being queued, so two transmissions
 * can never interfere with each other.
 */
export class IrSendQueue {
  // Singleton instance of the queue.
  private static instance: IrSendQueue | undefined = undefined;

  // True while a job is executing.
  private busy: boolean = false;
  // Monotonic counter used to build unique ticket ids.
  private sequence: number = 0;
  // Ticket id of the currently running job, empty when idle.
  private currentTicketId: string = '';
  // Set by cancel() and consumed at step boundaries.
  private cancelRequested: boolean = false;
  // Progress listeners notified at every state change.
  private listeners: ProgressListener[] = [];

  /** Returns the process-wide queue instance. */
  static getInstance(): IrSendQueue {
    if (IrSendQueue.instance === undefined) {
      IrSendQueue.instance = new IrSendQueue();
    }
    return IrSendQueue.instance;
  }

  /**
   * Strict in-process serialization: reject new tasks while busy, never queue.
   * On acceptance the job runs asynchronously and progress is reported via listeners.
   */
  enqueue(job: SendJob): SendTicket {
    const ticket: SendTicket = new SendTicket();
    if (this.busy) {
      // Busy rejection keeps the queue strictly serial.
      ticket.accepted = false;
      ticket.reason = 'BUSY';
      AppLogger.warn(SCOPE, `enqueue rejected: queue busy, currentTicketId=${this.currentTicketId}`);
      return ticket;
    }

    this.sequence++;
    const ticketId: string = `job-${Date.now()}-${this.sequence}`;
    job.ticketId = ticketId;
    this.busy = true;
    this.currentTicketId = ticketId;
    this.cancelRequested = false;

    ticket.accepted = true;
    ticket.ticketId = ticketId;
    AppLogger.info(SCOPE, `enqueue accepted: ticketId=${ticketId}, totalSteps=${job.steps.length}, source=${job.source}`);

    // Fire-and-forget execution; an unexpected crash here must release the busy flag.
    const execution: Promise<void> = this.run(job, ticketId);
    execution.catch((error: Error) => {
      AppLogger.error(SCOPE, `Job aborted unexpectedly: ${error.message}`);
      this.busy = false;
      this.currentTicketId = '';
    });
    return ticket;
  }

  /** Applies to the current job only; stops at step boundaries without affecting sent frames. */
  cancel(ticketId: string): void {
    if (this.currentTicketId === ticketId && ticketId.length > 0) {
      this.cancelRequested = true;
      AppLogger.info(SCOPE, `cancel requested: ticketId=${ticketId}`);
    }
  }

  /** Whether a job is currently executing. */
  isBusy(): boolean {
    return this.busy;
  }

  /** Registers a progress listener; the same listener registered twice fires twice. */
  onProgress(listener: ProgressListener): void {
    this.listeners.push(listener);
  }

  /** Removes a previously registered progress listener. */
  offProgress(listener: ProgressListener): void {
    const index: number = this.listeners.indexOf(listener);
    if (index >= 0) {
      this.listeners.splice(index, 1);
    }
  }

  /** Used by tests and shutdown. */
  async waitIdle(): Promise<void> {
    // Poll every 10 ms; good enough for tests and shutdown, upgrade to a completion callback if low latency is needed.
    while (this.busy) {
      await IrSendQueue.delay(WAIT_IDLE_POLL_MS);
    }
  }

  /** Runs one job end to end: dequeue log, per-step frames, progress events and cleanup. */
  private async run(job: SendJob, ticketId: string): Promise<void> {
    AppLogger.info(SCOPE, `run start (dequeue): ticketId=${ticketId}, totalSteps=${job.steps.length}, sceneRunId=${job.sceneRunId}`);
    hiTraceMeter.startTrace(SEND_TASK_TRACE_NAME, SEND_TASK_TRACE_TASK_ID);
    try {
      // Yield once so the job is still running when enqueue returns.
      await IrSendQueue.delay(0);
      const totalSteps: number = job.steps.length;
      for (let i: number = 0; i < totalSteps; i++) {
        // Cancellation is honored only at step boundaries.
        if (this.cancelRequested) {
          AppLogger.info(SCOPE, `Job cancelled: ${ticketId}`);
          break;
        }
        const step: SendStep = job.steps[i];
        AppLogger.info(SCOPE, 'step sending: ticketId=' + ticketId + ', step=' + i.toString() +
          ', frames=' + step.frames.length.toString());
        this.notify(ticketId,
          this.buildProgress(job, step, i, totalSteps, SendState.PENDING, TransmitResultCode.UNKNOWN));
        this.notify(ticketId,
          this.buildProgress(job, step, i, totalSteps, SendState.SENDING, TransmitResultCode.UNKNOWN));

        let failed: boolean = false;
        let resultCode: TransmitResultCode = TransmitResultCode.OK;
        for (let f: number = 0; f < step.frames.length; f++) {
          const frame: SendFrame = step.frames[f];
          // Fall back to the default carrier when the frame omits its frequency.
          const frequencyHz: number =
            frame.frequencyHz > 0 ? frame.frequencyHz : AppConstants.DEFAULT_FREQUENCY_HZ;
          const transmitResult: TransmitResult =
            IrTransmitter.transmitPattern(frequencyHz, frame.pattern);
          if (transmitResult.code !== TransmitResultCode.OK) {
            // The first failing frame aborts the remaining frames of this step.
            AppLogger.warn(SCOPE, `frame transmit failed: ticketId=${ticketId}, step=${i}, frame=${f}, code=${transmitResult.code}`);
            failed = true;
            resultCode = transmitResult.code;
            break;
          }
          // Fixed pacing between frames avoids overwhelming the emitter.
          if (f < step.frames.length - 1) {
            await IrSendQueue.delay(AppConstants.FRAME_INTERVAL_MS);
          }
        }

        const finalState: SendState = failed ? SendState.FAILED : SendState.SUCCESS;
        this.notify(ticketId, this.buildProgress(job, step, i, totalSteps, finalState, resultCode));
        AppLogger.info(SCOPE, `step finished: ticketId=${ticketId}, step=${i}, state=${finalState}, code=${resultCode}`);

        if (i < totalSteps - 1) {
          // Use the step delay when valid, otherwise fall back to the default pacing.
          const gapMs: number =
            step.delayMs > 0 ? step.delayMs : AppConstants.STEP_INTERVAL_MS;
          await IrSendQueue.delay(gapMs);
        }
      }
    } catch (error) {
      const detail: string = error instanceof Error ? error.message : 'unknown error';
      AppLogger.error(SCOPE, `Job failed: ${detail}`);
    } finally {
      // Release the queue state so the next job can be accepted.
      this.busy = false;
      this.currentTicketId = '';
      this.cancelRequested = false;
      hiTraceMeter.finishTrace(SEND_TASK_TRACE_NAME, SEND_TASK_TRACE_TASK_ID);
      AppLogger.info(SCOPE, `run finished: ticketId=${ticketId}`);
    }
  }

  /** Builds a progress snapshot for one step state transition. */
  private buildProgress(job: SendJob, step: SendStep, stepIndex: number, totalSteps: number,
    state: SendState, resultCode: TransmitResultCode): SendProgress {
    const progress: SendProgress = new SendProgress();
    progress.ticketId = this.currentTicketId;
    progress.sceneRunId = job.sceneRunId;
    progress.stepIndex = stepIndex;
    progress.totalSteps = totalSteps;
    progress.deviceId = step.deviceId;
    progress.keyId = step.keyId;
    progress.state = state;
    progress.resultCode = resultCode;
    return progress;
  }

  /** Notifies listeners on a snapshot copy so mutation during delivery stays safe. */
  private notify(ticketId: string, progress: SendProgress): void {
    const snapshot: ProgressListener[] = this.listeners.slice();
    for (let i: number = 0; i < snapshot.length; i++) {
      try {
        snapshot[i](ticketId, progress);
      } catch (error) {
        const detail: string = error instanceof Error ? error.message : 'unknown error';
        AppLogger.error(SCOPE, `Progress listener threw: ${detail}`);
      }
    }
  }

  /** Promise-based delay used for pacing and polling. */
  private static delay(ms: number): Promise<void> {
    return new Promise<void>((resolve: () => void) => {
      setTimeout(() => {
        resolve();
      }, ms);
    });
  }
}
