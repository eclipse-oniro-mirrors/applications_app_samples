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

/** Logic checks for RawfilePageState flow (53 cases). */
export default function rawfilePageStateFlow2Test(): void {
  describe('RawfilePageStateFlow2Test', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0055
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0055
     * @tc.desc      RawfilePageState call flow listLabel > disappear > listLabel > listLabel > appear keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0055 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      const step2: number = subject.disappear();
      logInfo(`step2 disappear(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: ');
      const step4: string = subject.listLabel();
      logInfo(`step4 listLabel(): step4=${step4}`);
      expect(step4).assertEqual('file list: ');
      subject.appear([' ', 'hello world', 'A', 'hello world', 'Sample Title 123'], -64, 100);
      logInfo(`listLabel>disappear>listLabel>listLabel>a...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[" ","hello world","A","hello world","Sample Title 123"]');
      logInfo(`listLabel>disappear>listLabel>listLabel>a...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`listLabel>disappear>listLabel>listLabel>a...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`listLabel>disappear>listLabel>listLabel>a...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0056
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0056
     * @tc.desc      RawfilePageState call flow appear > openDescriptors > openDescriptors > disappear keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0056 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 2, -100);
      subject.openDescriptors(50, 10);
      subject.openDescriptors(95, 0);
      const step4: number = subject.disappear();
      logInfo(`step4 disappear(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`appear>openDescriptors>openDescriptors>di...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear>openDescriptors>openDescriptors>di...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>openDescriptors>openDescriptors>di...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('wfile1 content');
      logInfo(`appear>openDescriptors>openDescriptors>di...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>openDescriptors>openDescriptors>di...: subject.released=${subject.released}`);
      expect(subject.released).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0057
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0057
     * @tc.desc      RawfilePageState call flow disappear > openDescriptors keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0057 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.openDescriptors(2, 85);
      logInfo(`disappear>openDescriptors final: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`disappear>openDescriptors final: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(85);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0058
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0058
     * @tc.desc      RawfilePageState call flow openDescriptors > disappear > disappear > listLabel keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0058 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(30, 30);
      const step2: number = subject.disappear();
      logInfo(`step2 disappear(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.disappear();
      logInfo(`step3 disappear(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: string = subject.listLabel();
      logInfo(`step4 listLabel(): step4=${step4}`);
      expect(step4).assertEqual('file list: ');
      logInfo(`openDescriptors>disappear>disappear>listL...: subject.released=${subject.released}`);
      expect(subject.released).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0059
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0059
     * @tc.desc      RawfilePageState call flow openDescriptors > openDescriptors > disappear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0059 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(105, 0);
      subject.openDescriptors(2, 85);
      const step3: number = subject.disappear();
      logInfo(`step3 disappear(): step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`openDescriptors>openDescriptors>disappear...: subject.released=${subject.released}`);
      expect(subject.released).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0059 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0060
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0060
     * @tc.desc      RawfilePageState call flow disappear > appear > appear > appear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0060 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.appear(['', ''], 2, -100);
      subject.appear(['Hello', 'hello world', '', ' ', 'A'], -100, -100);
      subject.appear(['Hello'], 5, 5);
      logInfo(`disappear>appear>appear>appear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`disappear>appear>appear>appear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`disappear>appear>appear>appear final: subject.rawFileContentWith...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('le1 content');
      logInfo(`disappear>appear>appear>appear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`disappear>appear>appear>appear final: subject.rawFileContentWi...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('le content for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0060 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0061
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0061
     * @tc.desc      RawfilePageState call flow appear > listLabel > listLabel > openDescriptors keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0061 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['hello world', 'Hello', ''], -1, 1);
      const step2: string = subject.listLabel();
      logInfo(`step2 listLabel(): step2=${step2}`);
      expect(step2).assertEqual('file list: ["hello world","Hello",""]');
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: ["hello world","Hello",""]');
      subject.openDescriptors(50, 10);
      logInfo(`appear>listLabel>listLabel>openDescriptor...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["hello world","Hello",""]');
      logInfo(`appear>listLabel>listLabel>openDescriptor...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>listLabel>listLabel>openDescriptor...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conten');
      logInfo(`appear>listLabel>listLabel>openDescriptor...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>listLabel>listLabel>openDescriptor...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('awfile content for 64');
      logInfo(`appear>listLabel>listLabel>openDescriptor...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(50);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0061 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0062
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0062
     * @tc.desc      RawfilePageState call flow listLabel > disappear > listLabel keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0062 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      const step2: number = subject.disappear();
      logInfo(`step2 disappear(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: ');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0062 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0063
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0063
     * @tc.desc      RawfilePageState call flow disappear > openDescriptors > listLabel > disappear keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0063 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.openDescriptors(95, 85);
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: ');
      const step4: number = subject.disappear();
      logInfo(`step4 disappear(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`disappear>openDescriptors>listLabel>disap...: subject.released=${subject.released}`);
      expect(subject.released).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0063 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0064
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0064
     * @tc.desc      RawfilePageState call flow disappear > listLabel > openDescriptors > disappear > appear keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0064 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.listLabel();
      logInfo(`step2 listLabel(): step2=${step2}`);
      expect(step2).assertEqual('file list: ');
      subject.openDescriptors(85, 50);
      const step4: number = subject.disappear();
      logInfo(`step4 disappear(): step4=${step4}`);
      expect(step4).assertEqual(2);
      subject.appear([' ', 'hello world', 'A', 'hello world', 'Sample Title 123'], 0, 0);
      logInfo(`disappear>listLabel>openDescriptors>disap...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[" ","hello world","A","hello world","Sample Title 123"]');
      logInfo(`disappear>listLabel>openDescriptors>disap...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`disappear>listLabel>openDescriptors>disap...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`disappear>listLabel>openDescriptors>disap...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`disappear>listLabel>openDescriptors>disap...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`disappear>listLabel>openDescriptors>disap...: subject.released=${subject.released}`);
      expect(subject.released).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0064 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0065
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0065
     * @tc.desc      RawfilePageState call flow openDescriptors > openDescriptors > disappear > disappear keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0065 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 15);
      subject.openDescriptors(0, 25);
      const step3: number = subject.disappear();
      logInfo(`step3 disappear(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.disappear();
      logInfo(`step4 disappear(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`openDescriptors>openDescriptors>disappear...: subject.released=${subject.released}`);
      expect(subject.released).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0065 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0066
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0066
     * @tc.desc      RawfilePageState call flow openDescriptors > appear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0066 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(90, 0);
      subject.appear(['Hello', 'hello world', '', ' ', 'A'], 1, 0);
      logInfo(`openDescriptors>appear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello","hello world",""," ","A"]');
      logInfo(`openDescriptors>appear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`openDescriptors>appear final: subject.rawFileContentWithOffset=${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('awfile1 content');
      logInfo(`openDescriptors>appear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`openDescriptors>appear final: subject.rawFileContentWithOffset64=${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`openDescriptors>appear final: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(90);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0066 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0067
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0067
     * @tc.desc      RawfilePageState call flow disappear > appear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0067 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.appear(['', ''], -100, 13.98);
      logInfo(`disappear>appear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["",""]');
      logInfo(`disappear>appear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`disappear>appear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`disappear>appear final: subject.rawFileContentWithOffset64=${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('nt for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0067 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0068
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0068
     * @tc.desc      RawfilePageState call flow listLabel > openDescriptors > openDescriptors > listLabel > openDescr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0068 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      subject.openDescriptors(2, 0);
      subject.openDescriptors(105, 1);
      const step4: string = subject.listLabel();
      logInfo(`step4 listLabel(): step4=${step4}`);
      expect(step4).assertEqual('file list: ');
      subject.openDescriptors(0, 85);
      logInfo(`listLabel>openDescriptors>openDescriptors...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`listLabel>openDescriptors>openDescriptors...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(85);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0068 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0069
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0069
     * @tc.desc      RawfilePageState call flow disappear > appear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0069 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.appear([], 100, 50);
      logInfo(`disappear>appear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`disappear>appear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`disappear>appear final: subject.rawFileContentWithOffset=${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`disappear>appear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`disappear>appear final: subject.rawFileContentWithOffset64=${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0069 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0070
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0070
     * @tc.desc      RawfilePageState call flow openDescriptors > appear > listLabel > listLabel > appear keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0070 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(50, 10);
      subject.appear(['', ''], -100, 100);
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: ["",""]');
      const step4: string = subject.listLabel();
      logInfo(`step4 listLabel(): step4=${step4}`);
      expect(step4).assertEqual('file list: ["",""]');
      subject.appear([], 5, 15);
      logInfo(`openDescriptors>appear>listLabel>listLabe...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`openDescriptors>appear>listLabel>listLabe...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`openDescriptors>appear>listLabel>listLabe...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('le1 content');
      logInfo(`openDescriptors>appear>listLabel>listLabe...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`openDescriptors>appear>listLabel>listLabe...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual(' for 64');
      logInfo(`openDescriptors>appear>listLabel>listLabe...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(50);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0070 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0071
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0071
     * @tc.desc      RawfilePageState call flow disappear > listLabel > appear > disappear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0071 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.listLabel();
      logInfo(`step2 listLabel(): step2=${step2}`);
      expect(step2).assertEqual('file list: ');
      subject.appear([' ', 'hello world', 'A', 'hello world', 'Sample Title 123'], -1, 10);
      const step4: number = subject.disappear();
      logInfo(`step4 disappear(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`disappear>listLabel>appear>disappear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[" ","hello world","A","hello world","Sample Title 123"]');
      logInfo(`disappear>listLabel>appear>disappear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`disappear>listLabel>appear>disappear final: subject.rawFileConte...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conten');
      logInfo(`disappear>listLabel>appear>disappear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`disappear>listLabel>appear>disappear final: subject.rawFileCon...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('ntent for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0071 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0072
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0072
     * @tc.desc      RawfilePageState call flow listLabel > disappear > appear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0072 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      const step2: number = subject.disappear();
      logInfo(`step2 disappear(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.appear([], -100, 0);
      logInfo(`listLabel>disappear>appear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`listLabel>disappear>appear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`listLabel>disappear>appear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`listLabel>disappear>appear final: subject.rawFileContentWithOf...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0072 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0073
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0073
     * @tc.desc      RawfilePageState call flow appear > openDescriptors > listLabel > openDescriptors keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0073 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['', ''], 1, 5);
      subject.openDescriptors(2, 2);
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: ["",""]');
      subject.openDescriptors(90, 25);
      logInfo(`appear>openDescriptors>listLabel>openDesc...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["",""]');
      logInfo(`appear>openDescriptors>listLabel>openDesc...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>openDescriptors>listLabel>openDesc...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('awfile1 content');
      logInfo(`appear>openDescriptors>listLabel>openDesc...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>openDescriptors>listLabel>openDesc...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('le content for 64');
      logInfo(`appear>openDescriptors>listLabel>openDesc...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(90);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0073 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0074
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0074
     * @tc.desc      RawfilePageState call flow openDescriptors > listLabel keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0074 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(20, 90);
      const step2: string = subject.listLabel();
      logInfo(`step2 listLabel(): step2=${step2}`);
      expect(step2).assertEqual('file list: ');
      logInfo(`openDescriptors>listLabel final: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(20);
      logInfo(`openDescriptors>listLabel final: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(90);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0074 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0075
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0075
     * @tc.desc      RawfilePageState call flow appear > openDescriptors keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0075 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 5, 0);
      subject.openDescriptors(-1, 0);
      logInfo(`appear>openDescriptors final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear>openDescriptors final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>openDescriptors final: subject.rawFileContentWithOffset=${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('le1 content');
      logInfo(`appear>openDescriptors final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>openDescriptors final: subject.rawFileContentWithOffset64=${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`appear>openDescriptors final: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(0);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0075 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0076
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0076
     * @tc.desc      RawfilePageState call flow openDescriptors > listLabel > appear > openDescriptors keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0076 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(115, 30);
      const step2: string = subject.listLabel();
      logInfo(`step2 listLabel(): step2=${step2}`);
      expect(step2).assertEqual('file list: ');
      subject.appear(['', ''], 10, 15);
      subject.openDescriptors(65, 15);
      logInfo(`openDescriptors>listLabel>appear>openDesc...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["",""]');
      logInfo(`openDescriptors>listLabel>appear>openDesc...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`openDescriptors>listLabel>appear>openDesc...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('ontent');
      logInfo(`openDescriptors>listLabel>appear>openDesc...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`openDescriptors>listLabel>appear>openDesc...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual(' for 64');
      logInfo(`openDescriptors>listLabel>appear>openDesc...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(65);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0076 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0077
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0077
     * @tc.desc      RawfilePageState call flow appear > openDescriptors > disappear > appear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0077 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello', 'hello world'], 3, 10);
      subject.openDescriptors(5, 55);
      const step3: number = subject.disappear();
      logInfo(`step3 disappear(): step3=${step3}`);
      expect(step3).assertEqual(2);
      subject.appear([], -64, -100);
      logInfo(`appear>openDescriptors>disappear>appear f...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear>openDescriptors>disappear>appear f...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>openDescriptors>disappear>appear f...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>openDescriptors>disappear>appear f...: subject.released=${subject.released}`);
      expect(subject.released).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0077 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0078
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0078
     * @tc.desc      RawfilePageState call flow disappear > openDescriptors > listLabel > listLabel keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0078 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.openDescriptors(115, 55);
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: ');
      const step4: string = subject.listLabel();
      logInfo(`step4 listLabel(): step4=${step4}`);
      expect(step4).assertEqual('file list: ');
      logInfo(`disappear>openDescriptors>listLabel>listL...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(115);
      logInfo(`disappear>openDescriptors>listLabel>listL...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(55);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0078 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0079
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0079
     * @tc.desc      RawfilePageState call flow appear > openDescriptors > listLabel > appear > openDescriptors keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0079 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello', 'hello world'], 3, -1);
      subject.openDescriptors(105, 20);
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: ["Hello","hello world"]');
      subject.appear([' ', 'hello world', 'A', 'hello world', 'Sample Title 123'], -100, -100);
      subject.openDescriptors(0, 70);
      logInfo(`appear>openDescriptors>listLabel>appear>o...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[" ","hello world","A","hello world","Sample Title 123"]');
      logInfo(`appear>openDescriptors>listLabel>appear>o...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>openDescriptors>listLabel>appear>o...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>openDescriptors>listLabel>appear>o...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`appear>openDescriptors>listLabel>appear>o...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(70);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0079 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0080
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0080
     * @tc.desc      RawfilePageState call flow disappear > appear > openDescriptors > openDescriptors keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0080 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.appear([], -64, -100);
      subject.openDescriptors(100, 75);
      subject.openDescriptors(30, 65);
      logInfo(`disappear>appear>openDescriptors>openDesc...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`disappear>appear>openDescriptors>openDesc...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`disappear>appear>openDescriptors>openDesc...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`disappear>appear>openDescriptors>openDesc...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(30);
      logInfo(`disappear>appear>openDescriptors>openDesc...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(65);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0080 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0081
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0081
     * @tc.desc      RawfilePageState call flow openDescriptors > listLabel > disappear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0081 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(60, 100);
      const step2: string = subject.listLabel();
      logInfo(`step2 listLabel(): step2=${step2}`);
      expect(step2).assertEqual('file list: ');
      const step3: number = subject.disappear();
      logInfo(`step3 disappear(): step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`openDescriptors>listLabel>disappear final: subject.released=${subject.released}`);
      expect(subject.released).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0081 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0082
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0082
     * @tc.desc      RawfilePageState call flow listLabel > appear > disappear > appear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0082 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      subject.appear(['Hello'], 1, 15);
      const step3: number = subject.disappear();
      logInfo(`step3 disappear(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.appear([], 1, -100);
      logInfo(`listLabel>appear>disappear>appear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`listLabel>appear>disappear>appear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`listLabel>appear>disappear>appear final: subject.rawFileContentW...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('awfile1 content');
      logInfo(`listLabel>appear>disappear>appear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0082 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0083
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0083
     * @tc.desc      RawfilePageState call flow appear > listLabel > appear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0083 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 100, 50);
      const step2: string = subject.listLabel();
      logInfo(`step2 listLabel(): step2=${step2}`);
      expect(step2).assertEqual('file list: []');
      subject.appear(['Hello', 'hello world', '', ' ', 'A'], 3, 1);
      logInfo(`appear>listLabel>appear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello","hello world",""," ","A"]');
      logInfo(`appear>listLabel>appear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>listLabel>appear final: subject.rawFileContentWithOffset=${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('file1 content');
      logInfo(`appear>listLabel>appear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>listLabel>appear final: subject.rawFileContentWithOffse...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('awfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0083 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0084
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0084
     * @tc.desc      RawfilePageState call flow openDescriptors > appear > openDescriptors keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0084 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 5);
      subject.appear([' ', 'hello world', 'A', 'hello world', 'Sample Title 123'], -64, 1);
      subject.openDescriptors(25, 0);
      logInfo(`openDescriptors>appear>openDescriptors final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[" ","hello world","A","hello world","Sample Title 123"]');
      logInfo(`openDescriptors>appear>openDescriptors final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`openDescriptors>appear>openDescriptors final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`openDescriptors>appear>openDescriptors final: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('awfile content for 64');
      logInfo(`openDescriptors>appear>openDescriptors final: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(25);
      logInfo(`openDescriptors>appear>openDescriptors final: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(0);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0084 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0085
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0085
     * @tc.desc      RawfilePageState call flow openDescriptors > appear > openDescriptors keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0085 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(70, -1);
      subject.appear([], 15, -100);
      subject.openDescriptors(11, 35);
      logInfo(`openDescriptors>appear>openDescriptors final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`openDescriptors>appear>openDescriptors final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`openDescriptors>appear>openDescriptors final: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('t');
      logInfo(`openDescriptors>appear>openDescriptors final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`openDescriptors>appear>openDescriptors final: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(11);
      logInfo(`openDescriptors>appear>openDescriptors final: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(35);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0085 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0086
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0086
     * @tc.desc      RawfilePageState call flow listLabel > appear > openDescriptors > appear > appear keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0086 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      subject.appear([' ', 'hello world', 'A', 'hello world', 'Sample Title 123'], 0, 2);
      subject.openDescriptors(95, 85);
      subject.appear([], 50, -100);
      subject.appear(['hello world', 'Hello', ''], 0, 15);
      logInfo(`listLabel>appear>openDescriptors>appear>a...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["hello world","Hello",""]');
      logInfo(`listLabel>appear>openDescriptors>appear>a...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`listLabel>appear>openDescriptors>appear>a...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`listLabel>appear>openDescriptors>appear>a...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`listLabel>appear>openDescriptors>appear>a...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual(' for 64');
      logInfo(`listLabel>appear>openDescriptors>appear>a...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(95);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0086 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0087
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0087
     * @tc.desc      RawfilePageState call flow listLabel > openDescriptors > openDescriptors > appear keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0087 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      subject.openDescriptors(95, 85);
      subject.openDescriptors(40, 85);
      subject.appear(['Hello', 'hello world', '', ' ', 'A'], 2, 10);
      logInfo(`listLabel>openDescriptors>openDescriptors...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello","hello world",""," ","A"]');
      logInfo(`listLabel>openDescriptors>openDescriptors...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`listLabel>openDescriptors>openDescriptors...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('wfile1 content');
      logInfo(`listLabel>openDescriptors>openDescriptors...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`listLabel>openDescriptors>openDescriptors...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('ntent for 64');
      logInfo(`listLabel>openDescriptors>openDescriptors...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(40);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0087 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0088
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0088
     * @tc.desc      RawfilePageState call flow disappear > disappear > openDescriptors > disappear keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0088 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.disappear();
      logInfo(`step2 disappear(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.openDescriptors(2, 85);
      const step4: number = subject.disappear();
      logInfo(`step4 disappear(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`disappear>disappear>openDescriptors>disap...: subject.released=${subject.released}`);
      expect(subject.released).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0088 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0089
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0089
     * @tc.desc      RawfilePageState call flow openDescriptors > openDescriptors > appear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0089 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(95, 85);
      subject.openDescriptors(-1, 2);
      subject.appear(['Hello', 'hello world', '', ' ', 'A'], 2, 3);
      logInfo(`openDescriptors>openDescriptors>appear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello","hello world",""," ","A"]');
      logInfo(`openDescriptors>openDescriptors>appear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`openDescriptors>openDescriptors>appear final: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('wfile1 content');
      logInfo(`openDescriptors>openDescriptors>appear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`openDescriptors>openDescriptors>appear final: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('file content for 64');
      logInfo(`openDescriptors>openDescriptors>appear final: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0089 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0090
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0090
     * @tc.desc      RawfilePageState call flow openDescriptors > disappear > openDescriptors > listLabel keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0090 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(115, 30);
      const step2: number = subject.disappear();
      logInfo(`step2 disappear(): step2=${step2}`);
      expect(step2).assertEqual(2);
      subject.openDescriptors(2, 85);
      const step4: string = subject.listLabel();
      logInfo(`step4 listLabel(): step4=${step4}`);
      expect(step4).assertEqual('file list: ');
      logInfo(`openDescriptors>disappear>openDescriptors...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`openDescriptors>disappear>openDescriptors...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(85);
      logInfo(`openDescriptors>disappear>openDescriptors...: subject.released=${subject.released}`);
      expect(subject.released).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0090 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0091
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0091
     * @tc.desc      RawfilePageState call flow disappear > openDescriptors keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0091 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.openDescriptors(0, 2);
      logInfo(`disappear>openDescriptors final: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`disappear>openDescriptors final: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0091 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0092
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0092
     * @tc.desc      RawfilePageState call flow openDescriptors > listLabel > listLabel > disappear keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0092 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 105);
      const step2: string = subject.listLabel();
      logInfo(`step2 listLabel(): step2=${step2}`);
      expect(step2).assertEqual('file list: ');
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: ');
      const step4: number = subject.disappear();
      logInfo(`step4 disappear(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`openDescriptors>listLabel>listLabel>disap...: subject.released=${subject.released}`);
      expect(subject.released).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0092 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0093
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0093
     * @tc.desc      RawfilePageState call flow disappear > listLabel > openDescriptors > listLabel keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0093 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.listLabel();
      logInfo(`step2 listLabel(): step2=${step2}`);
      expect(step2).assertEqual('file list: ');
      subject.openDescriptors(110, 80);
      const step4: string = subject.listLabel();
      logInfo(`step4 listLabel(): step4=${step4}`);
      expect(step4).assertEqual('file list: ');
      logInfo(`disappear>listLabel>openDescriptors>listL...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(110);
      logInfo(`disappear>listLabel>openDescriptors>listL...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(80);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0093 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0094
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0094
     * @tc.desc      RawfilePageState call flow disappear > openDescriptors keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0094 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.openDescriptors(20, 105);
      logInfo(`disappear>openDescriptors final: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(20);
      logInfo(`disappear>openDescriptors final: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(105);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0094 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0095
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0095
     * @tc.desc      RawfilePageState call flow openDescriptors > openDescriptors > appear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0095 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 40);
      subject.openDescriptors(0, 15);
      subject.appear(['', ''], -100, 3);
      logInfo(`openDescriptors>openDescriptors>appear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["",""]');
      logInfo(`openDescriptors>openDescriptors>appear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`openDescriptors>openDescriptors>appear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`openDescriptors>openDescriptors>appear final: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('file content for 64');
      logInfo(`openDescriptors>openDescriptors>appear final: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`openDescriptors>openDescriptors>appear final: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(15);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0095 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0096
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0096
     * @tc.desc      RawfilePageState call flow appear > listLabel > openDescriptors > appear > openDescriptors keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0096 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], -64, -1);
      const step2: string = subject.listLabel();
      logInfo(`step2 listLabel(): step2=${step2}`);
      expect(step2).assertEqual('file list: []');
      subject.openDescriptors(65, 5);
      subject.appear(['', ''], -100, 13.98);
      subject.openDescriptors(0, 3);
      logInfo(`appear>listLabel>openDescriptors>appear>o...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["",""]');
      logInfo(`appear>listLabel>openDescriptors>appear>o...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>listLabel>openDescriptors>appear>o...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>listLabel>openDescriptors>appear>o...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('nt for 64');
      logInfo(`appear>listLabel>openDescriptors>appear>o...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`appear>listLabel>openDescriptors>appear>o...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(3);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0096 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0097
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0097
     * @tc.desc      RawfilePageState call flow listLabel > openDescriptors > listLabel > listLabel keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0097 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      subject.openDescriptors(90, 0);
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: ');
      const step4: string = subject.listLabel();
      logInfo(`step4 listLabel(): step4=${step4}`);
      expect(step4).assertEqual('file list: ');
      logInfo(`listLabel>openDescriptors>listLabel>listL...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(90);
      logInfo(`listLabel>openDescriptors>listLabel>listL...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(0);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0097 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0098
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0098
     * @tc.desc      RawfilePageState call flow listLabel > openDescriptors > listLabel > appear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0098 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      subject.openDescriptors(5, 10);
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: ');
      subject.appear(['Hello', 'hello world'], 10, 100);
      logInfo(`listLabel>openDescriptors>listLabel>appea...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello","hello world"]');
      logInfo(`listLabel>openDescriptors>listLabel>appea...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`listLabel>openDescriptors>listLabel>appea...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('ontent');
      logInfo(`listLabel>openDescriptors>listLabel>appea...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`listLabel>openDescriptors>listLabel>appea...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 64');
      logInfo(`listLabel>openDescriptors>listLabel>appea...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(5);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0098 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0099
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0099
     * @tc.desc      RawfilePageState call flow listLabel > disappear > disappear > disappear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0099 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      const step2: number = subject.disappear();
      logInfo(`step2 disappear(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.disappear();
      logInfo(`step3 disappear(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.disappear();
      logInfo(`step4 disappear(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0099 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0100
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0100
     * @tc.desc      RawfilePageState call flow appear > openDescriptors keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0100 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([], 3, 13.98);
      subject.openDescriptors(55, 115);
      logInfo(`appear>openDescriptors final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`appear>openDescriptors final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>openDescriptors final: subject.rawFileContentWithOffset=${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('file1 content');
      logInfo(`appear>openDescriptors final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>openDescriptors final: subject.rawFileContentWithOffset64=${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('nt for 64');
      logInfo(`appear>openDescriptors final: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(55);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0100 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0101
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0101
     * @tc.desc      RawfilePageState call flow disappear > disappear > listLabel keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0101 begin`);
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
      logInfo(`${BUNDLE}RawfilePageStateFlow_0101 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0102
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0102
     * @tc.desc      RawfilePageState call flow appear > appear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0102 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear(['Hello', 'hello world'], 10, 100);
      subject.appear(['', ''], 5, 5);
      logInfo(`appear>appear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["",""]');
      logInfo(`appear>appear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>appear final: subject.rawFileContentWithOffset=${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('le1 content');
      logInfo(`appear>appear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>appear final: subject.rawFileContentWithOffset64=${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('le content for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0102 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0103
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0103
     * @tc.desc      RawfilePageState call flow listLabel > openDescriptors > appear > appear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0103 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      subject.openDescriptors(45, 65);
      subject.appear(['Hello'], -100, -100);
      subject.appear([], -1, -100);
      logInfo(`listLabel>openDescriptors>appear>appear f...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`listLabel>openDescriptors>appear>appear f...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`listLabel>openDescriptors>appear>appear f...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 conten');
      logInfo(`listLabel>openDescriptors>appear>appear f...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`listLabel>openDescriptors>appear>appear f...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(45);
      logInfo(`listLabel>openDescriptors>appear>appear f...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(65);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0103 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0104
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0104
     * @tc.desc      RawfilePageState call flow disappear > disappear > listLabel > openDescriptors keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0104 begin`);
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
      subject.openDescriptors(0, 65);
      logInfo(`disappear>disappear>listLabel>openDescrip...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`disappear>disappear>listLabel>openDescrip...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(65);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0104 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0105
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0105
     * @tc.desc      RawfilePageState call flow disappear > disappear > appear > openDescriptors keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0105 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.disappear();
      logInfo(`step2 disappear(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.appear(['Hello', 'hello world'], 3, -100);
      subject.openDescriptors(70, -1);
      logInfo(`disappear>disappear>appear>openDescriptor...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello","hello world"]');
      logInfo(`disappear>disappear>appear>openDescriptor...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`disappear>disappear>appear>openDescriptor...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('file1 content');
      logInfo(`disappear>disappear>appear>openDescriptor...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`disappear>disappear>appear>openDescriptor...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(70);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0105 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0106
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0106
     * @tc.desc      RawfilePageState call flow listLabel > listLabel > appear > disappear > appear keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0106 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      const step2: string = subject.listLabel();
      logInfo(`step2 listLabel(): step2=${step2}`);
      expect(step2).assertEqual('file list: ');
      subject.appear([' ', 'hello world', 'A', 'hello world', 'Sample Title 123'], 0, 1);
      const step4: number = subject.disappear();
      logInfo(`step4 disappear(): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.appear(['Hello'], 2, 10);
      logInfo(`listLabel>listLabel>appear>disappear>appe...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello"]');
      logInfo(`listLabel>listLabel>appear>disappear>appe...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`listLabel>listLabel>appear>disappear>appe...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('wfile1 content');
      logInfo(`listLabel>listLabel>appear>disappear>appe...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`listLabel>listLabel>appear>disappear>appe...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('ntent for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0106 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0107
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0107
     * @tc.desc      RawfilePageState call flow disappear > listLabel > appear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0107 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.listLabel();
      logInfo(`step2 listLabel(): step2=${step2}`);
      expect(step2).assertEqual('file list: ');
      subject.appear(['hello world', 'Hello', ''], 50, 5);
      logInfo(`disappear>listLabel>appear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["hello world","Hello",""]');
      logInfo(`disappear>listLabel>appear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`disappear>listLabel>appear final: subject.rawFileContentWithOffset=${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`disappear>listLabel>appear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`disappear>listLabel>appear final: subject.rawFileContentWithOf...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('le content for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0107 end`);
    });
  });
}
