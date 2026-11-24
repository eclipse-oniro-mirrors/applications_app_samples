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

/** Logic checks for RawfilePageState.openDescriptors (84 cases). */
export default function rawfilePageStateOpenDescriptorsTest(): void {
  describe('RawfilePageStateOpenDescriptorsTest', () => {

    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0001
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0001
     * @tc.desc      RawfilePageState.openDescriptors(fd=0, fd64=0) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0001 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 0);
      logInfo(`openDescriptors(fd=0, fd64=0) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`openDescriptors(fd=0, fd64=0) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(0);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0002
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0002
     * @tc.desc      RawfilePageState.openDescriptors(fd=0, fd64=-1) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0002 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, -1);
      logInfo(`openDescriptors(fd=0, fd64=-1) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0003
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0003
     * @tc.desc      RawfilePageState.openDescriptors(fd=0, fd64=1) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0003 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 1);
      logInfo(`openDescriptors(fd=0, fd64=1) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`openDescriptors(fd=0, fd64=1) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(1);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0004
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0004
     * @tc.desc      RawfilePageState.openDescriptors(fd=0, fd64=-2) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0004 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, -2);
      logInfo(`openDescriptors(fd=0, fd64=-2) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`openDescriptors(fd=0, fd64=-2) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(-2);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0005
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0005
     * @tc.desc      RawfilePageState.openDescriptors(fd=0, fd64=2) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0005 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 2);
      logInfo(`openDescriptors(fd=0, fd64=2) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`openDescriptors(fd=0, fd64=2) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0006
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0006
     * @tc.desc      RawfilePageState.openDescriptors(fd=0, fd64=3) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0006 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 3);
      logInfo(`openDescriptors(fd=0, fd64=3) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`openDescriptors(fd=0, fd64=3) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(3);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0007
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0007
     * @tc.desc      RawfilePageState.openDescriptors(fd=0, fd64=10) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0007 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 10);
      logInfo(`openDescriptors(fd=0, fd64=10) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`openDescriptors(fd=0, fd64=10) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(10);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0007 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0008
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0008
     * @tc.desc      RawfilePageState.openDescriptors(fd=0, fd64=100) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0008 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 100);
      logInfo(`openDescriptors(fd=0, fd64=100) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`openDescriptors(fd=0, fd64=100) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(100);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0008 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0009
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0009
     * @tc.desc      RawfilePageState.openDescriptors(fd=0, fd64=5) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0009 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 5);
      logInfo(`openDescriptors(fd=0, fd64=5) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`openDescriptors(fd=0, fd64=5) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(5);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0009 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0010
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0010
     * @tc.desc      RawfilePageState.openDescriptors(fd=0, fd64=15) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0010 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 15);
      logInfo(`openDescriptors(fd=0, fd64=15) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`openDescriptors(fd=0, fd64=15) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(15);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0010 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0011
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0011
     * @tc.desc      RawfilePageState.openDescriptors(fd=0, fd64=20) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0011 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 20);
      logInfo(`openDescriptors(fd=0, fd64=20) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`openDescriptors(fd=0, fd64=20) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(20);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0011 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0012
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0012
     * @tc.desc      RawfilePageState.openDescriptors(fd=0, fd64=25) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0012 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 25);
      logInfo(`openDescriptors(fd=0, fd64=25) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`openDescriptors(fd=0, fd64=25) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(25);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0012 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0013
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0013
     * @tc.desc      RawfilePageState.openDescriptors(fd=0, fd64=30) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0013 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 30);
      logInfo(`openDescriptors(fd=0, fd64=30) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`openDescriptors(fd=0, fd64=30) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(30);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0013 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0014
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0014
     * @tc.desc      RawfilePageState.openDescriptors(fd=0, fd64=35) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0014 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 35);
      logInfo(`openDescriptors(fd=0, fd64=35) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`openDescriptors(fd=0, fd64=35) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(35);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0014 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0015
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0015
     * @tc.desc      RawfilePageState.openDescriptors(fd=0, fd64=40) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0015 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 40);
      logInfo(`openDescriptors(fd=0, fd64=40) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`openDescriptors(fd=0, fd64=40) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(40);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0015 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0016
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0016
     * @tc.desc      RawfilePageState.openDescriptors(fd=0, fd64=45) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0016 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 45);
      logInfo(`openDescriptors(fd=0, fd64=45) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`openDescriptors(fd=0, fd64=45) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(45);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0016 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0017
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0017
     * @tc.desc      RawfilePageState.openDescriptors(fd=0, fd64=50) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0017 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 50);
      logInfo(`openDescriptors(fd=0, fd64=50) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`openDescriptors(fd=0, fd64=50) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(50);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0017 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0018
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0018
     * @tc.desc      RawfilePageState.openDescriptors(fd=0, fd64=55) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0018 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 55);
      logInfo(`openDescriptors(fd=0, fd64=55) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`openDescriptors(fd=0, fd64=55) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(55);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0018 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0019
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0019
     * @tc.desc      RawfilePageState.openDescriptors(fd=0, fd64=60) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0019 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 60);
      logInfo(`openDescriptors(fd=0, fd64=60) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`openDescriptors(fd=0, fd64=60) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(60);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0019 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0020
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0020
     * @tc.desc      RawfilePageState.openDescriptors(fd=0, fd64=65) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0020 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 65);
      logInfo(`openDescriptors(fd=0, fd64=65) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`openDescriptors(fd=0, fd64=65) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(65);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0020 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0021
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0021
     * @tc.desc      RawfilePageState.openDescriptors(fd=0, fd64=70) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0021 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 70);
      logInfo(`openDescriptors(fd=0, fd64=70) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`openDescriptors(fd=0, fd64=70) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(70);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0021 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0022
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0022
     * @tc.desc      RawfilePageState.openDescriptors(fd=0, fd64=75) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0022 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 75);
      logInfo(`openDescriptors(fd=0, fd64=75) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`openDescriptors(fd=0, fd64=75) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(75);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0022 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0023
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0023
     * @tc.desc      RawfilePageState.openDescriptors(fd=0, fd64=80) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0023 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 80);
      logInfo(`openDescriptors(fd=0, fd64=80) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`openDescriptors(fd=0, fd64=80) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(80);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0023 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0024
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0024
     * @tc.desc      RawfilePageState.openDescriptors(fd=0, fd64=85) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0024 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 85);
      logInfo(`openDescriptors(fd=0, fd64=85) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`openDescriptors(fd=0, fd64=85) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(85);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0024 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0025
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0025
     * @tc.desc      RawfilePageState.openDescriptors(fd=0, fd64=90) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0025 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 90);
      logInfo(`openDescriptors(fd=0, fd64=90) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`openDescriptors(fd=0, fd64=90) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(90);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0025 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0026
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0026
     * @tc.desc      RawfilePageState.openDescriptors(fd=0, fd64=95) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0026 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 95);
      logInfo(`openDescriptors(fd=0, fd64=95) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`openDescriptors(fd=0, fd64=95) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(95);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0026 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0027
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0027
     * @tc.desc      RawfilePageState.openDescriptors(fd=0, fd64=105) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0027 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 105);
      logInfo(`openDescriptors(fd=0, fd64=105) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`openDescriptors(fd=0, fd64=105) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(105);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0027 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0028
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0028
     * @tc.desc      RawfilePageState.openDescriptors(fd=0, fd64=110) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0028 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 110);
      logInfo(`openDescriptors(fd=0, fd64=110) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`openDescriptors(fd=0, fd64=110) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(110);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0028 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0029
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0029
     * @tc.desc      RawfilePageState.openDescriptors(fd=0, fd64=52.51) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0029 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 52.51);
      logInfo(`openDescriptors(fd=0, fd64=52.51) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`openDescriptors(fd=0, fd64=52.51) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertClose(52.51, PRECISION);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0029 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0030
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0030
     * @tc.desc      RawfilePageState.openDescriptors(fd=0, fd64=182) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0030 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(0, 182);
      logInfo(`openDescriptors(fd=0, fd64=182) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(0);
      logInfo(`openDescriptors(fd=0, fd64=182) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(182);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0030 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0031
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0031
     * @tc.desc      RawfilePageState.openDescriptors(fd=-1, fd64=0) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0031 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-1, 0);
      logInfo(`openDescriptors(fd=-1, fd64=0) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(0);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0031 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0032
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0032
     * @tc.desc      RawfilePageState.openDescriptors(fd=-1, fd64=1) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0032 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-1, 1);
      logInfo(`openDescriptors(fd=-1, fd64=1) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(1);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0032 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0033
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0033
     * @tc.desc      RawfilePageState.openDescriptors(fd=-1, fd64=-2) yields -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0033 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-1, -2);
      logInfo(`openDescriptors(fd=-1, fd64=-2) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(-2);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0033 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0034
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0034
     * @tc.desc      RawfilePageState.openDescriptors(fd=-1, fd64=2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0034 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-1, 2);
      logInfo(`openDescriptors(fd=-1, fd64=2) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0034 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0035
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0035
     * @tc.desc      RawfilePageState.openDescriptors(fd=-1, fd64=3) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0035 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-1, 3);
      logInfo(`openDescriptors(fd=-1, fd64=3) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(3);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0035 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0036
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0036
     * @tc.desc      RawfilePageState.openDescriptors(fd=-1, fd64=10) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0036 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-1, 10);
      logInfo(`openDescriptors(fd=-1, fd64=10) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(10);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0036 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0037
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0037
     * @tc.desc      RawfilePageState.openDescriptors(fd=-1, fd64=100) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0037 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-1, 100);
      logInfo(`openDescriptors(fd=-1, fd64=100) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(100);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0037 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0038
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0038
     * @tc.desc      RawfilePageState.openDescriptors(fd=-1, fd64=5) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0038 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-1, 5);
      logInfo(`openDescriptors(fd=-1, fd64=5) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(5);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0038 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0039
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0039
     * @tc.desc      RawfilePageState.openDescriptors(fd=-1, fd64=15) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0039 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-1, 15);
      logInfo(`openDescriptors(fd=-1, fd64=15) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(15);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0039 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0040
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0040
     * @tc.desc      RawfilePageState.openDescriptors(fd=-1, fd64=20) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0040 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-1, 20);
      logInfo(`openDescriptors(fd=-1, fd64=20) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(20);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0040 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0041
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0041
     * @tc.desc      RawfilePageState.openDescriptors(fd=-1, fd64=25) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0041 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-1, 25);
      logInfo(`openDescriptors(fd=-1, fd64=25) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(25);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0041 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0042
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0042
     * @tc.desc      RawfilePageState.openDescriptors(fd=-1, fd64=30) yields 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0042 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-1, 30);
      logInfo(`openDescriptors(fd=-1, fd64=30) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(30);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0042 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0043
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0043
     * @tc.desc      RawfilePageState.openDescriptors(fd=-1, fd64=35) yields 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0043 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-1, 35);
      logInfo(`openDescriptors(fd=-1, fd64=35) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(35);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0043 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0044
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0044
     * @tc.desc      RawfilePageState.openDescriptors(fd=-1, fd64=40) yields 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0044 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-1, 40);
      logInfo(`openDescriptors(fd=-1, fd64=40) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(40);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0044 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0045
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0045
     * @tc.desc      RawfilePageState.openDescriptors(fd=-1, fd64=45) yields 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0045 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-1, 45);
      logInfo(`openDescriptors(fd=-1, fd64=45) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(45);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0045 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0046
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0046
     * @tc.desc      RawfilePageState.openDescriptors(fd=-1, fd64=50) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0046 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-1, 50);
      logInfo(`openDescriptors(fd=-1, fd64=50) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(50);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0046 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0047
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0047
     * @tc.desc      RawfilePageState.openDescriptors(fd=-1, fd64=55) yields 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0047 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-1, 55);
      logInfo(`openDescriptors(fd=-1, fd64=55) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(55);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0047 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0048
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0048
     * @tc.desc      RawfilePageState.openDescriptors(fd=-1, fd64=60) yields 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0048 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-1, 60);
      logInfo(`openDescriptors(fd=-1, fd64=60) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(60);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0048 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0049
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0049
     * @tc.desc      RawfilePageState.openDescriptors(fd=-1, fd64=65) yields 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0049 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-1, 65);
      logInfo(`openDescriptors(fd=-1, fd64=65) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(65);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0049 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0050
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0050
     * @tc.desc      RawfilePageState.openDescriptors(fd=-1, fd64=70) yields 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0050 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-1, 70);
      logInfo(`openDescriptors(fd=-1, fd64=70) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(70);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0050 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0051
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0051
     * @tc.desc      RawfilePageState.openDescriptors(fd=-1, fd64=75) yields 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0051 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-1, 75);
      logInfo(`openDescriptors(fd=-1, fd64=75) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(75);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0051 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0052
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0052
     * @tc.desc      RawfilePageState.openDescriptors(fd=-1, fd64=80) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0052 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-1, 80);
      logInfo(`openDescriptors(fd=-1, fd64=80) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(80);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0052 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0053
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0053
     * @tc.desc      RawfilePageState.openDescriptors(fd=-1, fd64=85) yields 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0053 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-1, 85);
      logInfo(`openDescriptors(fd=-1, fd64=85) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(85);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0053 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0054
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0054
     * @tc.desc      RawfilePageState.openDescriptors(fd=-1, fd64=90) yields 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0054 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-1, 90);
      logInfo(`openDescriptors(fd=-1, fd64=90) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(90);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0054 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0055
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0055
     * @tc.desc      RawfilePageState.openDescriptors(fd=-1, fd64=95) yields 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0055 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-1, 95);
      logInfo(`openDescriptors(fd=-1, fd64=95) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(95);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0055 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0056
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0056
     * @tc.desc      RawfilePageState.openDescriptors(fd=-1, fd64=105) yields 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0056 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-1, 105);
      logInfo(`openDescriptors(fd=-1, fd64=105) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(105);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0056 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0057
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0057
     * @tc.desc      RawfilePageState.openDescriptors(fd=-1, fd64=110) yields 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0057 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-1, 110);
      logInfo(`openDescriptors(fd=-1, fd64=110) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(110);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0057 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0058
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0058
     * @tc.desc      RawfilePageState.openDescriptors(fd=-1, fd64=52.51) yields 52.51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0058 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-1, 52.51);
      logInfo(`openDescriptors(fd=-1, fd64=52.51) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertClose(52.51, PRECISION);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0058 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0059
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0059
     * @tc.desc      RawfilePageState.openDescriptors(fd=-1, fd64=182) yields 182
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0059 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(-1, 182);
      logInfo(`openDescriptors(fd=-1, fd64=182) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(182);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0059 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0060
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0060
     * @tc.desc      RawfilePageState.openDescriptors(fd=1, fd64=0) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0060 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(1, 0);
      logInfo(`openDescriptors(fd=1, fd64=0) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`openDescriptors(fd=1, fd64=0) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(0);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0060 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0061
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0061
     * @tc.desc      RawfilePageState.openDescriptors(fd=1, fd64=-1) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0061 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(1, -1);
      logInfo(`openDescriptors(fd=1, fd64=-1) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0061 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0062
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0062
     * @tc.desc      RawfilePageState.openDescriptors(fd=1, fd64=1) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0062 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(1, 1);
      logInfo(`openDescriptors(fd=1, fd64=1) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`openDescriptors(fd=1, fd64=1) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(1);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0062 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0063
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0063
     * @tc.desc      RawfilePageState.openDescriptors(fd=1, fd64=-2) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0063 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(1, -2);
      logInfo(`openDescriptors(fd=1, fd64=-2) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`openDescriptors(fd=1, fd64=-2) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(-2);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0063 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0064
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0064
     * @tc.desc      RawfilePageState.openDescriptors(fd=1, fd64=2) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0064 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(1, 2);
      logInfo(`openDescriptors(fd=1, fd64=2) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`openDescriptors(fd=1, fd64=2) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(2);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0064 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0065
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0065
     * @tc.desc      RawfilePageState.openDescriptors(fd=1, fd64=3) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0065 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(1, 3);
      logInfo(`openDescriptors(fd=1, fd64=3) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`openDescriptors(fd=1, fd64=3) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(3);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0065 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0066
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0066
     * @tc.desc      RawfilePageState.openDescriptors(fd=1, fd64=10) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0066 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(1, 10);
      logInfo(`openDescriptors(fd=1, fd64=10) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`openDescriptors(fd=1, fd64=10) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(10);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0066 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0067
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0067
     * @tc.desc      RawfilePageState.openDescriptors(fd=1, fd64=100) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0067 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(1, 100);
      logInfo(`openDescriptors(fd=1, fd64=100) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`openDescriptors(fd=1, fd64=100) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(100);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0067 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0068
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0068
     * @tc.desc      RawfilePageState.openDescriptors(fd=1, fd64=5) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0068 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(1, 5);
      logInfo(`openDescriptors(fd=1, fd64=5) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`openDescriptors(fd=1, fd64=5) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(5);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0068 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0069
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0069
     * @tc.desc      RawfilePageState.openDescriptors(fd=1, fd64=15) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0069 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(1, 15);
      logInfo(`openDescriptors(fd=1, fd64=15) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`openDescriptors(fd=1, fd64=15) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(15);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0069 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0070
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0070
     * @tc.desc      RawfilePageState.openDescriptors(fd=1, fd64=20) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0070 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(1, 20);
      logInfo(`openDescriptors(fd=1, fd64=20) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`openDescriptors(fd=1, fd64=20) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(20);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0070 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0071
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0071
     * @tc.desc      RawfilePageState.openDescriptors(fd=1, fd64=25) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0071 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(1, 25);
      logInfo(`openDescriptors(fd=1, fd64=25) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`openDescriptors(fd=1, fd64=25) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(25);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0071 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0072
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0072
     * @tc.desc      RawfilePageState.openDescriptors(fd=1, fd64=30) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0072 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(1, 30);
      logInfo(`openDescriptors(fd=1, fd64=30) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`openDescriptors(fd=1, fd64=30) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(30);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0072 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0073
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0073
     * @tc.desc      RawfilePageState.openDescriptors(fd=1, fd64=35) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0073 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(1, 35);
      logInfo(`openDescriptors(fd=1, fd64=35) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`openDescriptors(fd=1, fd64=35) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(35);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0073 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0074
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0074
     * @tc.desc      RawfilePageState.openDescriptors(fd=1, fd64=40) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0074 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(1, 40);
      logInfo(`openDescriptors(fd=1, fd64=40) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`openDescriptors(fd=1, fd64=40) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(40);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0074 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0075
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0075
     * @tc.desc      RawfilePageState.openDescriptors(fd=1, fd64=45) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0075 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(1, 45);
      logInfo(`openDescriptors(fd=1, fd64=45) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`openDescriptors(fd=1, fd64=45) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(45);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0075 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0076
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0076
     * @tc.desc      RawfilePageState.openDescriptors(fd=1, fd64=50) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0076 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(1, 50);
      logInfo(`openDescriptors(fd=1, fd64=50) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`openDescriptors(fd=1, fd64=50) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(50);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0076 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0077
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0077
     * @tc.desc      RawfilePageState.openDescriptors(fd=1, fd64=55) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0077 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(1, 55);
      logInfo(`openDescriptors(fd=1, fd64=55) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`openDescriptors(fd=1, fd64=55) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(55);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0077 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0078
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0078
     * @tc.desc      RawfilePageState.openDescriptors(fd=1, fd64=60) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0078 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(1, 60);
      logInfo(`openDescriptors(fd=1, fd64=60) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`openDescriptors(fd=1, fd64=60) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(60);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0078 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0079
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0079
     * @tc.desc      RawfilePageState.openDescriptors(fd=1, fd64=65) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0079 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(1, 65);
      logInfo(`openDescriptors(fd=1, fd64=65) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`openDescriptors(fd=1, fd64=65) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(65);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0079 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0080
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0080
     * @tc.desc      RawfilePageState.openDescriptors(fd=1, fd64=70) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0080 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(1, 70);
      logInfo(`openDescriptors(fd=1, fd64=70) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`openDescriptors(fd=1, fd64=70) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(70);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0080 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0081
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0081
     * @tc.desc      RawfilePageState.openDescriptors(fd=1, fd64=75) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0081 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(1, 75);
      logInfo(`openDescriptors(fd=1, fd64=75) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`openDescriptors(fd=1, fd64=75) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(75);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0081 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0082
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0082
     * @tc.desc      RawfilePageState.openDescriptors(fd=1, fd64=80) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0082 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(1, 80);
      logInfo(`openDescriptors(fd=1, fd64=80) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`openDescriptors(fd=1, fd64=80) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(80);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0082 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0083
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0083
     * @tc.desc      RawfilePageState.openDescriptors(fd=1, fd64=85) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0083 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(1, 85);
      logInfo(`openDescriptors(fd=1, fd64=85) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`openDescriptors(fd=1, fd64=85) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(85);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0083 end`);
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_RAWFILE_PAGE_STATE_OPEN_DESCRIPTORS_0084
     * @tc.name      NdkRawfile_RawfilePageStateOpenDescriptors_0084
     * @tc.desc      RawfilePageState.openDescriptors(fd=1, fd64=90) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkRawfile_RawfilePageStateOpenDescriptors_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0084 begin`);
      const subject: RawfilePageState = new RawfilePageState();
      subject.openDescriptors(1, 90);
      logInfo(`openDescriptors(fd=1, fd64=90) state: subject.fd=${subject.fd}`);
      expect(subject.fd).assertEqual(1);
      logInfo(`openDescriptors(fd=1, fd64=90) state: subject.fd64=${subject.fd64}`);
      expect(subject.fd64).assertEqual(90);
      logInfo(`${BUNDLE}RawfilePageStateOpenDescriptors_0084 end`);
    });
  });
}
