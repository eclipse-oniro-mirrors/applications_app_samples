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
 * @tc.number EXP_CT_PLAYER_EVENTS_002
 * @tc.name 真实播放器事件注册、prepare门控及一次性回调 CT_PLAYER_EVENTS_002
 * @tc.desc Catalog oracle: {"prepareCalls":1,"callbackCalls":0,"prepareCallbackRetained":true}
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const f = await ContinuousFixture.open();
    let primaryFailed: boolean = false;
    try {
      model.initAVPlayer();
      expect(f.calls.join('|')).assertEqual('on:error|on:stateChange');
      let callbacks: number = 0;
      const callback = (): void => {
        callbacks++;
        expect(model.prepareCallback).assertNull();
      };
      model.prepareCallback = callback;
      f.player.emit('initialized');
      f.player.prepareGate.resolve();
      await drain();
      expect(f.calls.join('|')).assertEqual('on:error|on:stateChange|prepare');
      expect(model.prepareCallback === callback).assertTrue();
      expect(f.errors.length).assertEqual(0);
      expect(callbacks).assertEqual(0);
    } catch (error) {
      primaryFailed = true;
      throw error as Error;
    } finally {
      await f.close(primaryFailed);
    }
  };

export default runExpansionCase;
