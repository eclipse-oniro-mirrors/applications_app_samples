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
 * @tc.number EXP_CT_PLAYER_EVENTS_004
 * @tc.name 真实播放器事件注册、prepare门控及一次性回调 CT_PLAYER_EVENTS_004
 * @tc.desc Catalog oracle: {"callbackCalls":1,"prepareCallbackIsNullBeforeCallback":true}
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
      f.player.emit('prepared');
      expect(callbacks).assertEqual(1);
      expect(model.prepareCallback).assertNull();
      expect(f.calls.join('|')).assertEqual('on:error|on:stateChange');
    } catch (error) {
      primaryFailed = true;
      throw error as Error;
    } finally {
      await f.close(primaryFailed);
    }
  };

export default runExpansionCase;
