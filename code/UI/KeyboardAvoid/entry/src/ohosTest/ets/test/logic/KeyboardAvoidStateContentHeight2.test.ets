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

/** Logic checks for KeyboardAvoidState.contentHeight (30 cases). */
export default function keyboardAvoidStateContentHeight2Test(): void {
  describe('KeyboardAvoidStateContentHeight2Test', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0091
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0091
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=760.68) yields 704.68
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0091 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(760.68);
      logInfo(`contentHeight(windowHeightVp=760.68): actual=${actual}`);
      expect(actual).assertClose(704.68, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0091 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0092
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0092
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=1745.6) yields 1689.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0092 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(1745.6);
      logInfo(`contentHeight(windowHeightVp=1745.6): actual=${actual}`);
      expect(actual).assertClose(1689.6, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0092 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0093
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0093
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=918) yields 862
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0093 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(918);
      logInfo(`contentHeight(windowHeightVp=918): actual=${actual}`);
      expect(actual).assertEqual(862);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0093 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0094
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0094
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=843.66) yields 787.66
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0094 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(843.66);
      logInfo(`contentHeight(windowHeightVp=843.66): actual=${actual}`);
      expect(actual).assertClose(787.66, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0094 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0095
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0095
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=3380) yields 3324
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0095 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(3380);
      logInfo(`contentHeight(windowHeightVp=3380): actual=${actual}`);
      expect(actual).assertEqual(3324);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0095 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0096
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0096
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=1) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0096 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(1);
      logInfo(`contentHeight(windowHeightVp=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0096 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0097
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0097
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=56) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0097 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(56);
      logInfo(`contentHeight(windowHeightVp=56): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0097 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0098
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0098
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=55) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0098 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(55);
      logInfo(`contentHeight(windowHeightVp=55): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0098 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0099
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0099
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=28) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0099 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(28);
      logInfo(`contentHeight(windowHeightVp=28): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0099 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0100
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0100
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=-1) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0100 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(-1);
      logInfo(`contentHeight(windowHeightVp=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0100 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0101
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0101
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=2) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0101 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(2);
      logInfo(`contentHeight(windowHeightVp=2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0101 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0102
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0102
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=3) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0102 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(3);
      logInfo(`contentHeight(windowHeightVp=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0102 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0103
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0103
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=10) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0103 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(10);
      logInfo(`contentHeight(windowHeightVp=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0103 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0104
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0104
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=-40) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0104 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(-40);
      logInfo(`contentHeight(windowHeightVp=-40): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0104 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0105
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0105
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=-935) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0105 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(-935);
      logInfo(`contentHeight(windowHeightVp=-935): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0105 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0106
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0106
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=-492) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0106 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(-492);
      logInfo(`contentHeight(windowHeightVp=-492): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0106 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0107
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0107
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=-1883) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0107 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(-1883);
      logInfo(`contentHeight(windowHeightVp=-1883): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0107 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0108
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0108
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=-213) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0108 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(-213);
      logInfo(`contentHeight(windowHeightVp=-213): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0108 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0109
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0109
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=-1758) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0109 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(-1758);
      logInfo(`contentHeight(windowHeightVp=-1758): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0109 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0110
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0110
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=-1611) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0110 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(-1611);
      logInfo(`contentHeight(windowHeightVp=-1611): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0110 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0111
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0111
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=-1489) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0111 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(-1489);
      logInfo(`contentHeight(windowHeightVp=-1489): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0111 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0112
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0112
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=-83) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0112 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(-83);
      logInfo(`contentHeight(windowHeightVp=-83): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0112 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0113
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0113
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=-361) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0113 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(-361);
      logInfo(`contentHeight(windowHeightVp=-361): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0113 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0114
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0114
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=37.59) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0114 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(37.59);
      logInfo(`contentHeight(windowHeightVp=37.59): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0114 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0115
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0115
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=-1493) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0115 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(-1493);
      logInfo(`contentHeight(windowHeightVp=-1493): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0115 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0116
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0116
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=-138) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0116 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(-138);
      logInfo(`contentHeight(windowHeightVp=-138): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0116 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0117
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0117
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=-820) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0117 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(-820);
      logInfo(`contentHeight(windowHeightVp=-820): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0117 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0118
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0118
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=-271) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0118 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(-271);
      logInfo(`contentHeight(windowHeightVp=-271): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0118 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0119
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0119
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=-56) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0119 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(-56);
      logInfo(`contentHeight(windowHeightVp=-56): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0119 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CONTENT_HEIGHT_0120
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateContentHeight_0120
     * @tc.desc      KeyboardAvoidState.contentHeight(windowHeightVp=-112) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_KeyboardAvoidStateContentHeight_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0120 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      const actual: number = subject.contentHeight(-112);
      logInfo(`contentHeight(windowHeightVp=-112): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardAvoidStateContentHeight_0120 end`);
    });
  });
}
