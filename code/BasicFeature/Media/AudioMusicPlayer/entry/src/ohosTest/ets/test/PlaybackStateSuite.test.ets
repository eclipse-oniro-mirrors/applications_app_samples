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

import { describe, beforeAll, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { MediaControlCenter } from '../../../main/ets/common/utils/mediautils/MediaControlCenter';
import { AVSessionController } from '../../../main/ets/common/utils/mediautils/AVSessionController';
import { MusicPlayMode } from '../../../main/ets/common/constants/PlayerConstants';
import { PreferencesUtil } from '../../../main/ets/common/utils/PreferencesUtil';
import { StorageSnapshot, ensureAppContext } from './TestContext';
import { splitClock, pad2 } from './TestData';
import { paceTurn } from './TestPace';

const TAG: string = 'Sample_AudioMusicPlayer';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'AudioMusicPlayer_';
const STATE_KEYS: string[] = ['progress', 'currentTime', 'playMode', 'isPlay', 'isFavorite', 'currentSpeed',
  'currentVolume', 'selectIndex'];
const SONG_COUNT: number = 8;

/**
 * 独立换算：与进度条展示一致的“分:秒”文本，秒不参与进位到小时。
 */
function clockText(ms: number): string {
  if (!ms) {
    return '00:00';
  }
  let splits: number[] = splitClock(ms);
  return pad2(splits[1]) + ':' + pad2(splits[2]);
}

function loopModeName(loopMode: number): string {
  if (loopMode === 0) {
    return '单曲循环';
  }
  if (loopMode === 1) {
    return '列表循环';
  }
  return '随机';
}

function isLoopModeOf(mode: MusicPlayMode, loopMode: number): boolean {
  if (mode === MusicPlayMode.SINGLE_CYCLE) {
    return loopMode === 0;
  }
  if (mode === MusicPlayMode.ORDER) {
    return loopMode === 1;
  }
  return loopMode === 2;
}

function assetKeys(): string[] {
  let keys: string[] = [];
  for (let index = 0; index < SONG_COUNT; index++) {
    keys.push(`favoriteAsset_${index}`);
  }
  return keys;
}

interface FavoriteBackup {
  present: boolean;
  value: boolean;
}

function captureFavorites(): FavoriteBackup[] {
  let provider: PreferencesUtil = PreferencesUtil.getInstance();
  let saved: FavoriteBackup[] = [];
  for (let index = 0; index < SONG_COUNT; index++) {
    let key: string = index.toString();
    let present: boolean = provider.preferencesHas(key);
    saved.push({ present: present, value: present ? provider.getValue(key) as boolean : false });
  }
  return saved;
}

async function restoreFavorites(provider: PreferencesUtil, saved: FavoriteBackup[]): Promise<void> {
  for (let index = 0; index < saved.length; index++) {
    let key: string = index.toString();
    if (saved[index].present) {
      provider.preferencesPut(key, saved[index].value);
    } else {
      provider.removeKey(key);
    }
  }
}

export default function PlaybackStateSuite() {
  describe('PlaybackStateSuite', () => {
    let snapshot: StorageSnapshot = new StorageSnapshot();

    beforeAll(() => {
      ensureAppContext();
      MediaControlCenter.getInstance();
    });

    beforeEach(async () => {
      snapshot = new StorageSnapshot().capture(...STATE_KEYS);
      await paceTurn();
    });

    /**
     * @tc.number    SUB_PLAY_STATE_0100
     * @tc.name      testPlaybackState0001
     * @tc.desc      验证三种播放模式依次切换后存储值与待切换列表顺序一致，并全部落在合法模式集合内
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    

    /**
     * @tc.number    SUB_PLAY_STATE_0200
     * @tc.name      testPlaybackState0002
     * @tc.desc      验证重复设置同一播放模式幂等：存储值不变、来源模式与存储值保持一致
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    

    /**
     * @tc.number    SUB_PLAY_STATE_0300
     * @tc.name      testPlaybackState0003
     * @tc.desc      验证播放模式与系统循环模式映射方向正确：单曲对单曲、顺序对列表、随机对随机，无交叉
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    

    /**
     * @tc.number    SUB_PLAY_STATE_0400
     * @tc.name      testPlaybackState0004
     * @tc.desc      验证进度更新同时写入毫秒进度与分秒文本，二者与独立换算逐点一致且累计推进不回退
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPlaybackState0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PlayState_ProgressSeries_0004 begin');
        let center: MediaControlCenter = MediaControlCenter.getInstance();
        let samples: number[] = [0, 1000, 59999, 60000, 125500, 3599000];
        let timeMatched: number = 0;
        let progressMatched: number = 0;
        let previous: number = -1;
        let monotonic: boolean = true;
        for (let ms of samples) {
          center.updateProgress(ms);
          let progress: number = AppStorage.get<number>('progress') as number;
          let text: string = AppStorage.get<string>('currentTime') as string;
          if (progress === ms) {
            progressMatched++;
          }
          if (text === clockText(ms)) {
            timeMatched++;
          }
          if (progress < previous) {
            monotonic = false;
          }
          previous = progress;
        }
        hilog.info(DOMAIN, TAG, '%{public}s',
          `进度命中=${progressMatched}, 文本命中=${timeMatched}, 单调=${monotonic}`);
        expect(progressMatched).assertEqual(samples.length);
        expect(timeMatched).assertEqual(samples.length);
        expect(monotonic).assertTrue();
        expect(AppStorage.get<string>('currentTime')).assertEqual('59:59');
        expect(AppStorage.get<number>('progress')).assertEqual(3599000);
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PlayState_ProgressSeries_0004 end');
      } finally {
        snapshot.restore();
      }
    });

    /**
     * @tc.number    SUB_PLAY_STATE_0500
     * @tc.name      testPlaybackState0005
     * @tc.desc      验证进度文本与毫秒进度的边界对应：整分钟显示零秒、临界前一毫秒仍是上一秒
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPlaybackState0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PlayState_ProgressBoundary_0005 begin');
        let center: MediaControlCenter = MediaControlCenter.getInstance();
        let pairs: number[] = [60000, 60001, 119999, 120000];
        let expected: string[] = ['01:00', '01:00', '01:59', '02:00'];
        let matched: number = 0;
        for (let i = 0; i < pairs.length; i++) {
          center.updateProgress(pairs[i]);
          let text: string = AppStorage.get<string>('currentTime') as string;
          if (text === expected[i]) {
            matched++;
          }
        }
        hilog.info(DOMAIN, TAG, '%{public}s', `边界命中=${matched}`);
        expect(matched).assertEqual(pairs.length);
        expect(clockText(60001)).assertEqual('01:00');
        expect(clockText(119999)).assertEqual('01:59');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PlayState_ProgressBoundary_0005 end');
      } finally {
        snapshot.restore();
      }
    });

    /**
     * @tc.number    SUB_PLAY_STATE_0600
     * @tc.name      testPlaybackState0006
     * @tc.desc      验证播放状态标记往返切换与存储值一致，且切换不影响当前进度
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPlaybackState0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PlayState_IsPlayToggle_0006 begin');
        let center: MediaControlCenter = MediaControlCenter.getInstance();
        center.updateProgress(45678);
        center.updateIsPlay(true);
        let playing: boolean = AppStorage.get<boolean>('isPlay') as boolean;
        center.updateIsPlay(false);
        let paused: boolean = AppStorage.get<boolean>('isPlay') as boolean;
        let progress: number = AppStorage.get<number>('progress') as number;
        let text: string = AppStorage.get<string>('currentTime') as string;
        hilog.info(DOMAIN, TAG, '%{public}s',
          `播放=${playing}, 暂停=${paused}, 进度=${progress}, 文本=${text}`);
        expect(playing).assertTrue();
        expect(paused).assertFalse();
        expect(progress).assertEqual(45678);
        expect(text).assertEqual('00:45');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PlayState_IsPlayToggle_0006 end');
      } finally {
        snapshot.restore();
      }
    });

    /**
     * @tc.number    SUB_PLAY_STATE_0700
     * @tc.name      testPlaybackState0007
     * @tc.desc      验证收藏状态写回按歌曲索引隔离：切换一首歌的收藏不改变其他歌曲的收藏记录
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    

    /**
     * @tc.number    SUB_PLAY_STATE_0800
     * @tc.name      testPlaybackState0008
     * @tc.desc      验证收藏状态读回与写入往返一致：写入真值后读回为真，写入假值后读回为假
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    

    /**
     * @tc.number    SUB_PLAY_STATE_0900
     * @tc.name      testPlaybackState0009
     * @tc.desc      验证从未写过的歌曲索引读回为未收藏，且不会影响已收藏歌曲的状态
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    

    /**
     * @tc.number    SUB_PLAY_STATE_1000
     * @tc.name      testPlaybackState0010
     * @tc.desc      验证相同收藏状态重复写入结果稳定，首曲与末曲收藏互不干扰并可同时为已收藏
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    
  });
}
