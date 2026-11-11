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
import { MediaControlCenter } from '../../../main/ets/common/utils/mediautils/MediaControlCenter';
import SongItemBuilder from '../../../main/ets/viewmodel/SongItemBuilder';
import { songList } from '../../../main/ets/model/SongListData';
import { MusicPlayMode } from '../../../main/ets/common/constants/PlayerConstants';
import { SongItem } from '../../../main/ets/viewmodel/SongData';

const TAG: string = 'Sample_AudioMusicPlayer';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'AudioMusicPlayer_';

/**
 * Core logic tests for the media control center:
 * play state switching, progress update, play mode sync and volume query.
 */
export default function PlayerControl01Test() {
  describe('PlayerControl01Test', () => {

    beforeAll(() => {
      let context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      if (!AppStorage.get('context')) {
        AppStorage.setOrCreate('context', context);
      }
    });

    /**
     * @tc.number    SUB_PLAYER_CONTROL_TEST01_0100
     * @tc.name      testPlayerControl01Chapter0001
     * @tc.desc      Verify AudioMusicPlayer_ControlCenter_Singleton_001
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPlayerControl01Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ControlCenter_Singleton_001 begin');
      let first: MediaControlCenter = MediaControlCenter.getInstance();
      let second: MediaControlCenter = MediaControlCenter.getInstance();
      let same: boolean = first === second;
      hilog.info(DOMAIN, TAG, '%{public}s', `两次获取实例是否相同=${same}`);
      expect(same).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ControlCenter_Singleton_001 end');
    });

    /**
     * @tc.number    SUB_PLAYER_CONTROL_TEST01_0200
     * @tc.name      testPlayerControl01Chapter0002
     * @tc.desc      Verify AudioMusicPlayer_ControlCenter_SongListInStorage_002
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPlayerControl01Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ControlCenter_SongListInStorage_002 begin');
      MediaControlCenter.getInstance();
      let list: SongItem[] | undefined = AppStorage.get('songList');
      let len: number = list !== undefined ? list.length : -1;
      hilog.info(DOMAIN, TAG, '%{public}s', `AppStorage中songList是否发布=${list !== undefined}, 实际长度=${len}`);
      expect(list !== undefined).assertTrue();
      expect(len).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ControlCenter_SongListInStorage_002 end');
    });

    /**
     * @tc.number    SUB_PLAYER_CONTROL_TEST01_0300
     * @tc.name      testPlayerControl01Chapter0003
     * @tc.desc      Verify AudioMusicPlayer_ControlCenter_UpdateIsPlay_003
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPlayerControl01Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ControlCenter_UpdateIsPlay_003 begin');
      let center: MediaControlCenter = MediaControlCenter.getInstance();
      center.updateIsPlay(true);
      let afterPlay: boolean = AppStorage.get<boolean>('isPlay') as boolean;
      center.updateIsPlay(false);
      let afterPause: boolean = AppStorage.get<boolean>('isPlay') as boolean;
      hilog.info(DOMAIN, TAG, '%{public}s', `updateIsPlay(true)后=${afterPlay}, updateIsPlay(false)后=${afterPause}`);
      expect(afterPlay).assertTrue();
      expect(afterPause).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ControlCenter_UpdateIsPlay_003 end');
    });

    /**
     * @tc.number    SUB_PLAYER_CONTROL_TEST01_0400
     * @tc.name      testPlayerControl01Chapter0004
     * @tc.desc      Verify AudioMusicPlayer_ControlCenter_UpdateProgress_004
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPlayerControl01Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ControlCenter_UpdateProgress_004 begin');
      let center: MediaControlCenter = MediaControlCenter.getInstance();
      center.updateProgress(65000);
      let progress1: number = AppStorage.get<number>('progress') as number;
      let time1: string = AppStorage.get<string>('currentTime') as string;
      center.updateProgress(0);
      let progress2: number = AppStorage.get<number>('progress') as number;
      let time2: string = AppStorage.get<string>('currentTime') as string;
      hilog.info(DOMAIN, TAG, '%{public}s',
        `65000ms后 progress=${progress1} time=${time1}; 0ms后 progress=${progress2} time=${time2}`);
      expect(progress1).assertEqual(65000);
      expect(time1).assertEqual('01:05');
      expect(progress2).assertEqual(0);
      expect(time2).assertEqual('00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ControlCenter_UpdateProgress_004 end');
    });
    

    /**
     * @tc.number    SUB_PLAYER_CONTROL_TEST01_0600
     * @tc.name      testPlayerControl01Chapter0006
     * @tc.desc      Verify AudioMusicPlayer_ControlCenter_PlayPauseState_006
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPlayerControl01Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ControlCenter_PlayPauseState_006 begin');
      let center: MediaControlCenter = MediaControlCenter.getInstance();
      center.updateIsPlay(true);
      center.updateIsPlay(false);
      let afterPause: boolean = AppStorage.get<boolean>('isPlay') as boolean;
      center.updateIsPlay(true);
      let afterPlay: boolean = AppStorage.get<boolean>('isPlay') as boolean;
      hilog.info(DOMAIN, TAG, '%{public}s', `pause后isPlay=${afterPause}, play后isPlay=${afterPlay}`);
      expect(afterPause).assertFalse();
      expect(afterPlay).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ControlCenter_PlayPauseState_006 end');
    });

    

    /**
     * @tc.number    SUB_PLAYER_CONTROL_TEST01_0800
     * @tc.name      testPlayerControl01Chapter0008
     * @tc.desc      Verify AudioMusicPlayer_ControlCenter_VolumeGet_008
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPlayerControl01Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ControlCenter_VolumeGet_008 begin');
      let center: MediaControlCenter = MediaControlCenter.getInstance();
      let volume: number = center.getVolume();
      hilog.info(DOMAIN, TAG, '%{public}s', `实际系统音量=${volume}`);
      expect(volume >= 0 && volume <= 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ControlCenter_VolumeGet_008 end');
    });

    /**
     * @tc.number    SUB_PLAYER_CONTROL_TEST01_0900
     * @tc.name      testPlayerControl01Chapter0009
     * @tc.desc      Verify AudioMusicPlayer_SongItemBuilder_BuildFirstSong_009
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPlayerControl01Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SongItemBuilder_BuildFirstSong_009 begin');
      let builder: SongItemBuilder = new SongItemBuilder();
      let song: SongItem = songList[0];
      let built: SongItem = await builder.build(song);
      let sameRef: boolean = built === song;
      let descriptor = builder.getRawFileDescriptor();
      let descLen: number = descriptor !== undefined ? descriptor.length : -1;
      hilog.info(DOMAIN, TAG, '%{public}s', `build是否返回原对象=${sameRef}, 描述符长度=${descLen}`);
      expect(sameRef).assertTrue();
      expect(descriptor !== undefined).assertTrue();
      if (descriptor !== undefined) {
        expect(descLen > 0).assertTrue();
      }
      await builder.release();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SongItemBuilder_BuildFirstSong_009 end');
    });
  });
}
