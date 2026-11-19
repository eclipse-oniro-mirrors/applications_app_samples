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
import { CONTENT_DATA, HIDDEN_OPACITY, SHOWN_OPACITY } from '../model/KeyboardAvoidLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_KeyboardAvoid]';
const BUNDLE: string = 'KeyboardAvoid_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for KeyboardAvoidLogic (3 cases). */
export default function keyboardAvoidLogicConstantsTest(): void {
  describe('KeyboardAvoidLogicConstantsTest', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_LOGIC_CONSTANTS_0001
     * @tc.name      KeyboardAvoid_KeyboardAvoidLogicConstants_0001
     * @tc.desc      CONTENT_DATA keeps value ["??????"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_KeyboardAvoidLogicConstants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidLogicConstants_0001 begin`);
      const actual: string[] = CONTENT_DATA;
      logInfo(`CONTENT_DATA: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(12);
      logInfo(`CONTENT_DATA: JSON.stringify(actual.slice(0, 1))=${JSON.stringify(actual.slice(0, 1))}`);
      expect(JSON.stringify(actual.slice(0, 1))).assertEqual('["\u7b2c\u4e00\u6761\u6570\u636e"]');
      logInfo(`CONTENT_DATA: JSON.stringify(actual.slice(6, 7))=${JSON.stringify(actual.slice(6, 7))}`);
      expect(JSON.stringify(actual.slice(6, 7))).assertEqual('["\u7b2c\u4e03\u6761\u6570\u636e"]');
      logInfo(`CONTENT_DATA: JSON.stringify(actual.slice(11, 12))=${JSON.stringify(actual.slice(11, 12))}`);
      expect(JSON.stringify(actual.slice(11, 12))).assertEqual('["\u7b2c\u5341\u4e8c\u6761\u6570\u636e"]');
      logInfo(`${BUNDLE}KeyboardAvoidLogicConstants_0001 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_LOGIC_CONSTANTS_0002
     * @tc.name      KeyboardAvoid_KeyboardAvoidLogicConstants_0002
     * @tc.desc      SHOWN_OPACITY keeps value 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_KeyboardAvoidLogicConstants_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidLogicConstants_0002 begin`);
      const actual: number = SHOWN_OPACITY;
      logInfo(`SHOWN_OPACITY: actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}KeyboardAvoidLogicConstants_0002 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_LOGIC_CONSTANTS_0003
     * @tc.name      KeyboardAvoid_KeyboardAvoidLogicConstants_0003
     * @tc.desc      HIDDEN_OPACITY keeps value 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardAvoidLogicConstants_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidLogicConstants_0003 begin`);
      const actual: number = HIDDEN_OPACITY;
      logInfo(`HIDDEN_OPACITY: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}KeyboardAvoidLogicConstants_0003 end`);
    });
  });
}
