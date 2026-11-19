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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { FormStoreModel } from './model/FormExtLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FormExtAbility]';
const BUNDLE: string = 'FormExtAbility_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new FormStoreModel (1 cases). */
export default function formStoreModelCtorTest(): void {
  describe('FormStoreModelCtorTest', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_CTOR_0001
     * @tc.name      FormExtAbility_FormStoreModelCtor_0001
     * @tc.desc      new FormStoreModel() initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_FormStoreModelCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCtor_0001 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      logInfo(`new FormStoreModel(): subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(0);
      logInfo(`new FormStoreModel(): subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(0);
      logInfo(`new FormStoreModel(): subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(0);
      logInfo(`new FormStoreModel(): subject.counts.length=${subject.counts.length}`);
      expect(subject.counts.length).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelCtor_0001 end`);
    });
  });
}
