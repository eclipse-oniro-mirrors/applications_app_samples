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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  BreakpointConstants
} from '../../../main/ets/common/constants/BreakpointConstants';
import { LyricFile } from '../../../main/ets/common/constants/LyricConst';
import {
  AudioPlayerState,
  DEFAULT_SPEED,
  DEFAULT_VOLUME,
  EFFECT_ID,
  firstSongSinger,
  firstSongTitle,
  MusicPlayMode,
  Options,
  playModeSwitchList,
  SELECT_MUSIC_INDEX,
  SILENT_ID,
  SPEED_ID,
  TOTAL_TIME_STRING_NUMBER_DURATION,
  TOTAL_MS_NUMBER_NUMBER_DURATION,
  VOLUME_ID
} from '../../../main/ets/common/constants/PlayerConstants';
import { StyleConstants } from '../../../main/ets/common/constants/StyleConstants';
import { paceTurn } from './TestPace';

const TAG: string = 'Sample_AudioMusicPlayer';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'AudioMusicPlayer_';

const RANGE_REGEX: RegExp = /^\((\d+)vp<=(width)(<(\d+)vp)?\)$/;

function parseRange(range: string): number[] {
  let body: string = range.substring(1, range.length - 1);
  let parts: string[] = body.split('<=width');
  let lower: number = Number.parseInt(parts[0]);
  let upperPart: string = parts[1];
  if (upperPart.length === 1) {
    return [lower, -1];
  }
  return [lower, Number.parseInt(upperPart.substring(1, upperPart.length - 1))];
}

function distinctValues(values: string[]): number {
  let unique: string[] = [];
  for (let value of values) {
    if (unique.indexOf(value) < 0) {
      unique.push(value);
    }
  }
  return unique.length;
}

