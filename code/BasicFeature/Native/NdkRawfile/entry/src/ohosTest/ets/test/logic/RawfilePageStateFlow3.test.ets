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

/** Logic checks for RawfilePageState flow (50 cases). */
export default function rawfilePageStateFlow3Test(): void {
  describe('RawfilePageStateFlow3Test', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0108
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0108
     * @tc.desc      RawfilePageState call flow openDescriptors > appear > openDescriptors keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0108 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(2, 0);
      subject.appear([], 10, -100);
      subject.openDescriptors(65, 115);
      logInfo(`openDescriptors>appear>openDescriptors final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`openDescriptors>appear>openDescriptors final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`openDescriptors>appear>openDescriptors final: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('ontent');
      logInfo(`openDescriptors>appear>openDescriptors final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`openDescriptors>appear>openDescriptors final: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(65);
      logInfo(`openDescriptors>appear>openDescriptors final: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(115);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0108 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0109
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0109
     * @tc.desc      RawfilePageState call flow appear > appear > listLabel > appear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0109 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], -100, 3);
      subject.appear([], 1, 100);
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: []');
      subject.appear(['Sample Title 123', 'A', ' ', '', 'hello world', 'Hello'], 1, -1);
      logInfo(`appear>appear>listLabel>appear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Sample Title 123","A"," ","","hello world","Hello"]');
      logInfo(`appear>appear>listLabel>appear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>appear>listLabel>appear final: subject.rawFileContentWith...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('awfile1 content');
      logInfo(`appear>appear>listLabel>appear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>appear>listLabel>appear final: subject.rawFileContentWi...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 6');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0109 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0110
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0110
     * @tc.desc      RawfilePageState call flow disappear > disappear > appear > openDescriptors > disappear keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0110 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.disappear();
      logInfo(`step2 disappear(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.appear(['Hello'], 15, -100);
      subject.openDescriptors(0, 85);
      const step5: number = subject.disappear();
      logInfo(`step5 disappear(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`disappear>disappear>appear>openDescriptor...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`disappear>disappear>appear>openDescriptor...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`disappear>disappear>appear>openDescriptor...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('t');
      logInfo(`disappear>disappear>appear>openDescriptor...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`disappear>disappear>appear>openDescriptor...: subject.released=${subject.released}`);
      expect(subject.released).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0110 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0111
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0111
     * @tc.desc      RawfilePageState call flow disappear > appear > openDescriptors keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0111 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.appear(['Hello'], 10, 50);
      subject.openDescriptors(35, 0);
      logInfo(`disappear>appear>openDescriptors final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`disappear>appear>openDescriptors final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`disappear>appear>openDescriptors final: subject.rawFileContentWi...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('ontent');
      logInfo(`disappear>appear>openDescriptors final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`disappear>appear>openDescriptors final: subject.rawFileContent...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`disappear>appear>openDescriptors final: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(35);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0111 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0112
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0112
     * @tc.desc      RawfilePageState call flow openDescriptors > listLabel > appear > appear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0112 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(110, 80);
      const step2: string = subject.listLabel();
      logInfo(`step2 listLabel(): step2=${step2}`);
      expect(step2).assertEqual('file list: ');
      subject.appear(['Sample Title 123', 'A', ' ', '', 'hello world', 'Hello'], 3, 5);
      subject.appear(['Hello', 'hello world'], -100, 15);
      logInfo(`openDescriptors>listLabel>appear>appear f...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello","hello world"]');
      logInfo(`openDescriptors>listLabel>appear>appear f...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`openDescriptors>listLabel>appear>appear f...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`openDescriptors>listLabel>appear>appear f...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual(' for 64');
      logInfo(`openDescriptors>listLabel>appear>appear f...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(110);
      logInfo(`openDescriptors>listLabel>appear>appear f...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(80);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0112 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0113
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0113
     * @tc.desc      RawfilePageState call flow appear > appear > disappear > appear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0113 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([' ', 'hello world', 'A', 'hello world', 'Sample Title 123'], 2, -100);
      subject.appear([], 1, 100);
      const step3: number = subject.disappear();
      logInfo(`step3 disappear(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.appear([' ', 'hello world', 'A', 'hello world', 'Sample Title 123'], 3, 10);
      logInfo(`appear>appear>disappear>appear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[" ","hello world","A","hello world","Sample Title 123"]');
      logInfo(`appear>appear>disappear>appear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>appear>disappear>appear final: subject.rawFileContentWith...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('file1 content');
      logInfo(`appear>appear>disappear>appear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>appear>disappear>appear final: subject.rawFileContentWi...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('ntent for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0113 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0114
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0114
     * @tc.desc      RawfilePageState call flow openDescriptors > appear > listLabel > openDescriptors > appear keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0114 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(20, 90);
      subject.appear([], 100, 50);
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: []');
      subject.openDescriptors(-38, 100);
      subject.appear(['', ''], 100, 1);
      logInfo(`openDescriptors>appear>listLabel>openDesc...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["",""]');
      logInfo(`openDescriptors>appear>listLabel>openDesc...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`openDescriptors>appear>listLabel>openDesc...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`openDescriptors>appear>listLabel>openDesc...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`openDescriptors>appear>listLabel>openDesc...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('awfile content for 64');
      logInfo(`openDescriptors>appear>listLabel>openDesc...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(-38);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0114 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0115
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0115
     * @tc.desc      RawfilePageState call flow listLabel > listLabel > disappear > appear > appear keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0115 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      const step2: string = subject.listLabel();
      logInfo(`step2 listLabel(): step2=${step2}`);
      expect(step2).assertEqual('file list: ');
      const step3: number = subject.disappear();
      logInfo(`step3 disappear(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.appear([], -100, -1);
      subject.appear(['hello world', 'Hello', ''], 50, 5);
      logInfo(`listLabel>listLabel>disappear>appear>appe...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["hello world","Hello",""]');
      logInfo(`listLabel>listLabel>disappear>appear>appe...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`listLabel>listLabel>disappear>appear>appe...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`listLabel>listLabel>disappear>appear>appe...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`listLabel>listLabel>disappear>appear>appe...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('le content for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0115 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0116
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0116
     * @tc.desc      RawfilePageState call flow disappear > appear > openDescriptors keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0116 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.appear(['', ''], 2, -100);
      subject.openDescriptors(0, 2);
      logInfo(`disappear>appear>openDescriptors final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["",""]');
      logInfo(`disappear>appear>openDescriptors final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`disappear>appear>openDescriptors final: subject.rawFileContentWi...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('wfile1 content');
      logInfo(`disappear>appear>openDescriptors final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`disappear>appear>openDescriptors final: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`disappear>appear>openDescriptors final: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0116 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0117
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0117
     * @tc.desc      RawfilePageState call flow listLabel > disappear > openDescriptors > openDescriptors keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0117 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      const step2: number = subject.disappear();
      logInfo(`step2 disappear(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.openDescriptors(0, 115);
      subject.openDescriptors(40, 85);
      logInfo(`listLabel>disappear>openDescriptors>openD...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(40);
      logInfo(`listLabel>disappear>openDescriptors>openD...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(85);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0117 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0118
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0118
     * @tc.desc      RawfilePageState call flow disappear > listLabel > appear > openDescriptors keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0118 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.listLabel();
      logInfo(`step2 listLabel(): step2=${step2}`);
      expect(step2).assertEqual('file list: ');
      subject.appear(['', ''], 15, 2);
      subject.openDescriptors(30, 65);
      logInfo(`disappear>listLabel>appear>openDescriptor...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["",""]');
      logInfo(`disappear>listLabel>appear>openDescriptor...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`disappear>listLabel>appear>openDescriptor...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('t');
      logInfo(`disappear>listLabel>appear>openDescriptor...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`disappear>listLabel>appear>openDescriptor...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('wfile content for 64');
      logInfo(`disappear>listLabel>appear>openDescriptor...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(30);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0118 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0119
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0119
     * @tc.desc      RawfilePageState call flow listLabel > disappear > appear > disappear > disappear keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0119 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      const step2: number = subject.disappear();
      logInfo(`step2 disappear(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.appear([], 50, -100);
      const step4: number = subject.disappear();
      logInfo(`step4 disappear(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.disappear();
      logInfo(`step5 disappear(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`listLabel>disappear>appear>disappear>disa...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`listLabel>disappear>appear>disappear>disa...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`listLabel>disappear>appear>disappear>disa...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`listLabel>disappear>appear>disappear>disa...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0119 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0120
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0120
     * @tc.desc      RawfilePageState call flow listLabel > listLabel > disappear > listLabel keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0120 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      const step2: string = subject.listLabel();
      logInfo(`step2 listLabel(): step2=${step2}`);
      expect(step2).assertEqual('file list: ');
      const step3: number = subject.disappear();
      logInfo(`step3 disappear(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.listLabel();
      logInfo(`step4 listLabel(): step4=${step4}`);
      expect(step4).assertEqual('file list: ');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0120 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0121
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0121
     * @tc.desc      RawfilePageState call flow appear > openDescriptors > appear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0121 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 5, 3);
      subject.openDescriptors(0, 50);
      subject.appear(['', ''], 2, 15);
      logInfo(`appear>openDescriptors>appear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["",""]');
      logInfo(`appear>openDescriptors>appear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>openDescriptors>appear final: subject.rawFileContentWithO...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('wfile1 content');
      logInfo(`appear>openDescriptors>appear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>openDescriptors>appear final: subject.rawFileContentWit...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual(' for 64');
      logInfo(`appear>openDescriptors>appear final: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0121 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0122
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0122
     * @tc.desc      RawfilePageState call flow listLabel > appear > disappear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0122 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      subject.appear([], 5, 15);
      const step3: number = subject.disappear();
      logInfo(`step3 disappear(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`listLabel>appear>disappear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`listLabel>appear>disappear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`listLabel>appear>disappear final: subject.rawFileContentWithOffset=${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('le1 content');
      logInfo(`listLabel>appear>disappear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`listLabel>appear>disappear final: subject.rawFileContentWithOf...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual(' for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0122 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0123
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0123
     * @tc.desc      RawfilePageState call flow disappear > appear > listLabel > openDescriptors > openDescriptors ke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0123 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.appear([], 10, 15);
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: []');
      subject.openDescriptors(5, 55);
      subject.openDescriptors(0, 70);
      logInfo(`disappear>appear>listLabel>openDescriptor...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`disappear>appear>listLabel>openDescriptor...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`disappear>appear>listLabel>openDescriptor...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('ontent');
      logInfo(`disappear>appear>listLabel>openDescriptor...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`disappear>appear>listLabel>openDescriptor...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual(' for 64');
      logInfo(`disappear>appear>listLabel>openDescriptor...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0123 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0124
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0124
     * @tc.desc      RawfilePageState call flow appear > openDescriptors > disappear > appear > disappear keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0124 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello', 'hello world'], -100, -100);
      subject.openDescriptors(40, 0);
      const step3: number = subject.disappear();
      logInfo(`step3 disappear(): step3=${step3}`);
      expect(step3).assertEqual(2);
      subject.appear(['Hello'], 15, -1);
      const step5: number = subject.disappear();
      logInfo(`step5 disappear(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`appear>openDescriptors>disappear>appear>d...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear>openDescriptors>disappear>appear>d...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>openDescriptors>disappear>appear>d...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('t');
      logInfo(`appear>openDescriptors>disappear>appear>d...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>openDescriptors>disappear>appear>d...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 6');
      logInfo(`appear>openDescriptors>disappear>appear>d...: subject.released=${subject.released}`);
      expect(subject.released).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0124 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0125
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0125
     * @tc.desc      RawfilePageState call flow appear > openDescriptors > listLabel > disappear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0125 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([' ', 'hello world', 'A', 'hello world', 'Sample Title 123'], 0, 2);
      subject.openDescriptors(25, 60);
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(67);
      logInfo(`step3 listLabel(): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('file list: [" ","hello world","A');
      logInfo(`step3 listLabel(): step3.substring(35)=${step3.substring(35)}`);
      expect(step3.substring(35)).assertEqual('hello world","Sample Title 123"]');
      const step4: number = subject.disappear();
      logInfo(`step4 disappear(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`appear>openDescriptors>listLabel>disappea...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[" ","hello world","A","hello world","Sample Title 123"]');
      logInfo(`appear>openDescriptors>listLabel>disappea...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>openDescriptors>listLabel>disappea...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`appear>openDescriptors>listLabel>disappea...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>openDescriptors>listLabel>disappea...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('wfile content for 64');
      logInfo(`appear>openDescriptors>listLabel>disappea...: subject.released=${subject.released}`);
      expect(subject.released).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0125 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0126
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0126
     * @tc.desc      RawfilePageState call flow disappear > openDescriptors > openDescriptors > listLabel keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0126 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.openDescriptors(80, 40);
      subject.openDescriptors(-1, 85);
      const step4: string = subject.listLabel();
      logInfo(`step4 listLabel(): step4=${step4}`);
      expect(step4).assertEqual('file list: ');
      logInfo(`disappear>openDescriptors>openDescriptors...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(85);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0126 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0127
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0127
     * @tc.desc      RawfilePageState call flow appear > disappear > openDescriptors keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0127 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello', 'hello world', '', ' ', 'A'], 5, 3);
      const step2: number = subject.disappear();
      logInfo(`step2 disappear(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.openDescriptors(1, 3);
      logInfo(`appear>disappear>openDescriptors final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello","hello world",""," ","A"]');
      logInfo(`appear>disappear>openDescriptors final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>disappear>openDescriptors final: subject.rawFileContentWi...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('le1 content');
      logInfo(`appear>disappear>openDescriptors final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>disappear>openDescriptors final: subject.rawFileContent...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('file content for 64');
      logInfo(`appear>disappear>openDescriptors final: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0127 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0128
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0128
     * @tc.desc      RawfilePageState call flow listLabel > openDescriptors > listLabel > openDescriptors keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0128 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      subject.openDescriptors(110, 0);
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: ');
      subject.openDescriptors(0, 1);
      logInfo(`listLabel>openDescriptors>listLabel>openD...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`listLabel>openDescriptors>listLabel>openD...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(1);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0128 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0129
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0129
     * @tc.desc      RawfilePageState call flow appear > appear > appear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0129 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['hello world', 'Hello', ''], -1, 1);
      subject.appear(['Hello'], 5, 5);
      subject.appear([' ', 'hello world', 'A', 'hello world', 'Sample Title 123'], 3, 10);
      logInfo(`appear>appear>appear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[" ","hello world","A","hello world","Sample Title 123"]');
      logInfo(`appear>appear>appear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>appear>appear final: subject.rawFileContentWithOffset=${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('file1 content');
      logInfo(`appear>appear>appear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>appear>appear final: subject.rawFileContentWithOffset64=${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('ntent for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0129 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0130
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0130
     * @tc.desc      RawfilePageState call flow openDescriptors > openDescriptors > listLabel keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0130 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(55, 0);
      subject.openDescriptors(35, 75);
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: ');
      logInfo(`openDescriptors>openDescriptors>listLabel...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(35);
      logInfo(`openDescriptors>openDescriptors>listLabel...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(75);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0130 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0131
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0131
     * @tc.desc      RawfilePageState call flow openDescriptors > openDescriptors > disappear > appear > openDescript...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0131 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(90, 45);
      subject.openDescriptors(20, 105);
      const step3: number = subject.disappear();
      logInfo(`step3 disappear(): step3=${step3}`);
      expect(step3).assertEqual(2);
      subject.appear(['Hello', 'hello world', '', ' ', 'A'], -100, 10);
      subject.openDescriptors(35, 75);
      logInfo(`openDescriptors>openDescriptors>disappear...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello","hello world",""," ","A"]');
      logInfo(`openDescriptors>openDescriptors>disappear...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`openDescriptors>openDescriptors>disappear...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`openDescriptors>openDescriptors>disappear...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('ntent for 64');
      logInfo(`openDescriptors>openDescriptors>disappear...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(35);
      logInfo(`openDescriptors>openDescriptors>disappear...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(75);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0131 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0132
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0132
     * @tc.desc      RawfilePageState call flow listLabel > appear > appear > appear > appear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0132 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      subject.appear(['hello world', 'Hello', ''], 0, 15);
      subject.appear([], 5, 5);
      subject.appear([], 3, 13.98);
      subject.appear(['', ''], 5, 5);
      logInfo(`listLabel>appear>appear>appear>appear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["",""]');
      logInfo(`listLabel>appear>appear>appear>appear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`listLabel>appear>appear>appear>appear final: subject.rawFileCont...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('le1 content');
      logInfo(`listLabel>appear>appear>appear>appear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`listLabel>appear>appear>appear>appear final: subject.rawFileCo...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('le content for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0132 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0133
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0133
     * @tc.desc      RawfilePageState call flow openDescriptors > disappear > appear > appear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0133 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(20, 10);
      const step2: number = subject.disappear();
      logInfo(`step2 disappear(): step2=${step2}`);
      expect(step2).assertEqual(2);
      subject.appear([], -100, 2);
      subject.appear(['Hello', 'hello world', '', ' ', 'A'], 15, 50);
      logInfo(`openDescriptors>disappear>appear>appear f...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello","hello world",""," ","A"]');
      logInfo(`openDescriptors>disappear>appear>appear f...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`openDescriptors>disappear>appear>appear f...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('t');
      logInfo(`openDescriptors>disappear>appear>appear f...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`openDescriptors>disappear>appear>appear f...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`openDescriptors>disappear>appear>appear f...: subject.released=${subject.released}`);
      expect(subject.released).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0133 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0134
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0134
     * @tc.desc      RawfilePageState call flow appear > openDescriptors > listLabel keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0134 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello'], 5, 5);
      subject.openDescriptors(11, 90);
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: ["Hello"]');
      logInfo(`appear>openDescriptors>listLabel final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`appear>openDescriptors>listLabel final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>openDescriptors>listLabel final: subject.rawFileContentWi...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('le1 content');
      logInfo(`appear>openDescriptors>listLabel final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>openDescriptors>listLabel final: subject.rawFileContent...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('le content for 64');
      logInfo(`appear>openDescriptors>listLabel final: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(11);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0134 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0135
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0135
     * @tc.desc      RawfilePageState call flow listLabel > listLabel > openDescriptors keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0135 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      const step2: string = subject.listLabel();
      logInfo(`step2 listLabel(): step2=${step2}`);
      expect(step2).assertEqual('file list: ');
      subject.openDescriptors(0, 40);
      logInfo(`listLabel>listLabel>openDescriptors final: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`listLabel>listLabel>openDescriptors final: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(40);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0135 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0136
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0136
     * @tc.desc      RawfilePageState call flow listLabel > appear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0136 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      subject.appear([], 1, 50);
      logInfo(`listLabel>appear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`listLabel>appear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`listLabel>appear final: subject.rawFileContentWithOffset=${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('awfile1 content');
      logInfo(`listLabel>appear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`listLabel>appear final: subject.rawFileContentWithOffset64=${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0136 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0137
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0137
     * @tc.desc      RawfilePageState call flow listLabel > appear > disappear > openDescriptors > listLabel keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0137 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      subject.appear(['Hello'], -64, -1);
      const step3: number = subject.disappear();
      logInfo(`step3 disappear(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.openDescriptors(2, 70);
      const step5: string = subject.listLabel();
      logInfo(`step5 listLabel(): step5=${step5}`);
      expect(step5).assertEqual('file list: ["Hello"]');
      logInfo(`listLabel>appear>disappear>openDescriptor...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`listLabel>appear>disappear>openDescriptor...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`listLabel>appear>disappear>openDescriptor...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`listLabel>appear>disappear>openDescriptor...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 6');
      logInfo(`listLabel>appear>disappear>openDescriptor...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`listLabel>appear>disappear>openDescriptor...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(70);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0137 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0138
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0138
     * @tc.desc      RawfilePageState call flow disappear > openDescriptors > disappear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0138 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.openDescriptors(0, 100);
      const step3: number = subject.disappear();
      logInfo(`step3 disappear(): step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`disappear>openDescriptors>disappear final: subject.released=${subject.released}`);
      expect(subject.released).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0138 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0139
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0139
     * @tc.desc      RawfilePageState call flow disappear > openDescriptors > openDescriptors > disappear keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0139 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.openDescriptors(65, 5);
      subject.openDescriptors(115, 20);
      const step4: number = subject.disappear();
      logInfo(`step4 disappear(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`disappear>openDescriptors>openDescriptors...: subject.released=${subject.released}`);
      expect(subject.released).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0139 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0140
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0140
     * @tc.desc      RawfilePageState call flow openDescriptors > listLabel keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0140 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(2, 0);
      const step2: string = subject.listLabel();
      logInfo(`step2 listLabel(): step2=${step2}`);
      expect(step2).assertEqual('file list: ');
      logInfo(`openDescriptors>listLabel final: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`openDescriptors>listLabel final: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(0);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0140 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0141
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0141
     * @tc.desc      RawfilePageState call flow openDescriptors > openDescriptors > listLabel > listLabel keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0141 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(2, 85);
      subject.openDescriptors(70, 100);
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: ');
      const step4: string = subject.listLabel();
      logInfo(`step4 listLabel(): step4=${step4}`);
      expect(step4).assertEqual('file list: ');
      logInfo(`openDescriptors>openDescriptors>listLabel...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(70);
      logInfo(`openDescriptors>openDescriptors>listLabel...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(100);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0141 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0142
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0142
     * @tc.desc      RawfilePageState call flow disappear > disappear > disappear > listLabel keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0142 begin`);
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
      const step4: string = subject.listLabel();
      logInfo(`step4 listLabel(): step4=${step4}`);
      expect(step4).assertEqual('file list: ');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0142 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0143
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0143
     * @tc.desc      RawfilePageState call flow appear > listLabel > openDescriptors > openDescriptors > disappear ke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0143 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['', ''], -100, -100);
      const step2: string = subject.listLabel();
      logInfo(`step2 listLabel(): step2=${step2}`);
      expect(step2).assertEqual('file list: ["",""]');
      subject.openDescriptors(15, 15);
      subject.openDescriptors(30, 65);
      const step5: number = subject.disappear();
      logInfo(`step5 disappear(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`appear>listLabel>openDescriptors>openDesc...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["",""]');
      logInfo(`appear>listLabel>openDescriptors>openDesc...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>listLabel>openDescriptors>openDesc...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>listLabel>openDescriptors>openDesc...: subject.released=${subject.released}`);
      expect(subject.released).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0143 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0144
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0144
     * @tc.desc      RawfilePageState call flow openDescriptors > openDescriptors > openDescriptors > appear > appear...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0144 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 115);
      subject.openDescriptors(60, 100);
      subject.openDescriptors(80, 50);
      subject.appear(['', ''], -100, -100);
      subject.appear(['', ''], 2, -100);
      logInfo(`openDescriptors>openDescriptors>openDescr...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["",""]');
      logInfo(`openDescriptors>openDescriptors>openDescr...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`openDescriptors>openDescriptors>openDescr...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('wfile1 content');
      logInfo(`openDescriptors>openDescriptors>openDescr...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`openDescriptors>openDescriptors>openDescr...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(80);
      logInfo(`openDescriptors>openDescriptors>openDescr...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(50);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0144 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0145
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0145
     * @tc.desc      RawfilePageState call flow disappear > listLabel > disappear > listLabel > listLabel keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0145 begin`);
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
      const step5: string = subject.listLabel();
      logInfo(`step5 listLabel(): step5=${step5}`);
      expect(step5).assertEqual('file list: ');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0145 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0146
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0146
     * @tc.desc      RawfilePageState call flow disappear > openDescriptors > appear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0146 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.openDescriptors(20, 30);
      subject.appear([], -64, -1);
      logInfo(`disappear>openDescriptors>appear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`disappear>openDescriptors>appear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`disappear>openDescriptors>appear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`disappear>openDescriptors>appear final: subject.rawFileContent...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 6');
      logInfo(`disappear>openDescriptors>appear final: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(20);
      logInfo(`disappear>openDescriptors>appear final: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(30);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0146 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0147
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0147
     * @tc.desc      RawfilePageState call flow appear > disappear > disappear > disappear > listLabel keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0147 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([' ', 'hello world', 'A', 'hello world', 'Sample Title 123'], 2, -100);
      const step2: number = subject.disappear();
      logInfo(`step2 disappear(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.disappear();
      logInfo(`step3 disappear(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.disappear();
      logInfo(`step4 disappear(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string = subject.listLabel();
      logInfo(`step5 listLabel(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(67);
      logInfo(`step5 listLabel(): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('file list: [" ","hello world","A');
      logInfo(`step5 listLabel(): step5.substring(35)=${step5.substring(35)}`);
      expect(step5.substring(35)).assertEqual('hello world","Sample Title 123"]');
      logInfo(`appear>disappear>disappear>disappear>list...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[" ","hello world","A","hello world","Sample Title 123"]');
      logInfo(`appear>disappear>disappear>disappear>list...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>disappear>disappear>disappear>list...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('wfile1 content');
      logInfo(`appear>disappear>disappear>disappear>list...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0147 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0148
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0148
     * @tc.desc      RawfilePageState call flow listLabel > appear > listLabel keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0148 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      subject.appear([], 10, -100);
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: []');
      logInfo(`listLabel>appear>listLabel final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`listLabel>appear>listLabel final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`listLabel>appear>listLabel final: subject.rawFileContentWithOffset=${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('ontent');
      logInfo(`listLabel>appear>listLabel final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0148 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0149
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0149
     * @tc.desc      RawfilePageState call flow listLabel > appear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0149 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      subject.appear(['Hello', 'hello world'], 15, 2);
      logInfo(`listLabel>appear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello","hello world"]');
      logInfo(`listLabel>appear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`listLabel>appear final: subject.rawFileContentWithOffset=${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('t');
      logInfo(`listLabel>appear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`listLabel>appear final: subject.rawFileContentWithOffset64=${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('wfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0149 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0150
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0150
     * @tc.desc      RawfilePageState call flow appear > listLabel > listLabel keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0150 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello', 'hello world'], 10, 50);
      const step2: string = subject.listLabel();
      logInfo(`step2 listLabel(): step2=${step2}`);
      expect(step2).assertEqual('file list: ["Hello","hello world"]');
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: ["Hello","hello world"]');
      logInfo(`appear>listLabel>listLabel final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello","hello world"]');
      logInfo(`appear>listLabel>listLabel final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>listLabel>listLabel final: subject.rawFileContentWithOffset=${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('ontent');
      logInfo(`appear>listLabel>listLabel final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>listLabel>listLabel final: subject.rawFileContentWithOf...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0150 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0151
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0151
     * @tc.desc      RawfilePageState call flow disappear > appear > openDescriptors > listLabel > listLabel keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0151 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.appear([], -100, -1);
      subject.openDescriptors(85, 50);
      const step4: string = subject.listLabel();
      logInfo(`step4 listLabel(): step4=${step4}`);
      expect(step4).assertEqual('file list: []');
      const step5: string = subject.listLabel();
      logInfo(`step5 listLabel(): step5=${step5}`);
      expect(step5).assertEqual('file list: []');
      logInfo(`disappear>appear>openDescriptors>listLabe...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`disappear>appear>openDescriptors>listLabe...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`disappear>appear>openDescriptors>listLabe...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`disappear>appear>openDescriptors>listLabe...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 6');
      logInfo(`disappear>appear>openDescriptors>listLabe...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(85);
      logInfo(`disappear>appear>openDescriptors>listLabe...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(50);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0151 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0152
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0152
     * @tc.desc      RawfilePageState call flow appear > disappear > disappear > openDescriptors keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0152 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['', ''], -64, 15);
      const step2: number = subject.disappear();
      logInfo(`step2 disappear(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.disappear();
      logInfo(`step3 disappear(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.openDescriptors(1, 0);
      logInfo(`appear>disappear>disappear>openDescriptor...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["",""]');
      logInfo(`appear>disappear>disappear>openDescriptor...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>disappear>disappear>openDescriptor...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>disappear>disappear>openDescriptor...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual(' for 64');
      logInfo(`appear>disappear>disappear>openDescriptor...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`appear>disappear>disappear>openDescriptor...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(0);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0152 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0153
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0153
     * @tc.desc      RawfilePageState call flow openDescriptors > appear > listLabel > disappear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0153 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, -1);
      subject.appear([], -100, -100);
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: []');
      const step4: number = subject.disappear();
      logInfo(`step4 disappear(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`openDescriptors>appear>listLabel>disappea...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`openDescriptors>appear>listLabel>disappea...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`openDescriptors>appear>listLabel>disappea...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`openDescriptors>appear>listLabel>disappea...: subject.released=${subject.released}`);
      expect(subject.released).assertEqual(1);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0153 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0154
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0154
     * @tc.desc      RawfilePageState call flow appear > openDescriptors > listLabel > listLabel keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0154 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['hello world', 'Hello', ''], 0, 15);
      subject.openDescriptors(15, 80);
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: ["hello world","Hello",""]');
      const step4: string = subject.listLabel();
      logInfo(`step4 listLabel(): step4=${step4}`);
      expect(step4).assertEqual('file list: ["hello world","Hello",""]');
      logInfo(`appear>openDescriptors>listLabel>listLabe...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["hello world","Hello",""]');
      logInfo(`appear>openDescriptors>listLabel>listLabe...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>openDescriptors>listLabel>listLabe...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`appear>openDescriptors>listLabel>listLabe...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>openDescriptors>listLabel>listLabe...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual(' for 64');
      logInfo(`appear>openDescriptors>listLabel>listLabe...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(15);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0154 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0155
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0155
     * @tc.desc      RawfilePageState call flow disappear > listLabel > openDescriptors keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0155 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.listLabel();
      logInfo(`step2 listLabel(): step2=${step2}`);
      expect(step2).assertEqual('file list: ');
      subject.openDescriptors(0, 110);
      logInfo(`disappear>listLabel>openDescriptors final: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`disappear>listLabel>openDescriptors final: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(110);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0155 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0156
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0156
     * @tc.desc      RawfilePageState call flow openDescriptors > openDescriptors keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0156 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(1, 90);
      subject.openDescriptors(3, 95);
      logInfo(`openDescriptors>openDescriptors final: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(3);
      logInfo(`openDescriptors>openDescriptors final: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(95);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0156 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0157
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0157
     * @tc.desc      RawfilePageState call flow appear > disappear > disappear > disappear > openDescriptors keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0157 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([' ', 'hello world', 'A', 'hello world', 'Sample Title 123'], 50, 15);
      const step2: number = subject.disappear();
      logInfo(`step2 disappear(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.disappear();
      logInfo(`step3 disappear(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.disappear();
      logInfo(`step4 disappear(): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.openDescriptors(100, 75);
      logInfo(`appear>disappear>disappear>disappear>open...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[" ","hello world","A","hello world","Sample Title 123"]');
      logInfo(`appear>disappear>disappear>disappear>open...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>disappear>disappear>disappear>open...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`appear>disappear>disappear>disappear>open...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>disappear>disappear>disappear>open...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual(' for 64');
      logInfo(`appear>disappear>disappear>disappear>open...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(100);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0157 end`);
    });
  });
}
