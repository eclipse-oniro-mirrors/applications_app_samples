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
import { liftUpShownAfter } from '../model/KeyboardAvoidLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_KeyboardAvoid]';
const BUNDLE: string = 'KeyboardAvoid_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for liftUpShownAfter (48 cases). */
export default function liftUpShownAfterTest(): void {
  describe('LiftUpShownAfterTest', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0001
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0001
     * @tc.desc      liftUpShownAfter(pressed="liftUp", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_LiftUpShownAfter_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0001 begin`);
      const actual: boolean = liftUpShownAfter('liftUp', true);
      logInfo(`liftUpShownAfter(pressed="liftUp", curren...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}LiftUpShownAfter_0001 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0002
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0002
     * @tc.desc      liftUpShownAfter(pressed="scaling", current=true) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_LiftUpShownAfter_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0002 begin`);
      const actual: boolean = liftUpShownAfter('scaling', true);
      logInfo(`liftUpShownAfter(pressed="scaling", curre...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}LiftUpShownAfter_0002 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0003
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0003
     * @tc.desc      liftUpShownAfter(pressed="liftUp", current=false) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_LiftUpShownAfter_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0003 begin`);
      const actual: boolean = liftUpShownAfter('liftUp', false);
      logInfo(`liftUpShownAfter(pressed="liftUp", curren...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}LiftUpShownAfter_0003 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0004
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0004
     * @tc.desc      liftUpShownAfter(pressed="scaling", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_LiftUpShownAfter_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0004 begin`);
      const actual: boolean = liftUpShownAfter('scaling', false);
      logInfo(`liftUpShownAfter(pressed="scaling", curre...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}LiftUpShownAfter_0004 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0005
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0005
     * @tc.desc      liftUpShownAfter(pressed="LIFTUP", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_LiftUpShownAfter_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0005 begin`);
      const actual: boolean = liftUpShownAfter('LIFTUP', true);
      logInfo(`liftUpShownAfter(pressed="LIFTUP", curren...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}LiftUpShownAfter_0005 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0006
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0006
     * @tc.desc      liftUpShownAfter(pressed="LIFTUP", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_LiftUpShownAfter_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0006 begin`);
      const actual: boolean = liftUpShownAfter('LIFTUP', false);
      logInfo(`liftUpShownAfter(pressed="LIFTUP", curren...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}LiftUpShownAfter_0006 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0007
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0007
     * @tc.desc      liftUpShownAfter(pressed="liftU", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_LiftUpShownAfter_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0007 begin`);
      const actual: boolean = liftUpShownAfter('liftU', true);
      logInfo(`liftUpShownAfter(pressed="liftU", current...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}LiftUpShownAfter_0007 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0008
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0008
     * @tc.desc      liftUpShownAfter(pressed="liftU", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_LiftUpShownAfter_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0008 begin`);
      const actual: boolean = liftUpShownAfter('liftU', false);
      logInfo(`liftUpShownAfter(pressed="liftU", current...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}LiftUpShownAfter_0008 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0009
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0009
     * @tc.desc      liftUpShownAfter(pressed="liftUpx", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_LiftUpShownAfter_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0009 begin`);
      const actual: boolean = liftUpShownAfter('liftUpx', true);
      logInfo(`liftUpShownAfter(pressed="liftUpx", curre...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}LiftUpShownAfter_0009 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0010
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0010
     * @tc.desc      liftUpShownAfter(pressed="liftUpx", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_LiftUpShownAfter_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0010 begin`);
      const actual: boolean = liftUpShownAfter('liftUpx', false);
      logInfo(`liftUpShownAfter(pressed="liftUpx", curre...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}LiftUpShownAfter_0010 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0011
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0011
     * @tc.desc      liftUpShownAfter(pressed="SCALING", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_LiftUpShownAfter_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0011 begin`);
      const actual: boolean = liftUpShownAfter('SCALING', true);
      logInfo(`liftUpShownAfter(pressed="SCALING", curre...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}LiftUpShownAfter_0011 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0012
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0012
     * @tc.desc      liftUpShownAfter(pressed="SCALING", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_LiftUpShownAfter_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0012 begin`);
      const actual: boolean = liftUpShownAfter('SCALING', false);
      logInfo(`liftUpShownAfter(pressed="SCALING", curre...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}LiftUpShownAfter_0012 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0013
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0013
     * @tc.desc      liftUpShownAfter(pressed="scalin", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_LiftUpShownAfter_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0013 begin`);
      const actual: boolean = liftUpShownAfter('scalin', true);
      logInfo(`liftUpShownAfter(pressed="scalin", curren...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}LiftUpShownAfter_0013 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0014
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0014
     * @tc.desc      liftUpShownAfter(pressed="scalin", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_LiftUpShownAfter_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0014 begin`);
      const actual: boolean = liftUpShownAfter('scalin', false);
      logInfo(`liftUpShownAfter(pressed="scalin", curren...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}LiftUpShownAfter_0014 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0015
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0015
     * @tc.desc      liftUpShownAfter(pressed="scalingx", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_LiftUpShownAfter_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0015 begin`);
      const actual: boolean = liftUpShownAfter('scalingx', true);
      logInfo(`liftUpShownAfter(pressed="scalingx", curr...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}LiftUpShownAfter_0015 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0016
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0016
     * @tc.desc      liftUpShownAfter(pressed="scalingx", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_LiftUpShownAfter_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0016 begin`);
      const actual: boolean = liftUpShownAfter('scalingx', false);
      logInfo(`liftUpShownAfter(pressed="scalingx", curr...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}LiftUpShownAfter_0016 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0017
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0017
     * @tc.desc      liftUpShownAfter(pressed="", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_LiftUpShownAfter_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0017 begin`);
      const actual: boolean = liftUpShownAfter('', true);
      logInfo(`liftUpShownAfter(pressed="", current=true): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}LiftUpShownAfter_0017 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0018
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0018
     * @tc.desc      liftUpShownAfter(pressed="", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_LiftUpShownAfter_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0018 begin`);
      const actual: boolean = liftUpShownAfter('', false);
      logInfo(`liftUpShownAfter(pressed="", current=false): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}LiftUpShownAfter_0018 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0019
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0019
     * @tc.desc      liftUpShownAfter(pressed="a", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_LiftUpShownAfter_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0019 begin`);
      const actual: boolean = liftUpShownAfter('a', true);
      logInfo(`liftUpShownAfter(pressed="a", current=true): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}LiftUpShownAfter_0019 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0020
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0020
     * @tc.desc      liftUpShownAfter(pressed="a", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_LiftUpShownAfter_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0020 begin`);
      const actual: boolean = liftUpShownAfter('a', false);
      logInfo(`liftUpShownAfter(pressed="a", current=false): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}LiftUpShownAfter_0020 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0021
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0021
     * @tc.desc      liftUpShownAfter(pressed="abc", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_LiftUpShownAfter_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0021 begin`);
      const actual: boolean = liftUpShownAfter('abc', true);
      logInfo(`liftUpShownAfter(pressed="abc", current=t...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}LiftUpShownAfter_0021 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0022
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0022
     * @tc.desc      liftUpShownAfter(pressed="abc", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_LiftUpShownAfter_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0022 begin`);
      const actual: boolean = liftUpShownAfter('abc', false);
      logInfo(`liftUpShownAfter(pressed="abc", current=f...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}LiftUpShownAfter_0022 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0023
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0023
     * @tc.desc      liftUpShownAfter(pressed="Hello World", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_LiftUpShownAfter_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0023 begin`);
      const actual: boolean = liftUpShownAfter('Hello World', true);
      logInfo(`liftUpShownAfter(pressed="Hello World", c...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}LiftUpShownAfter_0023 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0024
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0024
     * @tc.desc      liftUpShownAfter(pressed="Hello World", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_LiftUpShownAfter_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0024 begin`);
      const actual: boolean = liftUpShownAfter('Hello World', false);
      logInfo(`liftUpShownAfter(pressed="Hello World", c...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}LiftUpShownAfter_0024 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0025
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0025
     * @tc.desc      liftUpShownAfter(pressed=" ", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_LiftUpShownAfter_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0025 begin`);
      const actual: boolean = liftUpShownAfter(' ', true);
      logInfo(`liftUpShownAfter(pressed=" ", current=true): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}LiftUpShownAfter_0025 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0026
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0026
     * @tc.desc      liftUpShownAfter(pressed=" ", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_LiftUpShownAfter_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0026 begin`);
      const actual: boolean = liftUpShownAfter(' ', false);
      logInfo(`liftUpShownAfter(pressed=" ", current=false): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}LiftUpShownAfter_0026 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0027
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0027
     * @tc.desc      liftUpShownAfter(pressed="123", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_LiftUpShownAfter_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0027 begin`);
      const actual: boolean = liftUpShownAfter('123', true);
      logInfo(`liftUpShownAfter(pressed="123", current=t...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}LiftUpShownAfter_0027 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0028
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0028
     * @tc.desc      liftUpShownAfter(pressed="123", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_LiftUpShownAfter_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0028 begin`);
      const actual: boolean = liftUpShownAfter('123', false);
      logInfo(`liftUpShownAfter(pressed="123", current=f...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}LiftUpShownAfter_0028 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0029
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0029
     * @tc.desc      liftUpShownAfter(pressed=" liftUp ", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_LiftUpShownAfter_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0029 begin`);
      const actual: boolean = liftUpShownAfter(' liftUp ', true);
      logInfo(`liftUpShownAfter(pressed=" liftUp ", curr...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}LiftUpShownAfter_0029 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0030
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0030
     * @tc.desc      liftUpShownAfter(pressed=" liftUp ", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_LiftUpShownAfter_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0030 begin`);
      const actual: boolean = liftUpShownAfter(' liftUp ', false);
      logInfo(`liftUpShownAfter(pressed=" liftUp ", curr...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}LiftUpShownAfter_0030 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0031
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0031
     * @tc.desc      liftUpShownAfter(pressed="liftUpliftUp", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_LiftUpShownAfter_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0031 begin`);
      const actual: boolean = liftUpShownAfter('liftUpliftUp', true);
      logInfo(`liftUpShownAfter(pressed="liftUpliftUp", ...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}LiftUpShownAfter_0031 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0032
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0032
     * @tc.desc      liftUpShownAfter(pressed="liftUpliftUp", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_LiftUpShownAfter_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0032 begin`);
      const actual: boolean = liftUpShownAfter('liftUpliftUp', false);
      logInfo(`liftUpShownAfter(pressed="liftUpliftUp", ...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}LiftUpShownAfter_0032 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0033
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0033
     * @tc.desc      liftUpShownAfter(pressed="liftUp_1", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_LiftUpShownAfter_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0033 begin`);
      const actual: boolean = liftUpShownAfter('liftUp_1', true);
      logInfo(`liftUpShownAfter(pressed="liftUp_1", curr...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}LiftUpShownAfter_0033 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0034
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0034
     * @tc.desc      liftUpShownAfter(pressed="liftUp_1", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_LiftUpShownAfter_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0034 begin`);
      const actual: boolean = liftUpShownAfter('liftUp_1', false);
      logInfo(`liftUpShownAfter(pressed="liftUp_1", curr...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}LiftUpShownAfter_0034 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0035
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0035
     * @tc.desc      liftUpShownAfter(pressed="xliftUp", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_LiftUpShownAfter_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0035 begin`);
      const actual: boolean = liftUpShownAfter('xliftUp', true);
      logInfo(`liftUpShownAfter(pressed="xliftUp", curre...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}LiftUpShownAfter_0035 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0036
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0036
     * @tc.desc      liftUpShownAfter(pressed="xliftUp", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_LiftUpShownAfter_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0036 begin`);
      const actual: boolean = liftUpShownAfter('xliftUp', false);
      logInfo(`liftUpShownAfter(pressed="xliftUp", curre...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}LiftUpShownAfter_0036 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0037
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0037
     * @tc.desc      liftUpShownAfter(pressed=" scaling ", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_LiftUpShownAfter_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0037 begin`);
      const actual: boolean = liftUpShownAfter(' scaling ', true);
      logInfo(`liftUpShownAfter(pressed=" scaling ", cur...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}LiftUpShownAfter_0037 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0038
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0038
     * @tc.desc      liftUpShownAfter(pressed=" scaling ", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_LiftUpShownAfter_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0038 begin`);
      const actual: boolean = liftUpShownAfter(' scaling ', false);
      logInfo(`liftUpShownAfter(pressed=" scaling ", cur...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}LiftUpShownAfter_0038 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0039
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0039
     * @tc.desc      liftUpShownAfter(pressed="scalingscaling", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_LiftUpShownAfter_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0039 begin`);
      const actual: boolean = liftUpShownAfter('scalingscaling', true);
      logInfo(`liftUpShownAfter(pressed="scalingscaling"...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}LiftUpShownAfter_0039 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0040
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0040
     * @tc.desc      liftUpShownAfter(pressed="scalingscaling", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_LiftUpShownAfter_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0040 begin`);
      const actual: boolean = liftUpShownAfter('scalingscaling', false);
      logInfo(`liftUpShownAfter(pressed="scalingscaling"...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}LiftUpShownAfter_0040 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0041
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0041
     * @tc.desc      liftUpShownAfter(pressed="scaling_1", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_LiftUpShownAfter_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0041 begin`);
      const actual: boolean = liftUpShownAfter('scaling_1', true);
      logInfo(`liftUpShownAfter(pressed="scaling_1", cur...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}LiftUpShownAfter_0041 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0042
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0042
     * @tc.desc      liftUpShownAfter(pressed="scaling_1", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_LiftUpShownAfter_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0042 begin`);
      const actual: boolean = liftUpShownAfter('scaling_1', false);
      logInfo(`liftUpShownAfter(pressed="scaling_1", cur...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}LiftUpShownAfter_0042 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0043
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0043
     * @tc.desc      liftUpShownAfter(pressed="xscaling", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_LiftUpShownAfter_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0043 begin`);
      const actual: boolean = liftUpShownAfter('xscaling', true);
      logInfo(`liftUpShownAfter(pressed="xscaling", curr...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}LiftUpShownAfter_0043 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0044
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0044
     * @tc.desc      liftUpShownAfter(pressed="xscaling", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_LiftUpShownAfter_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0044 begin`);
      const actual: boolean = liftUpShownAfter('xscaling', false);
      logInfo(`liftUpShownAfter(pressed="xscaling", curr...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}LiftUpShownAfter_0044 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0045
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0045
     * @tc.desc      liftUpShownAfter(pressed=" LIFTUP ", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_LiftUpShownAfter_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0045 begin`);
      const actual: boolean = liftUpShownAfter(' LIFTUP ', true);
      logInfo(`liftUpShownAfter(pressed=" LIFTUP ", curr...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}LiftUpShownAfter_0045 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0046
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0046
     * @tc.desc      liftUpShownAfter(pressed=" LIFTUP ", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_LiftUpShownAfter_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0046 begin`);
      const actual: boolean = liftUpShownAfter(' LIFTUP ', false);
      logInfo(`liftUpShownAfter(pressed=" LIFTUP ", curr...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}LiftUpShownAfter_0046 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0047
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0047
     * @tc.desc      liftUpShownAfter(pressed="LIFTUPLIFTUP", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_LiftUpShownAfter_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0047 begin`);
      const actual: boolean = liftUpShownAfter('LIFTUPLIFTUP', true);
      logInfo(`liftUpShownAfter(pressed="LIFTUPLIFTUP", ...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}LiftUpShownAfter_0047 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_LIFT_UP_SHOWN_AFTER_0048
     * @tc.name      KeyboardAvoid_LiftUpShownAfter_0048
     * @tc.desc      liftUpShownAfter(pressed="LIFTUPLIFTUP", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_LiftUpShownAfter_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}LiftUpShownAfter_0048 begin`);
      const actual: boolean = liftUpShownAfter('LIFTUPLIFTUP', false);
      logInfo(`liftUpShownAfter(pressed="LIFTUPLIFTUP", ...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}LiftUpShownAfter_0048 end`);
    });
  });
}
