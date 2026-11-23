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
import { scalingShownAfter } from '../model/KeyboardAvoidLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_KeyboardAvoid]';
const BUNDLE: string = 'KeyboardAvoid_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for scalingShownAfter (48 cases). */
export default function scalingShownAfterTest(): void {
  describe('ScalingShownAfterTest', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0001
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0001
     * @tc.desc      scalingShownAfter(pressed="scaling", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_ScalingShownAfter_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0001 begin`);
      const actual: boolean = scalingShownAfter('scaling', true);
      logInfo(`scalingShownAfter(pressed="scaling", curr...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ScalingShownAfter_0001 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0002
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0002
     * @tc.desc      scalingShownAfter(pressed="liftUp", current=true) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_ScalingShownAfter_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0002 begin`);
      const actual: boolean = scalingShownAfter('liftUp', true);
      logInfo(`scalingShownAfter(pressed="liftUp", curre...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ScalingShownAfter_0002 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0003
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0003
     * @tc.desc      scalingShownAfter(pressed="scaling", current=false) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ScalingShownAfter_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0003 begin`);
      const actual: boolean = scalingShownAfter('scaling', false);
      logInfo(`scalingShownAfter(pressed="scaling", curr...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ScalingShownAfter_0003 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0004
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0004
     * @tc.desc      scalingShownAfter(pressed="liftUp", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ScalingShownAfter_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0004 begin`);
      const actual: boolean = scalingShownAfter('liftUp', false);
      logInfo(`scalingShownAfter(pressed="liftUp", curre...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ScalingShownAfter_0004 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0005
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0005
     * @tc.desc      scalingShownAfter(pressed="SCALING", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ScalingShownAfter_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0005 begin`);
      const actual: boolean = scalingShownAfter('SCALING', true);
      logInfo(`scalingShownAfter(pressed="SCALING", curr...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ScalingShownAfter_0005 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0006
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0006
     * @tc.desc      scalingShownAfter(pressed="SCALING", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ScalingShownAfter_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0006 begin`);
      const actual: boolean = scalingShownAfter('SCALING', false);
      logInfo(`scalingShownAfter(pressed="SCALING", curr...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ScalingShownAfter_0006 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0007
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0007
     * @tc.desc      scalingShownAfter(pressed="scalin", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ScalingShownAfter_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0007 begin`);
      const actual: boolean = scalingShownAfter('scalin', true);
      logInfo(`scalingShownAfter(pressed="scalin", curre...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ScalingShownAfter_0007 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0008
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0008
     * @tc.desc      scalingShownAfter(pressed="scalin", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ScalingShownAfter_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0008 begin`);
      const actual: boolean = scalingShownAfter('scalin', false);
      logInfo(`scalingShownAfter(pressed="scalin", curre...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ScalingShownAfter_0008 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0009
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0009
     * @tc.desc      scalingShownAfter(pressed="scalingx", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ScalingShownAfter_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0009 begin`);
      const actual: boolean = scalingShownAfter('scalingx', true);
      logInfo(`scalingShownAfter(pressed="scalingx", cur...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ScalingShownAfter_0009 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0010
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0010
     * @tc.desc      scalingShownAfter(pressed="scalingx", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ScalingShownAfter_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0010 begin`);
      const actual: boolean = scalingShownAfter('scalingx', false);
      logInfo(`scalingShownAfter(pressed="scalingx", cur...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ScalingShownAfter_0010 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0011
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0011
     * @tc.desc      scalingShownAfter(pressed="LIFTUP", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ScalingShownAfter_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0011 begin`);
      const actual: boolean = scalingShownAfter('LIFTUP', true);
      logInfo(`scalingShownAfter(pressed="LIFTUP", curre...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ScalingShownAfter_0011 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0012
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0012
     * @tc.desc      scalingShownAfter(pressed="LIFTUP", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ScalingShownAfter_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0012 begin`);
      const actual: boolean = scalingShownAfter('LIFTUP', false);
      logInfo(`scalingShownAfter(pressed="LIFTUP", curre...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ScalingShownAfter_0012 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0013
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0013
     * @tc.desc      scalingShownAfter(pressed="liftU", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ScalingShownAfter_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0013 begin`);
      const actual: boolean = scalingShownAfter('liftU', true);
      logInfo(`scalingShownAfter(pressed="liftU", curren...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ScalingShownAfter_0013 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0014
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0014
     * @tc.desc      scalingShownAfter(pressed="liftU", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ScalingShownAfter_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0014 begin`);
      const actual: boolean = scalingShownAfter('liftU', false);
      logInfo(`scalingShownAfter(pressed="liftU", curren...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ScalingShownAfter_0014 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0015
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0015
     * @tc.desc      scalingShownAfter(pressed="liftUpx", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ScalingShownAfter_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0015 begin`);
      const actual: boolean = scalingShownAfter('liftUpx', true);
      logInfo(`scalingShownAfter(pressed="liftUpx", curr...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ScalingShownAfter_0015 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0016
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0016
     * @tc.desc      scalingShownAfter(pressed="liftUpx", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ScalingShownAfter_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0016 begin`);
      const actual: boolean = scalingShownAfter('liftUpx', false);
      logInfo(`scalingShownAfter(pressed="liftUpx", curr...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ScalingShownAfter_0016 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0017
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0017
     * @tc.desc      scalingShownAfter(pressed="", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ScalingShownAfter_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0017 begin`);
      const actual: boolean = scalingShownAfter('', true);
      logInfo(`scalingShownAfter(pressed="", current=true): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ScalingShownAfter_0017 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0018
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0018
     * @tc.desc      scalingShownAfter(pressed="", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ScalingShownAfter_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0018 begin`);
      const actual: boolean = scalingShownAfter('', false);
      logInfo(`scalingShownAfter(pressed="", current=false): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ScalingShownAfter_0018 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0019
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0019
     * @tc.desc      scalingShownAfter(pressed="a", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ScalingShownAfter_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0019 begin`);
      const actual: boolean = scalingShownAfter('a', true);
      logInfo(`scalingShownAfter(pressed="a", current=true): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ScalingShownAfter_0019 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0020
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0020
     * @tc.desc      scalingShownAfter(pressed="a", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ScalingShownAfter_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0020 begin`);
      const actual: boolean = scalingShownAfter('a', false);
      logInfo(`scalingShownAfter(pressed="a", current=fa...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ScalingShownAfter_0020 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0021
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0021
     * @tc.desc      scalingShownAfter(pressed="abc", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ScalingShownAfter_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0021 begin`);
      const actual: boolean = scalingShownAfter('abc', true);
      logInfo(`scalingShownAfter(pressed="abc", current=...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ScalingShownAfter_0021 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0022
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0022
     * @tc.desc      scalingShownAfter(pressed="abc", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ScalingShownAfter_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0022 begin`);
      const actual: boolean = scalingShownAfter('abc', false);
      logInfo(`scalingShownAfter(pressed="abc", current=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ScalingShownAfter_0022 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0023
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0023
     * @tc.desc      scalingShownAfter(pressed="Hello World", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ScalingShownAfter_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0023 begin`);
      const actual: boolean = scalingShownAfter('Hello World', true);
      logInfo(`scalingShownAfter(pressed="Hello World", ...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ScalingShownAfter_0023 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0024
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0024
     * @tc.desc      scalingShownAfter(pressed="Hello World", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ScalingShownAfter_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0024 begin`);
      const actual: boolean = scalingShownAfter('Hello World', false);
      logInfo(`scalingShownAfter(pressed="Hello World", ...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ScalingShownAfter_0024 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0025
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0025
     * @tc.desc      scalingShownAfter(pressed=" ", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ScalingShownAfter_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0025 begin`);
      const actual: boolean = scalingShownAfter(' ', true);
      logInfo(`scalingShownAfter(pressed=" ", current=true): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ScalingShownAfter_0025 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0026
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0026
     * @tc.desc      scalingShownAfter(pressed=" ", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ScalingShownAfter_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0026 begin`);
      const actual: boolean = scalingShownAfter(' ', false);
      logInfo(`scalingShownAfter(pressed=" ", current=fa...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ScalingShownAfter_0026 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0027
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0027
     * @tc.desc      scalingShownAfter(pressed="123", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ScalingShownAfter_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0027 begin`);
      const actual: boolean = scalingShownAfter('123', true);
      logInfo(`scalingShownAfter(pressed="123", current=...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ScalingShownAfter_0027 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0028
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0028
     * @tc.desc      scalingShownAfter(pressed="123", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ScalingShownAfter_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0028 begin`);
      const actual: boolean = scalingShownAfter('123', false);
      logInfo(`scalingShownAfter(pressed="123", current=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ScalingShownAfter_0028 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0029
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0029
     * @tc.desc      scalingShownAfter(pressed=" scaling ", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ScalingShownAfter_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0029 begin`);
      const actual: boolean = scalingShownAfter(' scaling ', true);
      logInfo(`scalingShownAfter(pressed=" scaling ", cu...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ScalingShownAfter_0029 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0030
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0030
     * @tc.desc      scalingShownAfter(pressed=" scaling ", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ScalingShownAfter_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0030 begin`);
      const actual: boolean = scalingShownAfter(' scaling ', false);
      logInfo(`scalingShownAfter(pressed=" scaling ", cu...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ScalingShownAfter_0030 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0031
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0031
     * @tc.desc      scalingShownAfter(pressed="scalingscaling", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ScalingShownAfter_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0031 begin`);
      const actual: boolean = scalingShownAfter('scalingscaling', true);
      logInfo(`scalingShownAfter(pressed="scalingscaling...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ScalingShownAfter_0031 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0032
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0032
     * @tc.desc      scalingShownAfter(pressed="scalingscaling", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ScalingShownAfter_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0032 begin`);
      const actual: boolean = scalingShownAfter('scalingscaling', false);
      logInfo(`scalingShownAfter(pressed="scalingscaling...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ScalingShownAfter_0032 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0033
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0033
     * @tc.desc      scalingShownAfter(pressed="scaling_1", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ScalingShownAfter_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0033 begin`);
      const actual: boolean = scalingShownAfter('scaling_1', true);
      logInfo(`scalingShownAfter(pressed="scaling_1", cu...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ScalingShownAfter_0033 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0034
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0034
     * @tc.desc      scalingShownAfter(pressed="scaling_1", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ScalingShownAfter_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0034 begin`);
      const actual: boolean = scalingShownAfter('scaling_1', false);
      logInfo(`scalingShownAfter(pressed="scaling_1", cu...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ScalingShownAfter_0034 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0035
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0035
     * @tc.desc      scalingShownAfter(pressed="xscaling", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ScalingShownAfter_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0035 begin`);
      const actual: boolean = scalingShownAfter('xscaling', true);
      logInfo(`scalingShownAfter(pressed="xscaling", cur...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ScalingShownAfter_0035 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0036
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0036
     * @tc.desc      scalingShownAfter(pressed="xscaling", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ScalingShownAfter_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0036 begin`);
      const actual: boolean = scalingShownAfter('xscaling', false);
      logInfo(`scalingShownAfter(pressed="xscaling", cur...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ScalingShownAfter_0036 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0037
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0037
     * @tc.desc      scalingShownAfter(pressed=" liftUp ", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ScalingShownAfter_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0037 begin`);
      const actual: boolean = scalingShownAfter(' liftUp ', true);
      logInfo(`scalingShownAfter(pressed=" liftUp ", cur...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ScalingShownAfter_0037 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0038
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0038
     * @tc.desc      scalingShownAfter(pressed=" liftUp ", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ScalingShownAfter_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0038 begin`);
      const actual: boolean = scalingShownAfter(' liftUp ', false);
      logInfo(`scalingShownAfter(pressed=" liftUp ", cur...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ScalingShownAfter_0038 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0039
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0039
     * @tc.desc      scalingShownAfter(pressed="liftUpliftUp", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ScalingShownAfter_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0039 begin`);
      const actual: boolean = scalingShownAfter('liftUpliftUp', true);
      logInfo(`scalingShownAfter(pressed="liftUpliftUp",...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ScalingShownAfter_0039 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0040
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0040
     * @tc.desc      scalingShownAfter(pressed="liftUpliftUp", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ScalingShownAfter_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0040 begin`);
      const actual: boolean = scalingShownAfter('liftUpliftUp', false);
      logInfo(`scalingShownAfter(pressed="liftUpliftUp",...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ScalingShownAfter_0040 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0041
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0041
     * @tc.desc      scalingShownAfter(pressed="liftUp_1", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ScalingShownAfter_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0041 begin`);
      const actual: boolean = scalingShownAfter('liftUp_1', true);
      logInfo(`scalingShownAfter(pressed="liftUp_1", cur...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ScalingShownAfter_0041 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0042
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0042
     * @tc.desc      scalingShownAfter(pressed="liftUp_1", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ScalingShownAfter_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0042 begin`);
      const actual: boolean = scalingShownAfter('liftUp_1', false);
      logInfo(`scalingShownAfter(pressed="liftUp_1", cur...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ScalingShownAfter_0042 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0043
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0043
     * @tc.desc      scalingShownAfter(pressed="xliftUp", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ScalingShownAfter_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0043 begin`);
      const actual: boolean = scalingShownAfter('xliftUp', true);
      logInfo(`scalingShownAfter(pressed="xliftUp", curr...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ScalingShownAfter_0043 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0044
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0044
     * @tc.desc      scalingShownAfter(pressed="xliftUp", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ScalingShownAfter_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0044 begin`);
      const actual: boolean = scalingShownAfter('xliftUp', false);
      logInfo(`scalingShownAfter(pressed="xliftUp", curr...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ScalingShownAfter_0044 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0045
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0045
     * @tc.desc      scalingShownAfter(pressed=" SCALING ", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ScalingShownAfter_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0045 begin`);
      const actual: boolean = scalingShownAfter(' SCALING ', true);
      logInfo(`scalingShownAfter(pressed=" SCALING ", cu...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ScalingShownAfter_0045 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0046
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0046
     * @tc.desc      scalingShownAfter(pressed=" SCALING ", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ScalingShownAfter_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0046 begin`);
      const actual: boolean = scalingShownAfter(' SCALING ', false);
      logInfo(`scalingShownAfter(pressed=" SCALING ", cu...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ScalingShownAfter_0046 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0047
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0047
     * @tc.desc      scalingShownAfter(pressed="SCALINGSCALING", current=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ScalingShownAfter_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0047 begin`);
      const actual: boolean = scalingShownAfter('SCALINGSCALING', true);
      logInfo(`scalingShownAfter(pressed="SCALINGSCALING...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ScalingShownAfter_0047 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_SCALING_SHOWN_AFTER_0048
     * @tc.name      KeyboardAvoid_ScalingShownAfter_0048
     * @tc.desc      scalingShownAfter(pressed="SCALINGSCALING", current=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ScalingShownAfter_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ScalingShownAfter_0048 begin`);
      const actual: boolean = scalingShownAfter('SCALINGSCALING', false);
      logInfo(`scalingShownAfter(pressed="SCALINGSCALING...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ScalingShownAfter_0048 end`);
    });
  });
}
