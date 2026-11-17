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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { paceTurn } from './shared/TestPace';
import { GlobalBuilderContext } from '../../../main/ets/common/GlobalBuilderContext';
import { Constants } from '../../../main/ets/common/Constants';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentReuse_BuilderOverwrite]';

class Probe {
  public tag: string;

  constructor(tag: string) {
    this.tag = tag;
  }
}

export default function builderContextOverwriteTest() {
  describe('builderContextOverwriteTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_OVERWRITE_0100
     * @tc.name testOverwriteSameKey
     * @tc.desc Verify writing the same key twice returns the latest value and missing key stays undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testOverwriteSameKey', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOverwriteSameKey begin');
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const key: string = Constants.NAV_DESTINATION_ITEM_0;
      context.setObject(key, new Probe('A'));
      context.setObject(key, new Probe('B'));
      const got: Probe = context.getObject(key) as Probe;
      expect(got.tag).assertEqual('B');
      expect(context.getObject(key + '_missing') === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOverwriteSameKey end');
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_OVERWRITE_0200
     * @tc.name testMultipleKeysIsolated
     * @tc.desc Verify two keys hold independent values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testMultipleKeysIsolated', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMultipleKeysIsolated begin');
      const context: GlobalBuilderContext = GlobalBuilderContext.getContext();
      const keyA: string = Constants.NAV_DESTINATION_ITEM_1;
      const keyB: string = Constants.NAV_DESTINATION_ITEM_2;
      context.setObject(keyA, new Probe('A'));
      context.setObject(keyB, new Probe('B'));
      const gotA: Probe = context.getObject(keyA) as Probe;
      const gotB: Probe = context.getObject(keyB) as Probe;
      expect(gotA.tag).assertEqual('A');
      expect(gotB.tag).assertEqual('B');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMultipleKeysIsolated end');
    });
  })
}