export default function ConstantsTableTest() {
  describe('ConstantsTableTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_CONSTANTS_TABLE_0200
     * @tc.name      testConstantsTable0002
     * @tc.desc      验证断点栏数栅格数值随断点增大有序递增且名称互不重复
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testConstantsTable0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Constants_BreakpointColumns_0002 begin');
      let names: string[] = [BreakpointConstants.BREAKPOINT_SM, BreakpointConstants.BREAKPOINT_MD,
        BreakpointConstants.BREAKPOINT_LG];
      let columns: number[] = [BreakpointConstants.COLUMN_SM, BreakpointConstants.COLUMN_MD,
        BreakpointConstants.COLUMN_LG];
      let spans: number[] = [BreakpointConstants.SPAN_SM, BreakpointConstants.SPAN_MD,
        BreakpointConstants.SPAN_LG];
      let fonts: number[] = [BreakpointConstants.FONT_SIZE_SM, BreakpointConstants.FONT_SIZE_MD,
        BreakpointConstants.FONT_SIZE_LG];
      hilog.info(DOMAIN, TAG, '%{public}s',
        `名称=${names}, 栏数=${columns}, 栅格=${spans}, 字号=${fonts}`);
      expect(distinctValues(names)).assertEqual(3);
      expect(names[0]).assertEqual('sm');
      expect(names[2]).assertEqual('lg');
      expect(columns).assertDeepEquals([4, 8, 12]);
      for (let i = 1; i < columns.length; i++) {
        expect(columns[i] > columns[i - 1]).assertTrue();
        expect(spans[i] > spans[i - 1]).assertTrue();
        expect(fonts[i] > fonts[i - 1]).assertTrue();
      }
      expect(BreakpointConstants.COLUMN_LYRIC_LG + BreakpointConstants.SPAN_LYRIC_LG)
        .assertEqual(BreakpointConstants.COLUMN_LG);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Constants_BreakpointColumns_0002 end');
    });

    /**
     * @tc.number    SUB_CONSTANTS_TABLE_0300
     * @tc.name      testConstantsTable0003
     * @tc.desc      验证播放模式切换序列首尾相接且三档模式各出现一次
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testConstantsTable0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Constants_PlayModeCycle_0003 begin');
      let modeNames: string[] = [];
      for (let mode of playModeSwitchList) {
        modeNames.push(MusicPlayMode[mode]);
      }
      let distinct: number = distinctValues(modeNames);
      hilog.info(DOMAIN, TAG, '%{public}s', `切换序列=${playModeSwitchList}, 模式名=${modeNames}`);
      expect(playModeSwitchList.length).assertEqual(3);
      expect(distinct).assertEqual(playModeSwitchList.length);
      expect(playModeSwitchList[0]).assertEqual(MusicPlayMode.ORDER);
      expect(playModeSwitchList[playModeSwitchList.length - 1]).assertEqual(MusicPlayMode.SINGLE_CYCLE);
      expect(modeNames).assertDeepEquals(['ORDER', 'RANDOM', 'SINGLE_CYCLE']);
      expect(AudioPlayerState.PREPARED > AudioPlayerState.LOAD).assertTrue();
      expect(AudioPlayerState.PAUSE > AudioPlayerState.PLAY).assertTrue();
      expect(AudioPlayerState.RELEASED > AudioPlayerState.COMPLETED).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Constants_PlayModeCycle_0003 end');
    });

    /**
     * @tc.number    SUB_CONSTANTS_TABLE_0400
     * @tc.name      testConstantsTable0004
     * @tc.desc      验证播放参数与偏好键名互不重复且默认音量与默认倍速取值有效
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testConstantsTable0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Constants_PreferenceKeys_0004 begin');
      let keys: string[] = [SELECT_MUSIC_INDEX, TOTAL_MS_NUMBER_NUMBER_DURATION,
        TOTAL_TIME_STRING_NUMBER_DURATION, SILENT_ID, VOLUME_ID, EFFECT_ID, SPEED_ID];
      let nonEmpty: boolean = true;
      for (let key of keys) {
        if (key.trim().length === 0) {
          nonEmpty = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `偏好键=${keys}, 去重后数量=${distinctValues(keys)}, 默认音量=${DEFAULT_VOLUME}, 默认倍速=${DEFAULT_SPEED}`);
      expect(nonEmpty).assertTrue();
      expect(distinctValues(keys)).assertEqual(keys.length);
      expect(keys.length).assertEqual(7);
      expect(DEFAULT_VOLUME).assertEqual(1);
      expect(DEFAULT_SPEED).assertEqual(1);
      expect(DEFAULT_VOLUME > 0).assertTrue();
      expect(DEFAULT_SPEED > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Constants_PreferenceKeys_0004 end');
    });

    /**
     * @tc.number    SUB_CONSTANTS_TABLE_0500
     * @tc.name      testConstantsTable0005
     * @tc.desc      验证时长缓存键名与首曲标题歌手文案及歌词文件后缀符合界面约定
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testConstantsTable0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Constants_DisplayText_0005 begin');
      let durationKeys: string[] = [TOTAL_MS_NUMBER_NUMBER_DURATION, TOTAL_TIME_STRING_NUMBER_DURATION];
      let suffixes: string[] = [LyricFile.LRC, LyricFile.KRC];
      hilog.info(DOMAIN, TAG, '%{public}s',
        `时长键=${durationKeys}, 首曲=${firstSongTitle}/${firstSongSinger}, 后缀=${suffixes}`);
      expect(durationKeys[0].includes('Ms')).assertTrue();
      expect(durationKeys[1].includes('Time')).assertTrue();
      expect(durationKeys[0].includes(durationKeys[1])).assertFalse();
      expect(durationKeys[1].includes(durationKeys[0])).assertFalse();
      expect(firstSongTitle).assertEqual('Dream It Possible');
      expect(firstSongSinger).assertEqual('Delacey');
      expect(durationKeys.length).assertEqual(suffixes.length);
      expect(suffixes[0]).assertEqual('.lrc');
      expect(suffixes[1]).assertEqual('.krc');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Constants_DisplayText_0005 end');
    });

    /**
     * @tc.number    SUB_CONSTANTS_TABLE_0600
     * @tc.name      testConstantsTable0006
     * @tc.desc      验证全宽全高样式与位移取值格式及选项对象默认值
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testConstantsTable0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Constants_StyleAndOptions_0006 begin');
      let percents: string[] = [StyleConstants.FULL_WIDTH, StyleConstants.FULL_HEIGHT,
        StyleConstants.TRANSLATE_Y];
      let percentPattern: RegExp = /^-?\d+%$/;
      for (let value of percents) {
        expect(percentPattern.test(value)).assertTrue();
      }
      let offset: Options = new Options();
      let assigns: boolean = true;
      offset.offset = 0;
      if (offset.offset !== 0 || offset.length !== undefined) {
        assigns = false;
      }
      offset.length = 4096;
      hilog.info(DOMAIN, TAG, '%{public}s',
        `百分比=${percents}, 播放区位移=${StyleConstants.TRANSLATE_PLAYER_Y}, 选项=${offset.offset}/${offset.length}`);
      expect(StyleConstants.FULL_WIDTH).assertEqual('100%');
      expect(StyleConstants.TRANSLATE_PLAYER_Y).assertEqual('-48vp');
      expect(assigns).assertTrue();
      expect(offset.length).assertEqual(4096);
      expect(StyleConstants.TRANSLATE_X).assertEqual(10);
      expect(percents.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Constants_StyleAndOptions_0006 end');
    });
  });
}
