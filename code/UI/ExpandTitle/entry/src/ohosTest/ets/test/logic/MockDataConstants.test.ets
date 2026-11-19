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
import { MemoInfo } from '../../../../main/ets/pages/MemoInfo';
import { MEMO_DATA } from '../../../../main/ets/pages/MockData';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandTitle]';
const BUNDLE: string = 'ExpandTitle_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for MockData (1 cases). */
export default function mockDataConstantsTest(): void {
  describe('MockDataConstantsTest', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_MOCK_DATA_CONSTANTS_0001
     * @tc.name      ExpandTitle_MockDataConstants_0001
     * @tc.desc      MEMO_DATA keeps value "Lunches"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_MockDataConstants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MockDataConstants_0001 begin`);
      const actual: MemoInfo[] = MEMO_DATA;
      logInfo(`MEMO_DATA: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`MEMO_DATA: actual[0].memoId=${actual[0].memoId}`);
      expect(actual[0].memoId).assertEqual('1646121972443');
      logInfo(`MEMO_DATA: actual[0].title=${actual[0].title}`);
      expect(actual[0].title).assertEqual('One step');
      logInfo(`MEMO_DATA: actual[0].time=${actual[0].time}`);
      expect(actual[0].time).assertEqual('Just now');
      logInfo(`MEMO_DATA: actual[0].imageSrc=${actual[0].imageSrc}`);
      expect(actual[0].imageSrc).assertEqual('app.media.expanded_title_ic_public_app5');
      logInfo(`MEMO_DATA: actual[0].content=${actual[0].content}`);
      expect(actual[0].content).assertEqual('For analyzing the data gathered in the previous experiment.');
      logInfo(`MEMO_DATA: actual[3].memoId=${actual[3].memoId}`);
      expect(actual[3].memoId).assertEqual('1646121972446');
      logInfo(`MEMO_DATA: actual[3].title=${actual[3].title}`);
      expect(actual[3].title).assertEqual('Lunches');
      logInfo(`${BUNDLE}MockDataConstants_0001 end`);
    });
  });
}
