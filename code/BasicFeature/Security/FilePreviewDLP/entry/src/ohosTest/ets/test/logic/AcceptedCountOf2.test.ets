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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../../utils/EventLoopYield';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { acceptedCountOf } from '../model/FilePreviewDlpLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FilePreviewDLP]';
const BUNDLE: string = 'FilePreviewDLP_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for acceptedCountOf (4 cases). */
export default function acceptedCountOf2Test(): void {
  describe('AcceptedCountOf2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0097
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0097
     * @tc.desc      acceptedCountOf(selectedCount=68) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0097 begin`);
      const actual: number = acceptedCountOf(68);
      logInfo(`acceptedCountOf(selectedCount=68): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0097 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0098
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0098
     * @tc.desc      acceptedCountOf(selectedCount=11.23) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0098 begin`);
      const actual: number = acceptedCountOf(11.23);
      logInfo(`acceptedCountOf(selectedCount=11.23): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0098 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0099
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0099
     * @tc.desc      acceptedCountOf(selectedCount=-11) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_AcceptedCountOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0099 begin`);
      const actual: number = acceptedCountOf(-11);
      logInfo(`acceptedCountOf(selectedCount=-11): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}AcceptedCountOf_0099 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ACCEPTED_COUNT_OF_0100
     * @tc.name      FilePreviewDLP_AcceptedCountOf_0100
     * @tc.desc      acceptedCountOf(selectedCount=89) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AcceptedCountOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AcceptedCountOf_0100 begin`);
      const actual: number = acceptedCountOf(89);
      logInfo(`acceptedCountOf(selectedCount=89): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AcceptedCountOf_0100 end`);
    });
  });
}
