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
 * @tc.number EXP_CT_PLAYER_EVENTS_008
 * @tc.name 真实播放器事件注册、prepare门控及一次性回调 CT_PLAYER_EVENTS_008
 * @tc.desc Catalog oracle: {"noRethrow":true,"publicStateUnchanged":true}
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const f = await ContinuousFixture.open();
    let primaryFailed: boolean = false;
    try {
      model.initAVPlayer();
      expect(f.calls.join('|')).assertEqual('on:error|on:stateChange');
      let callbacks: number = 0;
      model.playerIndex = 1; model.isPlaying = true;
      const beforePlaylist = model.playlist;
      const callback = (): void => { callbacks++; };
      model.prepareCallback = callback;
      f.player.errorListener(new Error('decoder failed'));
      expect(model.playerIndex).assertEqual(1);
      expect(model.isPlaying).assertTrue();
      expect(model.playlist === beforePlaylist).assertTrue();
      expect(model.player === f.player.asSdk()).assertTrue();
      expect(model.avSession === f.sessionA.asSdk()).assertTrue();
      expect(model.prepareCallback === callback).assertTrue();
      expect(callbacks).assertEqual(0);
      expect(f.errors.length).assertEqual(1);
      expect(f.errors[0].includes('player error: decoder failed')).assertTrue();
    } catch (error) {
      primaryFailed = true;
      throw error as Error;
    } finally {
      await f.close(primaryFailed);
    }
  };

export default runExpansionCase;
