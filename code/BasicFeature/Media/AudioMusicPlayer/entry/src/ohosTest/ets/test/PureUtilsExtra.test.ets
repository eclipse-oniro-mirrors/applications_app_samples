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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { MediaTools } from '../../../main/ets/common/utils/mediautils/MediaTools';
import { ColorConversion } from '../../../main/ets/common/utils/ColorConversion';
import { parseLrcLyric, parseKrcLyric, angleToRadian } from '../../../main/ets/common/utils/LrcUtils';
import { LrcEntry, Word } from '../../../main/ets/viewmodel/LrcEntry';
import {
  PlayerConstants,
  MusicPlayMode,
  AudioPlayerState,
  playModeSwitchList,
  DEFAULT_SPEED,
  DEFAULT_VOLUME
} from '../../../main/ets/common/constants/PlayerConstants';
import { Rectangle, LyricFile } from '../../../main/ets/common/constants/LyricConst';

function inUnitRange(value: number): boolean {
  return Number.isInteger(value) && value >= 0 && value <= 255;
}

export default function PureUtilsExtraTest() {
  describe('PureUtilsExtraTest', () => {
    /**
     * @tc.number SUB_PURE_EXTRA_0100
     * @tc.name testPureExtra0001
     * @tc.desc Verify dealColor returns three integer channels within the 0-255 range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testPureExtra0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const samples: number[][] = [
        [255, 0, 0], [0, 255, 0], [0, 0, 255], [100, 150, 200], [40, 60, 110], [128, 128, 128]
      ];
      for (const rgb of samples) {
        const result: number[] = ColorConversion.dealColor(rgb[0], rgb[1], rgb[2]);
        expect(result.length).assertEqual(3);
        expect(inUnitRange(result[0])).assertTrue();
        expect(inUnitRange(result[1])).assertTrue();
        expect(inUnitRange(result[2])).assertTrue();
      }
    });

    /**
     * @tc.number SUB_PURE_EXTRA_0200
     * @tc.name testPureExtra0002
     * @tc.desc Verify gray inputs keep the three output channels equal and in range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testPureExtra0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const levels: number[] = [0, 1, 10, 51, 102, 153, 254, 255];
      for (const level of levels) {
        const result: number[] = ColorConversion.dealColor(level, level, level);
        expect(result[0]).assertEqual(result[1]);
        expect(result[1]).assertEqual(result[2]);
        expect(inUnitRange(result[0])).assertTrue();
      }
    });

    /**
     * @tc.number SUB_PURE_EXTRA_0300
     * @tc.name testPureExtra0003
     * @tc.desc Verify pure red, green and blue keep their own channel as the maximum channel
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testPureExtra0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const red: number[] = ColorConversion.dealColor(255, 0, 0);
      const green: number[] = ColorConversion.dealColor(0, 255, 0);
      const blue: number[] = ColorConversion.dealColor(0, 0, 255);
      expect(red[0]).assertEqual(Math.max(red[0], red[1], red[2]));
      expect(green[1]).assertEqual(Math.max(green[0], green[1], green[2]));
      expect(blue[2]).assertEqual(Math.max(blue[0], blue[1], blue[2]));
    });

    /**
     * @tc.number SUB_PURE_EXTRA_0400
     * @tc.name testPureExtra0004
     * @tc.desc Verify secondary colors keep the two contributing channels equal and drop the third
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testPureExtra0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const yellow: number[] = ColorConversion.dealColor(255, 255, 0);
      const cyan: number[] = ColorConversion.dealColor(0, 255, 255);
      const magenta: number[] = ColorConversion.dealColor(255, 0, 255);
      expect(yellow[0]).assertEqual(yellow[1]);
      expect(yellow[2]).assertEqual(0);
      expect(cyan[1]).assertEqual(cyan[2]);
      expect(cyan[0]).assertEqual(0);
      expect(magenta[0]).assertEqual(magenta[2]);
      expect(magenta[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_PURE_EXTRA_0500
     * @tc.name testPureExtra0005
     * @tc.desc Verify zero and NaN durations format as the zero placeholder
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testPureExtra0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
      expect(MediaTools.msToCountdownTime(Number.NaN)).assertEqual('00:00');
    });

    /**
     * @tc.number SUB_PURE_EXTRA_0600
     * @tc.name testPureExtra0006
     * @tc.desc Verify second and minute boundaries format as mm:ss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testPureExtra0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(999)).assertEqual('00:00');
      expect(MediaTools.msToCountdownTime(1000)).assertEqual('00:01');
      expect(MediaTools.msToCountdownTime(1999)).assertEqual('00:01');
      expect(MediaTools.msToCountdownTime(59999)).assertEqual('00:59');
      expect(MediaTools.msToCountdownTime(60000)).assertEqual('01:00');
    });

    /**
     * @tc.number SUB_PURE_EXTRA_0700
     * @tc.name testPureExtra0007
     * @tc.desc Verify hour boundaries format as hh:mm:ss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testPureExtra0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(3599999)).assertEqual('59:59');
      expect(MediaTools.msToCountdownTime(3600000)).assertEqual('01:00:00');
      expect(MediaTools.msToCountdownTime(86399999)).assertEqual('23:59:59');
    });

    /**
     * @tc.number SUB_PURE_EXTRA_0800
     * @tc.name testPureExtra0008
     * @tc.desc Verify day prefixes add a leading segment while one day still shows three segments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testPureExtra0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(86400000)).assertEqual('01:00:00');
      expect(MediaTools.msToCountdownTime(86400000).split(':').length).assertEqual(3);
      expect(MediaTools.msToCountdownTime(90000000)).assertEqual('01:01:00:00');
      expect(MediaTools.msToCountdownTime(183845000)).assertEqual('02:03:04:05');
    });

    /**
     * @tc.number SUB_PURE_EXTRA_0900
     * @tc.name testPureExtra0009
     * @tc.desc Verify negative durations follow JavaScript modulo arithmetic segment by segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testPureExtra0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MediaTools.msToCountdownTime(-1)).assertEqual('-1:-1:-1:-1');
      expect(MediaTools.msToCountdownTime(-1000)).assertEqual('-1:-1:-1:-1');
      expect(MediaTools.msToCountdownTime(-86400000)).assertEqual('-1:00:00');
    });

    /**
     * @tc.number SUB_PURE_EXTRA_1000
     * @tc.name testPureExtra0010
     * @tc.desc Verify empty and timestamp-free lyric text parse to an empty list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testPureExtra0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(parseLrcLyric('').length).assertEqual(0);
      expect(parseLrcLyric('no timestamps here').length).assertEqual(0);
    });

    /**
     * @tc.number SUB_PURE_EXTRA_1100
     * @tc.name testPureExtra0011
     * @tc.desc Verify a single LRC line keeps its start time, text and open-ended duration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testPureExtra0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric('[00:01.00] hello');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(1000);
      expect(entries[0].lineWords.trim()).assertEqual('hello');
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
      expect(entries[0].words.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_PURE_EXTRA_1200
     * @tc.name testPureExtra0012
     * @tc.desc Verify out-of-order LRC lines are sorted and durations equal the time gaps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testPureExtra0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric('[00:20.00] c\n[00:10.00] b\n[00:05.00] a\n');
      expect(entries.length).assertEqual(3);
      expect(entries[0].lineStartTime).assertEqual(5000);
      expect(entries[1].lineStartTime).assertEqual(10000);
      expect(entries[2].lineStartTime).assertEqual(20000);
      expect(entries[0].lineDuration).assertEqual(5000);
      expect(entries[1].lineDuration).assertEqual(10000);
      expect(entries[2].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_PURE_EXTRA_1300
     * @tc.name testPureExtra0013
     * @tc.desc Verify the fractional part is parsed as a fraction of a second
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testPureExtra0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric('[00:10.50] x');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(10500);
    });

    /**
     * @tc.number SUB_PURE_EXTRA_1400
     * @tc.name testPureExtra0014
     * @tc.desc Verify multiple timestamps on one line produce one entry per timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testPureExtra0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric('[00:01.00][00:02.00] x');
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(1000);
      expect(entries[1].lineStartTime).assertEqual(2000);
      expect(entries[0].lineWords.trim()).assertEqual('x');
      expect(entries[1].lineWords.trim()).assertEqual('x');
    });

    /**
     * @tc.number SUB_PURE_EXTRA_1500
     * @tc.name testPureExtra0015
     * @tc.desc Verify a timestamp with no following text is skipped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testPureExtra0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(parseLrcLyric('[00:05.00]').length).assertEqual(0);
    });

    /**
     * @tc.number SUB_PURE_EXTRA_1600
     * @tc.name testPureExtra0016
     * @tc.desc Verify a valid KRC line yields its start, duration, text and words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testPureExtra0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[1000,2000]<0,500,0>Hel<500,500,0>lo');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(1000);
      expect(entries[0].lineDuration).assertEqual(2000);
      expect(entries[0].lineWords).assertEqual('Hello');
      expect(entries[0].words.length).assertEqual(2);
      const first: Word = entries[0].words[0];
      expect(first.text).assertEqual('Hel');
      expect(first.wordStartTime).assertEqual(0);
      expect(first.duration).assertEqual(500);
    });

    /**
     * @tc.number SUB_PURE_EXTRA_1700
     * @tc.name testPureExtra0017
     * @tc.desc Verify invalid KRC text is ignored and valid lines are sorted by start time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testPureExtra0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(parseKrcLyric('abc').length).assertEqual(0);
      const entries: LrcEntry[] = parseKrcLyric('[2000,100]<0,100,0>b\n[1000,100]<0,100,0>a');
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(1000);
      expect(entries[0].lineWords).assertEqual('a');
      expect(entries[1].lineStartTime).assertEqual(2000);
      expect(entries[1].lineWords).assertEqual('b');
    });

    /**
     * @tc.number SUB_PURE_EXTRA_1800
     * @tc.name testPureExtra0018
     * @tc.desc Verify angleToRadian matches pi-based known conversions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testPureExtra0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(angleToRadian(0)).assertEqual(0);
      expect(Math.abs(angleToRadian(90) - Math.PI / 2) < 1e-9).assertTrue();
      expect(Math.abs(angleToRadian(180) - Math.PI) < 1e-9).assertTrue();
      expect(Math.abs(angleToRadian(360) - 2 * Math.PI) < 1e-9).assertTrue();
      expect(Math.abs(angleToRadian(-90) + Math.PI / 2) < 1e-9).assertTrue();
    });

    /**
     * @tc.number SUB_PURE_EXTRA_1900
     * @tc.name testPureExtra0019
     * @tc.desc Verify the play mode switch order is order, random and single cycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testPureExtra0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(playModeSwitchList.length).assertEqual(3);
      expect(playModeSwitchList[0]).assertEqual(MusicPlayMode.ORDER);
      expect(playModeSwitchList[1]).assertEqual(MusicPlayMode.RANDOM);
      expect(playModeSwitchList[2]).assertEqual(MusicPlayMode.SINGLE_CYCLE);
    });

    /**
     * @tc.number SUB_PURE_EXTRA_2000
     * @tc.name testPureExtra0020
     * @tc.desc Verify play mode enum values are distinct and stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testPureExtra0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(MusicPlayMode.SINGLE_CYCLE).assertEqual(0);
      expect(MusicPlayMode.ORDER).assertEqual(1);
      expect(MusicPlayMode.RANDOM).assertEqual(2);
      const values: number[] = [MusicPlayMode.SINGLE_CYCLE, MusicPlayMode.ORDER, MusicPlayMode.RANDOM];
      expect(new Set<number>(values).size).assertEqual(3);
      expect(AudioPlayerState.IDLE).assertEqual(0);
      expect(AudioPlayerState.INITIALIZED).assertEqual(1);
    });

    /**
     * @tc.number SUB_PURE_EXTRA_2100
     * @tc.name testPureExtra0021
     * @tc.desc Verify player area constants keep their documented values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testPureExtra0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(PlayerConstants.ROTATE).assertEqual(360);
      expect(PlayerConstants.ANIMATION_DURATION).assertEqual(3000);
      expect(PlayerConstants.ITERATIONS).assertEqual(-1);
      expect(PlayerConstants.ENCODING).assertEqual('utf-8');
      expect(DEFAULT_VOLUME).assertEqual(1);
      expect(DEFAULT_SPEED).assertEqual(1);
    });

    /**
     * @tc.number SUB_PURE_EXTRA_2200
     * @tc.name testPureExtra0022
     * @tc.desc Verify Rectangle keeps valid coordinates and rejects inverted ones
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testPureExtra0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const valid: Rectangle = new Rectangle(1, 2, 3, 4);
      expect(valid.left).assertEqual(1);
      expect(valid.top).assertEqual(2);
      expect(valid.right).assertEqual(3);
      expect(valid.bottom).assertEqual(4);
      const inverted: Rectangle = new Rectangle(5, 2, 3, 4);
      expect(inverted.left).assertEqual(0);
      expect(inverted.top).assertEqual(0);
      expect(inverted.right).assertEqual(0);
      expect(inverted.bottom).assertEqual(0);
    });

    /**
     * @tc.number SUB_PURE_EXTRA_2300
     * @tc.name testPureExtra0023
     * @tc.desc Verify Rectangle.isIn includes the edges and excludes outside points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testPureExtra0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(1, 2, 3, 4);
      expect(rect.isIn(1, 2)).assertTrue();
      expect(rect.isIn(3, 4)).assertTrue();
      expect(rect.isIn(2, 3)).assertTrue();
      expect(rect.isIn(0, 2)).assertFalse();
      expect(rect.isIn(1, 5)).assertFalse();
      expect(rect.toString()).assertEqual('[Rectangle] = 1, 2, 3,4');
    });

    /**
     * @tc.number SUB_PURE_EXTRA_2400
     * @tc.name testPureExtra0024
     * @tc.desc Verify lyric file suffixes carry the expected values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testPureExtra0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(LyricFile.KRC).assertEqual('.krc');
      expect(LyricFile.LRC).assertEqual('.lrc');
    });
  });
}
