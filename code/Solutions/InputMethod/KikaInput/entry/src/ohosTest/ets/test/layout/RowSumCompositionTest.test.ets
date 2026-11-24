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
import hilog from '@ohos.hilog';
import { yieldToEventLoop } from '../support/AsyncSupport';
import {
  keySourceListData,
  numberSourceListData,
  symbolSourceListData,
  sourceListType
} from '../../../../main/ets/model/KeyboardKeyData';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputRowSumComposition]';

export default function rowSumCompositionTest(): void {
  describe('RowSumCompositionTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_ROW_SUM_COMPOSITION_0100
     * @tc.name      testRowSumComposition_001
     * @tc.desc      Verify that the three pages together offer exactly eighty glyph slots.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testRowSumComposition_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRowSumComposition_001 begin');
      const budget: number = keySourceListData.length + numberSourceListData.length +
        symbolSourceListData.length;
      expect(budget).assertEqual(80);
      expect(keySourceListData.length + numberSourceListData.length).assertEqual(53);
      expect(numberSourceListData.length).assertEqual(symbolSourceListData.length);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testRowSumComposition_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ROW_SUM_COMPOSITION_0200
     * @tc.name      testRowSumComposition_002
     * @tc.desc      Verify the alphabet stagger advances ten then nine slots between row starts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testRowSumComposition_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRowSumComposition_002 begin');
      const letters: string[] = keySourceListData.map((entry: sourceListType): string => entry.content);
      const starts: string[] = [letters[0], letters[letters.indexOf('a')], letters[letters.indexOf('z')]];
      expect(starts.join('')).assertEqual('qaz');
      expect(letters.indexOf('p')).assertEqual(9);
      expect(letters.indexOf('a')).assertEqual(10);
      expect(letters.indexOf('z') - letters.indexOf('a')).assertEqual(9);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testRowSumComposition_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ROW_SUM_COMPOSITION_0300
     * @tc.name      testRowSumComposition_003
     * @tc.desc      Verify the numeric tail row holds seven distinct symbols from star to question mark.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testRowSumComposition_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRowSumComposition_003 begin');
      const tail: string[] = numberSourceListData.slice(20).map((entry: sourceListType): string => entry.content);
      const distinct: Set<string> = new Set<string>();
      for (let i = 0; i < tail.length; i++) {
        distinct.add(tail[i]);
      }
      expect(tail.length).assertEqual(7);
      expect(distinct.size).assertEqual(7);
      expect(tail[0]).assertEqual('*');
      expect(tail[tail.length - 1]).assertEqual('?');
      expect(tail[1].charCodeAt(0)).assertEqual(34);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testRowSumComposition_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ROW_SUM_COMPOSITION_0400
     * @tc.name      testRowSumComposition_004
     * @tc.desc      Verify the symbol tail row starts with a backslash and closes with a bracket.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testRowSumComposition_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRowSumComposition_004 begin');
      const tail: string[] = symbolSourceListData.slice(20).map((entry: sourceListType): string => entry.content);
      expect(tail.length).assertEqual(7);
      expect(tail[0].charCodeAt(0)).assertEqual(92);
      expect(tail[tail.length - 1]).assertEqual(']');
      const head: string[] = symbolSourceListData.slice(0, 10).map((entry: sourceListType): string => entry.content);
      expect(head.indexOf('€')).assertEqual(-1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testRowSumComposition_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ROW_SUM_COMPOSITION_0500
     * @tc.name      testRowSumComposition_005
     * @tc.desc      Verify the three pages open with different glyphs so page switching is observable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testRowSumComposition_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRowSumComposition_005 begin');
      const openers: string[] = [keySourceListData[0].content, numberSourceListData[0].content,
        symbolSourceListData[0].content];
      const uniqueOpeners: Set<string> = new Set<string>(openers);
      expect(uniqueOpeners.size).assertEqual(3);
      expect(openers[1]).assertEqual('1');
      expect(openers[2].charCodeAt(0)).assertEqual(126);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testRowSumComposition_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_ROW_SUM_COMPOSITION_0600
     * @tc.name      testRowSumComposition_006
     * @tc.desc      Verify that every page closes on the same seven-slot row length despite different content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testRowSumComposition_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRowSumComposition_006 begin');
      const tailLengths: number[] = [keySourceListData.slice(19).length,
        numberSourceListData.slice(20).length, symbolSourceListData.slice(20).length];
      expect(tailLengths.join('|')).assertEqual('7|7|7');
      expect(keySourceListData[25].content).assertEqual('m');
      expect(numberSourceListData[26].content).assertEqual('?');
      expect(symbolSourceListData[26].content).assertEqual(']');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testRowSumComposition_006 end');
      await yieldToEventLoop();
    });

  });
}
