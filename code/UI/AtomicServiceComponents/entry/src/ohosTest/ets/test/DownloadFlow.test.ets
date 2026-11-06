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
 
import { describe, it, expect } from '@ohos/hypium';
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

export default function downloadFlowTest() {
  describe('downloadFlowTest', () => {

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOW_0100
     * @tc.name downloadStateEnumValues001
     * @tc.desc Verify the DownloadState enum keeps its documented numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('downloadState_enumValues', 0, () => {
      expect(DownloadState.IDLE).assertEqual(0);
      expect(DownloadState.PICKING).assertEqual(1);
      expect(DownloadState.SUCCESS).assertEqual(2);
      expect(DownloadState.FALLBACK).assertEqual(3);
      expect(DownloadState.FAILED).assertEqual(4);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOW_0200
     * @tc.name downloadTargetEnumValues002
     * @tc.desc Verify the DownloadTarget enum string values used for routing decisions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('downloadTarget_enumValues', 0, () => {
      expect(DownloadTarget.PICKER).assertEqual('picker');
      expect(DownloadTarget.SANDBOX).assertEqual('sandbox');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOW_0300
     * @tc.name pickerSupportMatrix003
     * @tc.desc Verify document picker support only covers phone, tablet and 2in1 device types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pickerSupport_matrix', 0, () => {
      expect(supportsDocumentPicker('phone')).assertTrue();
      expect(supportsDocumentPicker('tablet')).assertTrue();
      expect(supportsDocumentPicker('2in1')).assertTrue();
      expect(supportsDocumentPicker('default')).assertFalse();
      expect(supportsDocumentPicker('watch')).assertFalse();
      expect(supportsDocumentPicker('')).assertFalse();
      expect(supportsDocumentPicker('Phone')).assertFalse();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOW_0400
     * @tc.name resolveTargetFollowsSupport004
     * @tc.desc Verify download target resolution matches the picker capability for each device type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('resolveTarget_followsSupport', 0, () => {
      expect(resolveDownloadTarget('phone')).assertEqual(DownloadTarget.PICKER);
      expect(resolveDownloadTarget('default')).assertEqual(DownloadTarget.SANDBOX);
      expect(resolveDownloadTarget('unknown')).assertEqual(DownloadTarget.SANDBOX);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOW_0500
     * @tc.name beginAttemptIncrements005
     * @tc.desc Verify each download attempt receives a monotonically increasing token
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('beginAttempt_increments', 0, () => {
      expect(beginAttempt(0)).assertEqual(1);
      expect(beginAttempt(41)).assertEqual(42);
      expect(beginAttempt(-1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOW_0600
     * @tc.name staleAttemptDetection006
     * @tc.desc Verify stale attempt detection compares tokens strictly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('staleAttempt_detection', 0, () => {
      expect(isStaleAttempt(5, 5)).assertFalse();
      expect(isStaleAttempt(5, 6)).assertTrue();
      expect(isStaleAttempt(0, 0)).assertFalse();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOW_0700
     * @tc.name fallbackOnTimeoutRules007
     * @tc.desc Verify timeout fallback only fires for an unsettled current attempt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fallbackOnTimeout_rules', 0, () => {
      expect(shouldFallbackOnTimeout(false, 5, 5)).assertTrue();
      expect(shouldFallbackOnTimeout(true, 5, 5)).assertFalse();
      expect(shouldFallbackOnTimeout(false, 4, 5)).assertFalse();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOW_0800
     * @tc.name nextStateMapping008
     * @tc.desc Verify success and fallback outcomes map to the correct next download states
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('nextState_mapping', 0, () => {
      expect(nextDownloadState(DownloadState.PICKING, true)).assertEqual(DownloadState.SUCCESS);
      expect(nextDownloadState(DownloadState.PICKING, false)).assertEqual(DownloadState.FALLBACK);
      expect(nextDownloadState(DownloadState.FAILED, true)).assertEqual(DownloadState.SUCCESS);
      expect(nextDownloadState(DownloadState.IDLE, false)).assertEqual(DownloadState.FALLBACK);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOW_0900
     * @tc.name stateNameAllStates009
     * @tc.desc Verify every download state renders its documented Chinese label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('stateName_allStates', 0, () => {
      const idleId: number = downloadStateName(DownloadState.IDLE).id;
      expect(idleId > 0).assertTrue();
      expect(downloadStateName(DownloadState.PICKING).id !== idleId).assertTrue();
      expect(downloadStateName(DownloadState.SUCCESS).id !== idleId).assertTrue();
      expect(downloadStateName(DownloadState.FALLBACK).id !== idleId).assertTrue();
      expect(downloadStateName(DownloadState.FAILED).id !== idleId).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOW_1000
     * @tc.name attemptFlowEndToEnd010
     * @tc.desc Verify a full attempt sequence advances tokens, detects staleness and resolves the timeout outcome
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('attemptFlow_endToEnd', 0, () => {
      const first = beginAttempt(0);
      const second = beginAttempt(first);
      expect(second).assertEqual(first + 1);
      expect(isStaleAttempt(first, second)).assertTrue();
      expect(shouldFallbackOnTimeout(false, first, second)).assertFalse();
      const timedOut = shouldFallbackOnTimeout(false, second, second);
      expect(timedOut).assertTrue();
      expect(nextDownloadState(DownloadState.PICKING, !timedOut)).assertEqual(DownloadState.FALLBACK);
      expect(shouldFallbackOnTimeout(true, second, second)).assertFalse();
      expect(nextDownloadState(DownloadState.PICKING, true)).assertEqual(DownloadState.SUCCESS);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_DOWNLOADFLOW_1100
     * @tc.name stateNameUnknownFallsBackToIdle011
     * @tc.desc Verify an out-of-range state renders the idle label instead of throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('stateName_unknownFallsBackToIdle', 0, () => {
      const idleId: number = downloadStateName(DownloadState.IDLE).id;
      expect(downloadStateName(99 as DownloadState).id).assertEqual(idleId);
      expect(downloadStateName(-1 as DownloadState).id).assertEqual(idleId);
    });
  });
}
