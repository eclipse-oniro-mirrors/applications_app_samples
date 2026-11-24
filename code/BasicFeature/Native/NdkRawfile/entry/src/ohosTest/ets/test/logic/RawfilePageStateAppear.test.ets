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
export default function rawfilePageStateAppearTest(): void {
  describe('RawfilePageStateAppearTest', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0001
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0001
     * @tc.desc      RawfilePageState.appear(names=[], offset=-100, offset64=-100) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_RawfilePageStateAppear_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0001 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], -100, -100);
      logInfo(`appear(names=[], offset=-100, offset64=-1...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=-100, offset64=-1...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=-100, offset64=-1...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0002
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0002
     * @tc.desc      RawfilePageState.appear(names=[], offset=-100, offset64=-1) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_RawfilePageStateAppear_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0002 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], -100, -1);
      logInfo(`appear(names=[], offset=-100, offset64=-1...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=-100, offset64=-1...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=-100, offset64=-1...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=-100, offset64=-1...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 6');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0003
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0003
     * @tc.desc      RawfilePageState.appear(names=[], offset=-100, offset64=0) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0003 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], -100, 0);
      logInfo(`appear(names=[], offset=-100, offset64=0)...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=-100, offset64=0)...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=-100, offset64=0)...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=-100, offset64=0)...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0004
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0004
     * @tc.desc      RawfilePageState.appear(names=[], offset=-100, offset64=1) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0004 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], -100, 1);
      logInfo(`appear(names=[], offset=-100, offset64=1)...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=-100, offset64=1)...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=-100, offset64=1)...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=-100, offset64=1)...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('awfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0005
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0005
     * @tc.desc      RawfilePageState.appear(names=[], offset=-100, offset64=-2) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0005 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], -100, -2);
      logInfo(`appear(names=[], offset=-100, offset64=-2...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=-100, offset64=-2...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=-100, offset64=-2...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=-100, offset64=-2...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for ');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0006
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0006
     * @tc.desc      RawfilePageState.appear(names=[], offset=-100, offset64=2) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0006 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], -100, 2);
      logInfo(`appear(names=[], offset=-100, offset64=2)...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=-100, offset64=2)...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=-100, offset64=2)...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=-100, offset64=2)...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('wfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0007
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0007
     * @tc.desc      RawfilePageState.appear(names=[], offset=-100, offset64=3) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0007 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], -100, 3);
      logInfo(`appear(names=[], offset=-100, offset64=3)...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=-100, offset64=3)...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=-100, offset64=3)...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=-100, offset64=3)...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('file content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0007 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0008
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0008
     * @tc.desc      RawfilePageState.appear(names=[], offset=-100, offset64=10) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0008 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], -100, 10);
      logInfo(`appear(names=[], offset=-100, offset64=10...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=-100, offset64=10...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=-100, offset64=10...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=-100, offset64=10...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('ntent for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0008 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0009
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0009
     * @tc.desc      RawfilePageState.appear(names=[], offset=-100, offset64=5) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0009 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], -100, 5);
      logInfo(`appear(names=[], offset=-100, offset64=5)...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=-100, offset64=5)...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=-100, offset64=5)...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=-100, offset64=5)...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('le content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0009 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0010
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0010
     * @tc.desc      RawfilePageState.appear(names=[], offset=-100, offset64=13.98) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0010 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], -100, 13.98);
      logInfo(`appear(names=[], offset=-100, offset64=13...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=-100, offset64=13...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=-100, offset64=13...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=-100, offset64=13...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('nt for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0010 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0011
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0011
     * @tc.desc      RawfilePageState.appear(names=[], offset=-1, offset64=-100) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0011 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], -1, -100);
      logInfo(`appear(names=[], offset=-1, offset64=-100...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=-1, offset64=-100...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=-1, offset64=-100...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conten');
      logInfo(`appear(names=[], offset=-1, offset64=-100...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0011 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0012
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0012
     * @tc.desc      RawfilePageState.appear(names=[], offset=-1, offset64=-1) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0012 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], -1, -1);
      logInfo(`appear(names=[], offset=-1, offset64=-1) ...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=-1, offset64=-1) ...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=-1, offset64=-1) ...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conten');
      logInfo(`appear(names=[], offset=-1, offset64=-1) ...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=-1, offset64=-1) ...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 6');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0012 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0013
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0013
     * @tc.desc      RawfilePageState.appear(names=[], offset=-1, offset64=0) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0013 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], -1, 0);
      logInfo(`appear(names=[], offset=-1, offset64=0) s...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=-1, offset64=0) s...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=-1, offset64=0) s...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conten');
      logInfo(`appear(names=[], offset=-1, offset64=0) s...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=-1, offset64=0) s...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0013 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0014
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0014
     * @tc.desc      RawfilePageState.appear(names=[], offset=-1, offset64=1) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0014 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], -1, 1);
      logInfo(`appear(names=[], offset=-1, offset64=1) s...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=-1, offset64=1) s...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=-1, offset64=1) s...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conten');
      logInfo(`appear(names=[], offset=-1, offset64=1) s...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=-1, offset64=1) s...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('awfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0014 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0015
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0015
     * @tc.desc      RawfilePageState.appear(names=[], offset=-1, offset64=-2) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0015 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], -1, -2);
      logInfo(`appear(names=[], offset=-1, offset64=-2) ...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=-1, offset64=-2) ...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=-1, offset64=-2) ...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conten');
      logInfo(`appear(names=[], offset=-1, offset64=-2) ...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=-1, offset64=-2) ...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for ');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0015 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0016
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0016
     * @tc.desc      RawfilePageState.appear(names=[], offset=-1, offset64=2) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0016 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], -1, 2);
      logInfo(`appear(names=[], offset=-1, offset64=2) s...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=-1, offset64=2) s...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=-1, offset64=2) s...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conten');
      logInfo(`appear(names=[], offset=-1, offset64=2) s...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=-1, offset64=2) s...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('wfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0016 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0017
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0017
     * @tc.desc      RawfilePageState.appear(names=[], offset=-1, offset64=3) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0017 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], -1, 3);
      logInfo(`appear(names=[], offset=-1, offset64=3) s...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=-1, offset64=3) s...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=-1, offset64=3) s...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conten');
      logInfo(`appear(names=[], offset=-1, offset64=3) s...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=-1, offset64=3) s...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('file content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0017 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0018
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0018
     * @tc.desc      RawfilePageState.appear(names=[], offset=-1, offset64=10) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0018 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], -1, 10);
      logInfo(`appear(names=[], offset=-1, offset64=10) ...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=-1, offset64=10) ...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=-1, offset64=10) ...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conten');
      logInfo(`appear(names=[], offset=-1, offset64=10) ...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=-1, offset64=10) ...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('ntent for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0018 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0019
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0019
     * @tc.desc      RawfilePageState.appear(names=[], offset=-1, offset64=5) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0019 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], -1, 5);
      logInfo(`appear(names=[], offset=-1, offset64=5) s...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=-1, offset64=5) s...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=-1, offset64=5) s...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conten');
      logInfo(`appear(names=[], offset=-1, offset64=5) s...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=-1, offset64=5) s...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('le content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0019 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0020
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0020
     * @tc.desc      RawfilePageState.appear(names=[], offset=-1, offset64=13.98) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0020 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], -1, 13.98);
      logInfo(`appear(names=[], offset=-1, offset64=13.9...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=-1, offset64=13.9...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=-1, offset64=13.9...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conten');
      logInfo(`appear(names=[], offset=-1, offset64=13.9...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=-1, offset64=13.9...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('nt for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0020 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0021
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0021
     * @tc.desc      RawfilePageState.appear(names=[], offset=0, offset64=-100) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0021 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 0, -100);
      logInfo(`appear(names=[], offset=0, offset64=-100)...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=0, offset64=-100)...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=0, offset64=-100)...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=0, offset64=-100)...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0021 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0022
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0022
     * @tc.desc      RawfilePageState.appear(names=[], offset=0, offset64=-1) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0022 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 0, -1);
      logInfo(`appear(names=[], offset=0, offset64=-1) s...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=0, offset64=-1) s...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=0, offset64=-1) s...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=0, offset64=-1) s...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=0, offset64=-1) s...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 6');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0022 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0023
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0023
     * @tc.desc      RawfilePageState.appear(names=[], offset=0, offset64=0) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0023 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 0, 0);
      logInfo(`appear(names=[], offset=0, offset64=0) state: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=0, offset64=0) state: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=0, offset64=0) state: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=0, offset64=0) state: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=0, offset64=0) state: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0023 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0024
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0024
     * @tc.desc      RawfilePageState.appear(names=[], offset=0, offset64=1) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0024 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 0, 1);
      logInfo(`appear(names=[], offset=0, offset64=1) state: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=0, offset64=1) state: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=0, offset64=1) state: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=0, offset64=1) state: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=0, offset64=1) state: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('awfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0024 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0025
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0025
     * @tc.desc      RawfilePageState.appear(names=[], offset=0, offset64=-2) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0025 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 0, -2);
      logInfo(`appear(names=[], offset=0, offset64=-2) s...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=0, offset64=-2) s...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=0, offset64=-2) s...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=0, offset64=-2) s...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=0, offset64=-2) s...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for ');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0025 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0026
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0026
     * @tc.desc      RawfilePageState.appear(names=[], offset=0, offset64=2) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0026 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 0, 2);
      logInfo(`appear(names=[], offset=0, offset64=2) state: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=0, offset64=2) state: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=0, offset64=2) state: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=0, offset64=2) state: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=0, offset64=2) state: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('wfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0026 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0027
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0027
     * @tc.desc      RawfilePageState.appear(names=[], offset=0, offset64=3) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0027 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 0, 3);
      logInfo(`appear(names=[], offset=0, offset64=3) state: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=0, offset64=3) state: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=0, offset64=3) state: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=0, offset64=3) state: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=0, offset64=3) state: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('file content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0027 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0028
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0028
     * @tc.desc      RawfilePageState.appear(names=[], offset=0, offset64=10) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0028 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 0, 10);
      logInfo(`appear(names=[], offset=0, offset64=10) s...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=0, offset64=10) s...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=0, offset64=10) s...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=0, offset64=10) s...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=0, offset64=10) s...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('ntent for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0028 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0029
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0029
     * @tc.desc      RawfilePageState.appear(names=[], offset=0, offset64=5) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0029 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 0, 5);
      logInfo(`appear(names=[], offset=0, offset64=5) state: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=0, offset64=5) state: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=0, offset64=5) state: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=0, offset64=5) state: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=0, offset64=5) state: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('le content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0029 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0030
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0030
     * @tc.desc      RawfilePageState.appear(names=[], offset=0, offset64=13.98) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0030 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 0, 13.98);
      logInfo(`appear(names=[], offset=0, offset64=13.98...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=0, offset64=13.98...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=0, offset64=13.98...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=0, offset64=13.98...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=0, offset64=13.98...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('nt for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0030 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0031
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0031
     * @tc.desc      RawfilePageState.appear(names=[], offset=1, offset64=-100) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0031 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 1, -100);
      logInfo(`appear(names=[], offset=1, offset64=-100)...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=1, offset64=-100)...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=1, offset64=-100)...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('awfile1 content');
      logInfo(`appear(names=[], offset=1, offset64=-100)...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0031 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0032
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0032
     * @tc.desc      RawfilePageState.appear(names=[], offset=1, offset64=-1) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0032 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 1, -1);
      logInfo(`appear(names=[], offset=1, offset64=-1) s...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=1, offset64=-1) s...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=1, offset64=-1) s...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('awfile1 content');
      logInfo(`appear(names=[], offset=1, offset64=-1) s...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=1, offset64=-1) s...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 6');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0032 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0033
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0033
     * @tc.desc      RawfilePageState.appear(names=[], offset=1, offset64=0) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0033 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 1, 0);
      logInfo(`appear(names=[], offset=1, offset64=0) state: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=1, offset64=0) state: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=1, offset64=0) state: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('awfile1 content');
      logInfo(`appear(names=[], offset=1, offset64=0) state: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=1, offset64=0) state: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0033 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0034
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0034
     * @tc.desc      RawfilePageState.appear(names=[], offset=1, offset64=1) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0034 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 1, 1);
      logInfo(`appear(names=[], offset=1, offset64=1) state: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=1, offset64=1) state: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=1, offset64=1) state: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('awfile1 content');
      logInfo(`appear(names=[], offset=1, offset64=1) state: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=1, offset64=1) state: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('awfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0034 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0035
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0035
     * @tc.desc      RawfilePageState.appear(names=[], offset=1, offset64=-2) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0035 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 1, -2);
      logInfo(`appear(names=[], offset=1, offset64=-2) s...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=1, offset64=-2) s...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=1, offset64=-2) s...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('awfile1 content');
      logInfo(`appear(names=[], offset=1, offset64=-2) s...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=1, offset64=-2) s...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for ');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0035 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0036
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0036
     * @tc.desc      RawfilePageState.appear(names=[], offset=1, offset64=2) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0036 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 1, 2);
      logInfo(`appear(names=[], offset=1, offset64=2) state: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=1, offset64=2) state: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=1, offset64=2) state: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('awfile1 content');
      logInfo(`appear(names=[], offset=1, offset64=2) state: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=1, offset64=2) state: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('wfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0036 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0037
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0037
     * @tc.desc      RawfilePageState.appear(names=[], offset=1, offset64=3) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0037 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 1, 3);
      logInfo(`appear(names=[], offset=1, offset64=3) state: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=1, offset64=3) state: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=1, offset64=3) state: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('awfile1 content');
      logInfo(`appear(names=[], offset=1, offset64=3) state: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=1, offset64=3) state: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('file content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0037 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0038
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0038
     * @tc.desc      RawfilePageState.appear(names=[], offset=1, offset64=10) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0038 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 1, 10);
      logInfo(`appear(names=[], offset=1, offset64=10) s...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=1, offset64=10) s...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=1, offset64=10) s...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('awfile1 content');
      logInfo(`appear(names=[], offset=1, offset64=10) s...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=1, offset64=10) s...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('ntent for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0038 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0039
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0039
     * @tc.desc      RawfilePageState.appear(names=[], offset=1, offset64=5) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0039 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 1, 5);
      logInfo(`appear(names=[], offset=1, offset64=5) state: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=1, offset64=5) state: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=1, offset64=5) state: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('awfile1 content');
      logInfo(`appear(names=[], offset=1, offset64=5) state: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=1, offset64=5) state: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('le content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0039 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0040
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0040
     * @tc.desc      RawfilePageState.appear(names=[], offset=1, offset64=13.98) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0040 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 1, 13.98);
      logInfo(`appear(names=[], offset=1, offset64=13.98...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=1, offset64=13.98...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=1, offset64=13.98...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('awfile1 content');
      logInfo(`appear(names=[], offset=1, offset64=13.98...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=1, offset64=13.98...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('nt for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0040 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0041
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0041
     * @tc.desc      RawfilePageState.appear(names=[], offset=-2, offset64=-100) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0041 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], -2, -100);
      logInfo(`appear(names=[], offset=-2, offset64=-100...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=-2, offset64=-100...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=-2, offset64=-100...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conte');
      logInfo(`appear(names=[], offset=-2, offset64=-100...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0041 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0042
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0042
     * @tc.desc      RawfilePageState.appear(names=[], offset=-2, offset64=-1) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0042 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], -2, -1);
      logInfo(`appear(names=[], offset=-2, offset64=-1) ...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=-2, offset64=-1) ...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=-2, offset64=-1) ...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conte');
      logInfo(`appear(names=[], offset=-2, offset64=-1) ...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=-2, offset64=-1) ...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 6');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0042 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0043
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0043
     * @tc.desc      RawfilePageState.appear(names=[], offset=-2, offset64=0) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0043 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], -2, 0);
      logInfo(`appear(names=[], offset=-2, offset64=0) s...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=-2, offset64=0) s...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=-2, offset64=0) s...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conte');
      logInfo(`appear(names=[], offset=-2, offset64=0) s...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=-2, offset64=0) s...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0043 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0044
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0044
     * @tc.desc      RawfilePageState.appear(names=[], offset=-2, offset64=1) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0044 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], -2, 1);
      logInfo(`appear(names=[], offset=-2, offset64=1) s...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=-2, offset64=1) s...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=-2, offset64=1) s...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conte');
      logInfo(`appear(names=[], offset=-2, offset64=1) s...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=-2, offset64=1) s...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('awfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0044 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0045
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0045
     * @tc.desc      RawfilePageState.appear(names=[], offset=-2, offset64=-2) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0045 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], -2, -2);
      logInfo(`appear(names=[], offset=-2, offset64=-2) ...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=-2, offset64=-2) ...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=-2, offset64=-2) ...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conte');
      logInfo(`appear(names=[], offset=-2, offset64=-2) ...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=-2, offset64=-2) ...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for ');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0045 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0046
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0046
     * @tc.desc      RawfilePageState.appear(names=[], offset=-2, offset64=2) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0046 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], -2, 2);
      logInfo(`appear(names=[], offset=-2, offset64=2) s...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=-2, offset64=2) s...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=-2, offset64=2) s...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conte');
      logInfo(`appear(names=[], offset=-2, offset64=2) s...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=-2, offset64=2) s...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('wfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0046 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0047
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0047
     * @tc.desc      RawfilePageState.appear(names=[], offset=-2, offset64=3) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0047 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], -2, 3);
      logInfo(`appear(names=[], offset=-2, offset64=3) s...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=-2, offset64=3) s...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=-2, offset64=3) s...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conte');
      logInfo(`appear(names=[], offset=-2, offset64=3) s...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=-2, offset64=3) s...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('file content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0047 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0048
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0048
     * @tc.desc      RawfilePageState.appear(names=[], offset=-2, offset64=10) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0048 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], -2, 10);
      logInfo(`appear(names=[], offset=-2, offset64=10) ...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=-2, offset64=10) ...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=-2, offset64=10) ...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conte');
      logInfo(`appear(names=[], offset=-2, offset64=10) ...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=-2, offset64=10) ...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('ntent for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0048 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0049
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0049
     * @tc.desc      RawfilePageState.appear(names=[], offset=-2, offset64=5) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0049 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], -2, 5);
      logInfo(`appear(names=[], offset=-2, offset64=5) s...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=-2, offset64=5) s...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=-2, offset64=5) s...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conte');
      logInfo(`appear(names=[], offset=-2, offset64=5) s...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=-2, offset64=5) s...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('le content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0049 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0050
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0050
     * @tc.desc      RawfilePageState.appear(names=[], offset=-2, offset64=13.98) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0050 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], -2, 13.98);
      logInfo(`appear(names=[], offset=-2, offset64=13.9...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=-2, offset64=13.9...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=-2, offset64=13.9...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conte');
      logInfo(`appear(names=[], offset=-2, offset64=13.9...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=-2, offset64=13.9...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('nt for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0050 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0051
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0051
     * @tc.desc      RawfilePageState.appear(names=[], offset=2, offset64=-100) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0051 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 2, -100);
      logInfo(`appear(names=[], offset=2, offset64=-100)...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=2, offset64=-100)...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=2, offset64=-100)...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('wfile1 content');
      logInfo(`appear(names=[], offset=2, offset64=-100)...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0051 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0052
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0052
     * @tc.desc      RawfilePageState.appear(names=[], offset=2, offset64=-1) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0052 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 2, -1);
      logInfo(`appear(names=[], offset=2, offset64=-1) s...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=2, offset64=-1) s...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=2, offset64=-1) s...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('wfile1 content');
      logInfo(`appear(names=[], offset=2, offset64=-1) s...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=2, offset64=-1) s...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 6');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0052 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0053
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0053
     * @tc.desc      RawfilePageState.appear(names=[], offset=2, offset64=0) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0053 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 2, 0);
      logInfo(`appear(names=[], offset=2, offset64=0) state: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=2, offset64=0) state: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=2, offset64=0) state: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('wfile1 content');
      logInfo(`appear(names=[], offset=2, offset64=0) state: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=2, offset64=0) state: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0053 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0054
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0054
     * @tc.desc      RawfilePageState.appear(names=[], offset=2, offset64=1) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0054 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 2, 1);
      logInfo(`appear(names=[], offset=2, offset64=1) state: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=2, offset64=1) state: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=2, offset64=1) state: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('wfile1 content');
      logInfo(`appear(names=[], offset=2, offset64=1) state: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=2, offset64=1) state: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('awfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0054 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0055
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0055
     * @tc.desc      RawfilePageState.appear(names=[], offset=2, offset64=-2) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0055 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 2, -2);
      logInfo(`appear(names=[], offset=2, offset64=-2) s...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=2, offset64=-2) s...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=2, offset64=-2) s...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('wfile1 content');
      logInfo(`appear(names=[], offset=2, offset64=-2) s...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=2, offset64=-2) s...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for ');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0055 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0056
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0056
     * @tc.desc      RawfilePageState.appear(names=[], offset=2, offset64=2) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0056 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 2, 2);
      logInfo(`appear(names=[], offset=2, offset64=2) state: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=2, offset64=2) state: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=2, offset64=2) state: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('wfile1 content');
      logInfo(`appear(names=[], offset=2, offset64=2) state: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=2, offset64=2) state: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('wfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0056 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0057
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0057
     * @tc.desc      RawfilePageState.appear(names=[], offset=2, offset64=3) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0057 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 2, 3);
      logInfo(`appear(names=[], offset=2, offset64=3) state: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=2, offset64=3) state: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=2, offset64=3) state: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('wfile1 content');
      logInfo(`appear(names=[], offset=2, offset64=3) state: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=2, offset64=3) state: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('file content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0057 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0058
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0058
     * @tc.desc      RawfilePageState.appear(names=[], offset=2, offset64=10) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0058 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 2, 10);
      logInfo(`appear(names=[], offset=2, offset64=10) s...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=2, offset64=10) s...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=2, offset64=10) s...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('wfile1 content');
      logInfo(`appear(names=[], offset=2, offset64=10) s...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=2, offset64=10) s...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('ntent for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0058 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0059
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0059
     * @tc.desc      RawfilePageState.appear(names=[], offset=2, offset64=5) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0059 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 2, 5);
      logInfo(`appear(names=[], offset=2, offset64=5) state: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=2, offset64=5) state: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=2, offset64=5) state: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('wfile1 content');
      logInfo(`appear(names=[], offset=2, offset64=5) state: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=2, offset64=5) state: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('le content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0059 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0060
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0060
     * @tc.desc      RawfilePageState.appear(names=[], offset=2, offset64=13.98) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateAppear_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0060 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 2, 13.98);
      logInfo(`appear(names=[], offset=2, offset64=13.98...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=2, offset64=13.98...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=2, offset64=13.98...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('wfile1 content');
      logInfo(`appear(names=[], offset=2, offset64=13.98...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=2, offset64=13.98...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('nt for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0060 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0061
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0061
     * @tc.desc      RawfilePageState.appear(names=[], offset=3, offset64=-100) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0061 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 3, -100);
      logInfo(`appear(names=[], offset=3, offset64=-100)...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=3, offset64=-100)...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=3, offset64=-100)...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('file1 content');
      logInfo(`appear(names=[], offset=3, offset64=-100)...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0061 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_APPEAR_0062
     * @tc.name      NdkRawfile_RawfilePageStateAppear_0062
     * @tc.desc      RawfilePageState.appear(names=[], offset=3, offset64=-1) yields "[]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkRawfile_RawfilePageStateAppear_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RawfilePageStateAppear_0062 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 3, -1);
      logInfo(`appear(names=[], offset=3, offset64=-1) s...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear(names=[], offset=3, offset64=-1) s...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear(names=[], offset=3, offset64=-1) s...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('file1 content');
      logInfo(`appear(names=[], offset=3, offset64=-1) s...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear(names=[], offset=3, offset64=-1) s...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 6');
      logInfo(`${BUNDLE}RawfilePageStateAppear_0062 end`);
    });
  });
}
