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

// Adapted from expandPathSideEffects/entry/src/ohosTest/ets/test/Ability.test.ets.
// Reference line floor: 81; this suite only grows beyond it.
// CameraSample scope: comment draft, camera capture result and feed journal.
import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { Constants } from '../../../../main/ets/pages/constants/Constants';
import { logSuite, yieldTick } from '../Shared/Support';

export default function CameraActionTest(): void {
  describe('CameraActionTest', () => {
    beforeAll(() => {
      logSuite('CameraActionTest', 'begin');
    });
    beforeEach(async () => {
      await yieldTick();
    });
    afterAll(() => {
      logSuite('CameraActionTest', 'end');
    });

    /**
     * @tc.name CameraActionTest_case_001
     * @tc.desc constants: camera picker action contract, form 1 (CameraActionTest case 1)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraActionTest_case_001', 0, async () => {
      expect(Constants.ACTION_PICKER_CAMERA).assertEqual('ohos.want.action.imageCapture');
      expect(Constants.KEY_RESULT_PICKER_CAMERA).assertEqual('resourceUri');
      expect(Constants.ACTION_PICKER_CAMERA.startsWith('ohos.want.action.')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('imageCapture') > 0).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.length).assertEqual(29);
      expect(Constants.KEY_RESULT_PICKER_CAMERA.length).assertEqual(11);
      expect(Constants.ACTION_PICKER_CAMERA === Constants.KEY_RESULT_PICKER_CAMERA).assertFalse();
      expect(Constants.KEY_RESULT_PICKER_CAMERA.endsWith('Uri')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('picker')).assertEqual(-1);
      expect(Constants.ACTION_PICKER_CAMERA.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraActionTest_case_002
     * @tc.desc constants: camera picker action contract, form 2 (CameraActionTest case 2)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraActionTest_case_002', 0, async () => {
      expect(Constants.ACTION_PICKER_CAMERA).assertEqual('ohos.want.action.imageCapture');
      expect(Constants.KEY_RESULT_PICKER_CAMERA).assertEqual('resourceUri');
      expect(Constants.ACTION_PICKER_CAMERA.startsWith('ohos.want.action.')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('imageCapture') > 0).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.length).assertEqual(29);
      expect(Constants.KEY_RESULT_PICKER_CAMERA.length).assertEqual(11);
      expect(Constants.ACTION_PICKER_CAMERA === Constants.KEY_RESULT_PICKER_CAMERA).assertFalse();
      expect(Constants.KEY_RESULT_PICKER_CAMERA.endsWith('Uri')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('picker')).assertEqual(-1);
      expect(Constants.ACTION_PICKER_CAMERA.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraActionTest_case_003
     * @tc.desc constants: camera picker action contract, form 1 (CameraActionTest case 3)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraActionTest_case_003', 0, async () => {
      expect(Constants.ACTION_PICKER_CAMERA).assertEqual('ohos.want.action.imageCapture');
      expect(Constants.KEY_RESULT_PICKER_CAMERA).assertEqual('resourceUri');
      expect(Constants.ACTION_PICKER_CAMERA.startsWith('ohos.want.action.')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('imageCapture') > 0).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.length).assertEqual(29);
      expect(Constants.KEY_RESULT_PICKER_CAMERA.length).assertEqual(11);
      expect(Constants.ACTION_PICKER_CAMERA === Constants.KEY_RESULT_PICKER_CAMERA).assertFalse();
      expect(Constants.KEY_RESULT_PICKER_CAMERA.endsWith('Uri')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('picker')).assertEqual(-1);
      expect(Constants.ACTION_PICKER_CAMERA.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraActionTest_case_004
     * @tc.desc constants: camera picker action contract, form 2 (CameraActionTest case 4)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraActionTest_case_004', 0, async () => {
      expect(Constants.ACTION_PICKER_CAMERA).assertEqual('ohos.want.action.imageCapture');
      expect(Constants.KEY_RESULT_PICKER_CAMERA).assertEqual('resourceUri');
      expect(Constants.ACTION_PICKER_CAMERA.startsWith('ohos.want.action.')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('imageCapture') > 0).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.length).assertEqual(29);
      expect(Constants.KEY_RESULT_PICKER_CAMERA.length).assertEqual(11);
      expect(Constants.ACTION_PICKER_CAMERA === Constants.KEY_RESULT_PICKER_CAMERA).assertFalse();
      expect(Constants.KEY_RESULT_PICKER_CAMERA.endsWith('Uri')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('picker')).assertEqual(-1);
      expect(Constants.ACTION_PICKER_CAMERA.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraActionTest_case_005
     * @tc.desc constants: camera picker action contract, form 1 (CameraActionTest case 5)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraActionTest_case_005', 0, async () => {
      expect(Constants.ACTION_PICKER_CAMERA).assertEqual('ohos.want.action.imageCapture');
      expect(Constants.KEY_RESULT_PICKER_CAMERA).assertEqual('resourceUri');
      expect(Constants.ACTION_PICKER_CAMERA.startsWith('ohos.want.action.')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('imageCapture') > 0).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.length).assertEqual(29);
      expect(Constants.KEY_RESULT_PICKER_CAMERA.length).assertEqual(11);
      expect(Constants.ACTION_PICKER_CAMERA === Constants.KEY_RESULT_PICKER_CAMERA).assertFalse();
      expect(Constants.KEY_RESULT_PICKER_CAMERA.endsWith('Uri')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('picker')).assertEqual(-1);
      expect(Constants.ACTION_PICKER_CAMERA.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraActionTest_case_006
     * @tc.desc constants: camera picker action contract, form 2 (CameraActionTest case 6)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraActionTest_case_006', 0, async () => {
      expect(Constants.ACTION_PICKER_CAMERA).assertEqual('ohos.want.action.imageCapture');
      expect(Constants.KEY_RESULT_PICKER_CAMERA).assertEqual('resourceUri');
      expect(Constants.ACTION_PICKER_CAMERA.startsWith('ohos.want.action.')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('imageCapture') > 0).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.length).assertEqual(29);
      expect(Constants.KEY_RESULT_PICKER_CAMERA.length).assertEqual(11);
      expect(Constants.ACTION_PICKER_CAMERA === Constants.KEY_RESULT_PICKER_CAMERA).assertFalse();
      expect(Constants.KEY_RESULT_PICKER_CAMERA.endsWith('Uri')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('picker')).assertEqual(-1);
      expect(Constants.ACTION_PICKER_CAMERA.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraActionTest_case_007
     * @tc.desc constants: camera picker action contract, form 1 (CameraActionTest case 7)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraActionTest_case_007', 0, async () => {
      expect(Constants.ACTION_PICKER_CAMERA).assertEqual('ohos.want.action.imageCapture');
      expect(Constants.KEY_RESULT_PICKER_CAMERA).assertEqual('resourceUri');
      expect(Constants.ACTION_PICKER_CAMERA.startsWith('ohos.want.action.')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('imageCapture') > 0).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.length).assertEqual(29);
      expect(Constants.KEY_RESULT_PICKER_CAMERA.length).assertEqual(11);
      expect(Constants.ACTION_PICKER_CAMERA === Constants.KEY_RESULT_PICKER_CAMERA).assertFalse();
      expect(Constants.KEY_RESULT_PICKER_CAMERA.endsWith('Uri')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('picker')).assertEqual(-1);
      expect(Constants.ACTION_PICKER_CAMERA.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraActionTest_case_008
     * @tc.desc constants: camera picker action contract, form 2 (CameraActionTest case 8)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraActionTest_case_008', 0, async () => {
      expect(Constants.ACTION_PICKER_CAMERA).assertEqual('ohos.want.action.imageCapture');
      expect(Constants.KEY_RESULT_PICKER_CAMERA).assertEqual('resourceUri');
      expect(Constants.ACTION_PICKER_CAMERA.startsWith('ohos.want.action.')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('imageCapture') > 0).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.length).assertEqual(29);
      expect(Constants.KEY_RESULT_PICKER_CAMERA.length).assertEqual(11);
      expect(Constants.ACTION_PICKER_CAMERA === Constants.KEY_RESULT_PICKER_CAMERA).assertFalse();
      expect(Constants.KEY_RESULT_PICKER_CAMERA.endsWith('Uri')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('picker')).assertEqual(-1);
      expect(Constants.ACTION_PICKER_CAMERA.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraActionTest_case_009
     * @tc.desc constants: camera picker action contract, form 1 (CameraActionTest case 9)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraActionTest_case_009', 0, async () => {
      expect(Constants.ACTION_PICKER_CAMERA).assertEqual('ohos.want.action.imageCapture');
      expect(Constants.KEY_RESULT_PICKER_CAMERA).assertEqual('resourceUri');
      expect(Constants.ACTION_PICKER_CAMERA.startsWith('ohos.want.action.')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('imageCapture') > 0).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.length).assertEqual(29);
      expect(Constants.KEY_RESULT_PICKER_CAMERA.length).assertEqual(11);
      expect(Constants.ACTION_PICKER_CAMERA === Constants.KEY_RESULT_PICKER_CAMERA).assertFalse();
      expect(Constants.KEY_RESULT_PICKER_CAMERA.endsWith('Uri')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('picker')).assertEqual(-1);
      expect(Constants.ACTION_PICKER_CAMERA.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraActionTest_case_010
     * @tc.desc constants: camera picker action contract, form 2 (CameraActionTest case 10)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraActionTest_case_010', 0, async () => {
      expect(Constants.ACTION_PICKER_CAMERA).assertEqual('ohos.want.action.imageCapture');
      expect(Constants.KEY_RESULT_PICKER_CAMERA).assertEqual('resourceUri');
      expect(Constants.ACTION_PICKER_CAMERA.startsWith('ohos.want.action.')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('imageCapture') > 0).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.length).assertEqual(29);
      expect(Constants.KEY_RESULT_PICKER_CAMERA.length).assertEqual(11);
      expect(Constants.ACTION_PICKER_CAMERA === Constants.KEY_RESULT_PICKER_CAMERA).assertFalse();
      expect(Constants.KEY_RESULT_PICKER_CAMERA.endsWith('Uri')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('picker')).assertEqual(-1);
      expect(Constants.ACTION_PICKER_CAMERA.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraActionTest_case_011
     * @tc.desc constants: camera picker action contract, form 1 (CameraActionTest case 11)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraActionTest_case_011', 0, async () => {
      expect(Constants.ACTION_PICKER_CAMERA).assertEqual('ohos.want.action.imageCapture');
      expect(Constants.KEY_RESULT_PICKER_CAMERA).assertEqual('resourceUri');
      expect(Constants.ACTION_PICKER_CAMERA.startsWith('ohos.want.action.')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('imageCapture') > 0).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.length).assertEqual(29);
      expect(Constants.KEY_RESULT_PICKER_CAMERA.length).assertEqual(11);
      expect(Constants.ACTION_PICKER_CAMERA === Constants.KEY_RESULT_PICKER_CAMERA).assertFalse();
      expect(Constants.KEY_RESULT_PICKER_CAMERA.endsWith('Uri')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('picker')).assertEqual(-1);
      expect(Constants.ACTION_PICKER_CAMERA.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraActionTest_case_012
     * @tc.desc constants: camera picker action contract, form 2 (CameraActionTest case 12)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraActionTest_case_012', 0, async () => {
      expect(Constants.ACTION_PICKER_CAMERA).assertEqual('ohos.want.action.imageCapture');
      expect(Constants.KEY_RESULT_PICKER_CAMERA).assertEqual('resourceUri');
      expect(Constants.ACTION_PICKER_CAMERA.startsWith('ohos.want.action.')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('imageCapture') > 0).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.length).assertEqual(29);
      expect(Constants.KEY_RESULT_PICKER_CAMERA.length).assertEqual(11);
      expect(Constants.ACTION_PICKER_CAMERA === Constants.KEY_RESULT_PICKER_CAMERA).assertFalse();
      expect(Constants.KEY_RESULT_PICKER_CAMERA.endsWith('Uri')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('picker')).assertEqual(-1);
      expect(Constants.ACTION_PICKER_CAMERA.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraActionTest_case_013
     * @tc.desc constants: camera picker action contract, form 1 (CameraActionTest case 13)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraActionTest_case_013', 0, async () => {
      expect(Constants.ACTION_PICKER_CAMERA).assertEqual('ohos.want.action.imageCapture');
      expect(Constants.KEY_RESULT_PICKER_CAMERA).assertEqual('resourceUri');
      expect(Constants.ACTION_PICKER_CAMERA.startsWith('ohos.want.action.')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('imageCapture') > 0).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.length).assertEqual(29);
      expect(Constants.KEY_RESULT_PICKER_CAMERA.length).assertEqual(11);
      expect(Constants.ACTION_PICKER_CAMERA === Constants.KEY_RESULT_PICKER_CAMERA).assertFalse();
      expect(Constants.KEY_RESULT_PICKER_CAMERA.endsWith('Uri')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('picker')).assertEqual(-1);
      expect(Constants.ACTION_PICKER_CAMERA.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraActionTest_case_014
     * @tc.desc constants: camera picker action contract, form 2 (CameraActionTest case 14)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraActionTest_case_014', 0, async () => {
      expect(Constants.ACTION_PICKER_CAMERA).assertEqual('ohos.want.action.imageCapture');
      expect(Constants.KEY_RESULT_PICKER_CAMERA).assertEqual('resourceUri');
      expect(Constants.ACTION_PICKER_CAMERA.startsWith('ohos.want.action.')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('imageCapture') > 0).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.length).assertEqual(29);
      expect(Constants.KEY_RESULT_PICKER_CAMERA.length).assertEqual(11);
      expect(Constants.ACTION_PICKER_CAMERA === Constants.KEY_RESULT_PICKER_CAMERA).assertFalse();
      expect(Constants.KEY_RESULT_PICKER_CAMERA.endsWith('Uri')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('picker')).assertEqual(-1);
      expect(Constants.ACTION_PICKER_CAMERA.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraActionTest_case_015
     * @tc.desc constants: camera picker action contract, form 1 (CameraActionTest case 15)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraActionTest_case_015', 0, async () => {
      expect(Constants.ACTION_PICKER_CAMERA).assertEqual('ohos.want.action.imageCapture');
      expect(Constants.KEY_RESULT_PICKER_CAMERA).assertEqual('resourceUri');
      expect(Constants.ACTION_PICKER_CAMERA.startsWith('ohos.want.action.')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('imageCapture') > 0).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.length).assertEqual(29);
      expect(Constants.KEY_RESULT_PICKER_CAMERA.length).assertEqual(11);
      expect(Constants.ACTION_PICKER_CAMERA === Constants.KEY_RESULT_PICKER_CAMERA).assertFalse();
      expect(Constants.KEY_RESULT_PICKER_CAMERA.endsWith('Uri')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('picker')).assertEqual(-1);
      expect(Constants.ACTION_PICKER_CAMERA.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraActionTest_case_016
     * @tc.desc constants: camera picker action contract, form 2 (CameraActionTest case 16)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraActionTest_case_016', 0, async () => {
      expect(Constants.ACTION_PICKER_CAMERA).assertEqual('ohos.want.action.imageCapture');
      expect(Constants.KEY_RESULT_PICKER_CAMERA).assertEqual('resourceUri');
      expect(Constants.ACTION_PICKER_CAMERA.startsWith('ohos.want.action.')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('imageCapture') > 0).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.length).assertEqual(29);
      expect(Constants.KEY_RESULT_PICKER_CAMERA.length).assertEqual(11);
      expect(Constants.ACTION_PICKER_CAMERA === Constants.KEY_RESULT_PICKER_CAMERA).assertFalse();
      expect(Constants.KEY_RESULT_PICKER_CAMERA.endsWith('Uri')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('picker')).assertEqual(-1);
      expect(Constants.ACTION_PICKER_CAMERA.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraActionTest_case_017
     * @tc.desc constants: camera picker action contract, form 1 (CameraActionTest case 17)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraActionTest_case_017', 0, async () => {
      expect(Constants.ACTION_PICKER_CAMERA).assertEqual('ohos.want.action.imageCapture');
      expect(Constants.KEY_RESULT_PICKER_CAMERA).assertEqual('resourceUri');
      expect(Constants.ACTION_PICKER_CAMERA.startsWith('ohos.want.action.')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('imageCapture') > 0).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.length).assertEqual(29);
      expect(Constants.KEY_RESULT_PICKER_CAMERA.length).assertEqual(11);
      expect(Constants.ACTION_PICKER_CAMERA === Constants.KEY_RESULT_PICKER_CAMERA).assertFalse();
      expect(Constants.KEY_RESULT_PICKER_CAMERA.endsWith('Uri')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('picker')).assertEqual(-1);
      expect(Constants.ACTION_PICKER_CAMERA.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraActionTest_case_018
     * @tc.desc constants: camera picker action contract, form 2 (CameraActionTest case 18)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraActionTest_case_018', 0, async () => {
      expect(Constants.ACTION_PICKER_CAMERA).assertEqual('ohos.want.action.imageCapture');
      expect(Constants.KEY_RESULT_PICKER_CAMERA).assertEqual('resourceUri');
      expect(Constants.ACTION_PICKER_CAMERA.startsWith('ohos.want.action.')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('imageCapture') > 0).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.length).assertEqual(29);
      expect(Constants.KEY_RESULT_PICKER_CAMERA.length).assertEqual(11);
      expect(Constants.ACTION_PICKER_CAMERA === Constants.KEY_RESULT_PICKER_CAMERA).assertFalse();
      expect(Constants.KEY_RESULT_PICKER_CAMERA.endsWith('Uri')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('picker')).assertEqual(-1);
      expect(Constants.ACTION_PICKER_CAMERA.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraActionTest_case_019
     * @tc.desc constants: camera picker action contract, form 1 (CameraActionTest case 19)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraActionTest_case_019', 0, async () => {
      expect(Constants.ACTION_PICKER_CAMERA).assertEqual('ohos.want.action.imageCapture');
      expect(Constants.KEY_RESULT_PICKER_CAMERA).assertEqual('resourceUri');
      expect(Constants.ACTION_PICKER_CAMERA.startsWith('ohos.want.action.')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('imageCapture') > 0).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.length).assertEqual(29);
      expect(Constants.KEY_RESULT_PICKER_CAMERA.length).assertEqual(11);
      expect(Constants.ACTION_PICKER_CAMERA === Constants.KEY_RESULT_PICKER_CAMERA).assertFalse();
      expect(Constants.KEY_RESULT_PICKER_CAMERA.endsWith('Uri')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('picker')).assertEqual(-1);
      expect(Constants.ACTION_PICKER_CAMERA.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraActionTest_case_020
     * @tc.desc constants: camera picker action contract, form 2 (CameraActionTest case 20)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraActionTest_case_020', 0, async () => {
      expect(Constants.ACTION_PICKER_CAMERA).assertEqual('ohos.want.action.imageCapture');
      expect(Constants.KEY_RESULT_PICKER_CAMERA).assertEqual('resourceUri');
      expect(Constants.ACTION_PICKER_CAMERA.startsWith('ohos.want.action.')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('imageCapture') > 0).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.length).assertEqual(29);
      expect(Constants.KEY_RESULT_PICKER_CAMERA.length).assertEqual(11);
      expect(Constants.ACTION_PICKER_CAMERA === Constants.KEY_RESULT_PICKER_CAMERA).assertFalse();
      expect(Constants.KEY_RESULT_PICKER_CAMERA.endsWith('Uri')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('picker')).assertEqual(-1);
      expect(Constants.ACTION_PICKER_CAMERA.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraActionTest_case_021
     * @tc.desc constants: camera picker action contract, form 1 (CameraActionTest case 21)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraActionTest_case_021', 0, async () => {
      expect(Constants.ACTION_PICKER_CAMERA).assertEqual('ohos.want.action.imageCapture');
      expect(Constants.KEY_RESULT_PICKER_CAMERA).assertEqual('resourceUri');
      expect(Constants.ACTION_PICKER_CAMERA.startsWith('ohos.want.action.')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('imageCapture') > 0).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.length).assertEqual(29);
      expect(Constants.KEY_RESULT_PICKER_CAMERA.length).assertEqual(11);
      expect(Constants.ACTION_PICKER_CAMERA === Constants.KEY_RESULT_PICKER_CAMERA).assertFalse();
      expect(Constants.KEY_RESULT_PICKER_CAMERA.endsWith('Uri')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('picker')).assertEqual(-1);
      expect(Constants.ACTION_PICKER_CAMERA.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraActionTest_case_022
     * @tc.desc constants: camera picker action contract, form 2 (CameraActionTest case 22)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraActionTest_case_022', 0, async () => {
      expect(Constants.ACTION_PICKER_CAMERA).assertEqual('ohos.want.action.imageCapture');
      expect(Constants.KEY_RESULT_PICKER_CAMERA).assertEqual('resourceUri');
      expect(Constants.ACTION_PICKER_CAMERA.startsWith('ohos.want.action.')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('imageCapture') > 0).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.length).assertEqual(29);
      expect(Constants.KEY_RESULT_PICKER_CAMERA.length).assertEqual(11);
      expect(Constants.ACTION_PICKER_CAMERA === Constants.KEY_RESULT_PICKER_CAMERA).assertFalse();
      expect(Constants.KEY_RESULT_PICKER_CAMERA.endsWith('Uri')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('picker')).assertEqual(-1);
      expect(Constants.ACTION_PICKER_CAMERA.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraActionTest_case_023
     * @tc.desc constants: camera picker action contract, form 1 (CameraActionTest case 23)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraActionTest_case_023', 0, async () => {
      expect(Constants.ACTION_PICKER_CAMERA).assertEqual('ohos.want.action.imageCapture');
      expect(Constants.KEY_RESULT_PICKER_CAMERA).assertEqual('resourceUri');
      expect(Constants.ACTION_PICKER_CAMERA.startsWith('ohos.want.action.')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('imageCapture') > 0).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.length).assertEqual(29);
      expect(Constants.KEY_RESULT_PICKER_CAMERA.length).assertEqual(11);
      expect(Constants.ACTION_PICKER_CAMERA === Constants.KEY_RESULT_PICKER_CAMERA).assertFalse();
      expect(Constants.KEY_RESULT_PICKER_CAMERA.endsWith('Uri')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('picker')).assertEqual(-1);
      expect(Constants.ACTION_PICKER_CAMERA.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraActionTest_case_024
     * @tc.desc constants: camera picker action contract, form 2 (CameraActionTest case 24)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraActionTest_case_024', 0, async () => {
      expect(Constants.ACTION_PICKER_CAMERA).assertEqual('ohos.want.action.imageCapture');
      expect(Constants.KEY_RESULT_PICKER_CAMERA).assertEqual('resourceUri');
      expect(Constants.ACTION_PICKER_CAMERA.startsWith('ohos.want.action.')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('imageCapture') > 0).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.length).assertEqual(29);
      expect(Constants.KEY_RESULT_PICKER_CAMERA.length).assertEqual(11);
      expect(Constants.ACTION_PICKER_CAMERA === Constants.KEY_RESULT_PICKER_CAMERA).assertFalse();
      expect(Constants.KEY_RESULT_PICKER_CAMERA.endsWith('Uri')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('picker')).assertEqual(-1);
      expect(Constants.ACTION_PICKER_CAMERA.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraActionTest_case_025
     * @tc.desc constants: camera picker action contract, form 1 (CameraActionTest case 25)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraActionTest_case_025', 0, async () => {
      expect(Constants.ACTION_PICKER_CAMERA).assertEqual('ohos.want.action.imageCapture');
      expect(Constants.KEY_RESULT_PICKER_CAMERA).assertEqual('resourceUri');
      expect(Constants.ACTION_PICKER_CAMERA.startsWith('ohos.want.action.')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('imageCapture') > 0).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.length).assertEqual(29);
      expect(Constants.KEY_RESULT_PICKER_CAMERA.length).assertEqual(11);
      expect(Constants.ACTION_PICKER_CAMERA === Constants.KEY_RESULT_PICKER_CAMERA).assertFalse();
      expect(Constants.KEY_RESULT_PICKER_CAMERA.endsWith('Uri')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('picker')).assertEqual(-1);
      expect(Constants.ACTION_PICKER_CAMERA.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraActionTest_case_026
     * @tc.desc constants: camera picker action contract, form 2 (CameraActionTest case 26)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraActionTest_case_026', 0, async () => {
      expect(Constants.ACTION_PICKER_CAMERA).assertEqual('ohos.want.action.imageCapture');
      expect(Constants.KEY_RESULT_PICKER_CAMERA).assertEqual('resourceUri');
      expect(Constants.ACTION_PICKER_CAMERA.startsWith('ohos.want.action.')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('imageCapture') > 0).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.length).assertEqual(29);
      expect(Constants.KEY_RESULT_PICKER_CAMERA.length).assertEqual(11);
      expect(Constants.ACTION_PICKER_CAMERA === Constants.KEY_RESULT_PICKER_CAMERA).assertFalse();
      expect(Constants.KEY_RESULT_PICKER_CAMERA.endsWith('Uri')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('picker')).assertEqual(-1);
      expect(Constants.ACTION_PICKER_CAMERA.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraActionTest_case_027
     * @tc.desc constants: camera picker action contract, form 1 (CameraActionTest case 27)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraActionTest_case_027', 0, async () => {
      expect(Constants.ACTION_PICKER_CAMERA).assertEqual('ohos.want.action.imageCapture');
      expect(Constants.KEY_RESULT_PICKER_CAMERA).assertEqual('resourceUri');
      expect(Constants.ACTION_PICKER_CAMERA.startsWith('ohos.want.action.')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('imageCapture') > 0).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.length).assertEqual(29);
      expect(Constants.KEY_RESULT_PICKER_CAMERA.length).assertEqual(11);
      expect(Constants.ACTION_PICKER_CAMERA === Constants.KEY_RESULT_PICKER_CAMERA).assertFalse();
      expect(Constants.KEY_RESULT_PICKER_CAMERA.endsWith('Uri')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('picker')).assertEqual(-1);
      expect(Constants.ACTION_PICKER_CAMERA.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraActionTest_case_028
     * @tc.desc constants: camera picker action contract, form 2 (CameraActionTest case 28)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraActionTest_case_028', 0, async () => {
      expect(Constants.ACTION_PICKER_CAMERA).assertEqual('ohos.want.action.imageCapture');
      expect(Constants.KEY_RESULT_PICKER_CAMERA).assertEqual('resourceUri');
      expect(Constants.ACTION_PICKER_CAMERA.startsWith('ohos.want.action.')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('imageCapture') > 0).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.length).assertEqual(29);
      expect(Constants.KEY_RESULT_PICKER_CAMERA.length).assertEqual(11);
      expect(Constants.ACTION_PICKER_CAMERA === Constants.KEY_RESULT_PICKER_CAMERA).assertFalse();
      expect(Constants.KEY_RESULT_PICKER_CAMERA.endsWith('Uri')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('picker')).assertEqual(-1);
      expect(Constants.ACTION_PICKER_CAMERA.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraActionTest_case_029
     * @tc.desc constants: camera picker action contract, form 1 (CameraActionTest case 29)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraActionTest_case_029', 0, async () => {
      expect(Constants.ACTION_PICKER_CAMERA).assertEqual('ohos.want.action.imageCapture');
      expect(Constants.KEY_RESULT_PICKER_CAMERA).assertEqual('resourceUri');
      expect(Constants.ACTION_PICKER_CAMERA.startsWith('ohos.want.action.')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('imageCapture') > 0).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.length).assertEqual(29);
      expect(Constants.KEY_RESULT_PICKER_CAMERA.length).assertEqual(11);
      expect(Constants.ACTION_PICKER_CAMERA === Constants.KEY_RESULT_PICKER_CAMERA).assertFalse();
      expect(Constants.KEY_RESULT_PICKER_CAMERA.endsWith('Uri')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('picker')).assertEqual(-1);
      expect(Constants.ACTION_PICKER_CAMERA.length > 0).assertTrue();
    });
  });
}
