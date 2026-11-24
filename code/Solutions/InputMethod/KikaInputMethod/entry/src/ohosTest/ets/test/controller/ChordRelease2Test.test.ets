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
const TAG: string = '[Sample_KikaInputMethodMore]';

export default function chordRelease2Test(): void {
  describe('ChordRelease2Test', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDRELEASE2_0001
     * @tc.name      testChordRelease_2001
     * @tc.desc      Verify the chord release order 2018-2047-2017 after holding 2017-2018-2047.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordRelease_2001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_2001 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const pressOrder: number[] = [2017, 2018, 2047];
      const pressFlags: boolean[] = [true, true, false];
      let index: number = 0;
      while (index < pressOrder.length) {
        expect(pressHardKey(pressOrder[index])).assertEqual(pressFlags[index]);
        index = index + 1;
      }
      const releaseOrder: number[] = [2018, 2047, 2017];
      for (let i: number = 0; i < releaseOrder.length; i++) {
        expect(releaseHardKey(releaseOrder[i])).assertEqual(true);
      }
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');
      expect(harness.client.buffer.length).assertEqual(2);
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_2001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDRELEASE2_0002
     * @tc.name      testChordRelease_2002
     * @tc.desc      Verify the chord release order 2047-2017-2018 after holding 2017-2018-2047.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordRelease_2002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_2002 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const outcomes: boolean[] = [pressHardKey(2017), pressHardKey(2018), pressHardKey(2047)];
      expect(outcomes.join('|')).assertEqual('true|true|false');
      expect(releaseHardKey(2047)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2018)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_2002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDRELEASE2_0003
     * @tc.name      testChordRelease_2003
     * @tc.desc      Verify the chord release order 2047-2018-2017 after holding 2017-2018-2047.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordRelease_2003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_2003 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const firstPress: boolean = pressHardKey(2017);
      const secondPress: boolean = pressHardKey(2018);
      const thirdPress: boolean = pressHardKey(2047);
      expect(firstPress).assertEqual(true);
      expect(secondPress).assertEqual(true);
      expect(thirdPress).assertEqual(false);
      const releaseOrder: number[] = [2047, 2018, 2017];
      for (let i: number = 0; i < releaseOrder.length; i++) {
        expect(releaseHardKey(releaseOrder[i])).assertEqual(true);
      }
      expect(harness.client.insertedTexts.join('')).assertEqual('ab');
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_2003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDRELEASE2_0004
     * @tc.name      testChordRelease_2004
     * @tc.desc      Verify the chord release order 2055-2017 after holding 2055-2017.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordRelease_2004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_2004 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const step1: boolean = pressHardKey(2055);
      expect(step1).assertEqual(true);
      const step2: boolean = pressHardKey(2017);
      expect(step2).assertEqual(true);
      const step3: boolean = releaseHardKey(2055);
      expect(step3).assertEqual(true);
      const step4: boolean = releaseHardKey(2017);
      expect(step4).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_2004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDRELEASE2_0005
     * @tc.name      testChordRelease_2005
     * @tc.desc      Verify the chord release order 2017-2055 after holding 2055-2017.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordRelease_2005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_2005 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(pressHardKey(2055)).assertEqual(true);
      expect(pressHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(releaseHardKey(2055)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_2005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDRELEASE2_0006
     * @tc.name      testChordRelease_2006
     * @tc.desc      Verify the chord release order 2017-3000 after holding 2017-3000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordRelease_2006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_2006 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const step1: boolean = pressHardKey(2017);
      expect(step1).assertEqual(true);
      const step2: boolean = pressHardKey(3000);
      expect(step2).assertEqual(false);
      const step3: boolean = releaseHardKey(2017);
      expect(step3).assertEqual(false);
      const step4: boolean = releaseHardKey(3000);
      expect(step4).assertEqual(false);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_2006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDRELEASE2_0007
     * @tc.name      testChordRelease_2007
     * @tc.desc      Verify the chord release order 3000-2017 after holding 2017-3000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordRelease_2007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_2007 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(3000)).assertEqual(false);
      expect(releaseHardKey(3000)).assertEqual(false);
      expect(releaseHardKey(2017)).assertEqual(false);
      expect(harness.client.insertedTexts.join('')).assertEqual('a');
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_2007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDRELEASE2_0008
     * @tc.name      testChordRelease_2008
     * @tc.desc      Verify the chord release order 2017-2018-2019-2020 after holding 2017-2018-2019-2020.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordRelease_2008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_2008 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const step1: boolean = pressHardKey(2017);
      expect(step1).assertEqual(true);
      const step2: boolean = pressHardKey(2018);
      expect(step2).assertEqual(true);
      const step3: boolean = pressHardKey(2019);
      expect(step3).assertEqual(true);
      const step4: boolean = pressHardKey(2020);
      expect(step4).assertEqual(true);
      const step5: boolean = releaseHardKey(2017);
      expect(step5).assertEqual(true);
      const step6: boolean = releaseHardKey(2018);
      expect(step6).assertEqual(true);
      const step7: boolean = releaseHardKey(2019);
      expect(step7).assertEqual(true);
      const step8: boolean = releaseHardKey(2020);
      expect(step8).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('abcd');
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_2008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDRELEASE2_0009
     * @tc.name      testChordRelease_2009
     * @tc.desc      Verify the chord release order 2020-2019-2018-2017 after holding 2017-2018-2019-2020.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordRelease_2009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_2009 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      expect(pressHardKey(2017)).assertEqual(true);
      expect(pressHardKey(2018)).assertEqual(true);
      expect(pressHardKey(2019)).assertEqual(true);
      expect(pressHardKey(2020)).assertEqual(true);
      expect(releaseHardKey(2020)).assertEqual(true);
      expect(releaseHardKey(2019)).assertEqual(true);
      expect(releaseHardKey(2018)).assertEqual(true);
      expect(releaseHardKey(2017)).assertEqual(true);
      expect(harness.client.insertedTexts.join('')).assertEqual('abcd');
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_2009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDRELEASE2_0010
     * @tc.name      testChordRelease_2010
     * @tc.desc      Verify the chord release order 2018-2020-2017-2019 after holding 2017-2018-2019-2020.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordRelease_2010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_2010 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const pressOrder: number[] = [2017, 2018, 2019, 2020];
      const releaseOrder: number[] = [2018, 2020, 2017, 2019];
      for (let i: number = 0; i < pressOrder.length; i++) {
        expect(pressHardKey(pressOrder[i])).assertEqual(true);
      }
      for (let i: number = 0; i < releaseOrder.length; i++) {
        expect(releaseHardKey(releaseOrder[i])).assertEqual(true);
      }
      expect(harness.client.insertedTexts.join('')).assertEqual('abcd');
      expect(harness.client.buffer).assertEqual('abcd');
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_2010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_CHORDRELEASE2_0011
     * @tc.name      testChordRelease_2011
     * @tc.desc      Verify the chord release order 2019-2017-2020-2018 after holding 2017-2018-2019-2020.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testChordRelease_2011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_2011 begin');
      const harness: PreviewHarness = await createPreviewHarness('');
      const outcomes: boolean[] = [];
      outcomes.push(pressHardKey(2017));
      outcomes.push(pressHardKey(2018));
      outcomes.push(pressHardKey(2019));
      outcomes.push(pressHardKey(2020));
      outcomes.push(releaseHardKey(2019));
      outcomes.push(releaseHardKey(2017));
      outcomes.push(releaseHardKey(2020));
      outcomes.push(releaseHardKey(2018));
      expect(outcomes.length).assertEqual(8);
      expect(outcomes.join('|')).assertEqual('true|true|true|true|true|true|true|true');
      expect(harness.client.insertedTexts.join('')).assertEqual('abcd');
      expect(harness.client.finishCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChordRelease_2011 end');
      await yieldToEventLoop();
    });

  });

}
