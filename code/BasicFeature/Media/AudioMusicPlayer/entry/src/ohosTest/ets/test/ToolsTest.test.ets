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
import { MediaTools } from '../../../main/ets/common/utils/mediautils/MediaTools';
import { ColorConversion } from '../../../main/ets/common/utils/ColorConversion';
import { ResourceConversion } from '../../../main/ets/common/utils/ResourceConversion';
import { songList } from '../../../main/ets/model/SongListData';
import { MusicPlayMode, playModeSwitchList, AudioPlayerState, DEFAULT_VOLUME, DEFAULT_SPEED } from
  '../../../main/ets/common/constants/PlayerConstants';

const TAG: string = 'Sample_AudioMusicPlayer';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'AudioMusicPlayer_';

export default function Tools01Test() {
  describe('Tools01Test', () => {

    beforeAll(() => {
      let context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      if (!AppStorage.get('context')) {
        AppStorage.setOrCreate('context', context);
      }
    });

    /**
     * @tc.number    SUB_TOOLS_TEST01_0100
     * @tc.name      testTools01Chapter0001
     * @tc.desc      Verify AudioMusicPlayer_MsToTime_Format_001
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testTools01Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MsToTime_Format_001 begin');
      let t0: string = MediaTools.msToCountdownTime(0);
      let t59: string = MediaTools.msToCountdownTime(59000);
      let t60: string = MediaTools.msToCountdownTime(60000);
      let t65: string = MediaTools.msToCountdownTime(65000);
      hilog.info(DOMAIN, TAG, '%{public}s', `0ms=${t0}, 59000ms=${t59}, 60000ms=${t60}, 65000ms=${t65}`);
      expect(t0).assertEqual('00:00');
      expect(t59).assertEqual('00:59');
      expect(t60).assertEqual('01:00');
      expect(t65).assertEqual('01:05');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MsToTime_Format_001 end');
    });

    /**
     * @tc.number    SUB_TOOLS_TEST01_0200
     * @tc.name      testTools01Chapter0002
     * @tc.desc      Verify AudioMusicPlayer_SongList_Constants_002
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testTools01Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SongList_Constants_002 begin');
      hilog.info(DOMAIN, TAG, '%{public}s',
        `歌曲数=${songList.length}, 首索引=${songList[0].index}, 末索引=${songList[7].index}`);
      expect(songList.length).assertEqual(8);
      expect(songList[0].index).assertEqual(0);
      expect(songList[7].index).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', `首歌曲源=${songList[0].src}, 歌词=${songList[0].lyric}`);
      expect(songList[0].src).assertEqual('Delacey - Dream It Possible.pcm');
      expect(songList[0].lyric).assertEqual('lrcfiles/DreamItPossible.lrc');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SongList_Constants_002 end');
    });

    /**
     * @tc.number    SUB_TOOLS_TEST01_0300
     * @tc.name      testTools01Chapter0003
     * @tc.desc      Verify AudioMusicPlayer_PlayMode_Constants_003
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testTools01Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PlayMode_Constants_003 begin');
      let modeText: string =
        `SINGLE_CYCLE=${MusicPlayMode.SINGLE_CYCLE}, ORDER=${MusicPlayMode.ORDER}, RANDOM=${MusicPlayMode.RANDOM}`;
      hilog.info(DOMAIN, TAG, '%{public}s', `${modeText}, 列表长度=${playModeSwitchList.length}`);
      expect(MusicPlayMode.SINGLE_CYCLE).assertEqual(0);
      expect(MusicPlayMode.ORDER).assertEqual(1);
      expect(MusicPlayMode.RANDOM).assertEqual(2);
      expect(playModeSwitchList.length).assertEqual(3);
      expect(playModeSwitchList[0]).assertEqual(MusicPlayMode.ORDER);
      expect(playModeSwitchList[1]).assertEqual(MusicPlayMode.RANDOM);
      expect(playModeSwitchList[2]).assertEqual(MusicPlayMode.SINGLE_CYCLE);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PlayMode_Constants_003 end');
    });

    /**
     * @tc.number    SUB_TOOLS_TEST01_0400
     * @tc.name      testTools01Chapter0004
     * @tc.desc      Verify AudioMusicPlayer_PlayerState_Constants_004
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testTools01Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PlayerState_Constants_004 begin');
      hilog.info(DOMAIN, TAG, '%{public}s',
        `IDLE=${AudioPlayerState.IDLE}, PREPARED=${AudioPlayerState.PREPARED}, PLAY=${AudioPlayerState.PLAY}, ` +
        `PAUSE=${AudioPlayerState.PAUSE}, STOP=${AudioPlayerState.STOP}, COMPLETED=${AudioPlayerState.COMPLETED}, ` +
        `DEFAULT_VOLUME=${DEFAULT_VOLUME}, DEFAULT_SPEED=${DEFAULT_SPEED}`);
      expect(AudioPlayerState.IDLE).assertEqual(0);
      expect(AudioPlayerState.PREPARED).assertEqual(3);
      expect(AudioPlayerState.PLAY).assertEqual(4);
      expect(AudioPlayerState.PAUSE).assertEqual(5);
      expect(AudioPlayerState.STOP).assertEqual(6);
      expect(AudioPlayerState.COMPLETED).assertEqual(8);
      expect(DEFAULT_VOLUME).assertEqual(1);
      expect(DEFAULT_SPEED).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PlayerState_Constants_004 end');
    });

    /**
     * @tc.number    SUB_TOOLS_TEST01_0500
     * @tc.name      testTools01Chapter0005
     * @tc.desc      Verify AudioMusicPlayer_ColorConversion_005
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testTools01Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ColorConversion_005 begin');
      let red: number[] = ColorConversion.dealColor(255, 0, 0);
      let mixed: number[] = ColorConversion.dealColor(100, 150, 200);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `红色=[${red}], 混合色=[${mixed}]`);
      expect(red.length).assertEqual(3);
      expect(red[0]).assertEqual(76);
      expect(red[1]).assertEqual(0);
      expect(red[2]).assertEqual(0);
      expect(mixed.length).assertEqual(3);
      expect(mixed[0]).assertEqual(38);
      expect(mixed[1]).assertEqual(57);
      expect(mixed[2]).assertEqual(76);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ColorConversion_005 end');
    });

    /**
     * @tc.number    SUB_TOOLS_TEST01_0600
     * @tc.name      testTools01Chapter0006
     * @tc.desc      Verify AudioMusicPlayer_ResourceConversion_Title_006
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testTools01Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceConversion_Title_006 begin');
      let contexts: Object[] = [];
      let entryContext: Object | undefined = AppStorage.get<Object>('context');
      let testContext: Object | undefined = AppStorage.get<Object>('testContext');
      if (entryContext !== undefined) {
        contexts.push(entryContext);
      }
      if (testContext !== undefined) {
        contexts.push(testContext);
      }
      let conversion: ResourceConversion = new ResourceConversion();
      let resolved: string = '';
      for (let ctx of contexts) {
        AppStorage.setOrCreate('context', ctx);
        let probe: ResourceConversion = new ResourceConversion();
        try {
          let value = probe.getStringValueFromResource(songList[0].title!);
          if (typeof value === 'string' && (value as string).length > 0) {
            resolved = value as string;
            break;
          }
        } catch (err) {
          const errCode: number | undefined = (err as BusinessError).code;
          hilog.error(DOMAIN, TAG, '%{public}s', `probe failed code=${String(errCode)}`);
          expect(errCode !== undefined).assertTrue();
        }
      }
      AppStorage.setOrCreate('context', entryContext!);
      hilog.info(DOMAIN, TAG, '%{public}s', `实际解析歌名=[${resolved}]`);
      expect(resolved.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResourceConversion_Title_006 end');
    });
  });
}
