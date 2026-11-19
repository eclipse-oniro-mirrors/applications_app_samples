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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { KeyboardAvoidState } from '../model/KeyboardAvoidLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_KeyboardAvoid]';
const BUNDLE: string = 'KeyboardAvoid_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for KeyboardAvoidState.onKeyboardHeightChange (43 cases). */
export default function keyboardAvoidStateOnKeyboardHeightChange2Test(): void {
  describe('KeyboardAvoidStateOnKeyboardHeightChange2Test', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0078
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0078
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=1705.72) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0078 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(1705.72);
      logInfo(`onKeyboardHeightChange(heightPx=1705.72): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=1705.72) ...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(568.5733333333334, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0078 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0079
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0079
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=-741) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0079 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(-741);
      logInfo(`onKeyboardHeightChange(heightPx=-741): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`onKeyboardHeightChange(heightPx=-741) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(-247);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0079 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0080
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0080
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=1829.94) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0080 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(1829.94);
      logInfo(`onKeyboardHeightChange(heightPx=1829.94): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=1829.94) ...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(609.98, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0080 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0081
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0081
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=-115) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0081 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(-115);
      logInfo(`onKeyboardHeightChange(heightPx=-115): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`onKeyboardHeightChange(heightPx=-115) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(-38.333333333333336, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0081 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0082
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0082
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=1070.49) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0082 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(1070.49);
      logInfo(`onKeyboardHeightChange(heightPx=1070.49): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=1070.49) ...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(356.83, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0082 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0083
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0083
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=2121) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0083 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(2121);
      logInfo(`onKeyboardHeightChange(heightPx=2121): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=2121) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(707);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0083 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0084
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0084
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=3295) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0084 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(3295);
      logInfo(`onKeyboardHeightChange(heightPx=3295): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=3295) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(1098.3333333333333, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0084 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0085
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0085
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=2466) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0085 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(2466);
      logInfo(`onKeyboardHeightChange(heightPx=2466): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=2466) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(822);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0085 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0086
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0086
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=642.09) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0086 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(642.09);
      logInfo(`onKeyboardHeightChange(heightPx=642.09): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=642.09) s...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(214.03, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0086 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0087
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0087
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=1951) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0087 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(1951);
      logInfo(`onKeyboardHeightChange(heightPx=1951): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=1951) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(650.3333333333334, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0087 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0088
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0088
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=-1298) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0088 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(-1298);
      logInfo(`onKeyboardHeightChange(heightPx=-1298): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`onKeyboardHeightChange(heightPx=-1298) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(-432.6666666666667, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0088 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0089
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0089
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=635.75) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0089 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(635.75);
      logInfo(`onKeyboardHeightChange(heightPx=635.75): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=635.75) s...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(211.91666666666666, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0089 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0090
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0090
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=3083) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0090 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(3083);
      logInfo(`onKeyboardHeightChange(heightPx=3083): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=3083) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(1027.6666666666667, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0090 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0091
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0091
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=553) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0091 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(553);
      logInfo(`onKeyboardHeightChange(heightPx=553): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=553) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(184.33333333333334, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0091 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0092
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0092
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=2860) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0092 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(2860);
      logInfo(`onKeyboardHeightChange(heightPx=2860): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=2860) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(953.3333333333334, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0092 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0093
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0093
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=2629) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0093 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(2629);
      logInfo(`onKeyboardHeightChange(heightPx=2629): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=2629) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(876.3333333333334, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0093 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0094
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0094
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=1253.82) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0094 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(1253.82);
      logInfo(`onKeyboardHeightChange(heightPx=1253.82): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=1253.82) ...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(417.94, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0094 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0095
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0095
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=-773) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0095 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(-773);
      logInfo(`onKeyboardHeightChange(heightPx=-773): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`onKeyboardHeightChange(heightPx=-773) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(-257.6666666666667, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0095 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0096
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0096
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=196.35) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0096 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(196.35);
      logInfo(`onKeyboardHeightChange(heightPx=196.35): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=196.35) s...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(65.45, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0096 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0097
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0097
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=3338) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0097 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(3338);
      logInfo(`onKeyboardHeightChange(heightPx=3338): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=3338) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(1112.6666666666667, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0097 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0098
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0098
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=3108) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0098 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(3108);
      logInfo(`onKeyboardHeightChange(heightPx=3108): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=3108) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(1036);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0098 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0099
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0099
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=13.04) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0099 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(13.04);
      logInfo(`onKeyboardHeightChange(heightPx=13.04): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=13.04) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(4.346666666666667, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0099 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0100
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0100
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=-516) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0100 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(-516);
      logInfo(`onKeyboardHeightChange(heightPx=-516): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`onKeyboardHeightChange(heightPx=-516) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(-172);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0100 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0101
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0101
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=1299) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0101 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(1299);
      logInfo(`onKeyboardHeightChange(heightPx=1299): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=1299) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(433);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0101 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0102
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0102
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=825.99) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0102 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(825.99);
      logInfo(`onKeyboardHeightChange(heightPx=825.99): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=825.99) s...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(275.33, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0102 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0103
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0103
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=-858) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0103 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(-858);
      logInfo(`onKeyboardHeightChange(heightPx=-858): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`onKeyboardHeightChange(heightPx=-858) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(-286);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0103 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0104
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0104
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=1083) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0104 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(1083);
      logInfo(`onKeyboardHeightChange(heightPx=1083): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=1083) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(361);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0104 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0105
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0105
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=654.88) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0105 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(654.88);
      logInfo(`onKeyboardHeightChange(heightPx=654.88): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=654.88) s...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(218.29333333333332, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0105 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0106
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0106
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=-1371) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0106 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(-1371);
      logInfo(`onKeyboardHeightChange(heightPx=-1371): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`onKeyboardHeightChange(heightPx=-1371) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(-457);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0106 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0107
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0107
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=-219) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0107 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(-219);
      logInfo(`onKeyboardHeightChange(heightPx=-219): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`onKeyboardHeightChange(heightPx=-219) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(-73);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0107 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0108
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0108
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=1196.57) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0108 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(1196.57);
      logInfo(`onKeyboardHeightChange(heightPx=1196.57): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=1196.57) ...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(398.8566666666666, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0108 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0109
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0109
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=3808) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0109 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(3808);
      logInfo(`onKeyboardHeightChange(heightPx=3808): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=3808) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(1269.3333333333333, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0109 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0110
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0110
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=3161) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0110 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(3161);
      logInfo(`onKeyboardHeightChange(heightPx=3161): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=3161) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(1053.6666666666667, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0110 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0111
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0111
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=1551) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0111 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(1551);
      logInfo(`onKeyboardHeightChange(heightPx=1551): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=1551) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(517);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0111 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0112
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0112
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=1444.2) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0112 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(1444.2);
      logInfo(`onKeyboardHeightChange(heightPx=1444.2): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=1444.2) s...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(481.40000000000003, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0112 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0113
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0113
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=855) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0113 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(855);
      logInfo(`onKeyboardHeightChange(heightPx=855): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=855) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(285);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0113 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0114
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0114
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=-378) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0114 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(-378);
      logInfo(`onKeyboardHeightChange(heightPx=-378): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`onKeyboardHeightChange(heightPx=-378) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(-126);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0114 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0115
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0115
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=2737) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0115 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(2737);
      logInfo(`onKeyboardHeightChange(heightPx=2737): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=2737) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(912.3333333333334, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0115 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0116
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0116
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=2017) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0116 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(2017);
      logInfo(`onKeyboardHeightChange(heightPx=2017): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=2017) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(672.3333333333334, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0116 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0117
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0117
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=2985) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0117 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(2985);
      logInfo(`onKeyboardHeightChange(heightPx=2985): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=2985) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(995);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0117 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0118
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0118
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=1047) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0118 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(1047);
      logInfo(`onKeyboardHeightChange(heightPx=1047): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=1047) state: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(349);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0118 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0119
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0119
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=1536.42) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0119 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(1536.42);
      logInfo(`onKeyboardHeightChange(heightPx=1536.42): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=1536.42) ...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(512.14, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0119 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_ON_KEYBOARD_HEIGHT_CHANGE_0120
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0120
     * @tc.desc      KeyboardAvoidState.onKeyboardHeightChange(heightPx=132.61) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateOnKeyboardHeightChange_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0120 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.onKeyboardHeightChange(132.61);
      logInfo(`onKeyboardHeightChange(heightPx=132.61): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`onKeyboardHeightChange(heightPx=132.61) s...: subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertClose(44.20333333333334, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateOnKeyboardHeightChange_0120 end`);
      });
  });
}
