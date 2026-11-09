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

// Import hiTraceMeter so synchronous performance trace marks can be emitted to the system.
import { hiTraceMeter } from '@kit.PerformanceAnalysisKit';
// Import the in-house logger so every trace transition is mirrored into the log channel.
import { Logger } from './Logger';

// The module tag used for every log line emitted by this utility.
const TAG: string = 'Trace';
// The upper bound applied to generated task ids, keeping them small and readable in traces.
const MAX_TASK_ID: number = 999;

// A thin facade over hiTraceMeter that pairs start/finish marks with human readable log lines.
export class TraceUtil {
  // The monotonically increasing counter used to allocate unique task ids.
  private static seq: number = 0;

  // Begins a named trace section and returns the task id needed to finish it later.
  static begin(name: string): number {
    // Allocate the next unique task id for this section.
    TraceUtil.seq = TraceUtil.seq + 1;
    // Wrap the counter back into the small id range to keep trace output tidy.
    const taskId: number = TraceUtil.seq % MAX_TASK_ID;
    try {
      // Emit the system level synchronous trace start mark visible in DevEco Profiler.
      hiTraceMeter.startTrace(name, taskId);
    } catch (error) {
      // Trace failures must never break business flow, so only the log channel reports it.
      Logger.warn(TAG, 'hiTraceMeter.startTrace failed for ' + name);
    }
    // Mirror the section start into the log channel for quick terminal inspection.
    Logger.debug(TAG, '>>> ' + name + ' begin (taskId=' + taskId.toString() + ')');
    // Return the id so the caller can pair the finish call correctly.
    return taskId;
  }

  // Ends a trace section previously started with begin() using its returned task id.
  static end(name: string, taskId: number): void {
    try {
      // Emit the matching system level trace finish mark.
      hiTraceMeter.finishTrace(name, taskId);
    } catch (error) {
      // Swallow trace failures and surface them only through the log channel.
      Logger.warn(TAG, 'hiTraceMeter.finishTrace failed for ' + name);
    }
    // Mirror the section end into the log channel.
    Logger.debug(TAG, '<<< ' + name + ' end (taskId=' + taskId.toString() + ')');
  }

  // Runs the given synchronous section between begin/end marks and returns its result.
  static section<T>(name: string, body: () => T): T {
    // Start the trace section and remember the task id.
    const taskId: number = TraceUtil.begin(name);
    try {
      // Execute the wrapped body so its cost lands inside the trace section.
      return body();
    } finally {
      // Always finish the section, even when the body throws.
      TraceUtil.end(name, taskId);
    }
  }

  // Runs an async section: starts marks before the promise and finishes when it settles.
  static asyncSection<T>(name: string, body: () => Promise<T>): Promise<T> {
    // Start the trace section and remember the task id.
    const taskId: number = TraceUtil.begin(name);
    // Run the async body and attach settle handlers that close the trace.
    return body().then((result: T) => {
      // Close the section on the success path.
      TraceUtil.end(name, taskId);
      // Forward the original result untouched.
      return result;
    }).catch((error: Error) => {
      // Close the section on the failure path too.
      TraceUtil.end(name, taskId);
      // Re-throw so business error handling stays intact.
      throw error;
    });
  }

  // Emits a value mark (for example queue depth or progress) into the current trace.
  static value(name: string, taskId: number, value: number): void {
    try {
      // Emit the numeric counter into the trace timeline using the two-argument overload.
      hiTraceMeter.traceByValue(name, value);
    } catch (error) {
      // Swallow trace failures and surface them only through the log channel.
      Logger.warn(TAG, 'hiTraceMeter.traceByValue failed for ' + name);
    }
    // Mirror the value into the log channel so it is visible without a profiler attached.
    Logger.debug(TAG, name + ' value=' + value.toString() + ' (taskId=' + taskId.toString() + ')');
  }

  // Logs a single key-path checkpoint line without touching the system trace timeline.
  static point(tag: string, detail: string): void {
    // Compose the checkpoint line with a marker prefix so it stands out in log filters.
    Logger.info(tag, '[checkpoint] ' + detail);
  }
}
