'use static';
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

/**
 * TransferToolValidation suite.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   57-60    progressValueA / progressValueB / progressValueC / isTaskFinished
 *   68-76    updateProgress writes exactly 100 for one task
 *   98-107   checkAndUnlock and canRunTaskC implement the A && B gate
 *   188-196  setInterval(200) poll and clearInterval after the gate opens
 *   250-259  start button colour and enabled state
 *   84-292   the shared utility contract consumed by the suites
 *
 * This file is the contract test of the small pure helpers: bounds, progress
 * monotonicity, URL slicing, redaction, string array comparison, joining,
 * reversal, the rolling fingerprint and the two rendering helpers. Each case
 * also checks the inverted rule, so a helper that always returns a constant
 * cannot pass. No UI component and no request.agent call is used.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  PROGRESS_TOTAL,
  PROGRESS_INITIAL,
  STATUS_IDLE,
  STATUS_RUNNING,
  STATUS_COMPLETED,
  STATUS_FAILED,
  BUTTON_ACTIVE_BACKGROUND,
  BUTTON_DISABLED_BACKGROUND,
  clampInt,
  isTerminalStatus,
  expectedProgressAfter,
  expectedCompletedProgress,
  expectedGateOpen,
  expectedStepStatus,
  fileNameOf,
  extensionOf,
  schemeOf,
  hostOf,
  pathOf,
  queryOf,
  redactQuery,
  redactCredentials,
  sameStringArray,
  hasDuplicateStrings,
  countOf,
  joined,
  reversedCopy,
  textFingerprint,
  progressLabel,
  startButtonEnabled,
  startButtonBackground
} from '../Shared/SharedDriver';

const MEDIA_URL: string = 'https://gitee.com/harmonyos-cases/cases/blob/master/media/after_cache.png';

export default function transferToolValidationTest(): void {
  describe('TransferToolValidation', () => {
    beforeAll(() => {
      logSuite('TransferToolValidation', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('TransferToolValidation', 'end');
    });

    /**
     * @tc.name   clampIntKeepsValueInsideRange
     * @tc.desc   A value already inside the inclusive bounds is returned unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('clampIntKeepsValueInsideRange', 0, () => {
      logStep('clampIntKeepsValueInsideRange', String(clampInt(50, 0, 100)));
      expect(clampInt(50, PROGRESS_INITIAL, PROGRESS_TOTAL)).assertEqual(50);
      expect(clampInt(1, 0, 100)).assertEqual(1);
      expect(clampInt(99, 0, 100)).assertEqual(99);
      expect(clampInt(7, 5, 9)).assertEqual(7);
      expect(clampInt(50, 0, 100) === 51).assertFalse();
      expect(clampInt(PROGRESS_TOTAL - 1, 0, 100)).assertEqual(99);
      expect(clampInt(3, 3, 3)).assertEqual(3);
    });

    /**
     * @tc.name   clampIntRaisesValueBelowLowBound
     * @tc.desc   A value under the low bound is raised to the low bound itself.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('clampIntRaisesValueBelowLowBound', 0, () => {
      logStep('clampIntRaisesValueBelowLowBound', String(clampInt(-5, 0, 100)));
      expect(clampInt(-5, 0, 100)).assertEqual(0);
      expect(clampInt(-1, 10, 20)).assertEqual(10);
      expect(clampInt(0, 5, 9)).assertEqual(5);
      expect(clampInt(-100, PROGRESS_INITIAL, PROGRESS_TOTAL)).assertEqual(PROGRESS_INITIAL);
      expect(clampInt(-5, 0, 100) < 0).assertFalse();
      expect(clampInt(-1, 10, 20) === -1).assertFalse();
      expect(clampInt(-1, 10, 20) === 10).assertTrue();
    });

    /**
     * @tc.name   clampIntLowersValueAboveHighBound
     * @tc.desc   A value above the high bound is lowered to the high bound itself.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('clampIntLowersValueAboveHighBound', 0, () => {
      logStep('clampIntLowersValueAboveHighBound', String(clampInt(150, 0, 100)));
      expect(clampInt(150, 0, 100)).assertEqual(100);
      expect(clampInt(101, 0, 100)).assertEqual(100);
      expect(clampInt(21, 10, 20)).assertEqual(20);
      expect(clampInt(1000, PROGRESS_INITIAL, PROGRESS_TOTAL)).assertEqual(PROGRESS_TOTAL);
      expect(clampInt(150, 0, 100) > 100).assertFalse();
      expect(clampInt(150, 0, 100) === 150).assertFalse();
      expect(clampInt(9999, 0, 100)).assertEqual(clampInt(101, 0, 100));
    });

    /**
     * @tc.name   clampIntAcceptsEqualBounds
     * @tc.desc   When low equals high every input collapses onto the single allowed value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clampIntAcceptsEqualBounds', 0, () => {
      logStep('clampIntAcceptsEqualBounds', String(clampInt(4, 5, 5)));
      expect(clampInt(5, 5, 5)).assertEqual(5);
      expect(clampInt(4, 5, 5)).assertEqual(5);
      expect(clampInt(6, 5, 5)).assertEqual(5);
      expect(clampInt(0, 0, 0)).assertEqual(0);
      expect(clampInt(-9, 0, 0)).assertEqual(0);
      expect(clampInt(4, 5, 5) === 4).assertFalse();
      expect(clampInt(6, 5, 5) === 6).assertFalse();
      expect(clampInt(4, 5, 5)).assertEqual(clampInt(6, 5, 5));
    });

    /**
     * @tc.name   clampIntLeavesFractionalValueUntouched
     * @tc.desc   The clamp only compares bounds, so an in-range fractional value keeps its fraction.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clampIntLeavesFractionalValueUntouched', 0, () => {
      logStep('clampIntLeavesFractionalValueUntouched', String(clampInt(50.5, 0, 100)));
      expect(clampInt(50.5, 0, 100)).assertEqual(50.5);
      expect(clampInt(50.5, 0, 100) === 50).assertFalse();
      expect(clampInt(100.9, 0, 100)).assertEqual(100);
      expect(clampInt(-0.5, 0, 100)).assertEqual(0);
      expect(clampInt(0.25, 0, 1)).assertEqual(0.25);
      expect(clampInt(50.5, 0, 100) > 50).assertTrue();
      expect(clampInt(50.5, 0, 100) < 51).assertTrue();
    });

    /**
     * @tc.name   expectedProgressAfterAdvancesForHigherValue
     * @tc.desc   An incoming value above the current progress becomes the new bounded progress.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('expectedProgressAfterAdvancesForHigherValue', 0, () => {
      logStep('expectedProgressAfterAdvancesForHigherValue', String(expectedProgressAfter(0, 40)));
      expect(expectedProgressAfter(0, 40)).assertEqual(40);
      expect(expectedProgressAfter(39, 40)).assertEqual(40);
      expect(expectedProgressAfter(40, 80)).assertEqual(80);
      expect(expectedProgressAfter(0, PROGRESS_TOTAL)).assertEqual(PROGRESS_TOTAL);
      expect(expectedProgressAfter(0, 40) > 0).assertTrue();
      expect(expectedProgressAfter(39, 40) === 39).assertFalse();
      expect(expectedProgressAfter(40, 80) === 80).assertTrue();
    });

    /**
     * @tc.name   expectedProgressAfterIgnoresBackwardsValue
     * @tc.desc   A lower incoming value never moves the progress bar backwards.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('expectedProgressAfterIgnoresBackwardsValue', 0, () => {
      logStep('expectedProgressAfterIgnoresBackwardsValue', String(expectedProgressAfter(80, 40)));
      expect(expectedProgressAfter(80, 40)).assertEqual(80);
      expect(expectedProgressAfter(100, 99)).assertEqual(100);
      expect(expectedProgressAfter(60, 0)).assertEqual(60);
      expect(expectedProgressAfter(60, 0) < 60).assertFalse();
      expect(expectedProgressAfter(80, 40)).assertEqual(80);
      expect(expectedProgressAfter(100, 99) === 99).assertFalse();
      expect(expectedProgressAfter(7, 3)).assertEqual(7);
      expect(expectedProgressAfter(PROGRESS_TOTAL, PROGRESS_INITIAL)).assertEqual(PROGRESS_TOTAL);
    });

    /**
     * @tc.name   expectedProgressAfterClampsAboveHundred
     * @tc.desc   An incoming value beyond the total is bounded to one hundred before comparison.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('expectedProgressAfterClampsAboveHundred', 0, () => {
      logStep('expectedProgressAfterClampsAboveHundred', String(expectedProgressAfter(0, 150)));
      expect(expectedProgressAfter(0, 150)).assertEqual(100);
      expect(expectedProgressAfter(90, 150)).assertEqual(100);
      expect(expectedProgressAfter(100, 150)).assertEqual(100);
      expect(expectedProgressAfter(50, 1000)).assertEqual(100);
      expect(expectedProgressAfter(0, 150) > PROGRESS_TOTAL).assertFalse();
      expect(expectedProgressAfter(0, 150) === 150).assertFalse();
      expect(expectedProgressAfter(90, 100)).assertEqual(100);
      expect(expectedProgressAfter(0, 150)).assertEqual(expectedCompletedProgress());
    });

    /**
     * @tc.name   expectedProgressAfterClampsNegativeToCurrent
     * @tc.desc   A negative incoming value is bounded to zero, which cannot beat a non-negative current value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('expectedProgressAfterClampsNegativeToCurrent', 0, () => {
      logStep('expectedProgressAfterClampsNegativeToCurrent', String(expectedProgressAfter(40, -5)));
      expect(expectedProgressAfter(40, -5)).assertEqual(40);
      expect(expectedProgressAfter(0, -5)).assertEqual(0);
      expect(expectedProgressAfter(0, -100)).assertEqual(0);
      expect(expectedProgressAfter(40, -5) < 40).assertFalse();
      expect(expectedProgressAfter(0, -5) < 0).assertFalse();
      expect(expectedProgressAfter(1, -1)).assertEqual(1);
      expect(expectedProgressAfter(40, -5)).assertEqual(40);
      expect(expectedProgressAfter(0, -5)).assertEqual(PROGRESS_INITIAL);
    });

    /**
     * @tc.name   expectedProgressAfterKeepsCurrentWhenEqual
     * @tc.desc   An identical incoming value leaves the stored progress byte-identical.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('expectedProgressAfterKeepsCurrentWhenEqual', 0, () => {
      logStep('expectedProgressAfterKeepsCurrentWhenEqual', String(expectedProgressAfter(40, 40)));
      expect(expectedProgressAfter(40, 40)).assertEqual(40);
      expect(expectedProgressAfter(0, 0)).assertEqual(0);
      expect(expectedProgressAfter(100, 100)).assertEqual(100);
      expect(expectedProgressAfter(73, 73)).assertEqual(73);
      expect(expectedProgressAfter(40, 40) === 40).assertTrue();
      expect(expectedProgressAfter(0, 0)).assertEqual(PROGRESS_INITIAL);
      expect(expectedProgressAfter(100, 100)).assertEqual(PROGRESS_TOTAL);
      expect(expectedProgressAfter(73, 73) > 73).assertFalse();
    });

    /**
     * @tc.name   expectedCompletedProgressIsAlwaysHundred
     * @tc.desc   Completion is a single assignment of the total, so the oracle is constant and full.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('expectedCompletedProgressIsAlwaysHundred', 0, () => {
      logStep('expectedCompletedProgressIsAlwaysHundred', String(expectedCompletedProgress()));
      expect(expectedCompletedProgress()).assertEqual(100);
      expect(expectedCompletedProgress()).assertEqual(PROGRESS_TOTAL);
      expect(expectedCompletedProgress() > 99).assertTrue();
      expect(expectedCompletedProgress() < 101).assertTrue();
      expect(expectedCompletedProgress()).assertEqual(expectedCompletedProgress());
      expect(expectedCompletedProgress() === PROGRESS_INITIAL).assertFalse();
      expect(expectedCompletedProgress() === 99).assertFalse();
      expect(PROGRESS_TOTAL).assertEqual(100);
    });

    /**
     * @tc.name   isTerminalStatusMarksCompletedAndFailed
     * @tc.desc   Both completed and failed stop further progress, so both are terminal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('isTerminalStatusMarksCompletedAndFailed', 0, () => {
      logStep('isTerminalStatusMarksCompletedAndFailed', STATUS_COMPLETED + ',' + STATUS_FAILED);
      expect(isTerminalStatus(STATUS_COMPLETED)).assertTrue();
      expect(isTerminalStatus(STATUS_FAILED)).assertTrue();
      expect(isTerminalStatus('completed')).assertTrue();
      expect(isTerminalStatus('failed')).assertTrue();
      expect(isTerminalStatus(STATUS_COMPLETED) === isTerminalStatus(STATUS_FAILED)).assertTrue();
      expect(STATUS_COMPLETED === STATUS_FAILED).assertFalse();
      expect(STATUS_COMPLETED.length).assertEqual(9);
      expect(isTerminalStatus(STATUS_COMPLETED)).assertEqual(isTerminalStatus(STATUS_FAILED));
    });

    /**
     * @tc.name   isTerminalStatusRejectsRunningAndIdle
     * @tc.desc   Idle, running and unknown status strings still accept progress updates.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('isTerminalStatusRejectsRunningAndIdle', 0, () => {
      logStep('isTerminalStatusRejectsRunningAndIdle', STATUS_IDLE + ',' + STATUS_RUNNING);
      expect(isTerminalStatus(STATUS_IDLE)).assertFalse();
      expect(isTerminalStatus(STATUS_RUNNING)).assertFalse();
      expect(isTerminalStatus('')).assertFalse();
      expect(isTerminalStatus('COMPLETED')).assertFalse();
      expect(isTerminalStatus('canceled')).assertFalse();
      expect(isTerminalStatus(STATUS_RUNNING)).assertEqual(isTerminalStatus(STATUS_IDLE));
      expect(isTerminalStatus(STATUS_IDLE) === true).assertFalse();
      expect(STATUS_IDLE).assertEqual('idle');
    });

    /**
     * @tc.name   fileNameOfReturnsLastSegment
     * @tc.desc   The helper returns everything after the final slash of a media URL.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fileNameOfReturnsLastSegment', 0, () => {
      logStep('fileNameOfReturnsLastSegment', fileNameOf(MEDIA_URL));
      expect(fileNameOf(MEDIA_URL)).assertEqual('after_cache.png');
      expect(fileNameOf('https://gitee.com/a/b/c.png')).assertEqual('c.png');
      expect(fileNameOf(MEDIA_URL).indexOf('/')).assertLess(0);
      expect(fileNameOf(MEDIA_URL).endsWith('.png')).assertTrue();
      expect(fileNameOf(MEDIA_URL) === 'media/after_cache.png').assertFalse();
      expect(fileNameOf('https://gitee.com/a/b/c.png')).assertEqual('c.png');
      expect(fileNameOf(MEDIA_URL).length).assertEqual(15);
      expect(fileNameOf('x')).assertEqual('x');
    });

    /**
     * @tc.name   fileNameOfHonoursCustomFallback
     * @tc.desc   A slash-terminated URL yields the fallback string, defaulting to "file".
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fileNameOfHonoursCustomFallback', 0, () => {
      logStep('fileNameOfHonoursCustomFallback', fileNameOf('https://gitee.com/media/', 'cached.bin'));
      expect(fileNameOf('https://gitee.com/media/', 'cached.bin')).assertEqual('cached.bin');
      expect(fileNameOf('https://gitee.com/media/')).assertEqual('file');
      expect(fileNameOf('')).assertEqual('file');
      expect(fileNameOf('/', 'root.bin')).assertEqual('root.bin');
      expect(fileNameOf('https://gitee.com/media/', 'cached.bin') === 'file').assertFalse();
      expect(fileNameOf('https://gitee.com/media/', 'cached.bin').endsWith('.bin')).assertTrue();
      expect(fileNameOf('https://gitee.com/media/', '').length).assertEqual(0);
    });

    /**
     * @tc.name   extensionOfKeepsDot
     * @tc.desc   The extension is returned with its leading dot and in original case.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('extensionOfKeepsDot', 0, () => {
      logStep('extensionOfKeepsDot', extensionOf(MEDIA_URL));
      expect(extensionOf(MEDIA_URL)).assertEqual('.png');
      expect(extensionOf('https://gitee.com/a/archive.tar.gz')).assertEqual('.gz');
      expect(extensionOf('https://gitee.com/a/file.PNG')).assertEqual('.PNG');
      expect(extensionOf(MEDIA_URL).startsWith('.')).assertTrue();
      expect(extensionOf(MEDIA_URL) === 'png').assertFalse();
      expect(extensionOf(MEDIA_URL).length).assertEqual(4);
      expect(extensionOf('https://gitee.com/a/archive.tar.gz') === '.gz').assertTrue();
      expect(extensionOf('https://gitee.com/a/file.PNG') === '.png').assertFalse();
    });

    /**
     * @tc.name   extensionOfRejectsLeadingDotFile
     * @tc.desc   A dot at position zero of the file name marks a hidden file, not an extension.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('extensionOfRejectsLeadingDotFile', 0, () => {
      logStep('extensionOfRejectsLeadingDotFile', String(extensionOf('https://gitee.com/a/.gitignore')));
      expect(extensionOf('https://gitee.com/a/.gitignore')).assertEqual('');
      expect(extensionOf('https://gitee.com/a/.png')).assertEqual('');
      expect(extensionOf('.gitignore')).assertEqual('');
      expect(extensionOf('https://gitee.com/a/file')).assertEqual('');
      expect(extensionOf('https://gitee.com/a/.gitignore') === '.gitignore').assertFalse();
      expect(extensionOf('https://gitee.com/a/dir.v1/file')).assertEqual('');
      expect(extensionOf('https://gitee.com/a/dir.v1/file.png')).assertEqual('.png');
      expect(fileNameOf('https://gitee.com/a/.pnpmfile')).assertEqual('.pnpmfile');
    });

    /**
     * @tc.name   schemeOfExtractsLowerCaseScheme
     * @tc.desc   The scheme is the text before :// and keeps whatever case the source used.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('schemeOfExtractsLowerCaseScheme', 0, () => {
      logStep('schemeOfExtractsLowerCaseScheme', schemeOf(MEDIA_URL));
      expect(schemeOf(MEDIA_URL)).assertEqual('https');
      expect(schemeOf('http://gitee.com/a.png')).assertEqual('http');
      expect(schemeOf('ftp://gitee.com/a.png')).assertEqual('ftp');
      expect(schemeOf('HTTPS://GITEE.COM/A.PNG')).assertEqual('HTTPS');
      expect(schemeOf('gitee.com/a.png')).assertEqual('');
      expect(schemeOf('://gitee.com/a.png')).assertEqual('');
      expect(schemeOf(MEDIA_URL) === 'http').assertFalse();
      expect(schemeOf(MEDIA_URL).length).assertEqual(5);
    });

    /**
     * @tc.name   hostOfExtractsAuthority
     * @tc.desc   The authority is everything between :// and the first slash, including any port.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('hostOfExtractsAuthority', 0, () => {
      logStep('hostOfExtractsAuthority', hostOf(MEDIA_URL));
      expect(hostOf(MEDIA_URL)).assertEqual('gitee.com');
      expect(hostOf('https://gitee.com')).assertEqual('gitee.com');
      expect(hostOf('https://gitee.com:8443/a/b.png')).assertEqual('gitee.com:8443');
      expect(hostOf('gitee.com/a.png')).assertEqual('');
      expect(hostOf('/a/b.png')).assertEqual('');
      expect(hostOf(MEDIA_URL).indexOf('/')).assertLess(0);
      expect(hostOf(MEDIA_URL) === 'gitee.com/').assertFalse();
      expect(hostOf('https://gitee.com:8443/a/b.png').indexOf(':8443')).assertLarger(0);
    });

    /**
     * @tc.name   pathOfDropsQueryAndAuthority
     * @tc.desc   The path starts at the first slash, keeps directories and stops before the query.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('pathOfDropsQueryAndAuthority', 0, () => {
      logStep('pathOfDropsQueryAndAuthority', pathOf(MEDIA_URL));
      expect(pathOf('https://gitee.com/a/b.png?x=1')).assertEqual('/a/b.png');
      expect(pathOf(MEDIA_URL)).assertEqual('/harmonyos-cases/cases/blob/master/media/after_cache.png');
      expect(pathOf('https://gitee.com')).assertEqual('');
      expect(pathOf('')).assertEqual('');
      expect(pathOf(MEDIA_URL).startsWith('/')).assertTrue();
      expect(pathOf(MEDIA_URL).indexOf('gitee.com')).assertLess(0);
      expect(pathOf('https://gitee.com/a/b.png?x=1').indexOf('?')).assertLess(0);
      expect(pathOf(MEDIA_URL).endsWith(fileNameOf(MEDIA_URL))).assertTrue();
    });

    /**
     * @tc.name   queryOfKeepsQuestionMark
     * @tc.desc   queryOf returns the query including the leading question mark, or an empty string.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('queryOfKeepsQuestionMark', 0, () => {
      logStep('queryOfKeepsQuestionMark', queryOf('https://gitee.com/a/b.png?x=1&y=2'));
      expect(queryOf('https://gitee.com/a/b.png?x=1&y=2')).assertEqual('?x=1&y=2');
      expect(queryOf(MEDIA_URL)).assertEqual('');
      expect(queryOf('a?')).assertEqual('?');
      expect(queryOf('https://gitee.com/a/b.png?x=1&y=2').startsWith('?')).assertTrue();
      expect(queryOf(MEDIA_URL).length).assertEqual(0);
      expect(queryOf('https://gitee.com/a/b.png?x=1&y=2') === 'x=1&y=2').assertFalse();
      expect(queryOf('https://gitee.com/a/b.png?x=1&y=2').indexOf('x=1')).assertLarger(0);
      expect(queryOf('')).assertEqual('');
    });

    /**
     * @tc.name   redactQueryStripsTokenSegment
     * @tc.desc   Redaction cuts everything from the first question mark, removing a signed token.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('redactQueryStripsTokenSegment', 0, () => {
      const signed: string = MEDIA_URL + '?token=top-secret&expires=1700';
      logStep('redactQueryStripsTokenSegment', String(redactQuery(signed).length));
      expect(redactQuery(signed)).assertEqual(MEDIA_URL);
      expect(redactQuery(signed).indexOf('top-secret')).assertLess(0);
      expect(redactQuery(signed).length < signed.length).assertTrue();
      expect(redactQuery(redactQuery(signed))).assertEqual(MEDIA_URL);
      expect(redactQuery(signed).indexOf('?')).assertLess(0);
      expect(signed.indexOf('token')).assertLarger(0);
      expect(redactQuery(signed).endsWith('after_cache.png')).assertTrue();
      expect(redactQuery('?token=1')).assertEqual('');
    });

    /**
     * @tc.name   redactQueryLeavesCleanUrl
     * @tc.desc   A URL without a query and a URL with only a fragment pass through untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('redactQueryLeavesCleanUrl', 0, () => {
      logStep('redactQueryLeavesCleanUrl', redactQuery(MEDIA_URL));
      expect(redactQuery(MEDIA_URL)).assertEqual(MEDIA_URL);
      expect(redactQuery(MEDIA_URL).length).assertEqual(MEDIA_URL.length);
      expect(redactQuery('https://gitee.com/a/b.png#preview')).assertEqual('https://gitee.com/a/b.png#preview');
      expect(redactQuery('https://gitee.com/a/b.png#preview').indexOf('#')).assertLarger(0);
      expect(redactQuery('')).assertEqual('');
      expect(redactQuery('no-query-here')).assertEqual('no-query-here');
      expect(redactQuery(MEDIA_URL) === MEDIA_URL).assertTrue();
      expect(redactQuery('https://gitee.com/a/b.png?')).assertEqual('https://gitee.com/a/b.png');
    });

    /**
     * @tc.name   redactCredentialsMasksUserInfo
     * @tc.desc   User and password before the authority are replaced by a fixed three star mask.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('redactCredentialsMasksUserInfo', 0, () => {
      const guarded: string = 'https://user:pass@gitee.com/a/b.png';
      logStep('redactCredentialsMasksUserInfo', redactCredentials(guarded));
      expect(redactCredentials(guarded)).assertEqual('https://***@gitee.com/a/b.png');
      expect(redactCredentials(guarded).indexOf('pass')).assertLess(0);
      expect(redactCredentials(guarded).indexOf('user')).assertLess(0);
      expect(redactCredentials(guarded).startsWith('https://***@')).assertTrue();
      expect(redactCredentials(guarded).endsWith('/a/b.png')).assertTrue();
      expect(redactCredentials(guarded).indexOf('://')).assertEqual(5);
      expect(redactCredentials(guarded).length < guarded.length).assertTrue();
      expect(redactCredentials('ftp://root@h/a.bin')).assertEqual('ftp://***@h/a.bin');
    });

    /**
     * @tc.name   redactCredentialsLeavesUrlWithoutAt
     * @tc.desc   A URL with no user info, no scheme marker or an at sign inside the path is handled as documented.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('redactCredentialsLeavesUrlWithoutAt', 0, () => {
      logStep('redactCredentialsLeavesUrlWithoutAt', redactCredentials(MEDIA_URL));
      expect(redactCredentials(MEDIA_URL)).assertEqual(MEDIA_URL);
      expect(redactCredentials('user@host/a.png')).assertEqual('user@host/a.png');
      expect(redactCredentials('local@file')).assertEqual('local@file');
      expect(redactCredentials('')).assertEqual('');
      expect(redactCredentials('https://gitee.com/a@b.png')).assertEqual('https://***@b.png');
      expect(redactCredentials(MEDIA_URL).length).assertEqual(MEDIA_URL.length);
      expect(redactCredentials(MEDIA_URL).indexOf('***')).assertLess(0);
      expect(redactCredentials('https://gitee.com/a@b.png').endsWith('@b.png')).assertTrue();
    });

    /**
     * @tc.name   sameStringArrayComparesContent
     * @tc.desc   Two arrays with equal length and equal positions compare true even when built separately.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sameStringArrayComparesContent', 0, () => {
      const left: string[] = ['alpha', 'beta', 'gamma'];
      const right: string[] = ['alpha', 'beta', 'gamma'];
      logStep('sameStringArrayComparesContent', String(left.length));
      expect(sameStringArray(left, right)).assertTrue();
      expect(left === right).assertFalse();
      expect(sameStringArray(left, ['alpha', 'beta'])).assertFalse();
      expect(sameStringArray(left, ['alpha', 'beta', 'delta'])).assertFalse();
      expect(sameStringArray(right, right)).assertTrue();
      expect(sameStringArray([], [])).assertTrue();
      expect(sameStringArray(['alpha'], ['Alpha'])).assertFalse();
      expect(left[2]).assertEqual(right[2]);
    });

    /**
     * @tc.name   hasDuplicateStringsFindsSecondCopy
     * @tc.desc   The nested scan reports true as soon as any later position repeats an earlier value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('hasDuplicateStringsFindsSecondCopy', 0, () => {
      logStep('hasDuplicateStringsFindsSecondCopy', String(hasDuplicateStrings(['a', 'b', 'a'])));
      expect(hasDuplicateStrings(['a', 'b', 'a'])).assertTrue();
      expect(hasDuplicateStrings(['a', 'b'])).assertFalse();
      expect(hasDuplicateStrings([])).assertFalse();
      expect(hasDuplicateStrings(['a'])).assertFalse();
      expect(hasDuplicateStrings(['a', 'a'])).assertTrue();
      expect(hasDuplicateStrings(['a', 'b', 'c', 'b'])).assertTrue();
      expect(hasDuplicateStrings(['a', 'b']) === true).assertFalse();
      expect(hasDuplicateStrings(['', ''])).assertTrue();
    });

    /**
     * @tc.name   countOfTalliesRepeats
     * @tc.desc   countOf counts whole-string matches only, so near matches and prefixes score zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('countOfTalliesRepeats', 0, () => {
      const values: string[] = ['a', 'a', 'b', ''];
      logStep('countOfTalliesRepeats', String(countOf(values, 'a')));
      expect(countOf(values, 'a')).assertEqual(2);
      expect(countOf(values, 'b')).assertEqual(1);
      expect(countOf(values, '')).assertEqual(1);
      expect(countOf(values, 'c')).assertEqual(0);
      expect(countOf(values, 'a ')).assertEqual(0);
      expect(countOf(values, 'A')).assertEqual(0);
      expect(countOf([], 'a')).assertEqual(0);
      expect(countOf(values, 'a')).assertEqual(values.length - countOf(values, 'b') - 1);
    });

    /**
     * @tc.name   joinedUsesCustomSeparator
     * @tc.desc   A custom separator appears exactly between entries and never before the first or after the last.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('joinedUsesCustomSeparator', 0, () => {
      logStep('joinedUsesCustomSeparator', joined(['A', 'B', 'C'], ' - '));
      expect(joined(['A', 'B', 'C'], ' - ')).assertEqual('A - B - C');
      expect(joined(['A', 'B', 'C'], '|')).assertEqual('A|B|C');
      expect(joined(['A'], '-')).assertEqual('A');
      expect(joined([], '-')).assertEqual('');
      expect(joined(['A', 'B', 'C'], '|').indexOf('|')).assertEqual(1);
      expect(joined(['A', 'B', 'C'], ' - ').startsWith(' - ')).assertFalse();
      expect(joined(['A', 'B', 'C'], ' - ').endsWith(' - ')).assertFalse();
      expect(joined(['A', 'B'], '')).assertEqual('AB');
    });

    /**
     * @tc.name   joinedDefaultsToComma
     * @tc.desc   Without an explicit separator the helper inserts a single comma between entries.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('joinedDefaultsToComma', 0, () => {
      logStep('joinedDefaultsToComma', joined(['A', 'B', 'C']));
      expect(joined(['A', 'B', 'C'])).assertEqual('A,B,C');
      expect(joined(['A', 'B', 'C'])).assertEqual(joined(['A', 'B', 'C'], ','));
      expect(joined(['A'])).assertEqual('A');
      expect(joined([])).assertEqual('');
      expect(joined(['', ''])).assertEqual(',');
      expect(joined(['A', 'B', 'C']).split(',').length).assertEqual(3);
      expect(joined(['A', 'B', 'C']).indexOf(', ')).assertLess(0);
      expect(joined(['A', 'B', 'C']) === 'A B C').assertFalse();
    });

    /**
     * @tc.name   reversedCopyReversesOrder
     * @tc.desc   Reversal returns a new list in the opposite order and leaves the input intact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('reversedCopyReversesOrder', 0, () => {
      const source: string[] = ['A', 'B', 'C'];
      const mirror: string[] = reversedCopy(source);
      logStep('reversedCopyReversesOrder', joined(mirror, ''));
      expect(mirror[0]).assertEqual('C');
      expect(mirror[1]).assertEqual('B');
      expect(mirror[2]).assertEqual('A');
      expect(source[0]).assertEqual('A');
      expect(mirror.length).assertEqual(source.length);
      expect(reversedCopy(['A'])[0]).assertEqual('A');
      expect(reversedCopy([]).length).assertEqual(0);
      expect(sameStringArray(reversedCopy(mirror), source)).assertTrue();
    });

    /**
     * @tc.name   textFingerprintIsDeterministic
     * @tc.desc   The rolling hash of a fixed string is stable across calls and stays inside the modulus.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('textFingerprintIsDeterministic', 0, () => {
      const first: number = textFingerprint('taskA:completed');
      const second: number = textFingerprint('taskA:completed');
      logStep('textFingerprintIsDeterministic', String(first));
      expect(first).assertEqual(second);
      expect(first >= 0).assertTrue();
      expect(first < 1000003).assertTrue();
      expect(first === 0).assertFalse();
      expect(textFingerprint('taskA:completed') === textFingerprint('taskB:completed')).assertFalse();
      expect(Math.floor(first)).assertEqual(first);
      expect(textFingerprint('taskA:completed') > 0).assertTrue();
    });

    /**
     * @tc.name   textFingerprintOfEmptyStringIsSeed
     * @tc.desc   The empty trace returns the documented seed value and any one character changes it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('textFingerprintOfEmptyStringIsSeed', 0, () => {
      logStep('textFingerprintOfEmptyStringIsSeed', String(textFingerprint('')));
      expect(textFingerprint('')).assertEqual(216613);
      expect(textFingerprint('')).assertEqual(textFingerprint(''));
      expect(textFingerprint('a') === textFingerprint('')).assertFalse();
      expect(textFingerprint(' ') === 216613).assertFalse();
      expect(textFingerprint('0') === textFingerprint('')).assertFalse();
      expect(textFingerprint('').toString()).assertEqual('216613');
    });

    /**
     * @tc.name   textFingerprintChangesWithOneCharacter
     * @tc.desc   A one character edit anywhere in the trace produces a different fingerprint value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('textFingerprintChangesWithOneCharacter', 0, () => {
      const base: string = MEDIA_URL;
      const edited: string = 'https://gitee.com/a/b.png';
      logStep('textFingerprintChangesWithOneCharacter', String(textFingerprint(base)));
      expect(textFingerprint(base) === textFingerprint(edited)).assertFalse();
      expect(textFingerprint('progress:100') === textFingerprint('progress:99')).assertFalse();
      expect(textFingerprint('A|B|C') === textFingerprint('A|B|C ')).assertFalse();
      expect(textFingerprint('A|B|C') === textFingerprint('A|B|D')).assertFalse();
      expect(textFingerprint('A|B|C')).assertEqual(textFingerprint('A|B|C'));
      expect(textFingerprint('progress:100') >= 0).assertTrue();
      expect(textFingerprint('progress:100') < 1000003).assertTrue();
      expect(base.length > edited.length).assertTrue();
    });

    /**
     * @tc.name   progressLabelRendersTaskAndPercent
     * @tc.desc   The label under each progress row embeds the task number and the integer percentage.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressLabelRendersTaskAndPercent', 0, () => {
      logStep('progressLabelRendersTaskAndPercent', progressLabel('A', 100));
      expect(progressLabel('A', 100)).assertEqual('任务A当前进度 100%');
      expect(progressLabel('B', 0)).assertEqual('任务B当前进度 0%');
      expect(progressLabel('C', 40)).assertEqual('任务C当前进度 40%');
      expect(progressLabel('A', 100).indexOf('任务A')).assertEqual(0);
      expect(progressLabel('A', 100).endsWith('%')).assertTrue();
      expect(progressLabel('A', 100).indexOf('100')).assertLarger(0);
      expect(progressLabel('B', 0).indexOf('任务C')).assertLess(0);
      expect(progressLabel('C', 40).length).assertEqual(11);
    });

    /**
     * @tc.name   expectedGateOpenRequiresBothTasks
     * @tc.desc   The gate predicate is true only in the A and B completed quadrant.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('expectedGateOpenRequiresBothTasks', 0, () => {
      logStep('expectedGateOpenRequiresBothTasks', String(expectedGateOpen(true, true)));
      expect(expectedGateOpen(false, false)).assertFalse();
      expect(expectedGateOpen(true, false)).assertFalse();
      expect(expectedGateOpen(false, true)).assertFalse();
      expect(expectedGateOpen(true, true)).assertTrue();
      expect(expectedGateOpen(true, false) === expectedGateOpen(true, true)).assertFalse();
      expect(expectedGateOpen(false, true) === expectedGateOpen(true, true)).assertFalse();
      expect(expectedGateOpen(true, true)).assertEqual(expectedGateOpen(true, true));
    });

    /**
     * @tc.name   expectedStepStatusReportsRunningUntilBothDone
     * @tc.desc   The dependency step only reaches completed when both inputs are done.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('expectedStepStatusReportsRunningUntilBothDone', 0, () => {
      logStep('expectedStepStatusReportsRunningUntilBothDone', expectedStepStatus(true, true));
      expect(expectedStepStatus(true, true)).assertEqual(STATUS_COMPLETED);
      expect(expectedStepStatus(false, false)).assertEqual(STATUS_RUNNING);
      expect(expectedStepStatus(true, false)).assertEqual(STATUS_RUNNING);
      expect(expectedStepStatus(false, true)).assertEqual(STATUS_RUNNING);
      expect(expectedStepStatus(true, false) === STATUS_COMPLETED).assertFalse();
      expect(expectedStepStatus(true, true) === STATUS_RUNNING).assertFalse();
      expect(isTerminalStatus(expectedStepStatus(true, true))).assertTrue();
      expect(isTerminalStatus(expectedStepStatus(false, true))).assertFalse();
    });

    /**
     * @tc.name   startButtonBackgroundSwitchesOnFlag
     * @tc.desc   The enabled start button uses the blue accent while the disabled one uses grey.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startButtonBackgroundSwitchesOnFlag', 0, () => {
      logStep('startButtonBackgroundSwitchesOnFlag', startButtonBackground(false));
      expect(startButtonBackground(false)).assertEqual(BUTTON_DISABLED_BACKGROUND);
      expect(startButtonBackground(true)).assertEqual(BUTTON_ACTIVE_BACKGROUND);
      expect(startButtonBackground(false)).assertEqual('#C0C4CC');
      expect(startButtonBackground(true)).assertEqual('#409EFF');
      expect(startButtonBackground(true) === startButtonBackground(false)).assertFalse();
      expect(startButtonBackground(false).startsWith('#')).assertTrue();
      expect(startButtonBackground(true).length).assertEqual(7);
      expect(startButtonBackground(false).length).assertEqual(7);
    });

    /**
     * @tc.name   startButtonEnabledMirrorsFlag
     * @tc.desc   The button is enabled exactly when isTaskFinished is true, without inversion.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startButtonEnabledMirrorsFlag', 0, () => {
      logStep('startButtonEnabledMirrorsFlag', String(startButtonEnabled(false)));
      expect(startButtonEnabled(true)).assertTrue();
      expect(startButtonEnabled(false)).assertFalse();
      expect(startButtonEnabled(true)).assertEqual(true);
      expect(startButtonEnabled(false) === true).assertFalse();
      expect(startButtonEnabled(true) === true).assertTrue();
      expect(startButtonEnabled(true)).assertEqual(!startButtonEnabled(false));
      expect(startButtonEnabled(false)).assertEqual(false);
    });

    /**
     * @tc.name   expectedProgressAfterSequenceIsMonotone
     * @tc.desc   Folding a realistic progress sequence never lowers the value and ends at the total.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('expectedProgressAfterSequenceIsMonotone', 0, () => {
      const incoming: number[] = [0, 25, 25, 60, 40, 100];
      let current: number = PROGRESS_INITIAL;
      let drops: number = 0;
      let raises: number = 0;
      for (let index = 0; index < incoming.length; index++) {
        const next: number = expectedProgressAfter(current, incoming[index]);
        if (next < current) {
          drops = drops + 1;
        }
        if (next > current) {
          raises = raises + 1;
        }
        current = next;
      }
      logStep('expectedProgressAfterSequenceIsMonotone', String(current));
      expect(drops).assertEqual(0);
      expect(raises).assertEqual(3);
      expect(current).assertEqual(PROGRESS_TOTAL);
      expect(current).assertEqual(100);
      expect(expectedProgressAfter(current, 0)).assertEqual(100);
      expect(expectedProgressAfter(current, 100)).assertEqual(100);
      expect(incoming.length).assertEqual(6);
    });

    /**
     * @tc.name   schemeAndHostComposeTheOriginPrefix
     * @tc.desc   Concatenating the extracted scheme and host reproduces the authority prefix of each URL.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferToolValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemeAndHostComposeTheOriginPrefix', 0, () => {
      const samples: string[] = [
        MEDIA_URL,
        'http://gitee.com/a/b.png',
        'ftp://mirror.example.org/pub/a.tar.gz',
        'https://gitee.com:8443/a/b.png'
      ];
      let composed: number = 0;
      for (let index = 0; index < samples.length; index++) {
        const prefix: string = schemeOf(samples[index]) + '://' + hostOf(samples[index]);
        expect(samples[index].startsWith(prefix)).assertTrue();
        if (prefix.length > 8) {
          composed = composed + 1;
        }
      }
      logStep('schemeAndHostComposeTheOriginPrefix', String(composed));
      expect(composed).assertEqual(4);
      expect(schemeOf(samples[0]) + '://' + hostOf(samples[0])).assertEqual('https://gitee.com');
      expect(schemeOf(samples[2]) + '://' + hostOf(samples[2])).assertEqual('ftp://mirror.example.org');
      expect(schemeOf(samples[1]) + '://' + hostOf(samples[1])).assertEqual('http://gitee.com');
      expect(schemeOf(samples[3]) + '://' + hostOf(samples[3])).assertEqual('https://gitee.com:8443');
      expect(hostOf(samples[2])).assertEqual('mirror.example.org');
      expect(fileNameOf(samples[2])).assertEqual('a.tar.gz');
      expect(extensionOf(samples[2])).assertEqual('.gz');
    });
  });
}
