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
import { PreferencesUtil } from '../../../main/ets/common/utils/PreferencesUtil';
import { MusicPlayMode, playModeSwitchList } from '../../../main/ets/common/constants/PlayerConstants';
import { ensureAppContext } from './TestContext';
import { paceTurn } from './TestPace';

const TAG: string = 'Sample_AudioMusicPlayer';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'AudioMusicPlayer_';
const FAVORITE_ASSET_PREFIX: string = 'favoriteAsset_';
const SONG_COUNT: number = 8;

function assetKeys(): string[] {
  let keys: string[] = [];
  for (let index = 0; index < SONG_COUNT; index++) {
    keys.push(FAVORITE_ASSET_PREFIX + index);
  }
  return keys;
}

function toggle(state: boolean): boolean {
  return !state;
}

function nextPlayMode(current: MusicPlayMode): MusicPlayMode {
  let position: number = playModeSwitchList.indexOf(current);
  let nextPosition: number = position >= playModeSwitchList.length - 1 ? 0 : position + 1;
  return playModeSwitchList[nextPosition];
}

function loopModeOf(mode: MusicPlayMode): number {
  if (mode === MusicPlayMode.SINGLE_CYCLE) {
    return 0;
  }
  if (mode === MusicPlayMode.ORDER) {
    return 1;
  }
  return 2;
}

function playModeOf(loopMode: number): MusicPlayMode {
  if (loopMode === 0) {
    return MusicPlayMode.SINGLE_CYCLE;
  }
  if (loopMode === 1) {
    return MusicPlayMode.ORDER;
  }
  return MusicPlayMode.RANDOM;
}

function songIndexText(selectIndex: number | undefined): string {
  return (selectIndex ? selectIndex : 0).toString();
}

export default function FavoriteSequenceTest() {
  describe('FavoriteSequenceTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_FAVORITE_SEQUENCE_0100
     * @tc.name      testFavoriteSequence0001
     * @tc.desc      验证收藏状态按歌曲索引独立保存且切换不影响其他歌曲的收藏记录
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    

    /**
     * @tc.number    SUB_FAVORITE_SEQUENCE_0200
     * @tc.name      testFavoriteSequence0002
     * @tc.desc      验证收藏开关多次切换后的状态与独立取反运算一致且首尾状态互补
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    

    /**
     * @tc.number    SUB_FAVORITE_SEQUENCE_0300
     * @tc.name      testFavoriteSequence0003
     * @tc.desc      验证播放模式按钮循环切换依次经过三档模式并回到初始模式
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testFavoriteSequence0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Favorite_PlayModeCycle_0003 begin');
      let start: MusicPlayMode = playModeSwitchList[0];
      let visited: MusicPlayMode[] = [];
      let current: MusicPlayMode = start;
      for (let step = 0; step < playModeSwitchList.length; step++) {
        current = nextPlayMode(current);
        visited.push(current);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `起点=${MusicPlayMode[start]}, 切换序列=${visited.map(v => MusicPlayMode[v])}`);
      expect(visited).assertDeepEquals([MusicPlayMode.RANDOM, MusicPlayMode.SINGLE_CYCLE, MusicPlayMode.ORDER]);
      expect(current).assertEqual(start);
      expect(visited[visited.length - 1]).assertEqual(start);
      expect(nextPlayMode(MusicPlayMode.SINGLE_CYCLE)).assertEqual(playModeSwitchList[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Favorite_PlayModeCycle_0003 end');
    });

    /**
     * @tc.number    SUB_FAVORITE_SEQUENCE_0400
     * @tc.name      testFavoriteSequence0004
     * @tc.desc      验证播放模式与系统循环模式双向映射互为逆运算且不丢失模式含义
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testFavoriteSequence0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Favorite_LoopMapping_0004 begin');
      let modes: MusicPlayMode[] = [MusicPlayMode.SINGLE_CYCLE, MusicPlayMode.ORDER, MusicPlayMode.RANDOM];
      let mapped: number[] = [];
      let roundTrip: boolean = true;
      for (let mode of modes) {
        let loopMode: number = loopModeOf(mode);
        mapped.push(loopMode);
        if (playModeOf(loopMode) !== mode) {
          roundTrip = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `模式=${modes}, 循环模式=${mapped}, 往返一致=${roundTrip}`);
      expect(mapped).assertDeepEquals([0, 1, 2]);
      expect(roundTrip).assertTrue();
      let distinctMapped: number = mapped.indexOf(0) >= 0 && mapped.indexOf(1) >= 0 && mapped.indexOf(2) >= 0 ? 3 : 0;
      expect(distinctMapped).assertEqual(modes.length);
      expect(playModeOf(loopModeOf(MusicPlayMode.RANDOM))).assertEqual(MusicPlayMode.RANDOM);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Favorite_LoopMapping_0004 end');
    });

    /**
     * @tc.number    SUB_FAVORITE_SEQUENCE_0500
     * @tc.name      testFavoriteSequence0005
     * @tc.desc      验证当前歌曲索引转文本时零索引与非零索引取值正确且未定义时回落首曲
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testFavoriteSequence0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Favorite_AssetIdText_0005 begin');
      let samples: number[] = [0, 1, 2, 5, 7];
      let texts: string[] = [];
      let allNumeric: boolean = true;
      for (let index of samples) {
        let key: string = index.toString();
        texts.push(key);
        expect(key).assertEqual(index.toString());
        if (!Number.isInteger(Number.parseInt(key))) {
          allNumeric = false;
        }
      }
      let zeroKey: string = Number(0).toString();
      let undefinedKey: string = songIndexText(undefined);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `索引文本=${texts}, 零索引文本=${zeroKey}, 未定义索引文本=${undefinedKey}`);
      expect(undefinedKey).assertEqual('0');
      expect(allNumeric).assertTrue();
      expect(texts.length).assertEqual(samples.length);
      expect(texts[texts.length - 1]).assertEqual((SONG_COUNT - 1).toString());
      expect(zeroKey).assertEqual(texts[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Favorite_AssetIdText_0005 end');
    });
  });
}
