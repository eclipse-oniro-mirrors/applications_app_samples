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
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for RawfilePageState flow (54 cases). */
export default function rawfilePageStateFlowTest(): void {
  describe('RawfilePageStateFlowTest', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0001
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0001
     * @tc.desc      RawfilePageState call flow openDescriptors > openDescriptors > listLabel keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_RawfilePageStateFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0001 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-1, 52.51);
      subject.openDescriptors(110, 80);
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: ');
      logInfo(`openDescriptors>openDescriptors>listLabel...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(110);
      logInfo(`openDescriptors>openDescriptors>listLabel...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(80);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0002
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0002
     * @tc.desc      RawfilePageState call flow listLabel > disappear > appear > openDescriptors keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_RawfilePageStateFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0002 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      const step2: number = subject.disappear();
      logInfo(`step2 disappear(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.appear(['hello world', 'Hello', ''], -64, 100);
      subject.openDescriptors(11, 0);
      logInfo(`listLabel>disappear>appear>openDescriptor...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["hello world","Hello",""]');
      logInfo(`listLabel>disappear>appear>openDescriptor...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`listLabel>disappear>appear>openDescriptor...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`listLabel>disappear>appear>openDescriptor...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`listLabel>disappear>appear>openDescriptor...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(11);
      logInfo(`listLabel>disappear>appear>openDescriptor...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(0);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0003
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0003
     * @tc.desc      RawfilePageState call flow disappear > disappear > disappear > openDescriptors keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0003 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.disappear();
      logInfo(`step2 disappear(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.disappear();
      logInfo(`step3 disappear(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.openDescriptors(2, 40);
      logInfo(`disappear>disappear>disappear>openDescrip...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`disappear>disappear>disappear>openDescrip...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(40);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0004
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0004
     * @tc.desc      RawfilePageState call flow disappear > disappear > listLabel > appear > appear keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0004 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.disappear();
      logInfo(`step2 disappear(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: ');
      subject.appear([], -100, 10);
      subject.appear([' ', 'hello world', 'A', 'hello world', 'Sample Title 123'], 0, 0);
      logInfo(`disappear>disappear>listLabel>appear>appe...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[" ","hello world","A","hello world","Sample Title 123"]');
      logInfo(`disappear>disappear>listLabel>appear>appe...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`disappear>disappear>listLabel>appear>appe...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`disappear>disappear>listLabel>appear>appe...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`disappear>disappear>listLabel>appear>appe...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0005
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0005
     * @tc.desc      RawfilePageState call flow openDescriptors > appear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0005 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(80, 40);
      subject.appear(['', ''], 2, -100);
      logInfo(`openDescriptors>appear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["",""]');
      logInfo(`openDescriptors>appear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`openDescriptors>appear final: subject.rawFileContentWithOffset=${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('wfile1 content');
      logInfo(`openDescriptors>appear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`openDescriptors>appear final: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(80);
      logInfo(`openDescriptors>appear final: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(40);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0006
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0006
     * @tc.desc      RawfilePageState call flow appear > openDescriptors > disappear > openDescriptors > appear keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0006 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], -100, 1);
      subject.openDescriptors(40, 0);
      const step3: number = subject.disappear();
      logInfo(`step3 disappear(): step3=${step3}`);
      expect(step3).assertEqual(2);
      subject.openDescriptors(20, 0);
      subject.appear(['', ''], -100, 100);
      logInfo(`appear>openDescriptors>disappear>openDesc...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["",""]');
      logInfo(`appear>openDescriptors>disappear>openDesc...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>openDescriptors>disappear>openDesc...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>openDescriptors>disappear>openDesc...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`appear>openDescriptors>disappear>openDesc...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(20);
      logInfo(`appear>openDescriptors>disappear>openDesc...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(0);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0007
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0007
     * @tc.desc      RawfilePageState call flow appear > appear > appear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0007 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['hello world', 'Hello', ''], 1, 2);
      subject.appear(['Hello', 'hello world'], -100, 15);
      subject.appear(['Hello', 'hello world', '', ' ', 'A'], 100, 5);
      logInfo(`appear>appear>appear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello","hello world",""," ","A"]');
      logInfo(`appear>appear>appear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>appear>appear final: subject.rawFileContentWithOffset=${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`appear>appear>appear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>appear>appear final: subject.rawFileContentWithOffset64=${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('le content for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0008
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0008
     * @tc.desc      RawfilePageState call flow listLabel > disappear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0008 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      const step2: number = subject.disappear();
      logInfo(`step2 disappear(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0009
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0009
     * @tc.desc      RawfilePageState call flow listLabel > appear > openDescriptors keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0009 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      subject.appear(['Hello'], 10, 100);
      subject.openDescriptors(5, 100);
      logInfo(`listLabel>appear>openDescriptors final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`listLabel>appear>openDescriptors final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`listLabel>appear>openDescriptors final: subject.rawFileContentWi...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('ontent');
      logInfo(`listLabel>appear>openDescriptors final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`listLabel>appear>openDescriptors final: subject.rawFileContent...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`listLabel>appear>openDescriptors final: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(5);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0010
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0010
     * @tc.desc      RawfilePageState call flow openDescriptors > listLabel > appear > appear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0010 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(35, 35);
      const step2: string = subject.listLabel();
      logInfo(`step2 listLabel(): step2=${step2}`);
      expect(step2).assertEqual('file list: ');
      subject.appear([], 5, 15);
      subject.appear(['', ''], 3, -100);
      logInfo(`openDescriptors>listLabel>appear>appear f...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["",""]');
      logInfo(`openDescriptors>listLabel>appear>appear f...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`openDescriptors>listLabel>appear>appear f...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('file1 content');
      logInfo(`openDescriptors>listLabel>appear>appear f...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`openDescriptors>listLabel>appear>appear f...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(35);
      logInfo(`openDescriptors>listLabel>appear>appear f...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(35);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0011
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0011
     * @tc.desc      RawfilePageState call flow appear > listLabel keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0011 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['hello world', 'Hello', ''], 0, 2);
      const step2: string = subject.listLabel();
      logInfo(`step2 listLabel(): step2=${step2}`);
      expect(step2).assertEqual('file list: ["hello world","Hello",""]');
      logInfo(`appear>listLabel final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["hello world","Hello",""]');
      logInfo(`appear>listLabel final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>listLabel final: subject.rawFileContentWithOffset=${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`appear>listLabel final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>listLabel final: subject.rawFileContentWithOffset64=${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('wfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0012
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0012
     * @tc.desc      RawfilePageState call flow appear > listLabel > listLabel > openDescriptors > listLabel keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0012 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['hello world', 'Hello', ''], 5, 50);
      const step2: string = subject.listLabel();
      logInfo(`step2 listLabel(): step2=${step2}`);
      expect(step2).assertEqual('file list: ["hello world","Hello",""]');
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: ["hello world","Hello",""]');
      subject.openDescriptors(0, 95);
      const step5: string = subject.listLabel();
      logInfo(`step5 listLabel(): step5=${step5}`);
      expect(step5).assertEqual('file list: ["hello world","Hello",""]');
      logInfo(`appear>listLabel>listLabel>openDescriptor...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["hello world","Hello",""]');
      logInfo(`appear>listLabel>listLabel>openDescriptor...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>listLabel>listLabel>openDescriptor...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('le1 content');
      logInfo(`appear>listLabel>listLabel>openDescriptor...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>listLabel>listLabel>openDescriptor...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`appear>listLabel>listLabel>openDescriptor...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0013
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0013
     * @tc.desc      RawfilePageState call flow openDescriptors > listLabel > disappear > appear > listLabel keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0013 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 35);
      const step2: string = subject.listLabel();
      logInfo(`step2 listLabel(): step2=${step2}`);
      expect(step2).assertEqual('file list: ');
      const step3: number = subject.disappear();
      logInfo(`step3 disappear(): step3=${step3}`);
      expect(step3).assertEqual(2);
      subject.appear([], -100, 15);
      const step5: string = subject.listLabel();
      logInfo(`step5 listLabel(): step5=${step5}`);
      expect(step5).assertEqual('file list: []');
      logInfo(`openDescriptors>listLabel>disappear>appea...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`openDescriptors>listLabel>disappear>appea...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`openDescriptors>listLabel>disappear>appea...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`openDescriptors>listLabel>disappear>appea...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual(' for 64');
      logInfo(`openDescriptors>listLabel>disappear>appea...: subject.released=${subject.released}`);
      expect(subject.released).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0014
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0014
     * @tc.desc      RawfilePageState call flow listLabel > openDescriptors > openDescriptors > listLabel > openDescr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0014 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      subject.openDescriptors(60, 100);
      subject.openDescriptors(80, 20);
      const step4: string = subject.listLabel();
      logInfo(`step4 listLabel(): step4=${step4}`);
      expect(step4).assertEqual('file list: ');
      subject.openDescriptors(40, 30);
      logInfo(`listLabel>openDescriptors>openDescriptors...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(40);
      logInfo(`listLabel>openDescriptors>openDescriptors...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(30);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0015
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0015
     * @tc.desc      RawfilePageState call flow openDescriptors > openDescriptors > disappear > openDescriptors keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0015 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(30, 65);
      subject.openDescriptors(-1, 35);
      const step3: number = subject.disappear();
      logInfo(`step3 disappear(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.openDescriptors(15, 25);
      logInfo(`openDescriptors>openDescriptors>disappear...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(15);
      logInfo(`openDescriptors>openDescriptors>disappear...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(25);
      logInfo(`openDescriptors>openDescriptors>disappear...: subject.released=${subject.released}`);
      expect(subject.released).assertEqual(1);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0016
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0016
     * @tc.desc      RawfilePageState call flow appear > disappear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0016 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello', 'hello world'], 0, 0);
      const step2: number = subject.disappear();
      logInfo(`step2 disappear(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`appear>disappear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello","hello world"]');
      logInfo(`appear>disappear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>disappear final: subject.rawFileContentWithOffset=${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`appear>disappear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>disappear final: subject.rawFileContentWithOffset64=${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0017
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0017
     * @tc.desc      RawfilePageState call flow appear > openDescriptors > listLabel > appear > openDescriptors keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0017 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['hello world', 'Hello', ''], 3, 50);
      subject.openDescriptors(100, 40);
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: ["hello world","Hello",""]');
      subject.appear([' ', 'hello world', 'A', 'hello world', 'Sample Title 123'], -64, 1);
      subject.openDescriptors(0, 182);
      logInfo(`appear>openDescriptors>listLabel>appear>o...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[" ","hello world","A","hello world","Sample Title 123"]');
      logInfo(`appear>openDescriptors>listLabel>appear>o...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>openDescriptors>listLabel>appear>o...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>openDescriptors>listLabel>appear>o...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('awfile content for 64');
      logInfo(`appear>openDescriptors>listLabel>appear>o...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`appear>openDescriptors>listLabel>appear>o...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(182);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0018
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0018
     * @tc.desc      RawfilePageState call flow openDescriptors > openDescriptors > appear > openDescriptors keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0018 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-1, 2);
      subject.openDescriptors(100, 90);
      subject.appear([], 3, 13.98);
      subject.openDescriptors(0, 52.51);
      logInfo(`openDescriptors>openDescriptors>appear>op...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`openDescriptors>openDescriptors>appear>op...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`openDescriptors>openDescriptors>appear>op...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('file1 content');
      logInfo(`openDescriptors>openDescriptors>appear>op...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`openDescriptors>openDescriptors>appear>op...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('nt for 64');
      logInfo(`openDescriptors>openDescriptors>appear>op...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0019
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0019
     * @tc.desc      RawfilePageState call flow appear > openDescriptors > appear > disappear > disappear keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0019 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello', 'hello world'], 5, 2);
      subject.openDescriptors(55, 115);
      subject.appear(['Hello', 'hello world', '', ' ', 'A'], -64, -1);
      const step4: number = subject.disappear();
      logInfo(`step4 disappear(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.disappear();
      logInfo(`step5 disappear(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`appear>openDescriptors>appear>disappear>d...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello","hello world",""," ","A"]');
      logInfo(`appear>openDescriptors>appear>disappear>d...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>openDescriptors>appear>disappear>d...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>openDescriptors>appear>disappear>d...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 6');
      logInfo(`appear>openDescriptors>appear>disappear>d...: subject.released=${subject.released}`);
      expect(subject.released).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0020
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0020
     * @tc.desc      RawfilePageState call flow disappear > appear > listLabel > listLabel keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0020 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.appear(['Hello', 'hello world'], 5, 2);
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: ["Hello","hello world"]');
      const step4: string = subject.listLabel();
      logInfo(`step4 listLabel(): step4=${step4}`);
      expect(step4).assertEqual('file list: ["Hello","hello world"]');
      logInfo(`disappear>appear>listLabel>listLabel final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello","hello world"]');
      logInfo(`disappear>appear>listLabel>listLabel final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`disappear>appear>listLabel>listLabel final: subject.rawFileConte...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('le1 content');
      logInfo(`disappear>appear>listLabel>listLabel final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`disappear>appear>listLabel>listLabel final: subject.rawFileCon...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('wfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0021
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0021
     * @tc.desc      RawfilePageState call flow listLabel > listLabel keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0021 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      const step2: string = subject.listLabel();
      logInfo(`step2 listLabel(): step2=${step2}`);
      expect(step2).assertEqual('file list: ');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0022
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0022
     * @tc.desc      RawfilePageState call flow appear > disappear > disappear > openDescriptors keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0022 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['hello world', 'Hello', ''], -100, -100);
      const step2: number = subject.disappear();
      logInfo(`step2 disappear(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.disappear();
      logInfo(`step3 disappear(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.openDescriptors(85, 45);
      logInfo(`appear>disappear>disappear>openDescriptor...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["hello world","Hello",""]');
      logInfo(`appear>disappear>disappear>openDescriptor...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>disappear>disappear>openDescriptor...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>disappear>disappear>openDescriptor...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(85);
      logInfo(`appear>disappear>disappear>openDescriptor...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(45);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0023
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0023
     * @tc.desc      RawfilePageState call flow openDescriptors > openDescriptors keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0023 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-1, 0);
      subject.openDescriptors(95, 75);
      logInfo(`openDescriptors>openDescriptors final: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(95);
      logInfo(`openDescriptors>openDescriptors final: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(75);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0024
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0024
     * @tc.desc      RawfilePageState call flow disappear > listLabel > listLabel keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0024 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.listLabel();
      logInfo(`step2 listLabel(): step2=${step2}`);
      expect(step2).assertEqual('file list: ');
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: ');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0025
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0025
     * @tc.desc      RawfilePageState call flow openDescriptors > disappear > openDescriptors > listLabel keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0025 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(25, 0);
      const step2: number = subject.disappear();
      logInfo(`step2 disappear(): step2=${step2}`);
      expect(step2).assertEqual(2);
      subject.openDescriptors(105, 105);
      const step4: string = subject.listLabel();
      logInfo(`step4 listLabel(): step4=${step4}`);
      expect(step4).assertEqual('file list: ');
      logInfo(`openDescriptors>disappear>openDescriptors...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(105);
      logInfo(`openDescriptors>disappear>openDescriptors...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(105);
      logInfo(`openDescriptors>disappear>openDescriptors...: subject.released=${subject.released}`);
      expect(subject.released).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0026
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0026
     * @tc.desc      RawfilePageState call flow appear > openDescriptors > openDescriptors > listLabel > openDescript...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0026 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], -64, -1);
      subject.openDescriptors(110, 0);
      subject.openDescriptors(3, 0);
      const step4: string = subject.listLabel();
      logInfo(`step4 listLabel(): step4=${step4}`);
      expect(step4).assertEqual('file list: ["Hello"]');
      subject.openDescriptors(90, 45);
      logInfo(`appear>openDescriptors>openDescriptors>li...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear>openDescriptors>openDescriptors>li...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>openDescriptors>openDescriptors>li...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>openDescriptors>openDescriptors>li...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 6');
      logInfo(`appear>openDescriptors>openDescriptors>li...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(90);
      logInfo(`appear>openDescriptors>openDescriptors>li...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(45);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0027
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0027
     * @tc.desc      RawfilePageState call flow disappear > disappear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0027 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.disappear();
      logInfo(`step2 disappear(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0028
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0028
     * @tc.desc      RawfilePageState call flow appear > appear > openDescriptors > appear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0028 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello', 'hello world'], 0, 0);
      subject.appear([], 2, -100);
      subject.openDescriptors(11, 0);
      subject.appear(['hello world', 'Hello', ''], 0, 2);
      logInfo(`appear>appear>openDescriptors>appear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["hello world","Hello",""]');
      logInfo(`appear>appear>openDescriptors>appear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>appear>openDescriptors>appear final: subject.rawFileConte...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`appear>appear>openDescriptors>appear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>appear>openDescriptors>appear final: subject.rawFileCon...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('wfile content for 64');
      logInfo(`appear>appear>openDescriptors>appear final: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(11);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0029
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0029
     * @tc.desc      RawfilePageState call flow listLabel > openDescriptors > openDescriptors keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0029 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      subject.openDescriptors(0, 35);
      subject.openDescriptors(15, 80);
      logInfo(`listLabel>openDescriptors>openDescriptors...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(15);
      logInfo(`listLabel>openDescriptors>openDescriptors...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(80);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0030
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0030
     * @tc.desc      RawfilePageState call flow listLabel > appear > appear > appear > disappear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0030 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      subject.appear(['Hello', 'hello world', '', ' ', 'A'], 100, 13.98);
      subject.appear([], 5, 15);
      subject.appear([' ', 'hello world', 'A', 'hello world', 'Sample Title 123'], 0, 0);
      const step5: number = subject.disappear();
      logInfo(`step5 disappear(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`listLabel>appear>appear>appear>disappear ...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[" ","hello world","A","hello world","Sample Title 123"]');
      logInfo(`listLabel>appear>appear>appear>disappear ...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`listLabel>appear>appear>appear>disappear ...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`listLabel>appear>appear>appear>disappear ...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`listLabel>appear>appear>appear>disappear ...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0031
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0031
     * @tc.desc      RawfilePageState call flow listLabel > appear > listLabel > openDescriptors > openDescriptors ke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0031 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      subject.appear([], 0, 2);
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: []');
      subject.openDescriptors(0, 105);
      subject.openDescriptors(85, 50);
      logInfo(`listLabel>appear>listLabel>openDescriptor...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`listLabel>appear>listLabel>openDescriptor...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`listLabel>appear>listLabel>openDescriptor...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`listLabel>appear>listLabel>openDescriptor...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`listLabel>appear>listLabel>openDescriptor...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('wfile content for 64');
      logInfo(`listLabel>appear>listLabel>openDescriptor...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(85);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0032
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0032
     * @tc.desc      RawfilePageState call flow disappear > openDescriptors > openDescriptors > disappear > listLabel...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0032 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.openDescriptors(105, 0);
      subject.openDescriptors(105, 20);
      const step4: number = subject.disappear();
      logInfo(`step4 disappear(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: string = subject.listLabel();
      logInfo(`step5 listLabel(): step5=${step5}`);
      expect(step5).assertEqual('file list: ');
      logInfo(`disappear>openDescriptors>openDescriptors...: subject.released=${subject.released}`);
      expect(subject.released).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0033
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0033
     * @tc.desc      RawfilePageState call flow openDescriptors > disappear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0033 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 90);
      const step2: number = subject.disappear();
      logInfo(`step2 disappear(): step2=${step2}`);
      expect(step2).assertEqual(2);
      logInfo(`openDescriptors>disappear final: subject.released=${subject.released}`);
      expect(subject.released).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0034
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0034
     * @tc.desc      RawfilePageState call flow disappear > appear > disappear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0034 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.appear(['', ''], 1, 10);
      const step3: number = subject.disappear();
      logInfo(`step3 disappear(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`disappear>appear>disappear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["",""]');
      logInfo(`disappear>appear>disappear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`disappear>appear>disappear final: subject.rawFileContentWithOffset=${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('awfile1 content');
      logInfo(`disappear>appear>disappear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`disappear>appear>disappear final: subject.rawFileContentWithOf...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('ntent for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0035
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0035
     * @tc.desc      RawfilePageState call flow openDescriptors > disappear > listLabel keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0035 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 110);
      const step2: number = subject.disappear();
      logInfo(`step2 disappear(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: ');
      logInfo(`openDescriptors>disappear>listLabel final: subject.released=${subject.released}`);
      expect(subject.released).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0036
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0036
     * @tc.desc      RawfilePageState call flow openDescriptors > appear > appear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0036 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(1, 3);
      subject.appear(['Hello', 'hello world', '', ' ', 'A'], 1, 0);
      subject.appear(['', ''], 50, 1);
      logInfo(`openDescriptors>appear>appear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["",""]');
      logInfo(`openDescriptors>appear>appear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`openDescriptors>appear>appear final: subject.rawFileContentWithO...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`openDescriptors>appear>appear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`openDescriptors>appear>appear final: subject.rawFileContentWit...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('awfile content for 64');
      logInfo(`openDescriptors>appear>appear final: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0037
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0037
     * @tc.desc      RawfilePageState call flow disappear > listLabel keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0037 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.listLabel();
      logInfo(`step2 listLabel(): step2=${step2}`);
      expect(step2).assertEqual('file list: ');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0038
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0038
     * @tc.desc      RawfilePageState call flow disappear > listLabel > disappear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0038 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.listLabel();
      logInfo(`step2 listLabel(): step2=${step2}`);
      expect(step2).assertEqual('file list: ');
      const step3: number = subject.disappear();
      logInfo(`step3 disappear(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0039
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0039
     * @tc.desc      RawfilePageState call flow disappear > disappear > openDescriptors > openDescriptors keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0039 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.disappear();
      logInfo(`step2 disappear(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.openDescriptors(2, -1);
      subject.openDescriptors(100, 90);
      logInfo(`disappear>disappear>openDescriptors>openD...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(100);
      logInfo(`disappear>disappear>openDescriptors>openD...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(90);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0040
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0040
     * @tc.desc      RawfilePageState call flow listLabel > listLabel > appear > disappear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0040 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      const step2: string = subject.listLabel();
      logInfo(`step2 listLabel(): step2=${step2}`);
      expect(step2).assertEqual('file list: ');
      subject.appear(['', ''], -1, 1);
      const step4: number = subject.disappear();
      logInfo(`step4 disappear(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`listLabel>listLabel>appear>disappear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["",""]');
      logInfo(`listLabel>listLabel>appear>disappear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`listLabel>listLabel>appear>disappear final: subject.rawFileConte...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conten');
      logInfo(`listLabel>listLabel>appear>disappear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`listLabel>listLabel>appear>disappear final: subject.rawFileCon...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('awfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0041
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0041
     * @tc.desc      RawfilePageState call flow disappear > appear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0041 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.appear(['', ''], -100, -100);
      logInfo(`disappear>appear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["",""]');
      logInfo(`disappear>appear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`disappear>appear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0042
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0042
     * @tc.desc      RawfilePageState call flow appear > openDescriptors > openDescriptors > listLabel > appear keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0042 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 5, -100);
      subject.openDescriptors(1, 3);
      subject.openDescriptors(20, 0);
      const step4: string = subject.listLabel();
      logInfo(`step4 listLabel(): step4=${step4}`);
      expect(step4).assertEqual('file list: []');
      subject.appear([], 1, 50);
      logInfo(`appear>openDescriptors>openDescriptors>li...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear>openDescriptors>openDescriptors>li...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>openDescriptors>openDescriptors>li...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('awfile1 content');
      logInfo(`appear>openDescriptors>openDescriptors>li...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>openDescriptors>openDescriptors>li...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`appear>openDescriptors>openDescriptors>li...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(20);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0043
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0043
     * @tc.desc      RawfilePageState call flow listLabel > openDescriptors > listLabel keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0043 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      subject.openDescriptors(15, 15);
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: ');
      logInfo(`listLabel>openDescriptors>listLabel final: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(15);
      logInfo(`listLabel>openDescriptors>listLabel final: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(15);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0044
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0044
     * @tc.desc      RawfilePageState call flow disappear > openDescriptors > appear > appear > listLabel keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0044 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.openDescriptors(-1, 35);
      subject.appear(['Sample Title 123', 'A', ' ', '', 'hello world', 'Hello'], -1, 2);
      subject.appear([], 0, 2);
      const step5: string = subject.listLabel();
      logInfo(`step5 listLabel(): step5=${step5}`);
      expect(step5).assertEqual('file list: []');
      logInfo(`disappear>openDescriptors>appear>appear>l...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`disappear>openDescriptors>appear>appear>l...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`disappear>openDescriptors>appear>appear>l...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`disappear>openDescriptors>appear>appear>l...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`disappear>openDescriptors>appear>appear>l...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('wfile content for 64');
      logInfo(`disappear>openDescriptors>appear>appear>l...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(35);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0045
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0045
     * @tc.desc      RawfilePageState call flow appear > disappear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0045 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([' ', 'hello world', 'A', 'hello world', 'Sample Title 123'], 0, 2);
      const step2: number = subject.disappear();
      logInfo(`step2 disappear(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`appear>disappear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[" ","hello world","A","hello world","Sample Title 123"]');
      logInfo(`appear>disappear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>disappear final: subject.rawFileContentWithOffset=${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`appear>disappear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>disappear final: subject.rawFileContentWithOffset64=${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('wfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0046
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0046
     * @tc.desc      RawfilePageState call flow appear > appear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0046 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello', 'hello world', '', ' ', 'A'], 2, 10);
      subject.appear([], 3, -100);
      logInfo(`appear>appear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear>appear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>appear final: subject.rawFileContentWithOffset=${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('file1 content');
      logInfo(`appear>appear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0047
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0047
     * @tc.desc      RawfilePageState call flow listLabel > appear > listLabel keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0047 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      subject.appear(['Hello', 'hello world'], 100, 100);
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: ["Hello","hello world"]');
      logInfo(`listLabel>appear>listLabel final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello","hello world"]');
      logInfo(`listLabel>appear>listLabel final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`listLabel>appear>listLabel final: subject.rawFileContentWithOffset=${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`listLabel>appear>listLabel final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`listLabel>appear>listLabel final: subject.rawFileContentWithOf...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0048
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0048
     * @tc.desc      RawfilePageState call flow listLabel > disappear > openDescriptors > openDescriptors keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0048 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      const step2: number = subject.disappear();
      logInfo(`step2 disappear(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.openDescriptors(0, 5);
      subject.openDescriptors(100, 90);
      logInfo(`listLabel>disappear>openDescriptors>openD...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(100);
      logInfo(`listLabel>disappear>openDescriptors>openD...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(90);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0049
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0049
     * @tc.desc      RawfilePageState call flow appear > openDescriptors > disappear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0049 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([' ', 'hello world', 'A', 'hello world', 'Sample Title 123'], 2, -100);
      subject.openDescriptors(75, 0);
      const step3: number = subject.disappear();
      logInfo(`step3 disappear(): step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`appear>openDescriptors>disappear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[" ","hello world","A","hello world","Sample Title 123"]');
      logInfo(`appear>openDescriptors>disappear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>openDescriptors>disappear final: subject.rawFileContentWi...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('wfile1 content');
      logInfo(`appear>openDescriptors>disappear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>openDescriptors>disappear final: subject.released=${subject.released}`);
      expect(subject.released).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0050
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0050
     * @tc.desc      RawfilePageState call flow disappear > openDescriptors > openDescriptors keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0050 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.openDescriptors(70, -1);
      subject.openDescriptors(40, 52.51);
      logInfo(`disappear>openDescriptors>openDescriptors...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(40);
      logInfo(`disappear>openDescriptors>openDescriptors...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertClose(52.51, PRECISION);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0051
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0051
     * @tc.desc      RawfilePageState call flow appear > disappear > listLabel keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0051 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['', ''], 3, -100);
      const step2: number = subject.disappear();
      logInfo(`step2 disappear(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: ["",""]');
      logInfo(`appear>disappear>listLabel final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["",""]');
      logInfo(`appear>disappear>listLabel final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>disappear>listLabel final: subject.rawFileContentWithOffset=${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('file1 content');
      logInfo(`appear>disappear>listLabel final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0052
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0052
     * @tc.desc      RawfilePageState call flow openDescriptors > openDescriptors > disappear > listLabel keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0052 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(80, 40);
      subject.openDescriptors(35, 0);
      const step3: number = subject.disappear();
      logInfo(`step3 disappear(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: string = subject.listLabel();
      logInfo(`step4 listLabel(): step4=${step4}`);
      expect(step4).assertEqual('file list: ');
      logInfo(`openDescriptors>openDescriptors>disappear...: subject.released=${subject.released}`);
      expect(subject.released).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0053
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0053
     * @tc.desc      RawfilePageState call flow disappear > appear > disappear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0053 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.appear([], 3, -100);
      const step3: number = subject.disappear();
      logInfo(`step3 disappear(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`disappear>appear>disappear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`disappear>appear>disappear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`disappear>appear>disappear final: subject.rawFileContentWithOffset=${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('file1 content');
      logInfo(`disappear>appear>disappear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0054
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0054
     * @tc.desc      RawfilePageState call flow disappear > listLabel > disappear > listLabel keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0054 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.listLabel();
      logInfo(`step2 listLabel(): step2=${step2}`);
      expect(step2).assertEqual('file list: ');
      const step3: number = subject.disappear();
      logInfo(`step3 disappear(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.listLabel();
      logInfo(`step4 listLabel(): step4=${step4}`);
      expect(step4).assertEqual('file list: ');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0054 end`);
    });
  });
}
