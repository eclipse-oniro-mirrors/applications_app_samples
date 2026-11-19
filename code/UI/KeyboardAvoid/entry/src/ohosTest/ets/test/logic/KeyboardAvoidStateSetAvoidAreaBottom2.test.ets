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

/** Logic checks for KeyboardAvoidState.setAvoidAreaBottom (43 cases). */
export default function keyboardAvoidStateSetAvoidAreaBottom2Test(): void {
  describe('KeyboardAvoidStateSetAvoidAreaBottom2Test', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0078
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0078
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=208) yields 69.33333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0078 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(208);
      logInfo(`setAvoidAreaBottom(px=208): actual=${actual}`);
      expect(actual).assertClose(69.33333333333333, PRECISION);
      logInfo(`setAvoidAreaBottom(px=208) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(208);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0078 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0079
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0079
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=-86) yields -28.666666666666668
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0079 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(-86);
      logInfo(`setAvoidAreaBottom(px=-86): actual=${actual}`);
      expect(actual).assertClose(-28.666666666666668, PRECISION);
      logInfo(`setAvoidAreaBottom(px=-86) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-86);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0079 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0080
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0080
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=21.94) yields 7.3133333333333335
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0080 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(21.94);
      logInfo(`setAvoidAreaBottom(px=21.94): actual=${actual}`);
      expect(actual).assertClose(7.3133333333333335, PRECISION);
      logInfo(`setAvoidAreaBottom(px=21.94) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertClose(21.94, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0080 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0081
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0081
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=25) yields 8.333333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0081 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(25);
      logInfo(`setAvoidAreaBottom(px=25): actual=${actual}`);
      expect(actual).assertClose(8.333333333333334, PRECISION);
      logInfo(`setAvoidAreaBottom(px=25) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(25);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0081 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0082
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0082
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=-12) yields -4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0082 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(-12);
      logInfo(`setAvoidAreaBottom(px=-12): actual=${actual}`);
      expect(actual).assertEqual(-4);
      logInfo(`setAvoidAreaBottom(px=-12) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-12);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0082 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0083
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0083
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=91) yields 30.333333333333332
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0083 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(91);
      logInfo(`setAvoidAreaBottom(px=91): actual=${actual}`);
      expect(actual).assertClose(30.333333333333332, PRECISION);
      logInfo(`setAvoidAreaBottom(px=91) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(91);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0083 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0084
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0084
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=136) yields 45.333333333333336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0084 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(136);
      logInfo(`setAvoidAreaBottom(px=136): actual=${actual}`);
      expect(actual).assertClose(45.333333333333336, PRECISION);
      logInfo(`setAvoidAreaBottom(px=136) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(136);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0084 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0085
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0085
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=23.38) yields 7.793333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0085 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(23.38);
      logInfo(`setAvoidAreaBottom(px=23.38): actual=${actual}`);
      expect(actual).assertClose(7.793333333333333, PRECISION);
      logInfo(`setAvoidAreaBottom(px=23.38) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertClose(23.38, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0085 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0086
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0086
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=-107) yields -35.666666666666664
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0086 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(-107);
      logInfo(`setAvoidAreaBottom(px=-107): actual=${actual}`);
      expect(actual).assertClose(-35.666666666666664, PRECISION);
      logInfo(`setAvoidAreaBottom(px=-107) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-107);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0086 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0087
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0087
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=23.84) yields 7.946666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0087 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(23.84);
      logInfo(`setAvoidAreaBottom(px=23.84): actual=${actual}`);
      expect(actual).assertClose(7.946666666666666, PRECISION);
      logInfo(`setAvoidAreaBottom(px=23.84) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertClose(23.84, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0087 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0088
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0088
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=111.49) yields 37.163333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0088 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(111.49);
      logInfo(`setAvoidAreaBottom(px=111.49): actual=${actual}`);
      expect(actual).assertClose(37.163333333333334, PRECISION);
      logInfo(`setAvoidAreaBottom(px=111.49) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertClose(111.49, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0088 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0089
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0089
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=70) yields 23.333333333333332
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0089 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(70);
      logInfo(`setAvoidAreaBottom(px=70): actual=${actual}`);
      expect(actual).assertClose(23.333333333333332, PRECISION);
      logInfo(`setAvoidAreaBottom(px=70) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(70);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0089 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0090
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0090
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=95.13) yields 31.709999999999997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0090 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(95.13);
      logInfo(`setAvoidAreaBottom(px=95.13): actual=${actual}`);
      expect(actual).assertClose(31.709999999999997, PRECISION);
      logInfo(`setAvoidAreaBottom(px=95.13) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertClose(95.13, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0090 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0091
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0091
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=35.9) yields 11.966666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0091 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(35.9);
      logInfo(`setAvoidAreaBottom(px=35.9): actual=${actual}`);
      expect(actual).assertClose(11.966666666666667, PRECISION);
      logInfo(`setAvoidAreaBottom(px=35.9) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertClose(35.9, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0091 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0092
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0092
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=-9) yields -3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0092 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(-9);
      logInfo(`setAvoidAreaBottom(px=-9): actual=${actual}`);
      expect(actual).assertEqual(-3);
      logInfo(`setAvoidAreaBottom(px=-9) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-9);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0092 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0093
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0093
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=121) yields 40.333333333333336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0093 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(121);
      logInfo(`setAvoidAreaBottom(px=121): actual=${actual}`);
      expect(actual).assertClose(40.333333333333336, PRECISION);
      logInfo(`setAvoidAreaBottom(px=121) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(121);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0093 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0094
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0094
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=137) yields 45.666666666666664
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0094 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(137);
      logInfo(`setAvoidAreaBottom(px=137): actual=${actual}`);
      expect(actual).assertClose(45.666666666666664, PRECISION);
      logInfo(`setAvoidAreaBottom(px=137) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(137);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0094 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0095
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0095
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=154) yields 51.333333333333336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0095 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(154);
      logInfo(`setAvoidAreaBottom(px=154): actual=${actual}`);
      expect(actual).assertClose(51.333333333333336, PRECISION);
      logInfo(`setAvoidAreaBottom(px=154) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(154);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0095 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0096
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0096
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=87) yields 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0096 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(87);
      logInfo(`setAvoidAreaBottom(px=87): actual=${actual}`);
      expect(actual).assertEqual(29);
      logInfo(`setAvoidAreaBottom(px=87) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(87);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0096 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0097
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0097
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=-73) yields -24.333333333333332
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0097 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(-73);
      logInfo(`setAvoidAreaBottom(px=-73): actual=${actual}`);
      expect(actual).assertClose(-24.333333333333332, PRECISION);
      logInfo(`setAvoidAreaBottom(px=-73) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-73);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0097 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0098
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0098
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=64.82) yields 21.606666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0098 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(64.82);
      logInfo(`setAvoidAreaBottom(px=64.82): actual=${actual}`);
      expect(actual).assertClose(21.606666666666666, PRECISION);
      logInfo(`setAvoidAreaBottom(px=64.82) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertClose(64.82, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0098 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0099
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0099
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=209) yields 69.66666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0099 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(209);
      logInfo(`setAvoidAreaBottom(px=209): actual=${actual}`);
      expect(actual).assertClose(69.66666666666667, PRECISION);
      logInfo(`setAvoidAreaBottom(px=209) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(209);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0099 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0100
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0100
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=33.61) yields 11.203333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0100 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(33.61);
      logInfo(`setAvoidAreaBottom(px=33.61): actual=${actual}`);
      expect(actual).assertClose(11.203333333333333, PRECISION);
      logInfo(`setAvoidAreaBottom(px=33.61) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertClose(33.61, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0100 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0101
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0101
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=217) yields 72.33333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0101 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(217);
      logInfo(`setAvoidAreaBottom(px=217): actual=${actual}`);
      expect(actual).assertClose(72.33333333333333, PRECISION);
      logInfo(`setAvoidAreaBottom(px=217) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(217);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0101 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0102
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0102
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=-15) yields -5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0102 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(-15);
      logInfo(`setAvoidAreaBottom(px=-15): actual=${actual}`);
      expect(actual).assertEqual(-5);
      logInfo(`setAvoidAreaBottom(px=-15) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-15);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0102 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0103
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0103
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=13.51) yields 4.503333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0103 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(13.51);
      logInfo(`setAvoidAreaBottom(px=13.51): actual=${actual}`);
      expect(actual).assertClose(4.503333333333333, PRECISION);
      logInfo(`setAvoidAreaBottom(px=13.51) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertClose(13.51, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0103 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0104
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0104
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=1.65) yields 0.5499999999999999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0104 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(1.65);
      logInfo(`setAvoidAreaBottom(px=1.65): actual=${actual}`);
      expect(actual).assertClose(0.5499999999999999, PRECISION);
      logInfo(`setAvoidAreaBottom(px=1.65) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertClose(1.65, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0104 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0105
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0105
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=141) yields 47
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0105 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(141);
      logInfo(`setAvoidAreaBottom(px=141): actual=${actual}`);
      expect(actual).assertEqual(47);
      logInfo(`setAvoidAreaBottom(px=141) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(141);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0105 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0106
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0106
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=72.17) yields 24.05666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0106 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(72.17);
      logInfo(`setAvoidAreaBottom(px=72.17): actual=${actual}`);
      expect(actual).assertClose(24.05666666666667, PRECISION);
      logInfo(`setAvoidAreaBottom(px=72.17) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertClose(72.17, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0106 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0107
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0107
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=-13) yields -4.333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0107 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(-13);
      logInfo(`setAvoidAreaBottom(px=-13): actual=${actual}`);
      expect(actual).assertClose(-4.333333333333333, PRECISION);
      logInfo(`setAvoidAreaBottom(px=-13) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-13);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0107 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0108
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0108
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=105.04) yields 35.013333333333335
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0108 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(105.04);
      logInfo(`setAvoidAreaBottom(px=105.04): actual=${actual}`);
      expect(actual).assertClose(35.013333333333335, PRECISION);
      logInfo(`setAvoidAreaBottom(px=105.04) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertClose(105.04, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0108 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0109
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0109
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=82) yields 27.333333333333332
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0109 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(82);
      logInfo(`setAvoidAreaBottom(px=82): actual=${actual}`);
      expect(actual).assertClose(27.333333333333332, PRECISION);
      logInfo(`setAvoidAreaBottom(px=82) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(82);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0109 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0110
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0110
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=134) yields 44.666666666666664
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0110 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(134);
      logInfo(`setAvoidAreaBottom(px=134): actual=${actual}`);
      expect(actual).assertClose(44.666666666666664, PRECISION);
      logInfo(`setAvoidAreaBottom(px=134) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(134);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0110 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0111
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0111
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=-17) yields -5.666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0111 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(-17);
      logInfo(`setAvoidAreaBottom(px=-17): actual=${actual}`);
      expect(actual).assertClose(-5.666666666666667, PRECISION);
      logInfo(`setAvoidAreaBottom(px=-17) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-17);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0111 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0112
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0112
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=102.7) yields 34.233333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0112 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(102.7);
      logInfo(`setAvoidAreaBottom(px=102.7): actual=${actual}`);
      expect(actual).assertClose(34.233333333333334, PRECISION);
      logInfo(`setAvoidAreaBottom(px=102.7) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertClose(102.7, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0112 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0113
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0113
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=-74) yields -24.666666666666668
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0113 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(-74);
      logInfo(`setAvoidAreaBottom(px=-74): actual=${actual}`);
      expect(actual).assertClose(-24.666666666666668, PRECISION);
      logInfo(`setAvoidAreaBottom(px=-74) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-74);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0113 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0114
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0114
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=169) yields 56.333333333333336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0114 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(169);
      logInfo(`setAvoidAreaBottom(px=169): actual=${actual}`);
      expect(actual).assertClose(56.333333333333336, PRECISION);
      logInfo(`setAvoidAreaBottom(px=169) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(169);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0114 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0115
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0115
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=74) yields 24.666666666666668
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0115 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(74);
      logInfo(`setAvoidAreaBottom(px=74): actual=${actual}`);
      expect(actual).assertClose(24.666666666666668, PRECISION);
      logInfo(`setAvoidAreaBottom(px=74) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(74);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0115 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0116
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0116
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=125) yields 41.666666666666664
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0116 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(125);
      logInfo(`setAvoidAreaBottom(px=125): actual=${actual}`);
      expect(actual).assertClose(41.666666666666664, PRECISION);
      logInfo(`setAvoidAreaBottom(px=125) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(125);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0116 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0117
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0117
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=213) yields 71
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0117 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(213);
      logInfo(`setAvoidAreaBottom(px=213): actual=${actual}`);
      expect(actual).assertEqual(71);
      logInfo(`setAvoidAreaBottom(px=213) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(213);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0117 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0118
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0118
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=211) yields 70.33333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0118 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(211);
      logInfo(`setAvoidAreaBottom(px=211): actual=${actual}`);
      expect(actual).assertClose(70.33333333333333, PRECISION);
      logInfo(`setAvoidAreaBottom(px=211) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(211);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0118 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0119
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0119
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=-59) yields -19.666666666666668
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0119 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(-59);
      logInfo(`setAvoidAreaBottom(px=-59): actual=${actual}`);
      expect(actual).assertClose(-19.666666666666668, PRECISION);
      logInfo(`setAvoidAreaBottom(px=-59) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(-59);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0119 end`);
      });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_SET_AVOID_AREA_BOTTOM_0120
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0120
     * @tc.desc      KeyboardAvoidState.setAvoidAreaBottom(px=60.43) yields 20.143333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateSetAvoidAreaBottom_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0120 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.setAvoidAreaBottom(60.43);
      logInfo(`setAvoidAreaBottom(px=60.43): actual=${actual}`);
      expect(actual).assertClose(20.143333333333334, PRECISION);
      logInfo(`setAvoidAreaBottom(px=60.43) state: subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertClose(60.43, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateSetAvoidAreaBottom_0120 end`);
      });
  });
}
