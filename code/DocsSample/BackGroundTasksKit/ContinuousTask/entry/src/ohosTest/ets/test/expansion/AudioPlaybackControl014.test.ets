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
import { ContinuousFixture, model, drain } from './ContinuousFixture';

/**
 * @tc.number EXP_CT_PLAY_CONTROL_014
 * @tc.name 真实播放暂停停止门控、Promise顺序及状态缺陷 CT_PLAY_CONTROL_014
 * @tc.desc Catalog oracle: {"playerPlayCalls":1,"pauseCalls":0,"stopCalls":0,"isPlaying":false,"sessionNotDestroyed":true}
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const f = await ContinuousFixture.open();
    let primaryFailed: boolean = false;
    try {
      model.playMusic(0, true, f.context);
      // Session creation must happen before the pending play promise is settled.
      expect(f.calls.join('|')).assertEqual('play|createSession');
      expect(f.player.playGate.settled).assertFalse();
      expect(f.sessionContexts[0] === f.context).assertTrue();
      expect(f.sessionNames[0]).assertEqual('player');
      expect(f.sessionTypes[0]).assertEqual('audio');
      f.player.playGate.resolve();
      f.sessionGate.resolve(f.sessionB.asSdk());
      await drain();
      expect(model.isPlaying).assertFalse();
      expect(model.avSession === f.sessionB.asSdk()).assertTrue();
      expect(f.errors.length).assertEqual(0);
      model.pauseMusic();
      model.stopMusic();
      await drain();
      expect(f.calls.join('|')).assertEqual('play|createSession');
      expect(model.isPlaying).assertFalse();
    } catch (error) {
      primaryFailed = true;
      throw error as Error;
    } finally {
      await f.close(primaryFailed);
    }
  };

export default runExpansionCase;
