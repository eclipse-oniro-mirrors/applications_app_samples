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
import { relativeOffsetOf } from '../model/ListExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ListBeExchange]';
const BUNDLE: string = 'ListBeExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for relativeOffsetOf (58 cases). */
export default function relativeOffsetOf3Test(): void {
  describe('RelativeOffsetOf3Test', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0193
     * @tc.name      ListBeExchange_RelativeOffsetOf_0193
     * @tc.desc      relativeOffsetOf(offsetY=15, dragRefOffset=134) returns -119
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0193 begin`);
      const actual: number = relativeOffsetOf(15, 134);
      logInfo(`relativeOffsetOf(offsetY=15, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-119);
      logInfo(`${BUNDLE}RelativeOffsetOf_0193 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0194
     * @tc.name      ListBeExchange_RelativeOffsetOf_0194
     * @tc.desc      relativeOffsetOf(offsetY=20, dragRefOffset=-100) returns 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0194 begin`);
      const actual: number = relativeOffsetOf(20, -100);
      logInfo(`relativeOffsetOf(offsetY=20, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}RelativeOffsetOf_0194 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0195
     * @tc.name      ListBeExchange_RelativeOffsetOf_0195
     * @tc.desc      relativeOffsetOf(offsetY=20, dragRefOffset=-1) returns 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0195 begin`);
      const actual: number = relativeOffsetOf(20, -1);
      logInfo(`relativeOffsetOf(offsetY=20, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(21);
      logInfo(`${BUNDLE}RelativeOffsetOf_0195 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0196
     * @tc.name      ListBeExchange_RelativeOffsetOf_0196
     * @tc.desc      relativeOffsetOf(offsetY=20, dragRefOffset=1) returns 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0196 begin`);
      const actual: number = relativeOffsetOf(20, 1);
      logInfo(`relativeOffsetOf(offsetY=20, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(19);
      logInfo(`${BUNDLE}RelativeOffsetOf_0196 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0197
     * @tc.name      ListBeExchange_RelativeOffsetOf_0197
     * @tc.desc      relativeOffsetOf(offsetY=20, dragRefOffset=2) returns 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0197 begin`);
      const actual: number = relativeOffsetOf(20, 2);
      logInfo(`relativeOffsetOf(offsetY=20, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(18);
      logInfo(`${BUNDLE}RelativeOffsetOf_0197 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0198
     * @tc.name      ListBeExchange_RelativeOffsetOf_0198
     * @tc.desc      relativeOffsetOf(offsetY=20, dragRefOffset=3) returns 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0198 begin`);
      const actual: number = relativeOffsetOf(20, 3);
      logInfo(`relativeOffsetOf(offsetY=20, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(17);
      logInfo(`${BUNDLE}RelativeOffsetOf_0198 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0199
     * @tc.name      ListBeExchange_RelativeOffsetOf_0199
     * @tc.desc      relativeOffsetOf(offsetY=20, dragRefOffset=133) returns -113
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0199 begin`);
      const actual: number = relativeOffsetOf(20, 133);
      logInfo(`relativeOffsetOf(offsetY=20, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-113);
      logInfo(`${BUNDLE}RelativeOffsetOf_0199 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0200
     * @tc.name      ListBeExchange_RelativeOffsetOf_0200
     * @tc.desc      relativeOffsetOf(offsetY=20, dragRefOffset=134) returns -114
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0200 begin`);
      const actual: number = relativeOffsetOf(20, 134);
      logInfo(`relativeOffsetOf(offsetY=20, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-114);
      logInfo(`${BUNDLE}RelativeOffsetOf_0200 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0201
     * @tc.name      ListBeExchange_RelativeOffsetOf_0201
     * @tc.desc      relativeOffsetOf(offsetY=25, dragRefOffset=-100) returns 125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0201 begin`);
      const actual: number = relativeOffsetOf(25, -100);
      logInfo(`relativeOffsetOf(offsetY=25, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(125);
      logInfo(`${BUNDLE}RelativeOffsetOf_0201 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0202
     * @tc.name      ListBeExchange_RelativeOffsetOf_0202
     * @tc.desc      relativeOffsetOf(offsetY=25, dragRefOffset=-1) returns 26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0202 begin`);
      const actual: number = relativeOffsetOf(25, -1);
      logInfo(`relativeOffsetOf(offsetY=25, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(26);
      logInfo(`${BUNDLE}RelativeOffsetOf_0202 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0203
     * @tc.name      ListBeExchange_RelativeOffsetOf_0203
     * @tc.desc      relativeOffsetOf(offsetY=25, dragRefOffset=1) returns 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0203 begin`);
      const actual: number = relativeOffsetOf(25, 1);
      logInfo(`relativeOffsetOf(offsetY=25, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(24);
      logInfo(`${BUNDLE}RelativeOffsetOf_0203 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0204
     * @tc.name      ListBeExchange_RelativeOffsetOf_0204
     * @tc.desc      relativeOffsetOf(offsetY=25, dragRefOffset=2) returns 23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0204 begin`);
      const actual: number = relativeOffsetOf(25, 2);
      logInfo(`relativeOffsetOf(offsetY=25, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(23);
      logInfo(`${BUNDLE}RelativeOffsetOf_0204 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0205
     * @tc.name      ListBeExchange_RelativeOffsetOf_0205
     * @tc.desc      relativeOffsetOf(offsetY=25, dragRefOffset=3) returns 22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0205 begin`);
      const actual: number = relativeOffsetOf(25, 3);
      logInfo(`relativeOffsetOf(offsetY=25, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(22);
      logInfo(`${BUNDLE}RelativeOffsetOf_0205 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0206
     * @tc.name      ListBeExchange_RelativeOffsetOf_0206
     * @tc.desc      relativeOffsetOf(offsetY=25, dragRefOffset=133) returns -108
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0206 begin`);
      const actual: number = relativeOffsetOf(25, 133);
      logInfo(`relativeOffsetOf(offsetY=25, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-108);
      logInfo(`${BUNDLE}RelativeOffsetOf_0206 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0207
     * @tc.name      ListBeExchange_RelativeOffsetOf_0207
     * @tc.desc      relativeOffsetOf(offsetY=25, dragRefOffset=134) returns -109
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0207 begin`);
      const actual: number = relativeOffsetOf(25, 134);
      logInfo(`relativeOffsetOf(offsetY=25, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-109);
      logInfo(`${BUNDLE}RelativeOffsetOf_0207 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0208
     * @tc.name      ListBeExchange_RelativeOffsetOf_0208
     * @tc.desc      relativeOffsetOf(offsetY=30, dragRefOffset=-100) returns 130
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0208 begin`);
      const actual: number = relativeOffsetOf(30, -100);
      logInfo(`relativeOffsetOf(offsetY=30, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(130);
      logInfo(`${BUNDLE}RelativeOffsetOf_0208 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0209
     * @tc.name      ListBeExchange_RelativeOffsetOf_0209
     * @tc.desc      relativeOffsetOf(offsetY=30, dragRefOffset=-1) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0209 begin`);
      const actual: number = relativeOffsetOf(30, -1);
      logInfo(`relativeOffsetOf(offsetY=30, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}RelativeOffsetOf_0209 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0210
     * @tc.name      ListBeExchange_RelativeOffsetOf_0210
     * @tc.desc      relativeOffsetOf(offsetY=30, dragRefOffset=1) returns 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0210 begin`);
      const actual: number = relativeOffsetOf(30, 1);
      logInfo(`relativeOffsetOf(offsetY=30, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(29);
      logInfo(`${BUNDLE}RelativeOffsetOf_0210 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0211
     * @tc.name      ListBeExchange_RelativeOffsetOf_0211
     * @tc.desc      relativeOffsetOf(offsetY=30, dragRefOffset=2) returns 28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0211 begin`);
      const actual: number = relativeOffsetOf(30, 2);
      logInfo(`relativeOffsetOf(offsetY=30, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(28);
      logInfo(`${BUNDLE}RelativeOffsetOf_0211 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0212
     * @tc.name      ListBeExchange_RelativeOffsetOf_0212
     * @tc.desc      relativeOffsetOf(offsetY=30, dragRefOffset=3) returns 27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0212 begin`);
      const actual: number = relativeOffsetOf(30, 3);
      logInfo(`relativeOffsetOf(offsetY=30, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(27);
      logInfo(`${BUNDLE}RelativeOffsetOf_0212 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0213
     * @tc.name      ListBeExchange_RelativeOffsetOf_0213
     * @tc.desc      relativeOffsetOf(offsetY=35, dragRefOffset=-100) returns 135
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0213 begin`);
      const actual: number = relativeOffsetOf(35, -100);
      logInfo(`relativeOffsetOf(offsetY=35, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(135);
      logInfo(`${BUNDLE}RelativeOffsetOf_0213 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0214
     * @tc.name      ListBeExchange_RelativeOffsetOf_0214
     * @tc.desc      relativeOffsetOf(offsetY=35, dragRefOffset=-1) returns 36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0214 begin`);
      const actual: number = relativeOffsetOf(35, -1);
      logInfo(`relativeOffsetOf(offsetY=35, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(36);
      logInfo(`${BUNDLE}RelativeOffsetOf_0214 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0215
     * @tc.name      ListBeExchange_RelativeOffsetOf_0215
     * @tc.desc      relativeOffsetOf(offsetY=35, dragRefOffset=1) returns 34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0215 begin`);
      const actual: number = relativeOffsetOf(35, 1);
      logInfo(`relativeOffsetOf(offsetY=35, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(34);
      logInfo(`${BUNDLE}RelativeOffsetOf_0215 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0216
     * @tc.name      ListBeExchange_RelativeOffsetOf_0216
     * @tc.desc      relativeOffsetOf(offsetY=35, dragRefOffset=2) returns 33
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0216 begin`);
      const actual: number = relativeOffsetOf(35, 2);
      logInfo(`relativeOffsetOf(offsetY=35, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(33);
      logInfo(`${BUNDLE}RelativeOffsetOf_0216 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0217
     * @tc.name      ListBeExchange_RelativeOffsetOf_0217
     * @tc.desc      relativeOffsetOf(offsetY=35, dragRefOffset=3) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0217 begin`);
      const actual: number = relativeOffsetOf(35, 3);
      logInfo(`relativeOffsetOf(offsetY=35, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}RelativeOffsetOf_0217 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0218
     * @tc.name      ListBeExchange_RelativeOffsetOf_0218
     * @tc.desc      relativeOffsetOf(offsetY=40, dragRefOffset=-100) returns 140
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0218 begin`);
      const actual: number = relativeOffsetOf(40, -100);
      logInfo(`relativeOffsetOf(offsetY=40, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(140);
      logInfo(`${BUNDLE}RelativeOffsetOf_0218 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0219
     * @tc.name      ListBeExchange_RelativeOffsetOf_0219
     * @tc.desc      relativeOffsetOf(offsetY=40, dragRefOffset=-1) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0219 begin`);
      const actual: number = relativeOffsetOf(40, -1);
      logInfo(`relativeOffsetOf(offsetY=40, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}RelativeOffsetOf_0219 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0220
     * @tc.name      ListBeExchange_RelativeOffsetOf_0220
     * @tc.desc      relativeOffsetOf(offsetY=40, dragRefOffset=1) returns 39
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0220 begin`);
      const actual: number = relativeOffsetOf(40, 1);
      logInfo(`relativeOffsetOf(offsetY=40, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(39);
      logInfo(`${BUNDLE}RelativeOffsetOf_0220 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0221
     * @tc.name      ListBeExchange_RelativeOffsetOf_0221
     * @tc.desc      relativeOffsetOf(offsetY=40, dragRefOffset=2) returns 38
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0221 begin`);
      const actual: number = relativeOffsetOf(40, 2);
      logInfo(`relativeOffsetOf(offsetY=40, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(38);
      logInfo(`${BUNDLE}RelativeOffsetOf_0221 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0222
     * @tc.name      ListBeExchange_RelativeOffsetOf_0222
     * @tc.desc      relativeOffsetOf(offsetY=40, dragRefOffset=3) returns 37
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0222 begin`);
      const actual: number = relativeOffsetOf(40, 3);
      logInfo(`relativeOffsetOf(offsetY=40, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(37);
      logInfo(`${BUNDLE}RelativeOffsetOf_0222 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0223
     * @tc.name      ListBeExchange_RelativeOffsetOf_0223
     * @tc.desc      relativeOffsetOf(offsetY=45, dragRefOffset=-100) returns 145
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0223 begin`);
      const actual: number = relativeOffsetOf(45, -100);
      logInfo(`relativeOffsetOf(offsetY=45, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(145);
      logInfo(`${BUNDLE}RelativeOffsetOf_0223 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0224
     * @tc.name      ListBeExchange_RelativeOffsetOf_0224
     * @tc.desc      relativeOffsetOf(offsetY=45, dragRefOffset=-1) returns 46
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0224 begin`);
      const actual: number = relativeOffsetOf(45, -1);
      logInfo(`relativeOffsetOf(offsetY=45, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(46);
      logInfo(`${BUNDLE}RelativeOffsetOf_0224 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0225
     * @tc.name      ListBeExchange_RelativeOffsetOf_0225
     * @tc.desc      relativeOffsetOf(offsetY=45, dragRefOffset=1) returns 44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0225 begin`);
      const actual: number = relativeOffsetOf(45, 1);
      logInfo(`relativeOffsetOf(offsetY=45, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(44);
      logInfo(`${BUNDLE}RelativeOffsetOf_0225 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0226
     * @tc.name      ListBeExchange_RelativeOffsetOf_0226
     * @tc.desc      relativeOffsetOf(offsetY=45, dragRefOffset=2) returns 43
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0226 begin`);
      const actual: number = relativeOffsetOf(45, 2);
      logInfo(`relativeOffsetOf(offsetY=45, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(43);
      logInfo(`${BUNDLE}RelativeOffsetOf_0226 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0227
     * @tc.name      ListBeExchange_RelativeOffsetOf_0227
     * @tc.desc      relativeOffsetOf(offsetY=45, dragRefOffset=3) returns 42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0227 begin`);
      const actual: number = relativeOffsetOf(45, 3);
      logInfo(`relativeOffsetOf(offsetY=45, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(42);
      logInfo(`${BUNDLE}RelativeOffsetOf_0227 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0228
     * @tc.name      ListBeExchange_RelativeOffsetOf_0228
     * @tc.desc      relativeOffsetOf(offsetY=55, dragRefOffset=-100) returns 155
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0228 begin`);
      const actual: number = relativeOffsetOf(55, -100);
      logInfo(`relativeOffsetOf(offsetY=55, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(155);
      logInfo(`${BUNDLE}RelativeOffsetOf_0228 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0229
     * @tc.name      ListBeExchange_RelativeOffsetOf_0229
     * @tc.desc      relativeOffsetOf(offsetY=55, dragRefOffset=-1) returns 56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0229 begin`);
      const actual: number = relativeOffsetOf(55, -1);
      logInfo(`relativeOffsetOf(offsetY=55, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(56);
      logInfo(`${BUNDLE}RelativeOffsetOf_0229 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0230
     * @tc.name      ListBeExchange_RelativeOffsetOf_0230
     * @tc.desc      relativeOffsetOf(offsetY=55, dragRefOffset=1) returns 54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0230 begin`);
      const actual: number = relativeOffsetOf(55, 1);
      logInfo(`relativeOffsetOf(offsetY=55, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(54);
      logInfo(`${BUNDLE}RelativeOffsetOf_0230 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0231
     * @tc.name      ListBeExchange_RelativeOffsetOf_0231
     * @tc.desc      relativeOffsetOf(offsetY=55, dragRefOffset=2) returns 53
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0231 begin`);
      const actual: number = relativeOffsetOf(55, 2);
      logInfo(`relativeOffsetOf(offsetY=55, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(53);
      logInfo(`${BUNDLE}RelativeOffsetOf_0231 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0232
     * @tc.name      ListBeExchange_RelativeOffsetOf_0232
     * @tc.desc      relativeOffsetOf(offsetY=55, dragRefOffset=3) returns 52
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0232 begin`);
      const actual: number = relativeOffsetOf(55, 3);
      logInfo(`relativeOffsetOf(offsetY=55, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(52);
      logInfo(`${BUNDLE}RelativeOffsetOf_0232 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0233
     * @tc.name      ListBeExchange_RelativeOffsetOf_0233
     * @tc.desc      relativeOffsetOf(offsetY=60, dragRefOffset=-100) returns 160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0233 begin`);
      const actual: number = relativeOffsetOf(60, -100);
      logInfo(`relativeOffsetOf(offsetY=60, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(160);
      logInfo(`${BUNDLE}RelativeOffsetOf_0233 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0234
     * @tc.name      ListBeExchange_RelativeOffsetOf_0234
     * @tc.desc      relativeOffsetOf(offsetY=60, dragRefOffset=-1) returns 61
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0234 begin`);
      const actual: number = relativeOffsetOf(60, -1);
      logInfo(`relativeOffsetOf(offsetY=60, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(61);
      logInfo(`${BUNDLE}RelativeOffsetOf_0234 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0235
     * @tc.name      ListBeExchange_RelativeOffsetOf_0235
     * @tc.desc      relativeOffsetOf(offsetY=60, dragRefOffset=1) returns 59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0235 begin`);
      const actual: number = relativeOffsetOf(60, 1);
      logInfo(`relativeOffsetOf(offsetY=60, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(59);
      logInfo(`${BUNDLE}RelativeOffsetOf_0235 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0236
     * @tc.name      ListBeExchange_RelativeOffsetOf_0236
     * @tc.desc      relativeOffsetOf(offsetY=60, dragRefOffset=2) returns 58
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0236 begin`);
      const actual: number = relativeOffsetOf(60, 2);
      logInfo(`relativeOffsetOf(offsetY=60, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(58);
      logInfo(`${BUNDLE}RelativeOffsetOf_0236 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0237
     * @tc.name      ListBeExchange_RelativeOffsetOf_0237
     * @tc.desc      relativeOffsetOf(offsetY=60, dragRefOffset=3) returns 57
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0237 begin`);
      const actual: number = relativeOffsetOf(60, 3);
      logInfo(`relativeOffsetOf(offsetY=60, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(57);
      logInfo(`${BUNDLE}RelativeOffsetOf_0237 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0238
     * @tc.name      ListBeExchange_RelativeOffsetOf_0238
     * @tc.desc      relativeOffsetOf(offsetY=65, dragRefOffset=-100) returns 165
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0238 begin`);
      const actual: number = relativeOffsetOf(65, -100);
      logInfo(`relativeOffsetOf(offsetY=65, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(165);
      logInfo(`${BUNDLE}RelativeOffsetOf_0238 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0239
     * @tc.name      ListBeExchange_RelativeOffsetOf_0239
     * @tc.desc      relativeOffsetOf(offsetY=65, dragRefOffset=-1) returns 66
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0239 begin`);
      const actual: number = relativeOffsetOf(65, -1);
      logInfo(`relativeOffsetOf(offsetY=65, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(66);
      logInfo(`${BUNDLE}RelativeOffsetOf_0239 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0240
     * @tc.name      ListBeExchange_RelativeOffsetOf_0240
     * @tc.desc      relativeOffsetOf(offsetY=65, dragRefOffset=1) returns 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0240 begin`);
      const actual: number = relativeOffsetOf(65, 1);
      logInfo(`relativeOffsetOf(offsetY=65, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(64);
      logInfo(`${BUNDLE}RelativeOffsetOf_0240 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0241
     * @tc.name      ListBeExchange_RelativeOffsetOf_0241
     * @tc.desc      relativeOffsetOf(offsetY=65, dragRefOffset=2) returns 63
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0241 begin`);
      const actual: number = relativeOffsetOf(65, 2);
      logInfo(`relativeOffsetOf(offsetY=65, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(63);
      logInfo(`${BUNDLE}RelativeOffsetOf_0241 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0242
     * @tc.name      ListBeExchange_RelativeOffsetOf_0242
     * @tc.desc      relativeOffsetOf(offsetY=65, dragRefOffset=3) returns 62
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0242 begin`);
      const actual: number = relativeOffsetOf(65, 3);
      logInfo(`relativeOffsetOf(offsetY=65, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(62);
      logInfo(`${BUNDLE}RelativeOffsetOf_0242 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0243
     * @tc.name      ListBeExchange_RelativeOffsetOf_0243
     * @tc.desc      relativeOffsetOf(offsetY=70, dragRefOffset=-100) returns 170
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0243 begin`);
      const actual: number = relativeOffsetOf(70, -100);
      logInfo(`relativeOffsetOf(offsetY=70, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(170);
      logInfo(`${BUNDLE}RelativeOffsetOf_0243 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0244
     * @tc.name      ListBeExchange_RelativeOffsetOf_0244
     * @tc.desc      relativeOffsetOf(offsetY=70, dragRefOffset=-1) returns 71
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0244 begin`);
      const actual: number = relativeOffsetOf(70, -1);
      logInfo(`relativeOffsetOf(offsetY=70, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(71);
      logInfo(`${BUNDLE}RelativeOffsetOf_0244 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0245
     * @tc.name      ListBeExchange_RelativeOffsetOf_0245
     * @tc.desc      relativeOffsetOf(offsetY=70, dragRefOffset=1) returns 69
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0245 begin`);
      const actual: number = relativeOffsetOf(70, 1);
      logInfo(`relativeOffsetOf(offsetY=70, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(69);
      logInfo(`${BUNDLE}RelativeOffsetOf_0245 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0246
     * @tc.name      ListBeExchange_RelativeOffsetOf_0246
     * @tc.desc      relativeOffsetOf(offsetY=70, dragRefOffset=2) returns 68
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0246 begin`);
      const actual: number = relativeOffsetOf(70, 2);
      logInfo(`relativeOffsetOf(offsetY=70, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(68);
      logInfo(`${BUNDLE}RelativeOffsetOf_0246 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0247
     * @tc.name      ListBeExchange_RelativeOffsetOf_0247
     * @tc.desc      relativeOffsetOf(offsetY=70, dragRefOffset=3) returns 67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0247 begin`);
      const actual: number = relativeOffsetOf(70, 3);
      logInfo(`relativeOffsetOf(offsetY=70, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(67);
      logInfo(`${BUNDLE}RelativeOffsetOf_0247 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0248
     * @tc.name      ListBeExchange_RelativeOffsetOf_0248
     * @tc.desc      relativeOffsetOf(offsetY=75, dragRefOffset=-100) returns 175
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0248 begin`);
      const actual: number = relativeOffsetOf(75, -100);
      logInfo(`relativeOffsetOf(offsetY=75, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(175);
      logInfo(`${BUNDLE}RelativeOffsetOf_0248 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0249
     * @tc.name      ListBeExchange_RelativeOffsetOf_0249
     * @tc.desc      relativeOffsetOf(offsetY=75, dragRefOffset=-1) returns 76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0249 begin`);
      const actual: number = relativeOffsetOf(75, -1);
      logInfo(`relativeOffsetOf(offsetY=75, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(76);
      logInfo(`${BUNDLE}RelativeOffsetOf_0249 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0250
     * @tc.name      ListBeExchange_RelativeOffsetOf_0250
     * @tc.desc      relativeOffsetOf(offsetY=75, dragRefOffset=1) returns 74
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0250 begin`);
      const actual: number = relativeOffsetOf(75, 1);
      logInfo(`relativeOffsetOf(offsetY=75, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(74);
      logInfo(`${BUNDLE}RelativeOffsetOf_0250 end`);
    });
  });
}
