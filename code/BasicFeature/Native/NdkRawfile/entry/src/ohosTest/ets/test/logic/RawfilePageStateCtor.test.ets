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
import { yieldToEventLoop } from '../EventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { RawfilePageState } from '../model/NdkRawfileLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkRawfile]';
const BUNDLE: string = 'NdkRawfile_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new RawfilePageState (1 cases). */
export default function rawfilePageStateCtorTest(): void {
  describe('RawfilePageStateCtorTest', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_CTOR_0001
     * @tc.name      NdkRawfile_RawfilePageStateCtor_0001
     * @tc.desc      new RawfilePageState() initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_RawfilePageStateCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RawfilePageStateCtor_0001 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      logInfo(`new RawfilePageState(): subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('');
      logInfo(`new RawfilePageState(): subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('');
      logInfo(`new RawfilePageState(): subject.rawFileContentWithOffset=${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('');
      logInfo(`new RawfilePageState(): subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('');
      logInfo(`new RawfilePageState(): subject.rawFileContentWithOffset64=${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('');
      logInfo(`new RawfilePageState(): subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(-1);
      logInfo(`new RawfilePageState(): subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(-1);
      logInfo(`new RawfilePageState(): subject.released=${subject.released}`);
      expect(subject.released).assertEqual(0);
      logInfo(`${BUNDLE}RawfilePageStateCtor_0001 end`);
    });
  });
}
