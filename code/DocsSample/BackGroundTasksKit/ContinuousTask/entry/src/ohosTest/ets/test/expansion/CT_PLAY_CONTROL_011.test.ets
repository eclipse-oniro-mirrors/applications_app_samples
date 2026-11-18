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
 * @tc.number EXP_CT_PLAY_CONTROL_011
 * @tc.name 真实播放暂停停止门控、Promise顺序及状态缺陷 CT_PLAY_CONTROL_011
 * @tc.desc Catalog oracle: {"stopCalls":1,"destroySessionCalls":1,"throwsSameError":false,"rejectionHandled":false,"isPlaying":true}
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const f = await ContinuousFixture.open();
    let primaryFailed: boolean = false;
    try {
      model.isPlaying = true;
      model.stopMusic();
      expect(f.calls.join('|')).assertEqual('stop');
      // No destroy call before the external stop promise settles.
      f.player.stopGate.resolve();
      await drain();
      expect(f.calls.join('|')).assertEqual('stop|destroy');
      expect(model.isPlaying).assertEqual(true);
      expect(model.avSession === f.sessionA.asSdk()).assertTrue();
      expect(f.errors.length).assertEqual(0);
    } catch (error) {
      primaryFailed = true;
      throw error as Error;
    } finally {
      await f.close(primaryFailed);
    }
  };

export default runExpansionCase;
