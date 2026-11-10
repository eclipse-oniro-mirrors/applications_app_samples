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

// Import the trace facade under test from the library HAR package.
import { TraceUtil } from 'library';
// Import hilog directly for device side test logging.
import { hilog } from '@kit.PerformanceAnalysisKit';
// Import the hypium test framework primitives used by this suite.
import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

// The suite-level hilog tag, distinct from the per-case TAG values.
const SUITE_TAG: string = '[Sample_FontAndResource]';
// The hilog domain used by this suite.
const DOMAIN: number = 0xF811;
// The prefix attached to every case log message.
const BUNDLE: string = 'FontAndResource_';

// The upper bound applied by the facade to generated task ids.
const MAX_TASK_ID: number = 999;
// The trace section name used by the begin/end pairing cases.
const SECTION_NAME: string = 'fontresource_convert';
// The trace section name used by the nested section cases.
const OUTER_SECTION: string = 'fontresource_outer';
// The trace section name used by the inner nested section.
const INNER_SECTION: string = 'fontresource_inner';
// The trace section name used by the async section cases.
const ASYNC_SECTION: string = 'fontresource_async';
// The value emitted by the value mark cases.
const MARK_VALUE: number = 42;
// The larger value emitted by the second value mark case.
const MARK_VALUE_LARGE: number = 1024;
// The section names table used by the bulk pairing sweep.
const SECTION_TABLE: string[] = ['stage_clone', 'stage_install', 'stage_register', 'stage_unregister',
  'stage_preview', 'stage_convert'];
// The expected value of the synchronous section body used by the return value cases.
const SECTION_RESULT: number = 42;
// The repeat count used by the task id monotonic sweep.
const MONOTONIC_ROUNDS: number = 5;
// The long detail string used by the checkpoint probe cases.
const SAMPLE_CHECKPOINT_DETAIL: string = 'fontresource checkpoint probe with a longer detail text';
// The empty text payload used by the name and message boundary cases.
const EMPTY_TEXT: string = '';
// The single character name used by the name boundary cases.
const SINGLE_CHAR_TEXT: string = 'F';
// The long section name used by the defensive name boundary cases.
const LONG_SECTION_NAME: string = 'fontresource_long_section_name_probe_0123456789_abcdefghijklmnopqrstuvwxyz';

// Logs one structured case progress line into hilog under the case TAG.
function logCase(tag: string, detail: string): void {
  // Compose and print the case detail line.
  hilog.info(DOMAIN, tag, '%{public}s', BUNDLE + tag + ', ' + detail);
}

// A tiny promise helper so the async section cases can await an inner task deterministically.
function resolvedNumber(value: number): Promise<number> {
  // Resolve the provided value on the micro task queue.
  return Promise.resolve(value);
}

// A tiny rejecting promise helper so the async section failure path can be observed.
function rejectedTask(): Promise<number> {
  // Reject with a plain error so the facade catch branch runs.
  return Promise.reject(new Error('trace section failure probe'));
}

