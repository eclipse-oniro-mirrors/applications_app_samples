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
 
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import {
  DownloadState,
  DownloadTarget,
  beginAttempt,
  downloadStateName,
  isStaleAttempt,
  nextDownloadState,
  resolveDownloadTarget,
  shouldFallbackOnTimeout,
  supportsDocumentPicker
} from '../../../main/ets/model/DownloadFlow';

export default function downloadFlowMatrixTest() {
  describe('downloadFlowMatrixTest', () => {

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOWMATRIX_0100
     * @tc.name pickerPhone010
     * @tc.desc Verify the phone device type supports the document picker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('picker_phone', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(supportsDocumentPicker('phone')).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOWMATRIX_0200
     * @tc.name pickerTablet020
     * @tc.desc Verify the tablet device type supports the document picker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('picker_tablet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(supportsDocumentPicker('tablet')).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOWMATRIX_0300
     * @tc.name pickerTwoInOne030
     * @tc.desc Verify the 2in1 device type supports the document picker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('picker_twoInOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(supportsDocumentPicker('2in1')).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOWMATRIX_0400
     * @tc.name pickerDefault040
     * @tc.desc Verify the default device type reports no picker support
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('picker_default', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(supportsDocumentPicker('default')).assertFalse();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOWMATRIX_0500
     * @tc.name pickerWatch050
     * @tc.desc Verify an unsupported device type reports no picker support
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('picker_watch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(supportsDocumentPicker('watch')).assertFalse();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOWMATRIX_0600
     * @tc.name pickerCaseSensitive060
     * @tc.desc Verify device type matching is case sensitive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('picker_caseSensitive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(supportsDocumentPicker('Phone')).assertFalse();
      expect(supportsDocumentPicker('')).assertFalse();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOWMATRIX_0700
     * @tc.name targetPhone070
     * @tc.desc Verify a phone download resolves to the document picker target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('target_phone', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(resolveDownloadTarget('phone')).assertEqual(DownloadTarget.PICKER);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOWMATRIX_0800
     * @tc.name targetDefault080
     * @tc.desc Verify the default device type resolves to the sandbox target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('target_default', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(resolveDownloadTarget('default')).assertEqual(DownloadTarget.SANDBOX);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOWMATRIX_0900
     * @tc.name targetUnknown090
     * @tc.desc Verify an unknown device type resolves to the sandbox target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('target_unknown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(resolveDownloadTarget('unknown')).assertEqual(DownloadTarget.SANDBOX);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOWMATRIX_1000
     * @tc.name attemptFromZero100
     * @tc.desc Verify the first attempt token starts at one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('attempt_fromZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(beginAttempt(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOWMATRIX_1100
     * @tc.name attemptFromFortyOne110
     * @tc.desc Verify a later attempt token increments from its previous value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('attempt_fromFortyOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(beginAttempt(41)).assertEqual(42);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOWMATRIX_1200
     * @tc.name attemptChain120
     * @tc.desc Verify three consecutive attempts produce a strictly increasing sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('attempt_chain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const first = beginAttempt(0);
      const second = beginAttempt(first);
      const third = beginAttempt(second);
      expect(first).assertEqual(1);
      expect(second).assertEqual(2);
      expect(third).assertEqual(3);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOWMATRIX_1300
     * @tc.name staleSameToken130
     * @tc.desc Verify the active token is not considered stale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('stale_sameToken', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(isStaleAttempt(5, 5)).assertFalse();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOWMATRIX_1400
     * @tc.name staleOlderToken140
     * @tc.desc Verify a token that is not the active one is stale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('stale_olderToken', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(isStaleAttempt(5, 6)).assertTrue();
      expect(isStaleAttempt(6, 5)).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOWMATRIX_1500
     * @tc.name staleZeroToken150
     * @tc.desc Verify token zero is not stale against an active zero token
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('stale_zeroToken', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(isStaleAttempt(0, 0)).assertFalse();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOWMATRIX_1600
     * @tc.name fallbackUnsettledCurrent160
     * @tc.desc Verify a timeout on the current unsettled attempt triggers the fallback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fallback_unsettledCurrent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(shouldFallbackOnTimeout(false, 5, 5)).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOWMATRIX_1700
     * @tc.name fallbackSettledCurrent170
     * @tc.desc Verify a settled attempt never triggers the timeout fallback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fallback_settledCurrent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(shouldFallbackOnTimeout(true, 5, 5)).assertFalse();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOWMATRIX_1800
     * @tc.name fallbackUnsettledStale180
     * @tc.desc Verify a stale attempt never triggers the timeout fallback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fallback_unsettledStale', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(shouldFallbackOnTimeout(false, 4, 5)).assertFalse();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOWMATRIX_1900
     * @tc.name fallbackSettledStale190
     * @tc.desc Verify a settled stale attempt never triggers the timeout fallback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fallback_settledStale', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(shouldFallbackOnTimeout(true, 4, 5)).assertFalse();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOWMATRIX_2000
     * @tc.name nextStateSuccess200
     * @tc.desc Verify a successful save moves the flow to the SUCCESS state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('nextState_success', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(nextDownloadState(DownloadState.PICKING, true)).assertEqual(DownloadState.SUCCESS);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOWMATRIX_2100
     * @tc.name nextStateFallback210
     * @tc.desc Verify a failed save moves the flow to the FALLBACK state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('nextState_fallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(nextDownloadState(DownloadState.PICKING, false)).assertEqual(DownloadState.FALLBACK);
      expect(nextDownloadState(DownloadState.FAILED, true)).assertEqual(DownloadState.SUCCESS);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOWMATRIX_2200
     * @tc.name stateNameIdle220
     * @tc.desc Verify the idle state renders its pending label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('stateName_idle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(downloadStateName(DownloadState.IDLE).id > 0).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOWMATRIX_2300
     * @tc.name stateNamePicking230
     * @tc.desc Verify the picking state renders its picker waiting label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('stateName_picking', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(downloadStateName(DownloadState.PICKING).id > 0).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOWMATRIX_2400
     * @tc.name stateNameSuccess240
     * @tc.desc Verify the success state renders its saved label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('stateName_success', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(downloadStateName(DownloadState.SUCCESS).id > 0).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOWMATRIX_2500
     * @tc.name stateNameFallback250
     * @tc.desc Verify the fallback state renders its sandbox degradation label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('stateName_fallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(downloadStateName(DownloadState.FALLBACK).id > 0).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOWMATRIX_2600
     * @tc.name stateNameFailed260
     * @tc.desc Verify the failed state renders its failure label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('stateName_failed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(downloadStateName(DownloadState.FAILED).id > 0).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOWMATRIX_2700
     * @tc.name timeoutThenSuccessFlow270
     * @tc.desc Verify a timeout on the first attempt degrades while the second attempt recovers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('timeoutThenSuccess_flow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const first = beginAttempt(0);
      const second = beginAttempt(first);
      expect(isStaleAttempt(first, second)).assertTrue();
      expect(shouldFallbackOnTimeout(false, first, second)).assertFalse();
      expect(shouldFallbackOnTimeout(false, second, second)).assertTrue();
      expect(nextDownloadState(DownloadState.PICKING, false)).assertEqual(DownloadState.FALLBACK);
      expect(nextDownloadState(DownloadState.PICKING, true)).assertEqual(DownloadState.SUCCESS);
    });
  });
}
