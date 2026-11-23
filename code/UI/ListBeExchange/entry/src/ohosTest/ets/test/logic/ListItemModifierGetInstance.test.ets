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

/** Logic checks for ListItemModifier.getInstance (1 cases). */
export default function listItemModifierGetInstanceTest(): void {
  describe('ListItemModifierGetInstanceTest', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_ITEM_MODIFIER_GET_INSTANCE_0001
     * @tc.name      ListBeExchange_ListItemModifierGetInstance_0001
     * @tc.desc      getInstance() returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_ListItemModifierGetInstance_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListItemModifierGetInstance_0001 begin`);
      const actual: ListItemModifier = ListItemModifier.getInstance();
      logInfo(`getInstance(): actual.hasShadow=${actual.hasShadow}`);
      expect(actual.hasShadow).assertFalse();
      logInfo(`getInstance(): actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(1);
      logInfo(`getInstance(): actual.offsetY=${actual.offsetY}`);
      expect(actual.offsetY).assertEqual(0);
      logInfo(`getInstance(): actual.offsetX=${actual.offsetX}`);
      expect(actual.offsetX).assertEqual(0);
      logInfo(`getInstance(): actual.opacity=${actual.opacity}`);
      expect(actual.opacity).assertEqual(1);
      logInfo(`getInstance(): actual.isDeleted=${actual.isDeleted}`);
      expect(actual.isDeleted).assertFalse();
      logInfo(`${BUNDLE}ListItemModifierGetInstance_0001 end`);
    });
  });
}
