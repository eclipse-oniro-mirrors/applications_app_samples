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
 * @tc.number EXP_CT_PRELOAD_001
 * @tc.name 重置、索引边界、系统文件和应用资源分流 CT_PRELOAD_001
 * @tc.desc Catalog oracle: {"return":0,"playerResetCalls":0,"playerIndex":0,"prepareCallbackUnchanged":true}
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const f = await ContinuousFixture.open();
    let primaryFailed: boolean = false;
    try {
      const prior = (): void => {};
      model.prepareCallback = prior;
      expect(model.preLoad(-1, f.context, (): void => {})).assertEqual(0);
      expect(model.playerIndex).assertEqual(0);
      expect(model.prepareCallback === prior).assertTrue();
      await drain();
      expect(f.calls.length).assertEqual(0);
    } catch (error) {
      primaryFailed = true;
      throw error as Error;
    } finally {
      await f.close(primaryFailed);
    }
  };

export default runExpansionCase;
