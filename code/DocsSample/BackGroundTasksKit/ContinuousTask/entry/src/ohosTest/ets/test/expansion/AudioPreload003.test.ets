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
import { ContinuousFixture, model, drain, thrownBy } from './ContinuousFixture';

/**
 * @tc.number EXP_CT_PRELOAD_003
 * @tc.name 重置、索引边界、系统文件和应用资源分流 CT_PRELOAD_003
 * @tc.desc Catalog oracle: {"throws":"TypeError reading fileUri on undefined indexed Song","playerResetCalls":0,"playerIndex":0.5}
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const f = await ContinuousFixture.open();
    let primaryFailed: boolean = false;
    try {
      const prior = (): void => {};
      model.prepareCallback = prior;
      const error = thrownBy((): void => { model.preLoad(0.5, f.context, (): void => {}); });
      expect(error instanceof TypeError).assertTrue();
      expect(model.playerIndex).assertEqual(0.5);
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
