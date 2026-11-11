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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level, Assert } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_MediaSourceSubtitleDefaults]';
const DOMAIN: number = 0xF812;

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

function expect(actual: string | number | boolean | Object | null | undefined): Assert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function mediaSourceSubtitleDefaultsTest(): void {
  describe('mediaSourceSubtitleDefaultsTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0001
     * @tc.name      testExtSubtitleDefaults0000
     * @tc.desc      Subtitle defaults for text undefined start 0 duration 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = undefined;
      const rawStart: number | null | undefined = 0;
      const rawDuration: number | null | undefined = 0;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0002
     * @tc.name      testExtSubtitleDefaults0001
     * @tc.desc      Subtitle defaults for text null start 0 duration 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = null;
      const rawStart: number | null | undefined = 0;
      const rawDuration: number | null | undefined = 0;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0003
     * @tc.name      testExtSubtitleDefaults0002
     * @tc.desc      Subtitle defaults for text '' start 100 duration 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = '';
      const rawStart: number | null | undefined = 100;
      const rawDuration: number | null | undefined = 0;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(100);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0004
     * @tc.name      testExtSubtitleDefaults0003
     * @tc.desc      Subtitle defaults for text 'hello' start 100 duration 100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = 'hello';
      const rawStart: number | null | undefined = 100;
      const rawDuration: number | null | undefined = 100;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('hello');
      expect(startTime).assertEqual(100);
      expect(duration).assertEqual(100);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0005
     * @tc.name      testExtSubtitleDefaults0004
     * @tc.desc      Subtitle defaults for text '0' start undefined duration 100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = '0';
      const rawStart: number | null | undefined = undefined;
      const rawDuration: number | null | undefined = 100;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('0');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(100);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0006
     * @tc.name      testExtSubtitleDefaults0005
     * @tc.desc      Subtitle defaults for text ' ' start undefined duration 100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = ' ';
      const rawStart: number | null | undefined = undefined;
      const rawDuration: number | null | undefined = 100;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual(' ');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(100);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0007
     * @tc.name      testExtSubtitleDefaults0006
     * @tc.desc      Subtitle defaults for text undefined start null duration undefined.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = undefined;
      const rawStart: number | null | undefined = null;
      const rawDuration: number | null | undefined = undefined;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0008
     * @tc.name      testExtSubtitleDefaults0007
     * @tc.desc      Subtitle defaults for text null start null duration undefined.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = null;
      const rawStart: number | null | undefined = null;
      const rawDuration: number | null | undefined = undefined;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0009
     * @tc.name      testExtSubtitleDefaults0008
     * @tc.desc      Subtitle defaults for text '' start 0 duration undefined.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = '';
      const rawStart: number | null | undefined = 0;
      const rawDuration: number | null | undefined = undefined;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0010
     * @tc.name      testExtSubtitleDefaults0009
     * @tc.desc      Subtitle defaults for text 'hello' start 0 duration null.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = 'hello';
      const rawStart: number | null | undefined = 0;
      const rawDuration: number | null | undefined = null;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('hello');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0011
     * @tc.name      testExtSubtitleDefaults0010
     * @tc.desc      Subtitle defaults for text '0' start 100 duration null.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = '0';
      const rawStart: number | null | undefined = 100;
      const rawDuration: number | null | undefined = null;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('0');
      expect(startTime).assertEqual(100);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0012
     * @tc.name      testExtSubtitleDefaults0011
     * @tc.desc      Subtitle defaults for text ' ' start 100 duration null.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = ' ';
      const rawStart: number | null | undefined = 100;
      const rawDuration: number | null | undefined = null;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual(' ');
      expect(startTime).assertEqual(100);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0013
     * @tc.name      testExtSubtitleDefaults0012
     * @tc.desc      Subtitle defaults for text undefined start undefined duration 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = undefined;
      const rawStart: number | null | undefined = undefined;
      const rawDuration: number | null | undefined = 0;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0014
     * @tc.name      testExtSubtitleDefaults0013
     * @tc.desc      Subtitle defaults for text null start undefined duration 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = null;
      const rawStart: number | null | undefined = undefined;
      const rawDuration: number | null | undefined = 0;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0015
     * @tc.name      testExtSubtitleDefaults0014
     * @tc.desc      Subtitle defaults for text '' start null duration 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = '';
      const rawStart: number | null | undefined = null;
      const rawDuration: number | null | undefined = 0;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0016
     * @tc.name      testExtSubtitleDefaults0015
     * @tc.desc      Subtitle defaults for text 'hello' start null duration 100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = 'hello';
      const rawStart: number | null | undefined = null;
      const rawDuration: number | null | undefined = 100;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('hello');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(100);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0017
     * @tc.name      testExtSubtitleDefaults0016
     * @tc.desc      Subtitle defaults for text '0' start 0 duration 100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = '0';
      const rawStart: number | null | undefined = 0;
      const rawDuration: number | null | undefined = 100;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('0');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(100);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0018
     * @tc.name      testExtSubtitleDefaults0017
     * @tc.desc      Subtitle defaults for text ' ' start 0 duration 100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = ' ';
      const rawStart: number | null | undefined = 0;
      const rawDuration: number | null | undefined = 100;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual(' ');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(100);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0019
     * @tc.name      testExtSubtitleDefaults0018
     * @tc.desc      Subtitle defaults for text undefined start 100 duration undefined.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = undefined;
      const rawStart: number | null | undefined = 100;
      const rawDuration: number | null | undefined = undefined;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(100);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0020
     * @tc.name      testExtSubtitleDefaults0019
     * @tc.desc      Subtitle defaults for text null start 100 duration undefined.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = null;
      const rawStart: number | null | undefined = 100;
      const rawDuration: number | null | undefined = undefined;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(100);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0021
     * @tc.name      testExtSubtitleDefaults0020
     * @tc.desc      Subtitle defaults for text '' start undefined duration undefined.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = '';
      const rawStart: number | null | undefined = undefined;
      const rawDuration: number | null | undefined = undefined;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0022
     * @tc.name      testExtSubtitleDefaults0021
     * @tc.desc      Subtitle defaults for text 'hello' start undefined duration null.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = 'hello';
      const rawStart: number | null | undefined = undefined;
      const rawDuration: number | null | undefined = null;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('hello');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0023
     * @tc.name      testExtSubtitleDefaults0022
     * @tc.desc      Subtitle defaults for text '0' start null duration null.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = '0';
      const rawStart: number | null | undefined = null;
      const rawDuration: number | null | undefined = null;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('0');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0024
     * @tc.name      testExtSubtitleDefaults0023
     * @tc.desc      Subtitle defaults for text ' ' start null duration null.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = ' ';
      const rawStart: number | null | undefined = null;
      const rawDuration: number | null | undefined = null;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual(' ');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0025
     * @tc.name      testExtSubtitleDefaults0024
     * @tc.desc      Subtitle defaults for text undefined start 0 duration 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = undefined;
      const rawStart: number | null | undefined = 0;
      const rawDuration: number | null | undefined = 0;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0026
     * @tc.name      testExtSubtitleDefaults0025
     * @tc.desc      Subtitle defaults for text null start 0 duration 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = null;
      const rawStart: number | null | undefined = 0;
      const rawDuration: number | null | undefined = 0;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0027
     * @tc.name      testExtSubtitleDefaults0026
     * @tc.desc      Subtitle defaults for text '' start 100 duration 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = '';
      const rawStart: number | null | undefined = 100;
      const rawDuration: number | null | undefined = 0;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(100);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0028
     * @tc.name      testExtSubtitleDefaults0027
     * @tc.desc      Subtitle defaults for text 'hello' start 100 duration 100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = 'hello';
      const rawStart: number | null | undefined = 100;
      const rawDuration: number | null | undefined = 100;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('hello');
      expect(startTime).assertEqual(100);
      expect(duration).assertEqual(100);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0029
     * @tc.name      testExtSubtitleDefaults0028
     * @tc.desc      Subtitle defaults for text '0' start undefined duration 100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = '0';
      const rawStart: number | null | undefined = undefined;
      const rawDuration: number | null | undefined = 100;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('0');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(100);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0030
     * @tc.name      testExtSubtitleDefaults0029
     * @tc.desc      Subtitle defaults for text ' ' start undefined duration 100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = ' ';
      const rawStart: number | null | undefined = undefined;
      const rawDuration: number | null | undefined = 100;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual(' ');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(100);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0031
     * @tc.name      testExtSubtitleDefaults0030
     * @tc.desc      Subtitle defaults for text undefined start null duration undefined.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = undefined;
      const rawStart: number | null | undefined = null;
      const rawDuration: number | null | undefined = undefined;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0032
     * @tc.name      testExtSubtitleDefaults0031
     * @tc.desc      Subtitle defaults for text null start null duration undefined.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = null;
      const rawStart: number | null | undefined = null;
      const rawDuration: number | null | undefined = undefined;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0033
     * @tc.name      testExtSubtitleDefaults0032
     * @tc.desc      Subtitle defaults for text '' start 0 duration undefined.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = '';
      const rawStart: number | null | undefined = 0;
      const rawDuration: number | null | undefined = undefined;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0034
     * @tc.name      testExtSubtitleDefaults0033
     * @tc.desc      Subtitle defaults for text 'hello' start 0 duration null.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = 'hello';
      const rawStart: number | null | undefined = 0;
      const rawDuration: number | null | undefined = null;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('hello');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0035
     * @tc.name      testExtSubtitleDefaults0034
     * @tc.desc      Subtitle defaults for text '0' start 100 duration null.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = '0';
      const rawStart: number | null | undefined = 100;
      const rawDuration: number | null | undefined = null;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('0');
      expect(startTime).assertEqual(100);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0036
     * @tc.name      testExtSubtitleDefaults0035
     * @tc.desc      Subtitle defaults for text ' ' start 100 duration null.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = ' ';
      const rawStart: number | null | undefined = 100;
      const rawDuration: number | null | undefined = null;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual(' ');
      expect(startTime).assertEqual(100);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0037
     * @tc.name      testExtSubtitleDefaults0036
     * @tc.desc      Subtitle defaults for text undefined start undefined duration 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = undefined;
      const rawStart: number | null | undefined = undefined;
      const rawDuration: number | null | undefined = 0;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0038
     * @tc.name      testExtSubtitleDefaults0037
     * @tc.desc      Subtitle defaults for text null start undefined duration 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = null;
      const rawStart: number | null | undefined = undefined;
      const rawDuration: number | null | undefined = 0;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0039
     * @tc.name      testExtSubtitleDefaults0038
     * @tc.desc      Subtitle defaults for text '' start null duration 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = '';
      const rawStart: number | null | undefined = null;
      const rawDuration: number | null | undefined = 0;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0040
     * @tc.name      testExtSubtitleDefaults0039
     * @tc.desc      Subtitle defaults for text 'hello' start null duration 100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = 'hello';
      const rawStart: number | null | undefined = null;
      const rawDuration: number | null | undefined = 100;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('hello');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(100);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0041
     * @tc.name      testExtSubtitleDefaults0040
     * @tc.desc      Subtitle defaults for text '0' start 0 duration 100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = '0';
      const rawStart: number | null | undefined = 0;
      const rawDuration: number | null | undefined = 100;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('0');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(100);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0042
     * @tc.name      testExtSubtitleDefaults0041
     * @tc.desc      Subtitle defaults for text ' ' start 0 duration 100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = ' ';
      const rawStart: number | null | undefined = 0;
      const rawDuration: number | null | undefined = 100;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual(' ');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(100);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0043
     * @tc.name      testExtSubtitleDefaults0042
     * @tc.desc      Subtitle defaults for text undefined start 100 duration undefined.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = undefined;
      const rawStart: number | null | undefined = 100;
      const rawDuration: number | null | undefined = undefined;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(100);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0044
     * @tc.name      testExtSubtitleDefaults0043
     * @tc.desc      Subtitle defaults for text null start 100 duration undefined.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = null;
      const rawStart: number | null | undefined = 100;
      const rawDuration: number | null | undefined = undefined;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(100);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0045
     * @tc.name      testExtSubtitleDefaults0044
     * @tc.desc      Subtitle defaults for text '' start undefined duration undefined.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = '';
      const rawStart: number | null | undefined = undefined;
      const rawDuration: number | null | undefined = undefined;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0046
     * @tc.name      testExtSubtitleDefaults0045
     * @tc.desc      Subtitle defaults for text 'hello' start undefined duration null.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = 'hello';
      const rawStart: number | null | undefined = undefined;
      const rawDuration: number | null | undefined = null;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('hello');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0047
     * @tc.name      testExtSubtitleDefaults0046
     * @tc.desc      Subtitle defaults for text '0' start null duration null.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = '0';
      const rawStart: number | null | undefined = null;
      const rawDuration: number | null | undefined = null;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('0');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0048
     * @tc.name      testExtSubtitleDefaults0047
     * @tc.desc      Subtitle defaults for text ' ' start null duration null.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = ' ';
      const rawStart: number | null | undefined = null;
      const rawDuration: number | null | undefined = null;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual(' ');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0049
     * @tc.name      testExtSubtitleDefaults0048
     * @tc.desc      Subtitle defaults for text undefined start 0 duration 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = undefined;
      const rawStart: number | null | undefined = 0;
      const rawDuration: number | null | undefined = 0;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0050
     * @tc.name      testExtSubtitleDefaults0049
     * @tc.desc      Subtitle defaults for text null start 0 duration 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = null;
      const rawStart: number | null | undefined = 0;
      const rawDuration: number | null | undefined = 0;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0051
     * @tc.name      testExtSubtitleDefaults0050
     * @tc.desc      Subtitle defaults for text '' start 100 duration 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = '';
      const rawStart: number | null | undefined = 100;
      const rawDuration: number | null | undefined = 0;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(100);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0052
     * @tc.name      testExtSubtitleDefaults0051
     * @tc.desc      Subtitle defaults for text 'hello' start 100 duration 100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = 'hello';
      const rawStart: number | null | undefined = 100;
      const rawDuration: number | null | undefined = 100;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('hello');
      expect(startTime).assertEqual(100);
      expect(duration).assertEqual(100);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0053
     * @tc.name      testExtSubtitleDefaults0052
     * @tc.desc      Subtitle defaults for text '0' start undefined duration 100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = '0';
      const rawStart: number | null | undefined = undefined;
      const rawDuration: number | null | undefined = 100;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('0');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(100);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0054
     * @tc.name      testExtSubtitleDefaults0053
     * @tc.desc      Subtitle defaults for text ' ' start undefined duration 100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = ' ';
      const rawStart: number | null | undefined = undefined;
      const rawDuration: number | null | undefined = 100;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual(' ');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(100);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0055
     * @tc.name      testExtSubtitleDefaults0054
     * @tc.desc      Subtitle defaults for text undefined start null duration undefined.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = undefined;
      const rawStart: number | null | undefined = null;
      const rawDuration: number | null | undefined = undefined;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0056
     * @tc.name      testExtSubtitleDefaults0055
     * @tc.desc      Subtitle defaults for text null start null duration undefined.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = null;
      const rawStart: number | null | undefined = null;
      const rawDuration: number | null | undefined = undefined;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0057
     * @tc.name      testExtSubtitleDefaults0056
     * @tc.desc      Subtitle defaults for text '' start 0 duration undefined.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = '';
      const rawStart: number | null | undefined = 0;
      const rawDuration: number | null | undefined = undefined;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0058
     * @tc.name      testExtSubtitleDefaults0057
     * @tc.desc      Subtitle defaults for text 'hello' start 0 duration null.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = 'hello';
      const rawStart: number | null | undefined = 0;
      const rawDuration: number | null | undefined = null;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('hello');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0059
     * @tc.name      testExtSubtitleDefaults0058
     * @tc.desc      Subtitle defaults for text '0' start 100 duration null.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = '0';
      const rawStart: number | null | undefined = 100;
      const rawDuration: number | null | undefined = null;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('0');
      expect(startTime).assertEqual(100);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0060
     * @tc.name      testExtSubtitleDefaults0059
     * @tc.desc      Subtitle defaults for text ' ' start 100 duration null.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = ' ';
      const rawStart: number | null | undefined = 100;
      const rawDuration: number | null | undefined = null;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual(' ');
      expect(startTime).assertEqual(100);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0061
     * @tc.name      testExtSubtitleDefaults0060
     * @tc.desc      Subtitle defaults for text undefined start undefined duration 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = undefined;
      const rawStart: number | null | undefined = undefined;
      const rawDuration: number | null | undefined = 0;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0062
     * @tc.name      testExtSubtitleDefaults0061
     * @tc.desc      Subtitle defaults for text null start undefined duration 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = null;
      const rawStart: number | null | undefined = undefined;
      const rawDuration: number | null | undefined = 0;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0063
     * @tc.name      testExtSubtitleDefaults0062
     * @tc.desc      Subtitle defaults for text '' start null duration 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = '';
      const rawStart: number | null | undefined = null;
      const rawDuration: number | null | undefined = 0;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0064
     * @tc.name      testExtSubtitleDefaults0063
     * @tc.desc      Subtitle defaults for text 'hello' start null duration 100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = 'hello';
      const rawStart: number | null | undefined = null;
      const rawDuration: number | null | undefined = 100;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('hello');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(100);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0065
     * @tc.name      testExtSubtitleDefaults0064
     * @tc.desc      Subtitle defaults for text '0' start 0 duration 100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = '0';
      const rawStart: number | null | undefined = 0;
      const rawDuration: number | null | undefined = 100;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('0');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(100);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0066
     * @tc.name      testExtSubtitleDefaults0065
     * @tc.desc      Subtitle defaults for text ' ' start 0 duration 100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = ' ';
      const rawStart: number | null | undefined = 0;
      const rawDuration: number | null | undefined = 100;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual(' ');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(100);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0067
     * @tc.name      testExtSubtitleDefaults0066
     * @tc.desc      Subtitle defaults for text undefined start 100 duration undefined.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = undefined;
      const rawStart: number | null | undefined = 100;
      const rawDuration: number | null | undefined = undefined;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(100);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0068
     * @tc.name      testExtSubtitleDefaults0067
     * @tc.desc      Subtitle defaults for text null start 100 duration undefined.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = null;
      const rawStart: number | null | undefined = 100;
      const rawDuration: number | null | undefined = undefined;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(100);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0069
     * @tc.name      testExtSubtitleDefaults0068
     * @tc.desc      Subtitle defaults for text '' start undefined duration undefined.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = '';
      const rawStart: number | null | undefined = undefined;
      const rawDuration: number | null | undefined = undefined;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0070
     * @tc.name      testExtSubtitleDefaults0069
     * @tc.desc      Subtitle defaults for text 'hello' start undefined duration null.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = 'hello';
      const rawStart: number | null | undefined = undefined;
      const rawDuration: number | null | undefined = null;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('hello');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0071
     * @tc.name      testExtSubtitleDefaults0070
     * @tc.desc      Subtitle defaults for text '0' start null duration null.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = '0';
      const rawStart: number | null | undefined = null;
      const rawDuration: number | null | undefined = null;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('0');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0072
     * @tc.name      testExtSubtitleDefaults0071
     * @tc.desc      Subtitle defaults for text ' ' start null duration null.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = ' ';
      const rawStart: number | null | undefined = null;
      const rawDuration: number | null | undefined = null;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual(' ');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0073
     * @tc.name      testExtSubtitleDefaults0072
     * @tc.desc      Subtitle defaults for text undefined start 0 duration 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = undefined;
      const rawStart: number | null | undefined = 0;
      const rawDuration: number | null | undefined = 0;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0074
     * @tc.name      testExtSubtitleDefaults0073
     * @tc.desc      Subtitle defaults for text null start 0 duration 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = null;
      const rawStart: number | null | undefined = 0;
      const rawDuration: number | null | undefined = 0;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0075
     * @tc.name      testExtSubtitleDefaults0074
     * @tc.desc      Subtitle defaults for text '' start 100 duration 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = '';
      const rawStart: number | null | undefined = 100;
      const rawDuration: number | null | undefined = 0;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(100);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0076
     * @tc.name      testExtSubtitleDefaults0075
     * @tc.desc      Subtitle defaults for text 'hello' start 100 duration 100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = 'hello';
      const rawStart: number | null | undefined = 100;
      const rawDuration: number | null | undefined = 100;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('hello');
      expect(startTime).assertEqual(100);
      expect(duration).assertEqual(100);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0077
     * @tc.name      testExtSubtitleDefaults0076
     * @tc.desc      Subtitle defaults for text '0' start undefined duration 100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = '0';
      const rawStart: number | null | undefined = undefined;
      const rawDuration: number | null | undefined = 100;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('0');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(100);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0078
     * @tc.name      testExtSubtitleDefaults0077
     * @tc.desc      Subtitle defaults for text ' ' start undefined duration 100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = ' ';
      const rawStart: number | null | undefined = undefined;
      const rawDuration: number | null | undefined = 100;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual(' ');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(100);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0079
     * @tc.name      testExtSubtitleDefaults0078
     * @tc.desc      Subtitle defaults for text undefined start null duration undefined.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = undefined;
      const rawStart: number | null | undefined = null;
      const rawDuration: number | null | undefined = undefined;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SUBDEF_0080
     * @tc.name      testExtSubtitleDefaults0079
     * @tc.desc      Subtitle defaults for text null start null duration undefined.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSubtitleDefaults0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawText: string | null | undefined = null;
      const rawStart: number | null | undefined = null;
      const rawDuration: number | null | undefined = undefined;
      const text: string = (!rawText) ? '' : rawText;
      const startTime: number = (!rawStart) ? 0 : rawStart;
      const duration: number = (!rawDuration) ? 0 : rawDuration;
      expect(text).assertEqual('');
      expect(startTime).assertEqual(0);
      expect(duration).assertEqual(0);
      expect(startTime).assertLargerOrEqual(0);
      expect(duration).assertLargerOrEqual(0);
    })
  });
}
