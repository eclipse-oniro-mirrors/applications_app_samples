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
import { ColorModel } from '../../../main/ets/model/BasicDataSource';
import { ColorData } from '../../../main/ets/model/ColorData';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentReuse_AltReadWrite]';

function pushAndCheckPrevious(count: number): void {
  const data: ColorData = new ColorData();
  for (let i: number = 0; i < count; i++) {
    data.pushData(new ColorModel('alt_' + i, 'alt_text_' + i, i % 2 === 0 ? Color.Red : Color.Blue));
    expect(data.totalCount()).assertEqual(i + 1);
    if (i > 0) {
      const prev: ColorModel = data.getData(i - 1) as ColorModel;
      expect(prev.id).assertEqual('alt_' + (i - 1));
      expect(prev.text).assertEqual('alt_text_' + (i - 1));
    }
  }
}

export default function dataSourceAlternationTest() {
  describe('dataSourceAlternationTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_ALTIO_0100
     * @tc.name testAlternateWriteRead5
     * @tc.desc Verify alternating write and previous-index read for 5 items keeps order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testAlternateWriteRead5', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAlternateWriteRead5 begin');
      pushAndCheckPrevious(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAlternateWriteRead5 end');
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_ALTIO_0200
     * @tc.name testAlternateWriteRead12
     * @tc.desc Verify alternating write and previous-index read for 12 items keeps order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testAlternateWriteRead12', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAlternateWriteRead12 begin');
      pushAndCheckPrevious(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAlternateWriteRead12 end');
    });
  })
}
