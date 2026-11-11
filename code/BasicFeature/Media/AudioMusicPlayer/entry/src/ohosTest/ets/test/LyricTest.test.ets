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

import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { getRawStringData, parseLrcLyric, parseKrcLyric, angleToRadian } from '../../../main/ets/common/utils/LrcUtils';
import { LrcEntry } from '../../../main/ets/viewmodel/LrcEntry';

const TAG: string = 'Sample_AudioMusicPlayer';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'AudioMusicPlayer_';

const LRC_TEXT: string =
  '[00:21.98] world line\n' +
  '[00:01.00] hello line\n' +
  '[00:10.50] middle line\n';

const KRC_TEXT: string = '[1000,2000]<0,500,0>Hel<500,500,0>lo\n';

export default function Lyric01Test() {
  describe('Lyric01Test', () => {

    beforeAll(() => {
      let context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      if (!AppStorage.get('context')) {
        AppStorage.setOrCreate('context', context);
      }
    });

    /**
     * @tc.number    SUB_LYRIC_TEST01_0100
     * @tc.name      testLyric01Chapter0001
     * @tc.desc      Verify AudioMusicPlayer_LrcParse_Invalid_001
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLyric01Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcParse_Invalid_001 begin');
      let emptyCount: number = parseLrcLyric('').length;
      let invalidCount: number = parseLrcLyric('no timestamps here').length;
      hilog.info(DOMAIN, TAG, '%{public}s', `空串解析行数=${emptyCount}, 无时间戳解析行数=${invalidCount}`);
      expect(emptyCount).assertEqual(0);
      expect(invalidCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcParse_Invalid_001 end');
    });

    /**
     * @tc.number    SUB_LYRIC_TEST01_0200
     * @tc.name      testLyric01Chapter0002
     * @tc.desc      Verify AudioMusicPlayer_LrcParse_SortAndTime_002
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLyric01Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcParse_SortAndTime_002 begin');
      let result: LrcEntry[] = parseLrcLyric(LRC_TEXT);
      let lrcStarts: string =
        `${result[0].lineStartTime},${result[1].lineStartTime},${result[2].lineStartTime}`;
      hilog.info(DOMAIN, TAG, '%{public}s', `解析行数=${result.length}, 起始时间=[${lrcStarts}]`);
      expect(result.length).assertEqual(3);
      expect(result[0].lineStartTime).assertEqual(1000);
      expect(result[1].lineStartTime).assertEqual(10500);
      expect(result[2].lineStartTime).assertEqual(21980);
      hilog.info(DOMAIN, TAG, '%{public}s', `歌词文本=[${result[0].lineWords.trim()}]`);
      expect(result[0].lineWords.trim()).assertEqual('hello line');
      hilog.info(DOMAIN, TAG, '%{public}s', `歌词文本=[${result[1].lineWords.trim()}]`);
      expect(result[1].lineWords.trim()).assertEqual('middle line');
      hilog.info(DOMAIN, TAG, '%{public}s', `歌词文本=[${result[2].lineWords.trim()}]`);
      expect(result[2].lineWords.trim()).assertEqual('world line');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcParse_SortAndTime_002 end');
    });

    /**
     * @tc.number    SUB_LYRIC_TEST01_0300
     * @tc.name      testLyric01Chapter0003
     * @tc.desc      Verify AudioMusicPlayer_LrcParse_Duration_003
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLyric01Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcParse_Duration_003 begin');
      let result: LrcEntry[] = parseLrcLyric(LRC_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `行时长=[${result[0].lineDuration},${result[1].lineDuration},${result[2].lineDuration}]`);
      expect(result[0].lineDuration).assertEqual(9500);
      expect(result[1].lineDuration).assertEqual(11480);
      expect(result[2].lineDuration === Number.MAX_VALUE).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcParse_Duration_003 end');
    });

    /**
     * @tc.number    SUB_LYRIC_TEST01_0400
     * @tc.name      testLyric01Chapter0004
     * @tc.desc      Verify AudioMusicPlayer_LrcParse_MultiTimeTags_004
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLyric01Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcParse_MultiTimeTags_004 begin');
      let result: LrcEntry[] = parseLrcLyric('[00:30.00][00:40.00] multi tag line\n');
      hilog.info(DOMAIN, TAG, '%{public}s',
        `解析行数=${result.length}, 起始时间=[${result[0].lineStartTime},${result[1].lineStartTime}]`);
      expect(result.length).assertEqual(2);
      expect(result[0].lineStartTime).assertEqual(30000);
      expect(result[1].lineStartTime).assertEqual(40000);
      hilog.info(DOMAIN, TAG, '%{public}s', `歌词文本=[${result[0].lineWords.trim()}]`);
      expect(result[0].lineWords.trim()).assertEqual('multi tag line');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcParse_MultiTimeTags_004 end');
    });

    /**
     * @tc.number    SUB_LYRIC_TEST01_0500
     * @tc.name      testLyric01Chapter0005
     * @tc.desc      Verify AudioMusicPlayer_KrcParse_Basic_005
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLyric01Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcParse_Basic_005 begin');
      let result: LrcEntry[] = parseKrcLyric(KRC_TEXT);
      let krcBrief: string =
        `start=${result[0].lineStartTime}, duration=${result[0].lineDuration}, words=${result[0].words.length}`;
      hilog.info(DOMAIN, TAG, '%{public}s', `行数=${result.length}, ${krcBrief}`);
      expect(result.length).assertEqual(1);
      expect(result[0].lineStartTime).assertEqual(1000);
      expect(result[0].lineDuration).assertEqual(2000);
      hilog.info(DOMAIN, TAG, '%{public}s', `行文本=[${result[0].lineWords}]`);
      expect(result[0].lineWords).assertEqual('Hello');
      expect(result[0].words.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `字1=[${result[0].words[0].text}] start=${result[0].words[0].wordStartTime} dur=${result[0].words[0].duration}`);
      expect(result[0].words[0].text).assertEqual('Hel');
      expect(result[0].words[0].wordStartTime).assertEqual(0);
      expect(result[0].words[0].duration).assertEqual(500);
      hilog.info(DOMAIN, TAG, '%{public}s', `字2=[${result[0].words[1].text}]`);
      expect(result[0].words[1].text).assertEqual('lo');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcParse_Basic_005 end');
    });

    /**
     * @tc.number    SUB_LYRIC_TEST01_0600
     * @tc.name      testLyric01Chapter0006
     * @tc.desc      Verify AudioMusicPlayer_KrcParse_Empty_006
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLyric01Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcParse_Empty_006 begin');
      let count: number = parseKrcLyric('').length;
      hilog.info(DOMAIN, TAG, '%{public}s', `空串解析行数=${count}`);
      expect(count).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcParse_Empty_006 end');
    });

    /**
     * @tc.number    SUB_LYRIC_TEST01_0700
     * @tc.name      testLyric01Chapter0007
     * @tc.desc      Verify AudioMusicPlayer_AngleToRadian_007
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLyric01Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AngleToRadian_007 begin');
      let rad0: number = angleToRadian(0);
      let rad180: number = angleToRadian(180);
      let rad90: number = angleToRadian(90);
      hilog.info(DOMAIN, TAG, '%{public}s', `0度=${rad0}, 90度=${rad90}, 180度=${rad180}`);
      expect(rad0).assertEqual(0);
      expect(Math.abs(rad180 - Math.PI) < 0.000001).assertTrue();
      expect(Math.abs(rad90 - Math.PI / 2) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AngleToRadian_007 end');
    });

    /**
     * @tc.number    SUB_LYRIC_TEST01_0800
     * @tc.name      testLyric01Chapter0008
     * @tc.desc      Verify AudioMusicPlayer_LrcRawFile_Integration_008
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLyric01Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcRawFile_Integration_008 begin');
      let context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      let data: string = await getRawStringData(context, 'lrcfiles/DreamItPossible.lrc');
      hilog.info(DOMAIN, TAG, '%{public}s', `rawfile内容长度=${data.length}`);
      expect(data.length > 0).assertTrue();
      let entries: LrcEntry[] = parseLrcLyric(data);
      hilog.info(DOMAIN, TAG, '%{public}s', `解析行数=${entries.length}`);
      expect(entries.length > 0).assertTrue();
      let sorted: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) {
          sorted = false;
          break;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `是否升序=${sorted}`);
      expect(sorted).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcRawFile_Integration_008 end');
    });
  });
}
