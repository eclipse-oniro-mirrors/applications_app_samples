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
import { ListItemModifier } from '../../../../main/ets/bridge/ListExchangeBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ListBeExchange]';
const BUNDLE: string = 'ListBeExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new ListItemModifier (1 cases). */
export default function listItemModifierCtorTest(): void {
  describe('ListItemModifierCtorTest', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_ITEM_MODIFIER_CTOR_0001
     * @tc.name      ListBeExchange_ListItemModifierCtor_0001
     * @tc.desc      new ListItemModifier() initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_ListItemModifierCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListItemModifierCtor_0001 begin`);
      const subject: ListItemModifier = new ListItemModifier();
      logInfo(`new ListItemModifier(): subject.hasShadow=${subject.hasShadow}`);
      expect(subject.hasShadow).assertFalse();
      logInfo(`new ListItemModifier(): subject.scale=${subject.scale}`);
      expect(subject.scale).assertEqual(1);
      logInfo(`new ListItemModifier(): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(0);
      logInfo(`new ListItemModifier(): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ListItemModifier(): subject.opacity=${subject.opacity}`);
      expect(subject.opacity).assertEqual(1);
      logInfo(`new ListItemModifier(): subject.isDeleted=${subject.isDeleted}`);
      expect(subject.isDeleted).assertFalse();
      logInfo(`${BUNDLE}ListItemModifierCtor_0001 end`);
    });
  });
}
