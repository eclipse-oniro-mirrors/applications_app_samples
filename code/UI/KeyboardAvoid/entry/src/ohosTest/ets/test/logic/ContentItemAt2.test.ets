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

/** Logic checks for contentItemAt (24 cases). */
export default function contentItemAt2Test(): void {
  describe('ContentItemAt2Test', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0097
     * @tc.name      KeyboardAvoid_ContentItemAt_0097
     * @tc.desc      contentItemAt(index=31.27) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0097 begin`);
      const actual: string = contentItemAt(31.27);
      logInfo(`contentItemAt(index=31.27): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0097 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0098
     * @tc.name      KeyboardAvoid_ContentItemAt_0098
     * @tc.desc      contentItemAt(index=41) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0098 begin`);
      const actual: string = contentItemAt(41);
      logInfo(`contentItemAt(index=41): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0098 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0099
     * @tc.name      KeyboardAvoid_ContentItemAt_0099
     * @tc.desc      contentItemAt(index=63) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0099 begin`);
      const actual: string = contentItemAt(63);
      logInfo(`contentItemAt(index=63): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0099 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0100
     * @tc.name      KeyboardAvoid_ContentItemAt_0100
     * @tc.desc      contentItemAt(index=68) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0100 begin`);
      const actual: string = contentItemAt(68);
      logInfo(`contentItemAt(index=68): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0100 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0101
     * @tc.name      KeyboardAvoid_ContentItemAt_0101
     * @tc.desc      contentItemAt(index=182) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0101 begin`);
      const actual: string = contentItemAt(182);
      logInfo(`contentItemAt(index=182): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0101 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0102
     * @tc.name      KeyboardAvoid_ContentItemAt_0102
     * @tc.desc      contentItemAt(index=-66) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentItemAt_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0102 begin`);
      const actual: string = contentItemAt(-66);
      logInfo(`contentItemAt(index=-66): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0102 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0103
     * @tc.name      KeyboardAvoid_ContentItemAt_0103
     * @tc.desc      contentItemAt(index=191) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0103 begin`);
      const actual: string = contentItemAt(191);
      logInfo(`contentItemAt(index=191): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0103 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0104
     * @tc.name      KeyboardAvoid_ContentItemAt_0104
     * @tc.desc      contentItemAt(index=10.13) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0104 begin`);
      const actual: string = contentItemAt(10.13);
      logInfo(`contentItemAt(index=10.13): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0104 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0105
     * @tc.name      KeyboardAvoid_ContentItemAt_0105
     * @tc.desc      contentItemAt(index=-6) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentItemAt_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0105 begin`);
      const actual: string = contentItemAt(-6);
      logInfo(`contentItemAt(index=-6): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0105 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0106
     * @tc.name      KeyboardAvoid_ContentItemAt_0106
     * @tc.desc      contentItemAt(index=86.28) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0106 begin`);
      const actual: string = contentItemAt(86.28);
      logInfo(`contentItemAt(index=86.28): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0106 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0107
     * @tc.name      KeyboardAvoid_ContentItemAt_0107
     * @tc.desc      contentItemAt(index=13.49) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0107 begin`);
      const actual: string = contentItemAt(13.49);
      logInfo(`contentItemAt(index=13.49): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0107 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0108
     * @tc.name      KeyboardAvoid_ContentItemAt_0108
     * @tc.desc      contentItemAt(index=107) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0108 begin`);
      const actual: string = contentItemAt(107);
      logInfo(`contentItemAt(index=107): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0108 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0109
     * @tc.name      KeyboardAvoid_ContentItemAt_0109
     * @tc.desc      contentItemAt(index=93.97) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0109 begin`);
      const actual: string = contentItemAt(93.97);
      logInfo(`contentItemAt(index=93.97): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0109 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0110
     * @tc.name      KeyboardAvoid_ContentItemAt_0110
     * @tc.desc      contentItemAt(index=186) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0110 begin`);
      const actual: string = contentItemAt(186);
      logInfo(`contentItemAt(index=186): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0110 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0111
     * @tc.name      KeyboardAvoid_ContentItemAt_0111
     * @tc.desc      contentItemAt(index=-18) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentItemAt_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0111 begin`);
      const actual: string = contentItemAt(-18);
      logInfo(`contentItemAt(index=-18): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0111 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0112
     * @tc.name      KeyboardAvoid_ContentItemAt_0112
     * @tc.desc      contentItemAt(index=-83) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentItemAt_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0112 begin`);
      const actual: string = contentItemAt(-83);
      logInfo(`contentItemAt(index=-83): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0112 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0113
     * @tc.name      KeyboardAvoid_ContentItemAt_0113
     * @tc.desc      contentItemAt(index=168) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0113 begin`);
      const actual: string = contentItemAt(168);
      logInfo(`contentItemAt(index=168): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0113 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0114
     * @tc.name      KeyboardAvoid_ContentItemAt_0114
     * @tc.desc      contentItemAt(index=-35) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentItemAt_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0114 begin`);
      const actual: string = contentItemAt(-35);
      logInfo(`contentItemAt(index=-35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0114 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0115
     * @tc.name      KeyboardAvoid_ContentItemAt_0115
     * @tc.desc      contentItemAt(index=-12) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentItemAt_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0115 begin`);
      const actual: string = contentItemAt(-12);
      logInfo(`contentItemAt(index=-12): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0115 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0116
     * @tc.name      KeyboardAvoid_ContentItemAt_0116
     * @tc.desc      contentItemAt(index=159) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0116 begin`);
      const actual: string = contentItemAt(159);
      logInfo(`contentItemAt(index=159): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0116 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0117
     * @tc.name      KeyboardAvoid_ContentItemAt_0117
     * @tc.desc      contentItemAt(index=-34) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentItemAt_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0117 begin`);
      const actual: string = contentItemAt(-34);
      logInfo(`contentItemAt(index=-34): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0117 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0118
     * @tc.name      KeyboardAvoid_ContentItemAt_0118
     * @tc.desc      contentItemAt(index=-51) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentItemAt_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0118 begin`);
      const actual: string = contentItemAt(-51);
      logInfo(`contentItemAt(index=-51): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0118 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0119
     * @tc.name      KeyboardAvoid_ContentItemAt_0119
     * @tc.desc      contentItemAt(index=122) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_ContentItemAt_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0119 begin`);
      const actual: string = contentItemAt(122);
      logInfo(`contentItemAt(index=122): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0119 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_CONTENT_ITEM_AT_0120
     * @tc.name      KeyboardAvoid_ContentItemAt_0120
     * @tc.desc      contentItemAt(index=-77) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('KeyboardAvoid_ContentItemAt_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ContentItemAt_0120 begin`);
      const actual: string = contentItemAt(-77);
      logInfo(`contentItemAt(index=-77): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ContentItemAt_0120 end`);
    });
  });
}
