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

/** Logic checks for RawfilePageState.appear (41 cases). */
export default function rawfilePageStateAppear3Test(): void {
  describe('RawfilePageStateAppear3Test', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0125
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0125
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=1, offset64=-2) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0125 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 1, -2);
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('awfile1 content');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for ');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0125 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0126
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0126
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=1, offset64=2) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0126 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 1, 2);
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('awfile1 content');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('wfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0126 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0127
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0127
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=1, offset64=3) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0127 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 1, 3);
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('awfile1 content');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('file content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0127 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0128
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0128
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=1, offset64=10) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0128 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 1, 10);
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('awfile1 content');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('ntent for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0128 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0129
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0129
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=1, offset64=5) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0129 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 1, 5);
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('awfile1 content');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('le content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0129 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0130
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0130
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=1, offset64=13.98) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0130 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 1, 13.98);
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('awfile1 content');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=1, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('nt for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0130 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0131
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0131
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=-2, offset64=-100) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0131 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], -2, -100);
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conte');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0131 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0132
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0132
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=-2, offset64=-1) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0132 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], -2, -1);
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conte');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 6');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0132 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0133
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0133
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=-2, offset64=0) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0133 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], -2, 0);
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conte');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0133 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0134
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0134
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=-2, offset64=1) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0134 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], -2, 1);
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conte');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('awfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0134 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0135
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0135
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=-2, offset64=-2) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0135 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], -2, -2);
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conte');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for ');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0135 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0136
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0136
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=-2, offset64=2) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0136 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], -2, 2);
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conte');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('wfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0136 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0137
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0137
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=-2, offset64=3) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0137 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], -2, 3);
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conte');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('file content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0137 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0138
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0138
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=-2, offset64=10) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0138 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], -2, 10);
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conte');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('ntent for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0138 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0139
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0139
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=-2, offset64=5) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0139 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], -2, 5);
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conte');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('le content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0139 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0140
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0140
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=-2, offset64=13.98) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0140 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], -2, 13.98);
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conte');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=-2, offset...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('nt for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0140 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0141
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0141
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=2, offset64=-100) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0141 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 2, -100);
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('wfile1 content');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0141 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0142
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0142
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=2, offset64=-1) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0142 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 2, -1);
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('wfile1 content');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 6');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0142 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0143
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0143
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=2, offset64=0) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0143 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 2, 0);
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('wfile1 content');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0143 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0144
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0144
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=2, offset64=1) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0144 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 2, 1);
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('wfile1 content');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('awfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0144 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0145
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0145
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=2, offset64=-2) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0145 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 2, -2);
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('wfile1 content');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for ');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0145 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0146
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0146
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=2, offset64=2) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateAppear_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0146 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 2, 2);
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('wfile1 content');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('wfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0146 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0147
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0147
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=2, offset64=3) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateAppear_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0147 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 2, 3);
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('wfile1 content');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('file content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0147 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0148
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0148
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=2, offset64=10) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateAppear_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0148 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 2, 10);
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('wfile1 content');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('ntent for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0148 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0149
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0149
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=2, offset64=5) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateAppear_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0149 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 2, 5);
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('wfile1 content');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('le content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0149 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0150
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0150
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=2, offset64=13.98) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateAppear_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0150 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 2, 13.98);
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('wfile1 content');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=2, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('nt for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0150 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0151
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0151
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=3, offset64=-100) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0151 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 3, -100);
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('file1 content');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0151 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0152
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0152
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=3, offset64=-1) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0152 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 3, -1);
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('file1 content');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 6');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0152 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0153
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0153
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=3, offset64=0) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0153 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 3, 0);
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('file1 content');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0153 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0154
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0154
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=3, offset64=1) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0154 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 3, 1);
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('file1 content');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('awfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0154 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0155
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0155
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=3, offset64=-2) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0155 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 3, -2);
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('file1 content');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for ');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0155 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0156
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0156
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=3, offset64=2) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateAppear_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0156 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 3, 2);
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('file1 content');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('wfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0156 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0157
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0157
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=3, offset64=3) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateAppear_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0157 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 3, 3);
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('file1 content');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('file content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0157 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0158
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0158
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=3, offset64=10) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateAppear_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0158 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 3, 10);
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('file1 content');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('ntent for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0158 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0159
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0159
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=3, offset64=5) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateAppear_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0159 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 3, 5);
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('file1 content');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('le content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0159 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0160
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0160
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=3, offset64=13.98) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateAppear_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0160 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 3, 13.98);
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('file1 content');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=3, offset6...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('nt for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0160 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0161
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0161
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=10, offset64=-100) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0161 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 10, -100);
      logInfo(`appear(names=["Hello"], offset=10, offset...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=10, offset...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=10, offset...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('ontent');
      logInfo(`appear(names=["Hello"], offset=10, offset...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0161 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0162
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0162
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=10, offset64=-1) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0162 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 10, -1);
      logInfo(`appear(names=["Hello"], offset=10, offset...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=10, offset...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=10, offset...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('ontent');
      logInfo(`appear(names=["Hello"], offset=10, offset...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=10, offset...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 6');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0162 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0163
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0163
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=10, offset64=0) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0163 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 10, 0);
      logInfo(`appear(names=["Hello"], offset=10, offset...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=10, offset...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=10, offset...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('ontent');
      logInfo(`appear(names=["Hello"], offset=10, offset...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=10, offset...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0163 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0164
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0164
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=10, offset64=1) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0164 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 10, 1);
      logInfo(`appear(names=["Hello"], offset=10, offset...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=10, offset...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=10, offset...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('ontent');
      logInfo(`appear(names=["Hello"], offset=10, offset...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=10, offset...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('awfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0164 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0165
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0165
     * @tc.desc      RawfilePageState.appear(names=["Hello"], offset=10, offset64=-2) yields "[?"Hello?"]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0165 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 10, -2);
      logInfo(`appear(names=["Hello"], offset=10, offset...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear(names=["Hello"], offset=10, offset...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=["Hello"], offset=10, offset...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('ontent');
      logInfo(`appear(names=["Hello"], offset=10, offset...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=["Hello"], offset=10, offset...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for ');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0165 end`);
    });
  });
}
