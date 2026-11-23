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

/** Logic checks for RawfilePageState.openDescriptors (81 cases). */
export default function rawfilePageStateOpenDescriptors2Test(): void {
  describe('RawfilePageStateOpenDescriptors2Test', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0085
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0085
     * @tc.desc      RawfilePageState.openDescriptors(fd=1, fd64=95) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0085 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(1, 95);
      logInfo(`openDescriptors(fd=1, fd64=95) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`openDescriptors(fd=1, fd64=95) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(95);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0085 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0086
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0086
     * @tc.desc      RawfilePageState.openDescriptors(fd=1, fd64=105) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0086 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(1, 105);
      logInfo(`openDescriptors(fd=1, fd64=105) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`openDescriptors(fd=1, fd64=105) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(105);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0086 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0087
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0087
     * @tc.desc      RawfilePageState.openDescriptors(fd=1, fd64=110) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0087 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(1, 110);
      logInfo(`openDescriptors(fd=1, fd64=110) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`openDescriptors(fd=1, fd64=110) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(110);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0087 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0088
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0088
     * @tc.desc      RawfilePageState.openDescriptors(fd=1, fd64=52.51) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0088 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(1, 52.51);
      logInfo(`openDescriptors(fd=1, fd64=52.51) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`openDescriptors(fd=1, fd64=52.51) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertClose(52.51, PRECISION);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0088 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0089
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0089
     * @tc.desc      RawfilePageState.openDescriptors(fd=1, fd64=182) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0089 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(1, 182);
      logInfo(`openDescriptors(fd=1, fd64=182) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`openDescriptors(fd=1, fd64=182) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(182);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0089 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0090
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0090
     * @tc.desc      RawfilePageState.openDescriptors(fd=-2, fd64=0) yields -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0090 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-2, 0);
      logInfo(`openDescriptors(fd=-2, fd64=0) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(-2);
      logInfo(`openDescriptors(fd=-2, fd64=0) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(0);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0090 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0091
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0091
     * @tc.desc      RawfilePageState.openDescriptors(fd=-2, fd64=-1) yields -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0091 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-2, -1);
      logInfo(`openDescriptors(fd=-2, fd64=-1) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(-2);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0091 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0092
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0092
     * @tc.desc      RawfilePageState.openDescriptors(fd=-2, fd64=1) yields -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0092 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-2, 1);
      logInfo(`openDescriptors(fd=-2, fd64=1) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(-2);
      logInfo(`openDescriptors(fd=-2, fd64=1) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(1);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0092 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0093
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0093
     * @tc.desc      RawfilePageState.openDescriptors(fd=-2, fd64=-2) yields -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0093 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-2, -2);
      logInfo(`openDescriptors(fd=-2, fd64=-2) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(-2);
      logInfo(`openDescriptors(fd=-2, fd64=-2) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(-2);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0093 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0094
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0094
     * @tc.desc      RawfilePageState.openDescriptors(fd=-2, fd64=2) yields -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0094 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-2, 2);
      logInfo(`openDescriptors(fd=-2, fd64=2) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(-2);
      logInfo(`openDescriptors(fd=-2, fd64=2) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0094 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0095
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0095
     * @tc.desc      RawfilePageState.openDescriptors(fd=-2, fd64=3) yields -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0095 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-2, 3);
      logInfo(`openDescriptors(fd=-2, fd64=3) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(-2);
      logInfo(`openDescriptors(fd=-2, fd64=3) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(3);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0095 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0096
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0096
     * @tc.desc      RawfilePageState.openDescriptors(fd=-2, fd64=10) yields -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0096 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-2, 10);
      logInfo(`openDescriptors(fd=-2, fd64=10) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(-2);
      logInfo(`openDescriptors(fd=-2, fd64=10) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(10);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0096 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0097
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0097
     * @tc.desc      RawfilePageState.openDescriptors(fd=-2, fd64=100) yields -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0097 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-2, 100);
      logInfo(`openDescriptors(fd=-2, fd64=100) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(-2);
      logInfo(`openDescriptors(fd=-2, fd64=100) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(100);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0097 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0098
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0098
     * @tc.desc      RawfilePageState.openDescriptors(fd=-2, fd64=5) yields -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0098 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-2, 5);
      logInfo(`openDescriptors(fd=-2, fd64=5) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(-2);
      logInfo(`openDescriptors(fd=-2, fd64=5) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(5);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0098 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0099
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0099
     * @tc.desc      RawfilePageState.openDescriptors(fd=-2, fd64=15) yields -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0099 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-2, 15);
      logInfo(`openDescriptors(fd=-2, fd64=15) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(-2);
      logInfo(`openDescriptors(fd=-2, fd64=15) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(15);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0099 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0100
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0100
     * @tc.desc      RawfilePageState.openDescriptors(fd=-2, fd64=20) yields -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0100 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-2, 20);
      logInfo(`openDescriptors(fd=-2, fd64=20) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(-2);
      logInfo(`openDescriptors(fd=-2, fd64=20) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(20);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0100 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0101
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0101
     * @tc.desc      RawfilePageState.openDescriptors(fd=-2, fd64=25) yields -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0101 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-2, 25);
      logInfo(`openDescriptors(fd=-2, fd64=25) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(-2);
      logInfo(`openDescriptors(fd=-2, fd64=25) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(25);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0101 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0102
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0102
     * @tc.desc      RawfilePageState.openDescriptors(fd=-2, fd64=30) yields -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0102 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-2, 30);
      logInfo(`openDescriptors(fd=-2, fd64=30) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(-2);
      logInfo(`openDescriptors(fd=-2, fd64=30) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(30);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0102 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0103
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0103
     * @tc.desc      RawfilePageState.openDescriptors(fd=-2, fd64=35) yields -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0103 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-2, 35);
      logInfo(`openDescriptors(fd=-2, fd64=35) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(-2);
      logInfo(`openDescriptors(fd=-2, fd64=35) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(35);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0103 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0104
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0104
     * @tc.desc      RawfilePageState.openDescriptors(fd=-2, fd64=40) yields -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0104 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-2, 40);
      logInfo(`openDescriptors(fd=-2, fd64=40) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(-2);
      logInfo(`openDescriptors(fd=-2, fd64=40) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(40);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0104 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0105
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0105
     * @tc.desc      RawfilePageState.openDescriptors(fd=-2, fd64=45) yields -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0105 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-2, 45);
      logInfo(`openDescriptors(fd=-2, fd64=45) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(-2);
      logInfo(`openDescriptors(fd=-2, fd64=45) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(45);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0105 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0106
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0106
     * @tc.desc      RawfilePageState.openDescriptors(fd=-2, fd64=50) yields -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0106 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-2, 50);
      logInfo(`openDescriptors(fd=-2, fd64=50) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(-2);
      logInfo(`openDescriptors(fd=-2, fd64=50) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(50);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0106 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0107
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0107
     * @tc.desc      RawfilePageState.openDescriptors(fd=-2, fd64=55) yields -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0107 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-2, 55);
      logInfo(`openDescriptors(fd=-2, fd64=55) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(-2);
      logInfo(`openDescriptors(fd=-2, fd64=55) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(55);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0107 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0108
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0108
     * @tc.desc      RawfilePageState.openDescriptors(fd=-2, fd64=60) yields -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0108 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-2, 60);
      logInfo(`openDescriptors(fd=-2, fd64=60) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(-2);
      logInfo(`openDescriptors(fd=-2, fd64=60) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(60);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0108 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0109
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0109
     * @tc.desc      RawfilePageState.openDescriptors(fd=-2, fd64=65) yields -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0109 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-2, 65);
      logInfo(`openDescriptors(fd=-2, fd64=65) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(-2);
      logInfo(`openDescriptors(fd=-2, fd64=65) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(65);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0109 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0110
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0110
     * @tc.desc      RawfilePageState.openDescriptors(fd=-2, fd64=70) yields -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0110 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-2, 70);
      logInfo(`openDescriptors(fd=-2, fd64=70) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(-2);
      logInfo(`openDescriptors(fd=-2, fd64=70) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(70);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0110 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0111
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0111
     * @tc.desc      RawfilePageState.openDescriptors(fd=-2, fd64=75) yields -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0111 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-2, 75);
      logInfo(`openDescriptors(fd=-2, fd64=75) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(-2);
      logInfo(`openDescriptors(fd=-2, fd64=75) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(75);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0111 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0112
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0112
     * @tc.desc      RawfilePageState.openDescriptors(fd=-2, fd64=80) yields -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0112 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-2, 80);
      logInfo(`openDescriptors(fd=-2, fd64=80) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(-2);
      logInfo(`openDescriptors(fd=-2, fd64=80) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(80);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0112 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0113
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0113
     * @tc.desc      RawfilePageState.openDescriptors(fd=-2, fd64=85) yields -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0113 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-2, 85);
      logInfo(`openDescriptors(fd=-2, fd64=85) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(-2);
      logInfo(`openDescriptors(fd=-2, fd64=85) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(85);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0113 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0114
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0114
     * @tc.desc      RawfilePageState.openDescriptors(fd=-2, fd64=90) yields -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0114 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-2, 90);
      logInfo(`openDescriptors(fd=-2, fd64=90) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(-2);
      logInfo(`openDescriptors(fd=-2, fd64=90) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(90);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0114 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0115
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0115
     * @tc.desc      RawfilePageState.openDescriptors(fd=-2, fd64=95) yields -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0115 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-2, 95);
      logInfo(`openDescriptors(fd=-2, fd64=95) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(-2);
      logInfo(`openDescriptors(fd=-2, fd64=95) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(95);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0115 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0116
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0116
     * @tc.desc      RawfilePageState.openDescriptors(fd=-2, fd64=105) yields -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0116 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-2, 105);
      logInfo(`openDescriptors(fd=-2, fd64=105) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(-2);
      logInfo(`openDescriptors(fd=-2, fd64=105) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(105);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0116 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0117
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0117
     * @tc.desc      RawfilePageState.openDescriptors(fd=-2, fd64=110) yields -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0117 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-2, 110);
      logInfo(`openDescriptors(fd=-2, fd64=110) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(-2);
      logInfo(`openDescriptors(fd=-2, fd64=110) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(110);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0117 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0118
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0118
     * @tc.desc      RawfilePageState.openDescriptors(fd=-2, fd64=52.51) yields -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0118 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-2, 52.51);
      logInfo(`openDescriptors(fd=-2, fd64=52.51) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(-2);
      logInfo(`openDescriptors(fd=-2, fd64=52.51) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertClose(52.51, PRECISION);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0118 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0119
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0119
     * @tc.desc      RawfilePageState.openDescriptors(fd=-2, fd64=182) yields -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0119 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-2, 182);
      logInfo(`openDescriptors(fd=-2, fd64=182) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(-2);
      logInfo(`openDescriptors(fd=-2, fd64=182) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(182);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0119 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0120
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0120
     * @tc.desc      RawfilePageState.openDescriptors(fd=2, fd64=0) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0120 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(2, 0);
      logInfo(`openDescriptors(fd=2, fd64=0) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`openDescriptors(fd=2, fd64=0) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(0);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0120 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0121
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0121
     * @tc.desc      RawfilePageState.openDescriptors(fd=2, fd64=-1) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0121 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(2, -1);
      logInfo(`openDescriptors(fd=2, fd64=-1) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0121 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0122
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0122
     * @tc.desc      RawfilePageState.openDescriptors(fd=2, fd64=1) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0122 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(2, 1);
      logInfo(`openDescriptors(fd=2, fd64=1) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`openDescriptors(fd=2, fd64=1) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(1);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0122 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0123
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0123
     * @tc.desc      RawfilePageState.openDescriptors(fd=2, fd64=-2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0123 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(2, -2);
      logInfo(`openDescriptors(fd=2, fd64=-2) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`openDescriptors(fd=2, fd64=-2) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(-2);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0123 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0124
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0124
     * @tc.desc      RawfilePageState.openDescriptors(fd=2, fd64=2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0124 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(2, 2);
      logInfo(`openDescriptors(fd=2, fd64=2) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`openDescriptors(fd=2, fd64=2) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0124 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0125
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0125
     * @tc.desc      RawfilePageState.openDescriptors(fd=2, fd64=3) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0125 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(2, 3);
      logInfo(`openDescriptors(fd=2, fd64=3) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`openDescriptors(fd=2, fd64=3) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(3);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0125 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0126
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0126
     * @tc.desc      RawfilePageState.openDescriptors(fd=2, fd64=10) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0126 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(2, 10);
      logInfo(`openDescriptors(fd=2, fd64=10) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`openDescriptors(fd=2, fd64=10) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(10);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0126 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0127
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0127
     * @tc.desc      RawfilePageState.openDescriptors(fd=2, fd64=100) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0127 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(2, 100);
      logInfo(`openDescriptors(fd=2, fd64=100) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`openDescriptors(fd=2, fd64=100) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(100);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0127 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0128
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0128
     * @tc.desc      RawfilePageState.openDescriptors(fd=2, fd64=5) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0128 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(2, 5);
      logInfo(`openDescriptors(fd=2, fd64=5) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`openDescriptors(fd=2, fd64=5) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(5);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0128 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0129
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0129
     * @tc.desc      RawfilePageState.openDescriptors(fd=2, fd64=15) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0129 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(2, 15);
      logInfo(`openDescriptors(fd=2, fd64=15) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`openDescriptors(fd=2, fd64=15) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(15);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0129 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0130
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0130
     * @tc.desc      RawfilePageState.openDescriptors(fd=2, fd64=20) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0130 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(2, 20);
      logInfo(`openDescriptors(fd=2, fd64=20) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`openDescriptors(fd=2, fd64=20) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(20);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0130 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0131
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0131
     * @tc.desc      RawfilePageState.openDescriptors(fd=2, fd64=25) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0131 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(2, 25);
      logInfo(`openDescriptors(fd=2, fd64=25) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`openDescriptors(fd=2, fd64=25) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(25);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0131 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0132
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0132
     * @tc.desc      RawfilePageState.openDescriptors(fd=2, fd64=30) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0132 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(2, 30);
      logInfo(`openDescriptors(fd=2, fd64=30) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`openDescriptors(fd=2, fd64=30) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(30);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0132 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0133
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0133
     * @tc.desc      RawfilePageState.openDescriptors(fd=2, fd64=35) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0133 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(2, 35);
      logInfo(`openDescriptors(fd=2, fd64=35) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`openDescriptors(fd=2, fd64=35) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(35);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0133 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0134
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0134
     * @tc.desc      RawfilePageState.openDescriptors(fd=2, fd64=40) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0134 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(2, 40);
      logInfo(`openDescriptors(fd=2, fd64=40) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`openDescriptors(fd=2, fd64=40) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(40);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0134 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0135
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0135
     * @tc.desc      RawfilePageState.openDescriptors(fd=2, fd64=45) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0135 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(2, 45);
      logInfo(`openDescriptors(fd=2, fd64=45) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`openDescriptors(fd=2, fd64=45) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(45);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0135 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0136
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0136
     * @tc.desc      RawfilePageState.openDescriptors(fd=2, fd64=50) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0136 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(2, 50);
      logInfo(`openDescriptors(fd=2, fd64=50) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`openDescriptors(fd=2, fd64=50) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(50);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0136 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0137
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0137
     * @tc.desc      RawfilePageState.openDescriptors(fd=2, fd64=55) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0137 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(2, 55);
      logInfo(`openDescriptors(fd=2, fd64=55) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`openDescriptors(fd=2, fd64=55) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(55);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0137 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0138
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0138
     * @tc.desc      RawfilePageState.openDescriptors(fd=2, fd64=60) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0138 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(2, 60);
      logInfo(`openDescriptors(fd=2, fd64=60) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`openDescriptors(fd=2, fd64=60) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(60);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0138 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0139
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0139
     * @tc.desc      RawfilePageState.openDescriptors(fd=2, fd64=65) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0139 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(2, 65);
      logInfo(`openDescriptors(fd=2, fd64=65) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`openDescriptors(fd=2, fd64=65) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(65);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0139 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0140
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0140
     * @tc.desc      RawfilePageState.openDescriptors(fd=2, fd64=70) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0140 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(2, 70);
      logInfo(`openDescriptors(fd=2, fd64=70) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`openDescriptors(fd=2, fd64=70) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(70);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0140 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0141
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0141
     * @tc.desc      RawfilePageState.openDescriptors(fd=2, fd64=75) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0141 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(2, 75);
      logInfo(`openDescriptors(fd=2, fd64=75) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`openDescriptors(fd=2, fd64=75) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(75);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0141 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0142
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0142
     * @tc.desc      RawfilePageState.openDescriptors(fd=2, fd64=80) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0142 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(2, 80);
      logInfo(`openDescriptors(fd=2, fd64=80) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`openDescriptors(fd=2, fd64=80) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(80);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0142 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0143
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0143
     * @tc.desc      RawfilePageState.openDescriptors(fd=2, fd64=85) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0143 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(2, 85);
      logInfo(`openDescriptors(fd=2, fd64=85) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`openDescriptors(fd=2, fd64=85) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(85);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0143 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0144
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0144
     * @tc.desc      RawfilePageState.openDescriptors(fd=2, fd64=90) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0144 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(2, 90);
      logInfo(`openDescriptors(fd=2, fd64=90) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`openDescriptors(fd=2, fd64=90) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(90);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0144 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0145
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0145
     * @tc.desc      RawfilePageState.openDescriptors(fd=2, fd64=95) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0145 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(2, 95);
      logInfo(`openDescriptors(fd=2, fd64=95) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`openDescriptors(fd=2, fd64=95) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(95);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0145 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0146
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0146
     * @tc.desc      RawfilePageState.openDescriptors(fd=2, fd64=105) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0146 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(2, 105);
      logInfo(`openDescriptors(fd=2, fd64=105) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`openDescriptors(fd=2, fd64=105) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(105);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0146 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0147
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0147
     * @tc.desc      RawfilePageState.openDescriptors(fd=2, fd64=110) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0147 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(2, 110);
      logInfo(`openDescriptors(fd=2, fd64=110) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`openDescriptors(fd=2, fd64=110) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(110);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0147 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0148
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0148
     * @tc.desc      RawfilePageState.openDescriptors(fd=2, fd64=52.51) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0148 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(2, 52.51);
      logInfo(`openDescriptors(fd=2, fd64=52.51) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`openDescriptors(fd=2, fd64=52.51) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertClose(52.51, PRECISION);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0148 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0149
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0149
     * @tc.desc      RawfilePageState.openDescriptors(fd=2, fd64=182) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0149 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(2, 182);
      logInfo(`openDescriptors(fd=2, fd64=182) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(2);
      logInfo(`openDescriptors(fd=2, fd64=182) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(182);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0149 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0150
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0150
     * @tc.desc      RawfilePageState.openDescriptors(fd=3, fd64=0) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0150 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(3, 0);
      logInfo(`openDescriptors(fd=3, fd64=0) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(3);
      logInfo(`openDescriptors(fd=3, fd64=0) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(0);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0150 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0151
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0151
     * @tc.desc      RawfilePageState.openDescriptors(fd=3, fd64=-1) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0151 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(3, -1);
      logInfo(`openDescriptors(fd=3, fd64=-1) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(3);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0151 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0152
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0152
     * @tc.desc      RawfilePageState.openDescriptors(fd=3, fd64=1) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0152 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(3, 1);
      logInfo(`openDescriptors(fd=3, fd64=1) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(3);
      logInfo(`openDescriptors(fd=3, fd64=1) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(1);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0152 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0153
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0153
     * @tc.desc      RawfilePageState.openDescriptors(fd=3, fd64=-2) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0153 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(3, -2);
      logInfo(`openDescriptors(fd=3, fd64=-2) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(3);
      logInfo(`openDescriptors(fd=3, fd64=-2) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(-2);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0153 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0154
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0154
     * @tc.desc      RawfilePageState.openDescriptors(fd=3, fd64=2) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0154 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(3, 2);
      logInfo(`openDescriptors(fd=3, fd64=2) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(3);
      logInfo(`openDescriptors(fd=3, fd64=2) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0154 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0155
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0155
     * @tc.desc      RawfilePageState.openDescriptors(fd=3, fd64=3) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0155 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(3, 3);
      logInfo(`openDescriptors(fd=3, fd64=3) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(3);
      logInfo(`openDescriptors(fd=3, fd64=3) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(3);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0155 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0156
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0156
     * @tc.desc      RawfilePageState.openDescriptors(fd=3, fd64=10) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0156 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(3, 10);
      logInfo(`openDescriptors(fd=3, fd64=10) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(3);
      logInfo(`openDescriptors(fd=3, fd64=10) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(10);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0156 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0157
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0157
     * @tc.desc      RawfilePageState.openDescriptors(fd=3, fd64=100) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0157 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(3, 100);
      logInfo(`openDescriptors(fd=3, fd64=100) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(3);
      logInfo(`openDescriptors(fd=3, fd64=100) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(100);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0157 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0158
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0158
     * @tc.desc      RawfilePageState.openDescriptors(fd=3, fd64=5) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0158 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(3, 5);
      logInfo(`openDescriptors(fd=3, fd64=5) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(3);
      logInfo(`openDescriptors(fd=3, fd64=5) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(5);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0158 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0159
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0159
     * @tc.desc      RawfilePageState.openDescriptors(fd=3, fd64=15) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0159 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(3, 15);
      logInfo(`openDescriptors(fd=3, fd64=15) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(3);
      logInfo(`openDescriptors(fd=3, fd64=15) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(15);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0159 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0160
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0160
     * @tc.desc      RawfilePageState.openDescriptors(fd=3, fd64=20) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0160 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(3, 20);
      logInfo(`openDescriptors(fd=3, fd64=20) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(3);
      logInfo(`openDescriptors(fd=3, fd64=20) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(20);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0160 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0161
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0161
     * @tc.desc      RawfilePageState.openDescriptors(fd=3, fd64=25) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0161 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(3, 25);
      logInfo(`openDescriptors(fd=3, fd64=25) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(3);
      logInfo(`openDescriptors(fd=3, fd64=25) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(25);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0161 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0162
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0162
     * @tc.desc      RawfilePageState.openDescriptors(fd=3, fd64=30) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0162 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(3, 30);
      logInfo(`openDescriptors(fd=3, fd64=30) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(3);
      logInfo(`openDescriptors(fd=3, fd64=30) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(30);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0162 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0163
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0163
     * @tc.desc      RawfilePageState.openDescriptors(fd=3, fd64=35) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0163 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(3, 35);
      logInfo(`openDescriptors(fd=3, fd64=35) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(3);
      logInfo(`openDescriptors(fd=3, fd64=35) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(35);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0163 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0164
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0164
     * @tc.desc      RawfilePageState.openDescriptors(fd=3, fd64=40) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0164 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(3, 40);
      logInfo(`openDescriptors(fd=3, fd64=40) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(3);
      logInfo(`openDescriptors(fd=3, fd64=40) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(40);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0164 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0165
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0165
     * @tc.desc      RawfilePageState.openDescriptors(fd=3, fd64=45) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0165 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(3, 45);
      logInfo(`openDescriptors(fd=3, fd64=45) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(3);
      logInfo(`openDescriptors(fd=3, fd64=45) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(45);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0165 end`);
    });
  });
}
