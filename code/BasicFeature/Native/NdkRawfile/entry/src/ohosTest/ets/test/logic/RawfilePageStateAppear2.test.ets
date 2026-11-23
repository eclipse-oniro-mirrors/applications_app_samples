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

/** Logic checks for RawfilePageState.appear (62 cases). */
export default function rawfilePageStateAppear2Test(): void {
  describe('RawfilePageStateAppear2Test', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0063
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0063
     * @tc.desc      RawfilePageState.appear(names=[], offset=3, offset64=0) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0063 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 3, 0);
      logInfo(`appear(names=[], offset=3, offset64=0) state: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=3, offset64=0) state: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=3, offset64=0) state: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('file1 content');
      logInfo(`appear(names=[], offset=3, offset64=0) state: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=3, offset64=0) state: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0063 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0064
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0064
     * @tc.desc      RawfilePageState.appear(names=[], offset=3, offset64=1) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0064 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 3, 1);
      logInfo(`appear(names=[], offset=3, offset64=1) state: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=3, offset64=1) state: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=3, offset64=1) state: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('file1 content');
      logInfo(`appear(names=[], offset=3, offset64=1) state: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=3, offset64=1) state: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('awfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0064 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0065
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0065
     * @tc.desc      RawfilePageState.appear(names=[], offset=3, offset64=-2) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0065 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 3, -2);
      logInfo(`appear(names=[], offset=3, offset64=-2) s...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=3, offset64=-2) s...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=3, offset64=-2) s...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('file1 content');
      logInfo(`appear(names=[], offset=3, offset64=-2) s...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=3, offset64=-2) s...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for ');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0065 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0066
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0066
     * @tc.desc      RawfilePageState.appear(names=[], offset=3, offset64=2) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0066 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 3, 2);
      logInfo(`appear(names=[], offset=3, offset64=2) state: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=3, offset64=2) state: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=3, offset64=2) state: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('file1 content');
      logInfo(`appear(names=[], offset=3, offset64=2) state: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=3, offset64=2) state: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('wfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0066 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0067
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0067
     * @tc.desc      RawfilePageState.appear(names=[], offset=3, offset64=3) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0067 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 3, 3);
      logInfo(`appear(names=[], offset=3, offset64=3) state: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=3, offset64=3) state: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=3, offset64=3) state: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('file1 content');
      logInfo(`appear(names=[], offset=3, offset64=3) state: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=3, offset64=3) state: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('file content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0067 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0068
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0068
     * @tc.desc      RawfilePageState.appear(names=[], offset=3, offset64=10) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0068 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 3, 10);
      logInfo(`appear(names=[], offset=3, offset64=10) s...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=3, offset64=10) s...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=3, offset64=10) s...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('file1 content');
      logInfo(`appear(names=[], offset=3, offset64=10) s...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=3, offset64=10) s...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('ntent for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0068 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0069
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0069
     * @tc.desc      RawfilePageState.appear(names=[], offset=3, offset64=5) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0069 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 3, 5);
      logInfo(`appear(names=[], offset=3, offset64=5) state: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=3, offset64=5) state: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=3, offset64=5) state: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('file1 content');
      logInfo(`appear(names=[], offset=3, offset64=5) state: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=3, offset64=5) state: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('le content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0069 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0070
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0070
     * @tc.desc      RawfilePageState.appear(names=[], offset=3, offset64=13.98) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0070 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 3, 13.98);
      logInfo(`appear(names=[], offset=3, offset64=13.98...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=3, offset64=13.98...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=3, offset64=13.98...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('file1 content');
      logInfo(`appear(names=[], offset=3, offset64=13.98...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=3, offset64=13.98...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('nt for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0070 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0071
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0071
     * @tc.desc      RawfilePageState.appear(names=[], offset=10, offset64=-100) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0071 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 10, -100);
      logInfo(`appear(names=[], offset=10, offset64=-100...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=10, offset64=-100...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=10, offset64=-100...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('ontent');
      logInfo(`appear(names=[], offset=10, offset64=-100...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0071 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0072
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0072
     * @tc.desc      RawfilePageState.appear(names=[], offset=10, offset64=-1) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0072 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 10, -1);
      logInfo(`appear(names=[], offset=10, offset64=-1) ...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=10, offset64=-1) ...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=10, offset64=-1) ...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('ontent');
      logInfo(`appear(names=[], offset=10, offset64=-1) ...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=10, offset64=-1) ...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 6');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0072 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0073
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0073
     * @tc.desc      RawfilePageState.appear(names=[], offset=10, offset64=0) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0073 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 10, 0);
      logInfo(`appear(names=[], offset=10, offset64=0) s...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=10, offset64=0) s...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=10, offset64=0) s...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('ontent');
      logInfo(`appear(names=[], offset=10, offset64=0) s...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=10, offset64=0) s...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0073 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0074
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0074
     * @tc.desc      RawfilePageState.appear(names=[], offset=10, offset64=1) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0074 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 10, 1);
      logInfo(`appear(names=[], offset=10, offset64=1) s...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=10, offset64=1) s...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=10, offset64=1) s...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('ontent');
      logInfo(`appear(names=[], offset=10, offset64=1) s...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=10, offset64=1) s...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('awfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0074 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0075
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0075
     * @tc.desc      RawfilePageState.appear(names=[], offset=10, offset64=-2) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0075 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 10, -2);
      logInfo(`appear(names=[], offset=10, offset64=-2) ...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=10, offset64=-2) ...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=10, offset64=-2) ...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('ontent');
      logInfo(`appear(names=[], offset=10, offset64=-2) ...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=10, offset64=-2) ...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for ');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0075 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0076
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0076
     * @tc.desc      RawfilePageState.appear(names=[], offset=10, offset64=2) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0076 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 10, 2);
      logInfo(`appear(names=[], offset=10, offset64=2) s...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=10, offset64=2) s...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=10, offset64=2) s...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('ontent');
      logInfo(`appear(names=[], offset=10, offset64=2) s...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=10, offset64=2) s...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('wfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0076 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0077
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0077
     * @tc.desc      RawfilePageState.appear(names=[], offset=10, offset64=3) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0077 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 10, 3);
      logInfo(`appear(names=[], offset=10, offset64=3) s...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=10, offset64=3) s...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=10, offset64=3) s...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('ontent');
      logInfo(`appear(names=[], offset=10, offset64=3) s...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=10, offset64=3) s...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('file content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0077 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0078
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0078
     * @tc.desc      RawfilePageState.appear(names=[], offset=10, offset64=10) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0078 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 10, 10);
      logInfo(`appear(names=[], offset=10, offset64=10) ...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=10, offset64=10) ...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=10, offset64=10) ...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('ontent');
      logInfo(`appear(names=[], offset=10, offset64=10) ...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=10, offset64=10) ...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('ntent for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0078 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0079
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0079
     * @tc.desc      RawfilePageState.appear(names=[], offset=10, offset64=5) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0079 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 10, 5);
      logInfo(`appear(names=[], offset=10, offset64=5) s...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=10, offset64=5) s...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=10, offset64=5) s...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('ontent');
      logInfo(`appear(names=[], offset=10, offset64=5) s...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=10, offset64=5) s...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('le content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0079 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0080
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0080
     * @tc.desc      RawfilePageState.appear(names=[], offset=10, offset64=13.98) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0080 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 10, 13.98);
      logInfo(`appear(names=[], offset=10, offset64=13.9...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=10, offset64=13.9...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=10, offset64=13.9...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('ontent');
      logInfo(`appear(names=[], offset=10, offset64=13.9...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=10, offset64=13.9...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('nt for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0080 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0081
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0081
     * @tc.desc      RawfilePageState.appear(names=[], offset=5, offset64=-100) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0081 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 5, -100);
      logInfo(`appear(names=[], offset=5, offset64=-100)...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=5, offset64=-100)...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=5, offset64=-100)...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('le1 content');
      logInfo(`appear(names=[], offset=5, offset64=-100)...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0081 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0082
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0082
     * @tc.desc      RawfilePageState.appear(names=[], offset=5, offset64=-1) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0082 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 5, -1);
      logInfo(`appear(names=[], offset=5, offset64=-1) s...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=5, offset64=-1) s...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=5, offset64=-1) s...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('le1 content');
      logInfo(`appear(names=[], offset=5, offset64=-1) s...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=5, offset64=-1) s...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 6');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0082 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0083
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0083
     * @tc.desc      RawfilePageState.appear(names=[], offset=5, offset64=0) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0083 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 5, 0);
      logInfo(`appear(names=[], offset=5, offset64=0) state: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=5, offset64=0) state: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=5, offset64=0) state: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('le1 content');
      logInfo(`appear(names=[], offset=5, offset64=0) state: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=5, offset64=0) state: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0083 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0084
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0084
     * @tc.desc      RawfilePageState.appear(names=[], offset=5, offset64=1) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0084 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 5, 1);
      logInfo(`appear(names=[], offset=5, offset64=1) state: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=5, offset64=1) state: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=5, offset64=1) state: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('le1 content');
      logInfo(`appear(names=[], offset=5, offset64=1) state: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=5, offset64=1) state: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('awfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0084 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0085
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0085
     * @tc.desc      RawfilePageState.appear(names=[], offset=5, offset64=-2) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0085 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 5, -2);
      logInfo(`appear(names=[], offset=5, offset64=-2) s...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=5, offset64=-2) s...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=5, offset64=-2) s...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('le1 content');
      logInfo(`appear(names=[], offset=5, offset64=-2) s...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=5, offset64=-2) s...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for ');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0085 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0086
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0086
     * @tc.desc      RawfilePageState.appear(names=[], offset=5, offset64=2) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0086 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 5, 2);
      logInfo(`appear(names=[], offset=5, offset64=2) state: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=5, offset64=2) state: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=5, offset64=2) state: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('le1 content');
      logInfo(`appear(names=[], offset=5, offset64=2) state: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=5, offset64=2) state: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('wfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0086 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0087
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0087
     * @tc.desc      RawfilePageState.appear(names=[], offset=5, offset64=3) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0087 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 5, 3);
      logInfo(`appear(names=[], offset=5, offset64=3) state: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=5, offset64=3) state: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=5, offset64=3) state: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('le1 content');
      logInfo(`appear(names=[], offset=5, offset64=3) state: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=5, offset64=3) state: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('file content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0087 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0088
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0088
     * @tc.desc      RawfilePageState.appear(names=[], offset=5, offset64=10) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0088 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 5, 10);
      logInfo(`appear(names=[], offset=5, offset64=10) s...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=5, offset64=10) s...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=5, offset64=10) s...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('le1 content');
      logInfo(`appear(names=[], offset=5, offset64=10) s...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=5, offset64=10) s...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('ntent for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0088 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0089
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0089
     * @tc.desc      RawfilePageState.appear(names=[], offset=5, offset64=5) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0089 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 5, 5);
      logInfo(`appear(names=[], offset=5, offset64=5) state: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=5, offset64=5) state: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=5, offset64=5) state: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('le1 content');
      logInfo(`appear(names=[], offset=5, offset64=5) state: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=5, offset64=5) state: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('le content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0089 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0090
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0090
     * @tc.desc      RawfilePageState.appear(names=[], offset=5, offset64=13.98) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0090 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 5, 13.98);
      logInfo(`appear(names=[], offset=5, offset64=13.98...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=5, offset64=13.98...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=5, offset64=13.98...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('le1 content');
      logInfo(`appear(names=[], offset=5, offset64=13.98...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=5, offset64=13.98...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('nt for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0090 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0091
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0091
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=-100, offset64=-100) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0091 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], -100, -100);
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0091 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0092
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0092
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=-100, offset64=-1) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0092 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], -100, -1);
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 6');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0092 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0093
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0093
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=-100, offset64=0) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0093 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], -100, 0);
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0093 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0094
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0094
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=-100, offset64=1) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0094 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], -100, 1);
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('awfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0094 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0095
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0095
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=-100, offset64=-2) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0095 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], -100, -2);
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for ');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0095 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0096
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0096
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=-100, offset64=2) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0096 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], -100, 2);
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('wfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0096 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0097
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0097
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=-100, offset64=3) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0097 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], -100, 3);
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('file content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0097 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0098
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0098
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=-100, offset64=10) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0098 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], -100, 10);
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('ntent for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0098 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0099
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0099
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=-100, offset64=5) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0099 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], -100, 5);
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('le content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0099 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0100
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0100
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=-100, offset64=13.98) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0100 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], -100, 13.98);
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=-100, offs...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('nt for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0100 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0101
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0101
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=-1, offset64=-100) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0101 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], -1, -100);
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conten');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0101 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0102
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0102
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=-1, offset64=-1) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0102 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], -1, -1);
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conten');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 6');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0102 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0103
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0103
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=-1, offset64=0) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0103 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], -1, 0);
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conten');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0103 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0104
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0104
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=-1, offset64=1) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0104 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], -1, 1);
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conten');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('awfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0104 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0105
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0105
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=-1, offset64=-2) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0105 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], -1, -2);
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conten');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for ');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0105 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0106
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0106
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=-1, offset64=2) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0106 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], -1, 2);
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conten');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('wfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0106 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0107
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0107
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=-1, offset64=3) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0107 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], -1, 3);
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conten');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('file content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0107 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0108
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0108
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=-1, offset64=10) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0108 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], -1, 10);
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conten');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('ntent for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0108 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0109
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0109
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=-1, offset64=5) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0109 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], -1, 5);
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conten');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('le content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0109 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0110
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0110
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=-1, offset64=13.98) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0110 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], -1, 13.98);
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conten');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=-1, offset...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('nt for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0110 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0111
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0111
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=0, offset64=-100) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0111 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 0, -100);
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0111 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0112
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0112
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=0, offset64=-1) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0112 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 0, -1);
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 6');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0112 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0113
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0113
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=0, offset64=0) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0113 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 0, 0);
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0113 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0114
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0114
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=0, offset64=1) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0114 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 0, 1);
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('awfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0114 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0115
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0115
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=0, offset64=-2) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0115 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 0, -2);
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for ');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0115 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0116
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0116
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=0, offset64=2) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0116 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 0, 2);
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('wfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0116 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0117
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0117
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=0, offset64=3) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0117 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 0, 3);
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('file content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0117 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0118
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0118
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=0, offset64=10) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0118 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 0, 10);
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('ntent for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0118 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0119
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0119
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=0, offset64=5) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0119 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 0, 5);
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('le content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0119 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0120
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0120
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=0, offset64=13.98) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0120 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 0, 13.98);
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=0, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('nt for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0120 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0121
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0121
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=1, offset64=-100) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0121 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 1, -100);
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('awfile1 content');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0121 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0122
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0122
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=1, offset64=-1) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0122 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 1, -1);
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('awfile1 content');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 6');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0122 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0123
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0123
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=1, offset64=0) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0123 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 1, 0);
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('awfile1 content');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0123 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0124
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0124
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=1, offset64=1) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0124 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 1, 1);
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('awfile1 content');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('awfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0124 end`);
    });
  });
}
