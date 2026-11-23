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
import { createPreviewHarness, PreviewHarness } from '../support/PreviewHarness';
import { pressHardKey, releaseHardKey } from '../support/TestSupport';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodMore2]';

export default function chordOrder2Test(): void {
  describe('ChordOrder2Test', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDORDER2_0001
     * @tc.name      testChordOrder_2001
     * @tc.desc      Verify the extended chord 2017-2018-2045 released as 2018-2045-2017.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordOrder_2001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_2001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2018)).assertEqual(true);
      expect(pressHardKey(2045)).assertEqual(false);
      const releaseOrder: number[] = [2018, 2045, 2017];
      for (let i: number = 0; i < releaseOrder.length; i++) {
        expect(releaseHardKey(releaseOrder[i])).assertEqual(true);
      }
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');
      expect(harness.client.buffer.charCodeAt(0)).assertEqual(97);
      expect(harness.client.buffer.charCodeAt(1)).assertEqual(98);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_2001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDORDER2_0002
     * @tc.name      testChordOrder_2002
     * @tc.desc      Verify the extended chord 2055-2017-2018 released as 2055-2017-2018.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordOrder_2002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_2002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const step1: boolean = pressHardKey(2055);
      expect(step1).assertEqual(true);
      const step2: boolean = pressHardKey(2017);
      expect(step2).assertEqual(true);
      const step3: boolean = pressHardKey(2018);
      expect(step3).assertEqual(true);
      const step4: boolean = releaseHardKey(2055);
      expect(step4).assertEqual(true);
      const step5: boolean = releaseHardKey(2017);
      expect(step5).assertEqual(true);
      const step6: boolean = releaseHardKey(2018);
      expect(step6).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');
      expect(harness.client.buffer).assertEqual('ab');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_2002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDORDER2_0003
     * @tc.name      testChordOrder_2003
     * @tc.desc      Verify the extended chord 2055-2017-2018 released as 2055-2018-2017.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordOrder_2003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_2003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(pressHardKey(2055)).assertEqual(true);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2018)).assertEqual(true);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(releaseHardKey(2018)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');
      expect(harness.client.buffer).assertEqual('ab');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_2003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDORDER2_0004
     * @tc.name      testChordOrder_2004
     * @tc.desc      Verify the extended chord 2055-2017-2018 released as 2017-2018-2055.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordOrder_2004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_2004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const outcomes: boolean[] = [
        pressHardKey(2055), pressHardKey(2017), pressHardKey(2018),
        releaseHardKey(2017), releaseHardKey(2018), releaseHardKey(2055)
      ];
      expect(outcomes.length).assertEqual(6);
      expect(outcomes.join('')).assertEqual('truetruetruetruetruetrue');
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');
      expect(harness.client.buffer).assertEqual('ab');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_2004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDORDER2_0005
     * @tc.name      testChordOrder_2005
     * @tc.desc      Verify the extended chord 2055-2017-2018 released as 2017-2055-2018.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordOrder_2005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_2005 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const expected: string = 'ab';
      expect(pressHardKey(2055)).assertEqual(true);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2018)).assertEqual(true);
      const releaseOrder: number[] = [2017, 2055, 2018];
      for (let i: number = 0; i < releaseOrder.length; i++) {
        expect(releaseHardKey(releaseOrder[i])).assertEqual(true);
      }
      expect(harness.client.buffer.length).assertEqual(expected.length);
      expect(harness.client.insertedTexts.join('')).assertEqual(expected);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_2005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDORDER2_0006
     * @tc.name      testChordOrder_2006
     * @tc.desc      Verify the extended chord 3000-2017-2018 released as 3000-2017-2018.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordOrder_2006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_2006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const step1: boolean = pressHardKey(3000);
      expect(step1).assertEqual(false);
      const step2: boolean = pressHardKey(2017);
      expect(step2).assertEqual(false);
      const step3: boolean = pressHardKey(2018);
      expect(step3).assertEqual(false);
      const step4: boolean = releaseHardKey(3000);
      expect(step4).assertEqual(false);
      const step5: boolean = releaseHardKey(2017);
      expect(step5).assertEqual(false);
      const step6: boolean = releaseHardKey(2018);
      expect(step6).assertEqual(false);
      expect(harness.client.insertedTexts.join('')).assertEqual('');
      expect(harness.client.buffer).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_2006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDORDER2_0007
     * @tc.name      testChordOrder_2007
     * @tc.desc      Verify the extended chord 3000-2017-2018 released as 3000-2018-2017.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordOrder_2007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_2007 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(pressHardKey(3000)).assertEqual(false);
      expect(pressHardKey(2017)).assertEqual(false);
      expect(pressHardKey(2018)).assertEqual(false);
      expect(releaseHardKey(3000)).assertEqual(false);
      expect(releaseHardKey(2018)).assertEqual(false);
      expect(releaseHardKey(2017)).assertEqual(false);
      expect(harness.client.insertedTexts.join('')).assertEqual('');
      expect(harness.client.buffer).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_2007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDORDER2_0008
     * @tc.name      testChordOrder_2008
     * @tc.desc      Verify the extended chord 3000-2017-2018 released as 2017-2018-3000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordOrder_2008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_2008 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const pressKeys: number[] = [3000, 2017, 2018];
      for (let i: number = 0; i < pressKeys.length; i++) {
        expect(pressHardKey(pressKeys[i])).assertEqual(false);
      }
      const releaseKeys: number[] = [2017, 2018, 3000];
      for (let i: number = 0; i < releaseKeys.length; i++) {
        expect(releaseHardKey(releaseKeys[i])).assertEqual(false);
      }
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.buffer.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_2008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDORDER2_0009
     * @tc.name      testChordOrder_2009
     * @tc.desc      Verify the extended chord 3000-2017-2018 released as 2017-3000-2018.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordOrder_2009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_2009 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const pressKeys: number[] = [3000, 2017, 2018];
      let index: number = 0;
      while (index < pressKeys.length) {
        expect(pressHardKey(pressKeys[index])).assertEqual(false);
        index = index + 1;
      }
      const releaseKeys: number[] = [2017, 3000, 2018];
      const releaseExpected: boolean[] = [false, false, false];
      for (let i: number = 0; i < releaseKeys.length; i++) {
        expect(releaseHardKey(releaseKeys[i])).assertEqual(releaseExpected[i]);
      }
      expect(harness.client.insertedTexts.join('')).assertEqual('');
      expect(harness.client.buffer).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_2009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDORDER2_0010
     * @tc.name      testChordOrder_2010
     * @tc.desc      Verify the extended chord 2047-2001-2017 released as 2047-2001-2017.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordOrder_2010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_2010 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const pressResults: boolean[] = [pressHardKey(2047), pressHardKey(2001), pressHardKey(2017)];
      expect(pressResults.length).assertEqual(3);
      expect(pressResults[0]).assertEqual(false);
      expect(pressResults[1]).assertEqual(false);
      expect(pressResults[2]).assertEqual(false);
      const releaseResults: boolean[] = [releaseHardKey(2047), releaseHardKey(2001), releaseHardKey(2017)];
      expect(releaseResults[0]).assertEqual(false);
      expect(releaseResults[1]).assertEqual(false);
      expect(releaseResults[2]).assertEqual(false);
      expect(harness.client.insertedTexts.join('')).assertEqual('');
      expect(harness.client.buffer).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_2010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDORDER2_0011
     * @tc.name      testChordOrder_2011
     * @tc.desc      Verify the extended chord 2047-2001-2017 released as 2047-2017-2001.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordOrder_2011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_2011 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const outcomes: boolean[] = [];
      outcomes.push(pressHardKey(2047));
      outcomes.push(pressHardKey(2001));
      outcomes.push(pressHardKey(2017));
      outcomes.push(releaseHardKey(2047));
      outcomes.push(releaseHardKey(2017));
      outcomes.push(releaseHardKey(2001));
      expect(outcomes.join('|')).assertEqual('false|false|false|false|false|false');
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.buffer.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_2011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDORDER2_0012
     * @tc.name      testChordOrder_2012
     * @tc.desc      Verify the extended chord 2047-2001-2017 released as 2001-2017-2047.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordOrder_2012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_2012 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const pressKeys: number[] = [2047, 2001, 2017];
      let index: number = 0;
      while (index < pressKeys.length) {
        expect(pressHardKey(pressKeys[index])).assertEqual(false);
        index = index + 1;
      }
      const releaseKeys: number[] = [2001, 2017, 2047];
      for (let i: number = 0; i < releaseKeys.length; i++) {
        expect(releaseHardKey(releaseKeys[i])).assertEqual(false);
      }
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.buffer).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_2012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDORDER2_0013
     * @tc.name      testChordOrder_2013
     * @tc.desc      Verify the extended chord 2047-2001-2017 released as 2001-2047-2017.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordOrder_2013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_2013 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const blockedDown: boolean = pressHardKey(2047);
      const digitDown: boolean = pressHardKey(2001);
      const letterDown: boolean = pressHardKey(2017);
      expect(blockedDown).assertEqual(false);
      expect(digitDown).assertEqual(false);
      expect(letterDown).assertEqual(false);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(releaseHardKey(2001)).assertEqual(false);
      expect(releaseHardKey(2047)).assertEqual(false);
      expect(releaseHardKey(2017)).assertEqual(false);
      expect(harness.client.buffer).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_2013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDORDER2_0014
     * @tc.name      testChordOrder_2014
     * @tc.desc      Verify the extended chord 2047-2001-2017 released as 2017-2001-2047.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordOrder_2014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_2014 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2001)).assertEqual(false);
      expect(pressHardKey(2017)).assertEqual(false);
      const releaseOrder: number[] = [2017, 2001, 2047];
      let acceptedReleases: number = 0;
      for (let i: number = 0; i < releaseOrder.length; i++) {
        if (releaseHardKey(releaseOrder[i])) {
          acceptedReleases = acceptedReleases + 1;
        }
      }
      expect(acceptedReleases).assertEqual(0);
      expect(harness.client.insertedTexts.join('')).assertEqual('');
      expect(harness.client.buffer.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_2014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDORDER2_0015
     * @tc.name      testChordOrder_2015
     * @tc.desc      Verify the extended chord 2047-2001-2017 released as 2017-2047-2001.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordOrder_2015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_2015 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(pressHardKey(2047)).assertEqual(false);
      expect(pressHardKey(2001)).assertEqual(false);
      expect(pressHardKey(2017)).assertEqual(false);
      expect(releaseHardKey(2017)).assertEqual(false);
      expect(releaseHardKey(2047)).assertEqual(false);
      expect(releaseHardKey(2001)).assertEqual(false);
      expect(harness.client.insertedTexts.length).assertEqual(0);
      expect(harness.client.buffer.length).assertEqual(0);
      expect(harness.client.previewCalls.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordOrder_2015 end');
      await yieldToEventLoop();
    });

  });

}
