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
import { ContinuousFixture, model, thrownBy } from './ContinuousFixture';

/**
 * @tc.number EXP_CT_PLAY_CONTROL_005
 * @tc.name 真实播放暂停停止门控、Promise顺序及状态缺陷 CT_PLAY_CONTROL_005
 * @tc.desc Catalog oracle: {"throwsSameError":true,"createSessionCalls":0}
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const f = await ContinuousFixture.open();
    let primaryFailed: boolean = false;
    try {
      f.player.playThrows = true;
      const error = thrownBy((): void => { model.playMusic(0, true, f.context); });
      expect(error === f.player.failure).assertTrue();
      expect(f.calls.join('|')).assertEqual('play');
      expect(f.sessionContexts.length).assertEqual(0);
      expect(model.isPlaying).assertFalse();
    } catch (error) {
      primaryFailed = true;
      throw error as Error;
    } finally {
      await f.close(primaryFailed);
    }
  };

export default runExpansionCase;
