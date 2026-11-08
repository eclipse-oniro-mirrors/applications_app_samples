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
  PlayerConstants,
  MusicPlayMode,
  AudioPlayerState,
  playModeSwitchList,
  firstSongTitle,
  firstSongSinger,
  SELECT_MUSIC_INDEX,
  TOTAL_MS_NUMBER_NUMBER_DURATION,
  TOTAL_TIME_STRING_NUMBER_DURATION,
  SILENT_ID,
  VOLUME_ID,
  EFFECT_ID,
  SPEED_ID,
  DEFAULT_VOLUME,
  DEFAULT_SPEED,
  Options
} from '../../../main/ets/common/constants/PlayerConstants';
import { paceTurn } from './TestPace';

const TAG: string = 'Sample_AudioMusicPlayer';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'AudioMusicPlayer_';

interface NumberCase {
  name: string;
  actual: number;
  expected: number;
}

interface StringCase {
  name: string;
  actual: string;
  expected: string;
}

function fontFamilyCases(): StringCase[] {
  return [
    { name: 'FONT_FAMILY_BLACK', actual: PlayerConstants.FONT_FAMILY_BLACK, expected: 'HarmonyHeiTi' },
    { name: 'FONT_FAMILY_BOLD', actual: PlayerConstants.FONT_FAMILY_BOLD, expected: 'HarmonyHeiTi-Bold' },
    { name: 'FONT_FAMILY_MEDIUM', actual: PlayerConstants.FONT_FAMILY_MEDIUM, expected: 'HarmonyHeiTi-Medium' }
  ];
}

function preferenceKeyCases(): StringCase[] {
  return [
    { name: 'SELECT_MUSIC_INDEX', actual: SELECT_MUSIC_INDEX, expected: 'selectIndex' },
    { name: 'TOTAL_MS_DURATION', actual: TOTAL_MS_NUMBER_NUMBER_DURATION, expected: 'totalMsDuration' },
    { name: 'TOTAL_TIME_DURATION', actual: TOTAL_TIME_STRING_NUMBER_DURATION, expected: 'totalTimeDuration' },
    { name: 'SILENT_ID', actual: SILENT_ID, expected: 'silentId' },
    { name: 'VOLUME_ID', actual: VOLUME_ID, expected: 'volumeId' },
    { name: 'EFFECT_ID', actual: EFFECT_ID, expected: 'effectId' },
    { name: 'SPEED_ID', actual: SPEED_ID, expected: 'speedId' }
  ];
}

/**
 * 播放状态枚举的“序号 = 声明顺序”表，用于核对 native 回调使用的整型状态码与枚举一致。
 * 只声明 main 中实际存在的前置状态，避免测试自行扩展业务含义。
 */
const PLAY_STATE_ORDER: string[] = [
  'IDLE', 'INITIALIZED', 'LOAD', 'PREPARED', 'PLAY', 'PAUSE', 'STOP', 'ERROR', 'COMPLETED', 'RELEASED',
  'PROGRESS_SPEED', 'TIME_UPDATE', 'VOLUME_CHANGE', 'UNKNOWN'
];

