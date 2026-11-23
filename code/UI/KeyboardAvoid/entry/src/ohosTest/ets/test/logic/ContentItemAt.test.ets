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
import { contentItemAt } from '../model/KeyboardAvoidLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_KeyboardAvoid]';
const BUNDLE: string = 'KeyboardAvoid_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for contentItemAt (96 cases). */
export default function contentItemAtTest(): void {
  describe('ContentItemAtTest', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0001
     * @tc.name      KeyboardAvoid_ContentItemAt_0001
     * @tc.desc      contentItemAt(index=0) returns "?????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_ContentItemAt_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0001 begin`);
      const actual: string = contentItemAt(0);
      logInfo(`contentItemAt(index=0): actual=${actual}`);
      expect(actual).assertEqual('\u7b2c\u4e00\u6761\u6570\u636e');
      logInfo(`${BUNDLE}ContentItemAt_0001 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0002
     * @tc.name      KeyboardAvoid_ContentItemAt_0002
     * @tc.desc      contentItemAt(index=1) returns "?????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_ContentItemAt_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0002 begin`);
      const actual: string = contentItemAt(1);
      logInfo(`contentItemAt(index=1): actual=${actual}`);
      expect(actual).assertEqual('\u7b2c\u4e8c\u6761\u6570\u636e');
      logInfo(`${BUNDLE}ContentItemAt_0002 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0003
     * @tc.name      KeyboardAvoid_ContentItemAt_0003
     * @tc.desc      contentItemAt(index=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_ContentItemAt_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0003 begin`);
      const actual: string = contentItemAt(-1);
      logInfo(`contentItemAt(index=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0003 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0004
     * @tc.name      KeyboardAvoid_ContentItemAt_0004
     * @tc.desc      contentItemAt(index=2) returns "?????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0004 begin`);
      const actual: string = contentItemAt(2);
      logInfo(`contentItemAt(index=2): actual=${actual}`);
      expect(actual).assertEqual('\u7b2c\u4e09\u6761\u6570\u636e');
      logInfo(`${BUNDLE}ContentItemAt_0004 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0005
     * @tc.name      KeyboardAvoid_ContentItemAt_0005
     * @tc.desc      contentItemAt(index=5) returns "?????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0005 begin`);
      const actual: string = contentItemAt(5);
      logInfo(`contentItemAt(index=5): actual=${actual}`);
      expect(actual).assertEqual('\u7b2c\u516d\u6761\u6570\u636e');
      logInfo(`${BUNDLE}ContentItemAt_0005 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0006
     * @tc.name      KeyboardAvoid_ContentItemAt_0006
     * @tc.desc      contentItemAt(index=10) returns "??????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0006 begin`);
      const actual: string = contentItemAt(10);
      logInfo(`contentItemAt(index=10): actual=${actual}`);
      expect(actual).assertEqual('\u7b2c\u5341\u4e00\u6761\u6570\u636e');
      logInfo(`${BUNDLE}ContentItemAt_0006 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0007
     * @tc.name      KeyboardAvoid_ContentItemAt_0007
     * @tc.desc      contentItemAt(index=3) returns "?????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0007 begin`);
      const actual: string = contentItemAt(3);
      logInfo(`contentItemAt(index=3): actual=${actual}`);
      expect(actual).assertEqual('\u7b2c\u56db\u6761\u6570\u636e');
      logInfo(`${BUNDLE}ContentItemAt_0007 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0008
     * @tc.name      KeyboardAvoid_ContentItemAt_0008
     * @tc.desc      contentItemAt(index=11) returns "??????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0008 begin`);
      const actual: string = contentItemAt(11);
      logInfo(`contentItemAt(index=11): actual=${actual}`);
      expect(actual).assertEqual('\u7b2c\u5341\u4e8c\u6761\u6570\u636e');
      logInfo(`${BUNDLE}ContentItemAt_0008 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0009
     * @tc.name      KeyboardAvoid_ContentItemAt_0009
     * @tc.desc      contentItemAt(index=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0009 begin`);
      const actual: string = contentItemAt(100);
      logInfo(`contentItemAt(index=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0009 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0010
     * @tc.name      KeyboardAvoid_ContentItemAt_0010
     * @tc.desc      contentItemAt(index=15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0010 begin`);
      const actual: string = contentItemAt(15);
      logInfo(`contentItemAt(index=15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0010 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0011
     * @tc.name      KeyboardAvoid_ContentItemAt_0011
     * @tc.desc      contentItemAt(index=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0011 begin`);
      const actual: string = contentItemAt(20);
      logInfo(`contentItemAt(index=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0011 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0012
     * @tc.name      KeyboardAvoid_ContentItemAt_0012
     * @tc.desc      contentItemAt(index=25) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0012 begin`);
      const actual: string = contentItemAt(25);
      logInfo(`contentItemAt(index=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0012 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0013
     * @tc.name      KeyboardAvoid_ContentItemAt_0013
     * @tc.desc      contentItemAt(index=30) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0013 begin`);
      const actual: string = contentItemAt(30);
      logInfo(`contentItemAt(index=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0013 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0014
     * @tc.name      KeyboardAvoid_ContentItemAt_0014
     * @tc.desc      contentItemAt(index=35) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0014 begin`);
      const actual: string = contentItemAt(35);
      logInfo(`contentItemAt(index=35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0014 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0015
     * @tc.name      KeyboardAvoid_ContentItemAt_0015
     * @tc.desc      contentItemAt(index=40) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0015 begin`);
      const actual: string = contentItemAt(40);
      logInfo(`contentItemAt(index=40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0015 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0016
     * @tc.name      KeyboardAvoid_ContentItemAt_0016
     * @tc.desc      contentItemAt(index=45) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0016 begin`);
      const actual: string = contentItemAt(45);
      logInfo(`contentItemAt(index=45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0016 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0017
     * @tc.name      KeyboardAvoid_ContentItemAt_0017
     * @tc.desc      contentItemAt(index=50) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0017 begin`);
      const actual: string = contentItemAt(50);
      logInfo(`contentItemAt(index=50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0017 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0018
     * @tc.name      KeyboardAvoid_ContentItemAt_0018
     * @tc.desc      contentItemAt(index=55) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0018 begin`);
      const actual: string = contentItemAt(55);
      logInfo(`contentItemAt(index=55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0018 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0019
     * @tc.name      KeyboardAvoid_ContentItemAt_0019
     * @tc.desc      contentItemAt(index=60) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0019 begin`);
      const actual: string = contentItemAt(60);
      logInfo(`contentItemAt(index=60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0019 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0020
     * @tc.name      KeyboardAvoid_ContentItemAt_0020
     * @tc.desc      contentItemAt(index=65) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0020 begin`);
      const actual: string = contentItemAt(65);
      logInfo(`contentItemAt(index=65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0020 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0021
     * @tc.name      KeyboardAvoid_ContentItemAt_0021
     * @tc.desc      contentItemAt(index=70) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0021 begin`);
      const actual: string = contentItemAt(70);
      logInfo(`contentItemAt(index=70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0021 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0022
     * @tc.name      KeyboardAvoid_ContentItemAt_0022
     * @tc.desc      contentItemAt(index=75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0022 begin`);
      const actual: string = contentItemAt(75);
      logInfo(`contentItemAt(index=75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0022 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0023
     * @tc.name      KeyboardAvoid_ContentItemAt_0023
     * @tc.desc      contentItemAt(index=80) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0023 begin`);
      const actual: string = contentItemAt(80);
      logInfo(`contentItemAt(index=80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0023 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0024
     * @tc.name      KeyboardAvoid_ContentItemAt_0024
     * @tc.desc      contentItemAt(index=85) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0024 begin`);
      const actual: string = contentItemAt(85);
      logInfo(`contentItemAt(index=85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0024 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0025
     * @tc.name      KeyboardAvoid_ContentItemAt_0025
     * @tc.desc      contentItemAt(index=90) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0025 begin`);
      const actual: string = contentItemAt(90);
      logInfo(`contentItemAt(index=90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0025 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0026
     * @tc.name      KeyboardAvoid_ContentItemAt_0026
     * @tc.desc      contentItemAt(index=95) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0026 begin`);
      const actual: string = contentItemAt(95);
      logInfo(`contentItemAt(index=95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0026 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0027
     * @tc.name      KeyboardAvoid_ContentItemAt_0027
     * @tc.desc      contentItemAt(index=105) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0027 begin`);
      const actual: string = contentItemAt(105);
      logInfo(`contentItemAt(index=105): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0027 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0028
     * @tc.name      KeyboardAvoid_ContentItemAt_0028
     * @tc.desc      contentItemAt(index=110) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0028 begin`);
      const actual: string = contentItemAt(110);
      logInfo(`contentItemAt(index=110): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0028 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0029
     * @tc.name      KeyboardAvoid_ContentItemAt_0029
     * @tc.desc      contentItemAt(index=115) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0029 begin`);
      const actual: string = contentItemAt(115);
      logInfo(`contentItemAt(index=115): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0029 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0030
     * @tc.name      KeyboardAvoid_ContentItemAt_0030
     * @tc.desc      contentItemAt(index=120) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0030 begin`);
      const actual: string = contentItemAt(120);
      logInfo(`contentItemAt(index=120): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0030 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0031
     * @tc.name      KeyboardAvoid_ContentItemAt_0031
     * @tc.desc      contentItemAt(index=125) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0031 begin`);
      const actual: string = contentItemAt(125);
      logInfo(`contentItemAt(index=125): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0031 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0032
     * @tc.name      KeyboardAvoid_ContentItemAt_0032
     * @tc.desc      contentItemAt(index=130) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0032 begin`);
      const actual: string = contentItemAt(130);
      logInfo(`contentItemAt(index=130): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0032 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0033
     * @tc.name      KeyboardAvoid_ContentItemAt_0033
     * @tc.desc      contentItemAt(index=135) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0033 begin`);
      const actual: string = contentItemAt(135);
      logInfo(`contentItemAt(index=135): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0033 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0034
     * @tc.name      KeyboardAvoid_ContentItemAt_0034
     * @tc.desc      contentItemAt(index=140) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0034 begin`);
      const actual: string = contentItemAt(140);
      logInfo(`contentItemAt(index=140): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0034 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0035
     * @tc.name      KeyboardAvoid_ContentItemAt_0035
     * @tc.desc      contentItemAt(index=145) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0035 begin`);
      const actual: string = contentItemAt(145);
      logInfo(`contentItemAt(index=145): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0035 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0036
     * @tc.name      KeyboardAvoid_ContentItemAt_0036
     * @tc.desc      contentItemAt(index=150) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0036 begin`);
      const actual: string = contentItemAt(150);
      logInfo(`contentItemAt(index=150): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0036 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0037
     * @tc.name      KeyboardAvoid_ContentItemAt_0037
     * @tc.desc      contentItemAt(index=155) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0037 begin`);
      const actual: string = contentItemAt(155);
      logInfo(`contentItemAt(index=155): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0037 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0038
     * @tc.name      KeyboardAvoid_ContentItemAt_0038
     * @tc.desc      contentItemAt(index=160) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0038 begin`);
      const actual: string = contentItemAt(160);
      logInfo(`contentItemAt(index=160): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0038 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0039
     * @tc.name      KeyboardAvoid_ContentItemAt_0039
     * @tc.desc      contentItemAt(index=165) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0039 begin`);
      const actual: string = contentItemAt(165);
      logInfo(`contentItemAt(index=165): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0039 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0040
     * @tc.name      KeyboardAvoid_ContentItemAt_0040
     * @tc.desc      contentItemAt(index=170) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0040 begin`);
      const actual: string = contentItemAt(170);
      logInfo(`contentItemAt(index=170): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0040 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0041
     * @tc.name      KeyboardAvoid_ContentItemAt_0041
     * @tc.desc      contentItemAt(index=175) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0041 begin`);
      const actual: string = contentItemAt(175);
      logInfo(`contentItemAt(index=175): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0041 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0042
     * @tc.name      KeyboardAvoid_ContentItemAt_0042
     * @tc.desc      contentItemAt(index=180) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0042 begin`);
      const actual: string = contentItemAt(180);
      logInfo(`contentItemAt(index=180): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0042 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0043
     * @tc.name      KeyboardAvoid_ContentItemAt_0043
     * @tc.desc      contentItemAt(index=185) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0043 begin`);
      const actual: string = contentItemAt(185);
      logInfo(`contentItemAt(index=185): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0043 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0044
     * @tc.name      KeyboardAvoid_ContentItemAt_0044
     * @tc.desc      contentItemAt(index=190) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0044 begin`);
      const actual: string = contentItemAt(190);
      logInfo(`contentItemAt(index=190): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0044 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0045
     * @tc.name      KeyboardAvoid_ContentItemAt_0045
     * @tc.desc      contentItemAt(index=195) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0045 begin`);
      const actual: string = contentItemAt(195);
      logInfo(`contentItemAt(index=195): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0045 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0046
     * @tc.name      KeyboardAvoid_ContentItemAt_0046
     * @tc.desc      contentItemAt(index=200) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0046 begin`);
      const actual: string = contentItemAt(200);
      logInfo(`contentItemAt(index=200): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0046 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0047
     * @tc.name      KeyboardAvoid_ContentItemAt_0047
     * @tc.desc      contentItemAt(index=41.33) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0047 begin`);
      const actual: string = contentItemAt(41.33);
      logInfo(`contentItemAt(index=41.33): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0047 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0048
     * @tc.name      KeyboardAvoid_ContentItemAt_0048
     * @tc.desc      contentItemAt(index=-69) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentItemAt_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0048 begin`);
      const actual: string = contentItemAt(-69);
      logInfo(`contentItemAt(index=-69): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0048 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0049
     * @tc.name      KeyboardAvoid_ContentItemAt_0049
     * @tc.desc      contentItemAt(index=-59) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentItemAt_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0049 begin`);
      const actual: string = contentItemAt(-59);
      logInfo(`contentItemAt(index=-59): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0049 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0050
     * @tc.name      KeyboardAvoid_ContentItemAt_0050
     * @tc.desc      contentItemAt(index=87.39) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0050 begin`);
      const actual: string = contentItemAt(87.39);
      logInfo(`contentItemAt(index=87.39): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0050 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0051
     * @tc.name      KeyboardAvoid_ContentItemAt_0051
     * @tc.desc      contentItemAt(index=113) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0051 begin`);
      const actual: string = contentItemAt(113);
      logInfo(`contentItemAt(index=113): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0051 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0052
     * @tc.name      KeyboardAvoid_ContentItemAt_0052
     * @tc.desc      contentItemAt(index=46.49) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0052 begin`);
      const actual: string = contentItemAt(46.49);
      logInfo(`contentItemAt(index=46.49): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0052 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0053
     * @tc.name      KeyboardAvoid_ContentItemAt_0053
     * @tc.desc      contentItemAt(index=-71) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentItemAt_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0053 begin`);
      const actual: string = contentItemAt(-71);
      logInfo(`contentItemAt(index=-71): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0053 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0054
     * @tc.name      KeyboardAvoid_ContentItemAt_0054
     * @tc.desc      contentItemAt(index=-27) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentItemAt_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0054 begin`);
      const actual: string = contentItemAt(-27);
      logInfo(`contentItemAt(index=-27): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0054 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0055
     * @tc.name      KeyboardAvoid_ContentItemAt_0055
     * @tc.desc      contentItemAt(index=-15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentItemAt_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0055 begin`);
      const actual: string = contentItemAt(-15);
      logInfo(`contentItemAt(index=-15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0055 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0056
     * @tc.name      KeyboardAvoid_ContentItemAt_0056
     * @tc.desc      contentItemAt(index=24) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0056 begin`);
      const actual: string = contentItemAt(24);
      logInfo(`contentItemAt(index=24): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0056 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0057
     * @tc.name      KeyboardAvoid_ContentItemAt_0057
     * @tc.desc      contentItemAt(index=-96) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentItemAt_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0057 begin`);
      const actual: string = contentItemAt(-96);
      logInfo(`contentItemAt(index=-96): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0057 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0058
     * @tc.name      KeyboardAvoid_ContentItemAt_0058
     * @tc.desc      contentItemAt(index=189) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0058 begin`);
      const actual: string = contentItemAt(189);
      logInfo(`contentItemAt(index=189): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0058 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0059
     * @tc.name      KeyboardAvoid_ContentItemAt_0059
     * @tc.desc      contentItemAt(index=-10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentItemAt_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0059 begin`);
      const actual: string = contentItemAt(-10);
      logInfo(`contentItemAt(index=-10): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0059 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0060
     * @tc.name      KeyboardAvoid_ContentItemAt_0060
     * @tc.desc      contentItemAt(index=62.41) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0060 begin`);
      const actual: string = contentItemAt(62.41);
      logInfo(`contentItemAt(index=62.41): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0060 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0061
     * @tc.name      KeyboardAvoid_ContentItemAt_0061
     * @tc.desc      contentItemAt(index=89.62) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0061 begin`);
      const actual: string = contentItemAt(89.62);
      logInfo(`contentItemAt(index=89.62): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0061 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0062
     * @tc.name      KeyboardAvoid_ContentItemAt_0062
     * @tc.desc      contentItemAt(index=-86) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentItemAt_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0062 begin`);
      const actual: string = contentItemAt(-86);
      logInfo(`contentItemAt(index=-86): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0062 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0063
     * @tc.name      KeyboardAvoid_ContentItemAt_0063
     * @tc.desc      contentItemAt(index=-2) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentItemAt_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0063 begin`);
      const actual: string = contentItemAt(-2);
      logInfo(`contentItemAt(index=-2): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0063 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0064
     * @tc.name      KeyboardAvoid_ContentItemAt_0064
     * @tc.desc      contentItemAt(index=-54) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentItemAt_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0064 begin`);
      const actual: string = contentItemAt(-54);
      logInfo(`contentItemAt(index=-54): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0064 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0065
     * @tc.name      KeyboardAvoid_ContentItemAt_0065
     * @tc.desc      contentItemAt(index=79.64) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0065 begin`);
      const actual: string = contentItemAt(79.64);
      logInfo(`contentItemAt(index=79.64): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0065 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0066
     * @tc.name      KeyboardAvoid_ContentItemAt_0066
     * @tc.desc      contentItemAt(index=-30) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentItemAt_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0066 begin`);
      const actual: string = contentItemAt(-30);
      logInfo(`contentItemAt(index=-30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0066 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0067
     * @tc.name      KeyboardAvoid_ContentItemAt_0067
     * @tc.desc      contentItemAt(index=31.24) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0067 begin`);
      const actual: string = contentItemAt(31.24);
      logInfo(`contentItemAt(index=31.24): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0067 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0068
     * @tc.name      KeyboardAvoid_ContentItemAt_0068
     * @tc.desc      contentItemAt(index=-73) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentItemAt_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0068 begin`);
      const actual: string = contentItemAt(-73);
      logInfo(`contentItemAt(index=-73): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0068 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0069
     * @tc.name      KeyboardAvoid_ContentItemAt_0069
     * @tc.desc      contentItemAt(index=-47) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentItemAt_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0069 begin`);
      const actual: string = contentItemAt(-47);
      logInfo(`contentItemAt(index=-47): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0069 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0070
     * @tc.name      KeyboardAvoid_ContentItemAt_0070
     * @tc.desc      contentItemAt(index=86) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0070 begin`);
      const actual: string = contentItemAt(86);
      logInfo(`contentItemAt(index=86): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0070 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0071
     * @tc.name      KeyboardAvoid_ContentItemAt_0071
     * @tc.desc      contentItemAt(index=58.64) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0071 begin`);
      const actual: string = contentItemAt(58.64);
      logInfo(`contentItemAt(index=58.64): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0071 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0072
     * @tc.name      KeyboardAvoid_ContentItemAt_0072
     * @tc.desc      contentItemAt(index=64) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0072 begin`);
      const actual: string = contentItemAt(64);
      logInfo(`contentItemAt(index=64): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0072 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0073
     * @tc.name      KeyboardAvoid_ContentItemAt_0073
     * @tc.desc      contentItemAt(index=36) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0073 begin`);
      const actual: string = contentItemAt(36);
      logInfo(`contentItemAt(index=36): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0073 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0074
     * @tc.name      KeyboardAvoid_ContentItemAt_0074
     * @tc.desc      contentItemAt(index=-88) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentItemAt_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0074 begin`);
      const actual: string = contentItemAt(-88);
      logInfo(`contentItemAt(index=-88): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0074 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0075
     * @tc.name      KeyboardAvoid_ContentItemAt_0075
     * @tc.desc      contentItemAt(index=61.84) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0075 begin`);
      const actual: string = contentItemAt(61.84);
      logInfo(`contentItemAt(index=61.84): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0075 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0076
     * @tc.name      KeyboardAvoid_ContentItemAt_0076
     * @tc.desc      contentItemAt(index=157) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0076 begin`);
      const actual: string = contentItemAt(157);
      logInfo(`contentItemAt(index=157): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0076 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0077
     * @tc.name      KeyboardAvoid_ContentItemAt_0077
     * @tc.desc      contentItemAt(index=8.95) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0077 begin`);
      const actual: string = contentItemAt(8.95);
      logInfo(`contentItemAt(index=8.95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0077 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0078
     * @tc.name      KeyboardAvoid_ContentItemAt_0078
     * @tc.desc      contentItemAt(index=-7) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentItemAt_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0078 begin`);
      const actual: string = contentItemAt(-7);
      logInfo(`contentItemAt(index=-7): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0078 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0079
     * @tc.name      KeyboardAvoid_ContentItemAt_0079
     * @tc.desc      contentItemAt(index=58) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0079 begin`);
      const actual: string = contentItemAt(58);
      logInfo(`contentItemAt(index=58): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0079 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0080
     * @tc.name      KeyboardAvoid_ContentItemAt_0080
     * @tc.desc      contentItemAt(index=43) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0080 begin`);
      const actual: string = contentItemAt(43);
      logInfo(`contentItemAt(index=43): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0080 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0081
     * @tc.name      KeyboardAvoid_ContentItemAt_0081
     * @tc.desc      contentItemAt(index=-17) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentItemAt_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0081 begin`);
      const actual: string = contentItemAt(-17);
      logInfo(`contentItemAt(index=-17): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0081 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0082
     * @tc.name      KeyboardAvoid_ContentItemAt_0082
     * @tc.desc      contentItemAt(index=90.15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0082 begin`);
      const actual: string = contentItemAt(90.15);
      logInfo(`contentItemAt(index=90.15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0082 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0083
     * @tc.name      KeyboardAvoid_ContentItemAt_0083
     * @tc.desc      contentItemAt(index=-28) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentItemAt_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0083 begin`);
      const actual: string = contentItemAt(-28);
      logInfo(`contentItemAt(index=-28): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0083 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0084
     * @tc.name      KeyboardAvoid_ContentItemAt_0084
     * @tc.desc      contentItemAt(index=55.19) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0084 begin`);
      const actual: string = contentItemAt(55.19);
      logInfo(`contentItemAt(index=55.19): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0084 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0085
     * @tc.name      KeyboardAvoid_ContentItemAt_0085
     * @tc.desc      contentItemAt(index=47) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0085 begin`);
      const actual: string = contentItemAt(47);
      logInfo(`contentItemAt(index=47): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0085 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0086
     * @tc.name      KeyboardAvoid_ContentItemAt_0086
     * @tc.desc      contentItemAt(index=-53) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentItemAt_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0086 begin`);
      const actual: string = contentItemAt(-53);
      logInfo(`contentItemAt(index=-53): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0086 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0087
     * @tc.name      KeyboardAvoid_ContentItemAt_0087
     * @tc.desc      contentItemAt(index=31.47) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0087 begin`);
      const actual: string = contentItemAt(31.47);
      logInfo(`contentItemAt(index=31.47): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0087 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0088
     * @tc.name      KeyboardAvoid_ContentItemAt_0088
     * @tc.desc      contentItemAt(index=-19) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentItemAt_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0088 begin`);
      const actual: string = contentItemAt(-19);
      logInfo(`contentItemAt(index=-19): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0088 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0089
     * @tc.name      KeyboardAvoid_ContentItemAt_0089
     * @tc.desc      contentItemAt(index=94.44) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0089 begin`);
      const actual: string = contentItemAt(94.44);
      logInfo(`contentItemAt(index=94.44): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0089 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0090
     * @tc.name      KeyboardAvoid_ContentItemAt_0090
     * @tc.desc      contentItemAt(index=96) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0090 begin`);
      const actual: string = contentItemAt(96);
      logInfo(`contentItemAt(index=96): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0090 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0091
     * @tc.name      KeyboardAvoid_ContentItemAt_0091
     * @tc.desc      contentItemAt(index=74.29) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0091 begin`);
      const actual: string = contentItemAt(74.29);
      logInfo(`contentItemAt(index=74.29): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0091 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0092
     * @tc.name      KeyboardAvoid_ContentItemAt_0092
     * @tc.desc      contentItemAt(index=-14) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentItemAt_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0092 begin`);
      const actual: string = contentItemAt(-14);
      logInfo(`contentItemAt(index=-14): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0092 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0093
     * @tc.name      KeyboardAvoid_ContentItemAt_0093
     * @tc.desc      contentItemAt(index=62.03) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0093 begin`);
      const actual: string = contentItemAt(62.03);
      logInfo(`contentItemAt(index=62.03): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0093 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0094
     * @tc.name      KeyboardAvoid_ContentItemAt_0094
     * @tc.desc      contentItemAt(index=72.41) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0094 begin`);
      const actual: string = contentItemAt(72.41);
      logInfo(`contentItemAt(index=72.41): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0094 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0095
     * @tc.name      KeyboardAvoid_ContentItemAt_0095
     * @tc.desc      contentItemAt(index=62.95) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0095 begin`);
      const actual: string = contentItemAt(62.95);
      logInfo(`contentItemAt(index=62.95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0095 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0096
     * @tc.name      KeyboardAvoid_ContentItemAt_0096
     * @tc.desc      contentItemAt(index=92) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0096 begin`);
      const actual: string = contentItemAt(92);
      logInfo(`contentItemAt(index=92): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0096 end`);
    });
  });
}
