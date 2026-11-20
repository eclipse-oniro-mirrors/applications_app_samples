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
import { DlpListState } from '../model/FilePreviewDlpLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FilePreviewDLP]';
const BUNDLE: string = 'FilePreviewDLP_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new DlpListState (1 cases). */
export default function dlpListStateCtorTest(): void {
  describe('DlpListStateCtorTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_DLP_LIST_STATE_CTOR_0001
     * @tc.name      FilePreviewDLP_DlpListStateCtor_0001
     * @tc.desc      new DlpListState() initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_DlpListStateCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DlpListStateCtor_0001 begin`);
      const subject: DlpListState = new DlpListState();
      logInfo(`new DlpListState(): subject.fileArray.length=${subject.fileArray.length}`);
      expect(subject.fileArray.length).assertEqual(0);
      logInfo(`new DlpListState(): subject.lastViewed=${subject.lastViewed}`);
      expect(subject.lastViewed).assertEqual('');
      logInfo(`new DlpListState(): subject.viewCount=${subject.viewCount}`);
      expect(subject.viewCount).assertEqual(0);
      logInfo(`new DlpListState(): subject.toastCount=${subject.toastCount}`);
      expect(subject.toastCount).assertEqual(0);
      logInfo(`${BUNDLE}DlpListStateCtor_0001 end`);
    });
  });
}