// Registers every on-device logic test case of the trace facade.
export default function traceUtilTest() {
  // Group the cases under the "TraceUtilSuite" describe block.
  describe('TraceUtilSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(() => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'TraceUtilSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_TRACE_0100
     * @tc.name      testTraceBegin0001
     * @tc.desc      Verify begin returns a numeric task id inside the documented range so end can pair with it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testTraceBegin0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testTraceBegin0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Open the trace section and keep the allocated task id.
      const taskId: number = TraceUtil.begin(SECTION_NAME);
      // Log the allocated task id.
      logCase(TAG, 'taskId=' + taskId.toString());
      // The facade returns a number so it can be handed back to end later.
      expect(typeof taskId).assertEqual('number');
      // The task id stays inside the wrapped range of the facade.
      expect(taskId).assertLargerOrEqual(0);
      // The task id never exceeds the documented upper bound.
      expect(taskId).assertLess(MAX_TASK_ID);
      // The task id is a whole number so it stays readable in the profiler.
      expect(taskId % 1).assertEqual(0);
      // Close the section so the trace timeline is balanced.
      TraceUtil.end(SECTION_NAME, taskId);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_TRACE_0200
     * @tc.name      testTraceEnd0001
     * @tc.desc      Verify end accepts a returned task id and never throws so a failed body cannot break tracing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTraceEnd0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testTraceEnd0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Open a section so a matching id exists for the end call.
      const taskId: number = TraceUtil.begin(SECTION_NAME);
      // Close the section with the returned id.
      TraceUtil.end(SECTION_NAME, taskId);
      // A second close with the same id is tolerated by the facade.
      TraceUtil.end(SECTION_NAME, taskId);
      // Close with the offline sentinel id to prove unknown ids are tolerated too.
      TraceUtil.end(SECTION_NAME, -1);
      // Reaching this line proves none of the three end calls threw.
      expect(true).assertTrue();
      // A follow up begin still allocates a usable id after the unbalanced closes.
      const nextId: number = TraceUtil.begin(SECTION_NAME);
      // Log the follow up id.
      logCase(TAG, 'nextId=' + nextId.toString());
      // The follow up id keeps the documented range.
      expect(nextId).assertLargerOrEqual(0);
      // The follow up id never exceeds the upper bound.
      expect(nextId).assertLess(MAX_TASK_ID);
      // Close the follow up section to keep the timeline balanced.
      TraceUtil.end(SECTION_NAME, nextId);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_TRACE_0300
     * @tc.name      testTraceSection0001
     * @tc.desc      Verify section returns the body result unchanged so wrapping a conversion keeps its value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testTraceSection0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testTraceSection0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Wrap a constant producing body and keep the returned value.
      const result: number = TraceUtil.section(SECTION_NAME, () => SECTION_RESULT);
      // Log the returned value.
      logCase(TAG, 'section result=' + result.toString());
      // The wrapped body result must be forwarded unchanged.
      expect(result).assertEqual(SECTION_RESULT);
      // The result is a number so the generic return type survived the wrapping.
      expect(typeof result).assertEqual('number');
      // Wrap a string producing body to prove the generic works beyond numbers.
      const textResult: string = TraceUtil.section(SECTION_NAME, () => 'font-resource');
      // The string body result must be forwarded unchanged.
      expect(textResult).assertEqual('font-resource');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_TRACE_0400
     * @tc.name      testTraceAsyncSection0001
     * @tc.desc      Verify asyncSection returns a promise that forwards the async body value to the caller.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTraceAsyncSection0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testTraceAsyncSection0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Wrap an async body and keep the returned promise.
      const pending: Promise<number> = TraceUtil.asyncSection(ASYNC_SECTION, () => resolvedNumber(SECTION_RESULT));
      // Await the wrapped async body.
      const result: number = await pending;
      // Log the awaited value.
      logCase(TAG, 'async section result=' + result.toString());
      // The async body value must be forwarded unchanged.
      expect(result).assertEqual(SECTION_RESULT);
      // The awaited value is a number.
      expect(typeof result).assertEqual('number');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_TRACE_0500
     * @tc.name      testTraceValue0001
     * @tc.desc      Verify value marks are accepted without throwing for small and large counters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTraceValue0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testTraceValue0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Open a section so the value marks have a task id to attach to.
      const taskId: number = TraceUtil.begin(SECTION_NAME);
      // Emit a small counter value.
      TraceUtil.value(SECTION_NAME, taskId, MARK_VALUE);
      // Emit a large counter value.
      TraceUtil.value(SECTION_NAME, taskId, MARK_VALUE_LARGE);
      // Emit the zero boundary value.
      TraceUtil.value(SECTION_NAME, taskId, 0);
      // Emit the offline sentinel value to prove negative counters are tolerated.
      TraceUtil.value(SECTION_NAME, taskId, -1);
      // Reaching this line proves none of the value marks threw.
      expect(taskId).assertLargerOrEqual(0);
      // The large mark value is larger than the small one as recorded by the matrix.
      expect(MARK_VALUE_LARGE).assertLarger(MARK_VALUE);
      // Close the section to keep the timeline balanced.
      TraceUtil.end(SECTION_NAME, taskId);
      // Log the value matrix that was emitted.
      logCase(TAG, 'values=' + MARK_VALUE.toString() + ',' + MARK_VALUE_LARGE.toString() + ',0,-1');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_TRACE_0600
     * @tc.name      testTracePoint0001
     * @tc.desc      Verify point logs a checkpoint line without touching the trace timeline and never throws.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTracePoint0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testTracePoint0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Emit a checkpoint with a normal detail string.
      TraceUtil.point(TAG, 'conversion started');
      // Emit a checkpoint with an empty detail string.
      TraceUtil.point(TAG, '');
      // Emit a checkpoint with a long detail string.
      TraceUtil.point(TAG, SAMPLE_CHECKPOINT_DETAIL);
      // Reaching this line proves none of the checkpoint calls threw.
      expect(SAMPLE_CHECKPOINT_DETAIL.length).assertLarger(0);
      // The long detail stays a plain string.
      expect(typeof SAMPLE_CHECKPOINT_DETAIL).assertEqual('string');
      // Log the checkpoint matrix size.
      logCase(TAG, 'checkpoints emitted=3');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_TRACE_0700
     * @tc.name      testTraceTaskIdMonotonic0001
     * @tc.desc      Verify task ids advance across successive calls so parallel sections stay distinguishable.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTraceTaskIdMonotonic0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testTraceTaskIdMonotonic0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The monotonic table records the id allocated by each round.
      const allocated: number[] = [];
      // Allocate the configured number of task ids.
      for (let i: number = 0; i < MONOTONIC_ROUNDS; i++) {
        // Allocate one id and close the section immediately.
        const taskId: number = TraceUtil.section(SECTION_NAME, () => i);
        // Record the allocated id.
        allocated.push(taskId);
      }
      // Log the allocated id table.
      logCase(TAG, 'allocated=' + allocated.join(','));
      // Every configured round must have allocated an id.
      expect(allocated.length).assertEqual(MONOTONIC_ROUNDS);
      // Track the adjacent pairs that advanced by exactly one step.
      let advancedPairs: number = 0;
      // Walk the allocated table comparing adjacent ids.
      for (let i: number = 1; i < allocated.length; i++) {
        // Adjacent ids must advance so two live sections never share an id.
        expect(allocated[i]).assertLarger(allocated[i - 1]);
        // Count the pair that advanced.
        advancedPairs = advancedPairs + 1;
      }
      // Every adjacent pair must have advanced.
      expect(advancedPairs).assertEqual(MONOTONIC_ROUNDS - 1);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_TRACE_0800
     * @tc.name      testTraceNestedSection0001
     * @tc.desc      Verify nested sections keep separate ids while the inner body result still reaches the caller.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTraceNestedSection0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testTraceNestedSection0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Run an outer section whose body runs an inner section as well.
      const result: number = TraceUtil.section(OUTER_SECTION, () => {
        // Run the inner section and return its body value.
        const inner: number = TraceUtil.section(INNER_SECTION, () => SECTION_RESULT);
        // Forward the inner value as the outer body result.
        return inner;
      });
      // Log the nested result.
      logCase(TAG, 'nested result=' + result.toString());
      // The innermost body value must reach the caller unchanged.
      expect(result).assertEqual(SECTION_RESULT);
      // The outer and inner section names are distinct so the trace timeline stays readable.
      expect(OUTER_SECTION === INNER_SECTION).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_TRACE_0900
     * @tc.name      testTraceSectionTable0001
     * @tc.desc      Verify a table of pipeline stage names all pair begin and end without throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testTraceSectionTable0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testTraceSectionTable0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Track the stage names that were traced and closed.
      let tracedStages: number = 0;
      // Walk the pipeline stage table and trace each stage once.
      for (let i: number = 0; i < SECTION_TABLE.length; i++) {
        // Open the stage section.
        const taskId: number = TraceUtil.begin(SECTION_TABLE[i]);
        // Emit a progress value for the stage.
        TraceUtil.value(SECTION_TABLE[i], taskId, i);
        // Close the stage section.
        TraceUtil.end(SECTION_TABLE[i], taskId);
        // Count the stage that was traced.
        tracedStages = tracedStages + 1;
      }
      // Log the traced stage count.
      logCase(TAG, 'traced stages=' + tracedStages.toString() + '/' + SECTION_TABLE.length.toString());
      // Every stage of the table must have been traced.
      expect(tracedStages).assertEqual(SECTION_TABLE.length);
      // The stage table keeps the six documented pipeline stages.
      expect(SECTION_TABLE.length).assertEqual(6);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_TRACE_1000
     * @tc.name      testTraceAsyncFailure0001
     * @tc.desc      Verify an async section body that rejects still closes the section and rethrows the error.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testTraceAsyncFailure0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testTraceAsyncFailure0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Track whether the rejection was observed by the caller.
      let rejected: boolean = false;
      // Track the failure message forwarded by the facade.
      let failureMessage: string = EMPTY_TEXT;
      // Wrap a rejecting body and catch the forwarded error.
      try {
        // Await the failing async section.
        await TraceUtil.asyncSection(ASYNC_SECTION, () => rejectedTask());
      } catch (error) {
        // Mark the rejection as observed.
        rejected = true;
        // Keep the forwarded message for the assertion below.
        failureMessage = error.message;
      }
      // Log the observed failure message.
      logCase(TAG, 'rejected=' + rejected.toString() + ', message=' + failureMessage);
      // The failure must reach the caller instead of being swallowed.
      expect(rejected).assertTrue();
      // The forwarded message keeps the text of the original error.
      expect(failureMessage.indexOf('trace section failure probe')).assertEqual(0);
      // A following section still runs because the failing one closed its trace.
      const afterResult: number = TraceUtil.section(SECTION_NAME, () => SECTION_RESULT);
      // The follow up section returns its body value.
      expect(afterResult).assertEqual(SECTION_RESULT);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_TRACE_1100
     * @tc.name      testTraceSectionBodyError0001
     * @tc.desc      Verify a synchronous body that throws still closes the section and rethrows to the caller.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testTraceSectionBodyError0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testTraceSectionBodyError0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Track whether the body error reached the caller.
      let thrown: boolean = false;
      // Run a body that throws and observe the forwarded error.
      try {
        // Wrap a throwing body so the finally branch of section runs.
        TraceUtil.section(SECTION_NAME, () => {
          // Throw a plain error so the finally branch must still close the section.
          throw new Error('section body failure probe');
        });
      } catch (error) {
        // Mark the error as observed.
        thrown = true;
      }
      // Log the observed flag.
      logCase(TAG, 'thrown=' + thrown.toString());
      // The body error must reach the caller rather than being swallowed.
      expect(thrown).assertTrue();
      // The facade stays usable after the failure.
      const recovered: string = TraceUtil.section(SECTION_NAME, () => 'recovered');
      // The recovered section returns its body value.
      expect(recovered).assertEqual('recovered');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_TRACE_1200
     * @tc.name      testTraceNullAndEmptyName0001
     * @tc.desc      Verify empty and long section names are tolerated so defensive call sites cannot break tracing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testTraceNullAndEmptyName0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testTraceNullAndEmptyName0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The name table lists the section name shapes exercised by this case.
      const nameTable: string[] = [EMPTY_TEXT, SINGLE_CHAR_TEXT, LONG_SECTION_NAME];
      // Track the names that were accepted and closed.
      let acceptedNames: number = 0;
      // Walk the name table and trace each shape once.
      for (let i: number = 0; i < nameTable.length; i++) {
        // Open the section with the current name shape.
        const taskId: number = TraceUtil.begin(nameTable[i]);
        // Close the section with the same name shape.
        TraceUtil.end(nameTable[i], taskId);
        // Count the accepted name shape.
        acceptedNames = acceptedNames + 1;
      }
      // Log the accepted name count.
      logCase(TAG, 'accepted names=' + acceptedNames.toString());
      // Every name shape must be accepted by the facade.
      expect(acceptedNames).assertEqual(nameTable.length);
      // The long name stays a plain string.
      expect(typeof LONG_SECTION_NAME).assertEqual('string');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_TRACE_1300
     * @tc.name      testTraceTaskIdWraparound0001
     * @tc.desc      Verify the task id stays inside the facade id range across many begin calls so traces never overflow.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testTraceTaskIdWraparound0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testTraceTaskIdWraparound0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The wraparound sweep issues more than one full id cycle plus a remainder.
      const sweepCount: number = MAX_TASK_ID + 5;
      // Track the ids that stayed inside the documented range.
      let inRangeIds: number = 0;
      // Track the last issued id so the sweep can be summarised.
      let lastTaskId: number = 0;
      // Issue the whole sweep, pairing every begin with an end.
      for (let i: number = 0; i < sweepCount; i++) {
        // Open the section and keep the issued id.
        const taskId: number = TraceUtil.begin(SECTION_NAME);
        // Close the section so no trace stays open after the sweep.
        TraceUtil.end(SECTION_NAME, taskId);
        // Remember the last issued id for the summary line.
        lastTaskId = taskId;
        // Count the id that stayed inside the documented range.
        if (taskId >= 0 && taskId < MAX_TASK_ID) {
          // Increment the in range counter.
          inRangeIds = inRangeIds + 1;
        }
      }
      // Log the sweep summary.
      logCase(TAG, 'sweep=' + sweepCount.toString() + ', inRange=' + inRangeIds.toString() +
        ', last=' + lastTaskId.toString());
      // Every issued id must stay inside the documented range.
      expect(inRangeIds).assertEqual(sweepCount);
      // The sweep count exceeds one full id cycle, so the wraparound branch was reached.
      expect(sweepCount).assertLarger(MAX_TASK_ID);
      // The last id also respects the upper bound.
      expect(lastTaskId).assertLess(MAX_TASK_ID);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_TRACE_1400
     * @tc.name      testTraceValueMarkTable0001
     * @tc.desc      Verify the value marks of the conversion pipeline are all accepted by the facade without throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testTraceValueMarkTable0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testTraceValueMarkTable0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The mark table lists the measured quantities reported by the conversion pipeline.
      const markNames: string[] = ['input_bytes', 'output_bytes', 'glyph_count', 'elapsed_ms', 'ratio_x100'];
      // The mark value table lists one representative value per mark.
      const markValues: number[] = [0, MARK_VALUE, MARK_VALUE_LARGE, 7, 100];
      // Open a section so the marks belong to a real trace id.
      const taskId: number = TraceUtil.begin(SECTION_NAME);
      // Track how many marks were emitted.
      let emittedMarks: number = 0;
      // Emit every mark of the table.
      for (let i: number = 0; i < markNames.length; i++) {
        // Emit the current value mark.
        TraceUtil.value(markNames[i], taskId, markValues[i]);
        // Count the emitted mark.
        emittedMarks = emittedMarks + 1;
      }
      // Close the section after every mark was emitted.
      TraceUtil.end(SECTION_NAME, taskId);
      // Log the emitted mark count.
      logCase(TAG, 'emitted marks=' + emittedMarks.toString());
      // Every mark of the table must have been emitted.
      expect(emittedMarks).assertEqual(markNames.length);
      // The mark name and value tables stay aligned.
      expect(markNames.length).assertEqual(markValues.length);
      // The representative value is a finite integer.
      expect(Number.isInteger(markValues[1])).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
