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

// Global switch of the trace meter; flip it to false to silence every trace call at once.
const TRACE_ENABLED: boolean = true;
// Task id used by the plain start/finish pair, which is the cheapest way to bracket a slice.
const SYNC_TASK_ID: number = 0;
// Monotonic counter producing unique task ids for the begin/end pair of nested work.
let taskIdSeed: number = 0;

/**
 * Thin wrapper around hiTraceMeter used by every key path of the sample.
 * Naming follows '<Module>.<Method>'; each slice that is started must also be finished so the
 * captured trace file stays balanced. Only hiTraceMeter.startTrace/finishTrace are used because
 * their (name, taskId) signature is stable from API 8 upwards, while the level-aware variants
 * require API 19 and would silently change the trace output level on newer devices.
 */
export class Trace {
  /**
   * Opens a named trace slice owned by the calling thread.
   * Must be paired with finish(name) at the end of the observed block.
   * @param name Trace name, for example 'PickerScene.aboutToAppear'.
   */
  static start(name: string): void {
    // Skip the meter call entirely when tracing is switched off in this build.
    if (!TRACE_ENABLED) {
      return;
    }
    // Open the slice with the shared task id, which is enough for non-overlapping slices.
    hiTraceMeter.startTrace(name, SYNC_TASK_ID);
  }

  /**
   * Closes the trace slice opened by start(name).
   * @param name Trace name; it must be byte-identical to the value passed to start(name).
   */
  static finish(name: string): void {
    // Skip the meter call entirely when tracing is switched off in this build.
    if (!TRACE_ENABLED) {
      return;
    }
    // Close the slice with the same name and task id used when it was opened.
    hiTraceMeter.finishTrace(name, SYNC_TASK_ID);
  }

  /**
   * Allocates a new unique task id for a begin/end pair.
   * @returns Strictly increasing positive task id.
   */
  static nextTaskId(): number {
    // Advance the module wide seed before handing the value out so no id is reused.
    taskIdSeed = taskIdSeed + 1;
    // Hand the freshly allocated id back to the caller.
    return taskIdSeed;
  }

  /**
   * Opens a trace slice with its own task id, used when several slices with the same name
   * may overlap, for example two concurrent image exports.
   * Must be paired with end(name, taskId).
   * @param name Trace name, for example 'ImageEditEngine.process'.
   * @returns Task id that has to be passed back to end().
   */
  static begin(name: string): number {
    // Allocate the id first so the caller always receives a usable value.
    const taskId: number = Trace.nextTaskId();
    // Skip the meter call but still return a valid id so end() stays symmetric.
    if (!TRACE_ENABLED) {
      return taskId;
    }
    // Open the slice with the unique id.
    hiTraceMeter.startTrace(name, taskId);
    // Hand the id back to the caller for the matching end call.
    return taskId;
  }

  /**
   * Closes the trace slice opened by begin(name).
   * @param name Trace name, identical to the value passed to begin(name).
   * @param taskId Task id returned by begin(name).
   */
  static end(name: string, taskId: number): void {
    // Skip the meter call entirely when tracing is switched off in this build.
    if (!TRACE_ENABLED) {
      return;
    }
    // Close the slice with the id produced by begin().
    hiTraceMeter.finishTrace(name, taskId);
  }

  /**
   * Runs a synchronous action inside a trace slice.
   * The slice is always finished, even when the action throws.
   * @param name Trace name, for example 'SandboxStore.count'.
   * @param action Synchronous work to observe.
   * @returns Value produced by the action.
   */
  static withSync<T>(name: string, action: () => T): T {
    // Fast path: tracing disabled means the action runs with zero meter overhead.
    if (!TRACE_ENABLED) {
      return action();
    }
    // Open the slice before entering user code.
    Trace.start(name);
    try {
      // Execute the observed work and keep its result.
      return action();
    } finally {
      // Always close the slice so the trace file stays balanced on both paths.
      Trace.finish(name);
    }
  }

  /**
   * Runs an asynchronous action inside a trace slice.
   * The slice is always finished, even when the returned promise rejects.
   * @param name Trace name, for example 'PhotoAccessFeature.queryByUris'.
   * @param action Asynchronous work to observe.
   * @returns Promise resolved with the value produced by the action.
   */
  static withAsync<T>(name: string, action: () => Promise<T>): Promise<T> {
    // Fast path: tracing disabled means the action runs with zero meter overhead.
    if (!TRACE_ENABLED) {
      return action();
    }
    // Open the slice before entering user code.
    Trace.start(name);
    // Start the observed asynchronous work; the promise is awaited inside the guard below.
    const running: Promise<T> = action();
    // Delegate to the guarded helper so the slice is closed on success and on rejection.
    return Trace.runGuarded(name, running);
  }

  /**
   * Awaits the given promise and closes the trace slice in a finally block.
   * Extracted on purpose: an explicit finally is the only balanced way to pair start and finish.
   * @param name Trace name that was already started by the caller.
   * @param running Promise of the observed work.
   * @returns Promise that resolves or rejects exactly like the input promise.
   */
  private static async runGuarded<T>(name: string, running: Promise<T>): Promise<T> {
    // Await the work inside a try block so the finally below always closes the slice.
    try {
      // Await the original promise and keep its resolved value.
      const value: T = await running;
      // Propagate the resolved value unchanged to the caller.
      return value;
    } finally {
      // Always close the slice, on success as well as on rejection.
      Trace.finish(name);
    }
  }
}