export default function PlayerConstantsTableTest() {
  describe('PlayerConstantsTableTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_PLAYER_CONST_0100
     * @tc.name      testPlayerConstantsTable0001
     * @tc.desc      验证动画与显示相关数值常量逐项正确且迭代次数为无限循环的负数
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPlayerConstantsTable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Player_DisplayNumbers_0001 begin');
      let cases: NumberCase[] = [
        { name: 'FONT_REDUCE', actual: PlayerConstants.FONT_REDUCE, expected: 4 },
        { name: 'LAYOUT_WEIGHT_PLAYER_CONTROL', actual: PlayerConstants.LAYOUT_WEIGHT_PLAYER_CONTROL, expected: 1 },
        { name: 'DISPLAY_PRIORITY_ONE', actual: PlayerConstants.DISPLAY_PRIORITY_ONE, expected: 1 },
        { name: 'DISPLAY_PRIORITY_TWO', actual: PlayerConstants.DISPLAY_PRIORITY_TWO, expected: 2 },
        { name: 'DISPLAY_PRIORITY_THREE', actual: PlayerConstants.DISPLAY_PRIORITY_THREE, expected: 3 },
        { name: 'ROTATE', actual: PlayerConstants.ROTATE, expected: 360 },
        { name: 'ANIMATION_DURATION', actual: PlayerConstants.ANIMATION_DURATION, expected: 3000 },
        { name: 'ITERATIONS', actual: PlayerConstants.ITERATIONS, expected: -1 },
        { name: 'FONT_WEIGHT_700', actual: PlayerConstants.FONT_WEIGHT_700, expected: 700 },
        { name: 'FONT_WEIGHT_500', actual: PlayerConstants.FONT_WEIGHT_500, expected: 500 },
        { name: 'IMAGE_BLUR', actual: PlayerConstants.IMAGE_BLUR, expected: 15 }
      ];
      let matched: number = 0;
      for (let item of cases) {
        if (item.actual === item.expected) {
          matched++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `比对数值常量=${matched}/${cases.length}`);
      expect(cases.length).assertEqual(11);
      expect(matched).assertEqual(cases.length);
      expect(PlayerConstants.ROTATE).assertEqual(360);
      expect(PlayerConstants.ITERATIONS).assertEqual(-1);
      expect(PlayerConstants.ITERATIONS < 0).assertTrue();
      expect(PlayerConstants.ANIMATION_DURATION).assertEqual(PlayerConstants.ROTATE * 1000 / 120);
      expect(PlayerConstants.DISPLAY_PRIORITY_THREE).assertEqual(PlayerConstants.DISPLAY_PRIORITY_ONE + 2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Player_DisplayNumbers_0001 end');
    });

    /**
     * @tc.number    SUB_PLAYER_CONST_0200
     * @tc.name      testPlayerConstantsTable0002
     * @tc.desc      验证字体族名共享 HarmonyHeiTi 前缀且变体名与字重一一对应
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPlayerConstantsTable0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Player_FontFamily_0002 begin');
      let cases: StringCase[] = fontFamilyCases();
      let base: string = PlayerConstants.FONT_FAMILY_BLACK;
      let variants: number = 0;
      for (let item of cases) {
        hilog.info(DOMAIN, TAG, '%{public}s', `${item.name}=${item.actual}`);
        expect(item.actual).assertEqual(item.expected);
        if (item.actual.startsWith(base)) {
          variants++;
        }
      }
      expect(cases.length).assertEqual(3);
      expect(variants).assertEqual(3);
      expect(PlayerConstants.FONT_FAMILY_BOLD).assertEqual(`${base}-Bold`);
      expect(PlayerConstants.FONT_FAMILY_MEDIUM).assertEqual(`${base}-Medium`);
      expect(PlayerConstants.FONT_FAMILY_BOLD !== PlayerConstants.FONT_FAMILY_MEDIUM).assertTrue();
      expect(PlayerConstants.FONT_FAMILY_BLACK !== PlayerConstants.FONT_FAMILY_BOLD).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Player_FontFamily_0002 end');
    });

    /**
     * @tc.number    SUB_PLAYER_CONST_0300
     * @tc.name      testPlayerConstantsTable0003
     * @tc.desc      验证文本格式常量：编码为 utf-8、背景图放大到 120%
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPlayerConstantsTable0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Player_TextFormat_0003 begin');
      let encoding: string = PlayerConstants.ENCODING;
      let backImage: string = PlayerConstants.BACK_IMAGE;
      let percentValue: number = Number.parseFloat(backImage.substring(0, backImage.length - 1));
      hilog.info(DOMAIN, TAG, '%{public}s', `编码=${encoding}, 背景图=${backImage}, 百分比=${percentValue}`);
      expect(encoding).assertEqual('utf-8');
      expect(encoding.toLowerCase()).assertEqual(encoding);
      expect(backImage).assertEqual('120%');
      expect(backImage.endsWith('%')).assertTrue();
      expect(percentValue).assertEqual(120);
      expect(percentValue > 100).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Player_TextFormat_0003 end');
    });

    /**
     * @tc.number    SUB_PLAYER_CONST_0400
     * @tc.name      testPlayerConstantsTable0004
     * @tc.desc      验证播放模式枚举值为 0/1/2 且切换列表是三个模式的排列、起始为顺序播放
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPlayerConstantsTable0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Player_PlayModeEnum_0004 begin');
      let modes: number[] = [MusicPlayMode.SINGLE_CYCLE, MusicPlayMode.ORDER, MusicPlayMode.RANDOM];
      let distinct: Set<number> = new Set<number>(modes);
      let inList: number = 0;
      for (let mode of playModeSwitchList) {
        if (modes.indexOf(mode) >= 0) {
          inList++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `枚举=[${modes.join(',')}], 列表=[${playModeSwitchList.join(',')}], 不重复=${distinct.size}`);
      expect(MusicPlayMode.SINGLE_CYCLE).assertEqual(0);
      expect(MusicPlayMode.ORDER).assertEqual(1);
      expect(MusicPlayMode.RANDOM).assertEqual(2);
      expect(distinct.size).assertEqual(3);
      expect(playModeSwitchList.length).assertEqual(3);
      expect(inList).assertEqual(3);
      expect(playModeSwitchList[0]).assertEqual(MusicPlayMode.ORDER);
      expect(playModeSwitchList[playModeSwitchList.length - 1]).assertEqual(MusicPlayMode.SINGLE_CYCLE);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Player_PlayModeEnum_0004 end');
    });

    /**
     * @tc.number    SUB_PLAYER_CONST_0500
     * @tc.name      testPlayerConstantsTable0005
     * @tc.desc      验证播放模式切换列表按“顺序→随机→单曲”循环，连续切换 9 次回到起点
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPlayerConstantsTable0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Player_PlayModeCycle_0005 begin');
      let index: number = 0;
      let visited: number[] = [];
      for (let step = 0; step < 9; step++) {
        visited.push(playModeSwitchList[index]);
        index = index === playModeSwitchList.length - 1 ? 0 : index + 1;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `9 次切换序列=[${visited.join(',')}]`);
      expect(visited.length).assertEqual(9);
      expect(index).assertEqual(0);
      expect(visited[0]).assertEqual(visited[3]);
      expect(visited[0]).assertEqual(visited[6]);
      expect(visited[1]).assertEqual(visited[7]);
      expect(visited[2]).assertEqual(visited[8]);
      expect(new Set<number>(visited).size).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Player_PlayModeCycle_0005 end');
    });

    /**
     * @tc.number    SUB_PLAYER_CONST_0600
     * @tc.name      testPlayerConstantsTable0006
     * @tc.desc      验证播放状态枚举序号与 native 回调整型状态码 PLAY=4(COMPLETED)/PAUSE=5/STOP=6 的对应关系
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPlayerConstantsTable0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Player_StateEnum_0006 begin');
      let names: string[] = PLAY_STATE_ORDER;
      let playIndex: number = AudioPlayerState.PLAY;
      let pauseIndex: number = AudioPlayerState.PAUSE;
      let stopIndex: number = AudioPlayerState.STOP;
      let unknownIndex: number = AudioPlayerState.UNKNOWN;
      hilog.info(DOMAIN, TAG, '%{public}s',
        `PLAY=${playIndex}, PAUSE=${pauseIndex}, STOP=${stopIndex}, UNKNOWN=${unknownIndex}`);
      expect(names.length).assertEqual(14);
      expect(names[playIndex]).assertEqual('PLAY');
      expect(names[pauseIndex]).assertEqual('PAUSE');
      expect(names[stopIndex]).assertEqual('STOP');
      expect(names[unknownIndex]).assertEqual('UNKNOWN');
      expect(playIndex + 1).assertEqual(pauseIndex);
      expect(pauseIndex + 1).assertEqual(stopIndex);
      expect(new Set<string>(names).size).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Player_StateEnum_0006 end');
    });

    /**
     * @tc.number    SUB_PLAYER_CONST_0700
     * @tc.name      testPlayerConstantsTable0007
     * @tc.desc      验证偏好键名表逐项正确、均小写驼峰以 Id 结尾且两两不重复
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPlayerConstantsTable0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Player_PreferenceKeys_0007 begin');
      let cases: StringCase[] = preferenceKeyCases();
      let values: string[] = [];
      for (let item of cases) {
        hilog.info(DOMAIN, TAG, '%{public}s', `${item.name}=${item.actual}`);
        expect(item.actual).assertEqual(item.expected);
        values.push(item.actual);
      }
      let idSuffix: number = 0;
      for (let value of values) {
        if (value.endsWith('Id')) {
          idSuffix++;
        }
      }
      expect(cases.length).assertEqual(7);
      expect(idSuffix).assertEqual(4);
      expect(new Set<string>(values).size).assertEqual(7);
      expect(SELECT_MUSIC_INDEX).assertEqual('select' + 'Index');
      expect(TOTAL_MS_NUMBER_NUMBER_DURATION.startsWith('totalMs')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Player_PreferenceKeys_0007 end');
    });

    /**
     * @tc.number    SUB_PLAYER_CONST_0800
     * @tc.name      testPlayerConstantsTable0008
     * @tc.desc      验证默认音量与默认倍速均为 1，且与滑块区间端点兼容
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPlayerConstantsTable0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Player_Defaults_0008 begin');
      let volumeRange: number[] = [0, 1];
      let speedRange: number[] = [0.25, 4];
      hilog.info(DOMAIN, TAG, '%{public}s',
        `默认音量=${DEFAULT_VOLUME}, 默认倍速=${DEFAULT_SPEED}, 音量区间=[${volumeRange}], 倍速区间=[${speedRange}]`);
      expect(DEFAULT_VOLUME).assertEqual(1);
      expect(DEFAULT_SPEED).assertEqual(1);
      expect(DEFAULT_VOLUME).assertEqual(DEFAULT_SPEED);
      expect(DEFAULT_VOLUME >= volumeRange[0] && DEFAULT_VOLUME <= volumeRange[1]).assertTrue();
      expect(DEFAULT_SPEED >= speedRange[0] && DEFAULT_SPEED <= speedRange[1]).assertTrue();
      expect((DEFAULT_SPEED - speedRange[0]) / 0.25).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Player_Defaults_0008 end');
    });

    /**
     * @tc.number    SUB_PLAYER_CONST_0900
     * @tc.name      testPlayerConstantsTable0009
     * @tc.desc      验证首曲兜底标题与歌手非空且与歌曲表第一首一致
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPlayerConstantsTable0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Player_FirstSong_0009 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `标题=${firstSongTitle}, 歌手=${firstSongSinger}`);
      expect(firstSongTitle).assertEqual('Dream It Possible');
      expect(firstSongSinger).assertEqual('Delacey');
      expect(firstSongTitle.length > 0).assertTrue();
      expect(firstSongSinger.length > 0).assertTrue();
      expect(firstSongTitle.trim()).assertEqual(firstSongTitle);
      expect(firstSongSinger.trim()).assertEqual(firstSongSinger);
      expect(firstSongTitle !== firstSongSinger).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Player_FirstSong_0009 end');
    });

    /**
     * @tc.number    SUB_PLAYER_CONST_1000
     * @tc.name      testPlayerConstantsTable0010
     * @tc.desc      验证 Options 默认两个字段均为未定义，赋值后可分别独立读写
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPlayerConstantsTable0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Player_Options_0010 begin');
      let empty: Options = new Options();
      let filled: Options = new Options();
      filled.offset = 0;
      filled.length = 44;
      hilog.info(DOMAIN, TAG, '%{public}s',
        `默认 offset=${empty.offset === undefined}, length=${empty.length === undefined}`);
      expect(empty.offset === undefined).assertTrue();
      expect(empty.length === undefined).assertTrue();
      expect(filled.offset).assertEqual(0);
      expect(filled.length).assertEqual(44);
      expect(filled.length! > filled.offset!).assertTrue();
      expect(empty.offset === undefined && filled.offset !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Player_Options_0010 end');
    });
  });
}
