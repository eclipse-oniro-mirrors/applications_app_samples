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
import { expect } from '@ohos/hypium';
import { ContinuousFixture, model } from './ContinuousFixture';

/**
 * @tc.number EXP_CT_PLAYLIST_002
 * @tc.name 真实播放列表生成、重建与回调顺序 CT_PLAYLIST_002
 * @tc.desc Catalog oracle: {"audioFiles":[{"name":"dynamic.wav","fileUri":"system/etc/dynamic.wav","duration":0},{"name":"demo.wav","fileUri":"system/etc/demo.wav","duration":0}],"freshPlaylistIdentity":true,"freshSongIdentity":true,"callbackCountForSecondCall":1}
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const f = await ContinuousFixture.open();
    let primaryFailed: boolean = false;
    try {
      const before = model.playlist;
      const oldSong = before.audioFiles[0];
      oldSong.name = 'mutated'; oldSong.fileUri = 'audio/changed.wav'; oldSong.duration = 888;
      before.audioFiles.push(oldSong);
      let callbacks: number = 0;
      model.getPlaylist((): void => { callbacks++; });
      expect(callbacks).assertEqual(1);
      expect(model.playlist === before).assertFalse();
      expect(model.playlist.audioFiles[0] === oldSong).assertFalse();
      expect(model.playlist.audioFiles.length).assertEqual(2);
      expect(model.playlist.audioFiles[0].name).assertEqual('dynamic.wav');
      expect(model.playlist.audioFiles[0].fileUri).assertEqual('system/etc/dynamic.wav');
      expect(model.playlist.audioFiles[0].duration).assertEqual(0);
      expect(model.playlist.audioFiles[1].name).assertEqual('demo.wav');
      expect(model.playlist.audioFiles[1].fileUri).assertEqual('system/etc/demo.wav');
      expect(model.playlist.audioFiles[1].duration).assertEqual(0);
    } catch (error) {
      primaryFailed = true;
      throw error as Error;
    } finally {
      await f.close(primaryFailed);
    }
  };

export default runExpansionCase;
