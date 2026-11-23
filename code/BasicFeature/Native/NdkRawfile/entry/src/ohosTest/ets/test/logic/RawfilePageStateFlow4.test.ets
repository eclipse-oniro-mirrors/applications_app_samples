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

/** Logic checks for RawfilePageState flow (8 cases). */
export default function rawfilePageStateFlow4Test(): void {
  describe('RawfilePageStateFlow4Test', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0158
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0158
     * @tc.desc      RawfilePageState call flow openDescriptors > openDescriptors > listLabel > appear keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0158 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(115, 0);
      subject.openDescriptors(75, 2);
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: ');
      subject.appear(['', ''], 50, 1);
      logInfo(`openDescriptors>openDescriptors>listLabel...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["",""]');
      logInfo(`openDescriptors>openDescriptors>listLabel...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`openDescriptors>openDescriptors>listLabel...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`openDescriptors>openDescriptors>listLabel...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`openDescriptors>openDescriptors>listLabel...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('awfile content for 64');
      logInfo(`openDescriptors>openDescriptors>listLabel...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(75);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0158 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0159
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0159
     * @tc.desc      RawfilePageState call flow openDescriptors > appear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0159 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(105, 0);
      subject.appear([], -100, -1);
      logInfo(`openDescriptors>appear final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[]');
      logInfo(`openDescriptors>appear final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`openDescriptors>appear final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`openDescriptors>appear final: subject.rawFileContentWithOffset64=${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 6');
      logInfo(`openDescriptors>appear final: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(105);
      logInfo(`openDescriptors>appear final: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(0);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0159 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0160
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0160
     * @tc.desc      RawfilePageState call flow listLabel > openDescriptors > openDescriptors keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0160 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      subject.openDescriptors(-38, 40);
      subject.openDescriptors(15, 25);
      logInfo(`listLabel>openDescriptors>openDescriptors...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(15);
      logInfo(`listLabel>openDescriptors>openDescriptors...: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(25);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0160 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0161
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0161
     * @tc.desc      RawfilePageState call flow openDescriptors > appear > openDescriptors keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0161 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(95, 75);
      subject.appear(['Hello', 'hello world'], 0, 5);
      subject.openDescriptors(1, 105);
      logInfo(`openDescriptors>appear>openDescriptors final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Hello","hello world"]');
      logInfo(`openDescriptors>appear>openDescriptors final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`openDescriptors>appear>openDescriptors final: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`openDescriptors>appear>openDescriptors final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`openDescriptors>appear>openDescriptors final: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('le content for 64');
      logInfo(`openDescriptors>appear>openDescriptors final: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0161 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0162
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0162
     * @tc.desc      RawfilePageState call flow appear > listLabel keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0162 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.appear([' ', 'hello world', 'A', 'hello world', 'Sample Title 123'], 0, 1);
      const step2: string = subject.listLabel();
      logInfo(`step2 listLabel(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(67);
      logInfo(`step2 listLabel(): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('file list: [" ","hello world","A');
      logInfo(`step2 listLabel(): step2.substring(35)=${step2.substring(35)}`);
      expect(step2.substring(35)).assertEqual('hello world","Sample Title 123"]');
      logInfo(`appear>listLabel final: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('[" ","hello world","A","hello world","Sample Title 123"]');
      logInfo(`appear>listLabel final: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`appear>listLabel final: subject.rawFileContentWithOffset=${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`appear>listLabel final: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`appear>listLabel final: subject.rawFileContentWithOffset64=${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('awfile content for 64');
      logInfo(`${BUNDLE}RawfilePageStateFlow_0162 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0163
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0163
     * @tc.desc      RawfilePageState call flow listLabel > openDescriptors keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0163 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: string = subject.listLabel();
      logInfo(`step1 listLabel(): step1=${step1}`);
      expect(step1).assertEqual('file list: ');
      subject.openDescriptors(2, 52.51);
      logInfo(`listLabel>openDescriptors final: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`listLabel>openDescriptors final: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertClose(52.51, PRECISION);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0163 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0164
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0164
     * @tc.desc      RawfilePageState call flow openDescriptors > openDescriptors > listLabel > appear keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0164 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-38, 40);
      subject.openDescriptors(5, 55);
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: ');
      subject.appear(['', ''], 100, 1);
      logInfo(`openDescriptors>openDescriptors>listLabel...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["",""]');
      logInfo(`openDescriptors>openDescriptors>listLabel...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`openDescriptors>openDescriptors>listLabel...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('rawfile1 content');
      logInfo(`openDescriptors>openDescriptors>listLabel...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`openDescriptors>openDescriptors>listLabel...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('awfile content for 64');
      logInfo(`openDescriptors>openDescriptors>listLabel...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(5);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0164 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_FLOW_0165
     * @tc.name      NdkRawfile_RawfilePageStateFlow_0165
     * @tc.desc      RawfilePageState call flow disappear > openDescriptors > listLabel > appear keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateFlow_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateFlow_0165 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      const step1: number = subject.disappear();
      logInfo(`step1 disappear(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.openDescriptors(-38, 0);
      const step3: string = subject.listLabel();
      logInfo(`step3 listLabel(): step3=${step3}`);
      expect(step3).assertEqual('file list: ');
      subject.appear(['Sample Title 123', 'A', ' ', '', 'hello world', 'Hello'], 1, -1);
      logInfo(`disappear>openDescriptors>listLabel>appea...: subject.rawFileList=${subject.rawFileList}`);
      expect(subject.rawFileList).assertEqual('["Sample Title 123","A"," ","","hello world","Hello"]');
      logInfo(`disappear>openDescriptors>listLabel>appea...: subject.rawFileContent=${subject.rawFileContent}`);
      expect(subject.rawFileContent).assertEqual('rawfile1 content');
      logInfo(`disappear>openDescriptors>listLabel>appea...: subject.rawFileCon...${subject.rawFileContentWithOffset}`);
      expect(subject.rawFileContentWithOffset).assertEqual('awfile1 content');
      logInfo(`disappear>openDescriptors>listLabel>appea...: subject.rawFileContent64=${subject.rawFileContent64}`);
      expect(subject.rawFileContent64).assertEqual('rawfile content for 64');
      logInfo(`disappear>openDescriptors>listLabel>appea...: subject.rawFileC...${subject.rawFileContentWithOffset64}`);
      expect(subject.rawFileContentWithOffset64).assertEqual('rawfile content for 6');
      logInfo(`disappear>openDescriptors>listLabel>appea...: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(-38);
      logInfo(`${BUNDLE}RawfilePageStateFlow_0165 end`);
    });
  });
}
