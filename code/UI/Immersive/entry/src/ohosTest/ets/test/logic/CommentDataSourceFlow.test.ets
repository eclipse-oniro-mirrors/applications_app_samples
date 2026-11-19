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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CommentDataSource } from '../../../../main/ets/bridge/ImmersiveBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Immersive]';
const BUNDLE: string = 'Immersive_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for CommentDataSource flow (66 cases). */
export default function commentDataSourceFlowTest(): void {
  describe('CommentDataSourceFlowTest', (): void => {
    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0001
     * @tc.name      Immersive_CommentDataSourceFlow_0001
     * @tc.desc      CommentDataSource call flow getData > pushItem > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Immersive_CommentDataSourceFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0001 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(51.57);
      logInfo(`step1 getData(51.57): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(90.73);
      subject.pushItem(-60);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0002
     * @tc.name      Immersive_CommentDataSourceFlow_0002
     * @tc.desc      CommentDataSource call flow pushItem > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Immersive_CommentDataSourceFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0002 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(3.46);
      const step2: number = subject.getData(21);
      logInfo(`step2 getData(21): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(80);
      logInfo(`step3 getData(80): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0003
     * @tc.name      Immersive_CommentDataSourceFlow_0003
     * @tc.desc      CommentDataSource call flow getData > getData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0003 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(-27);
      logInfo(`step1 getData(-27): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(-37);
      logInfo(`step2 getData(-37): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0004
     * @tc.name      Immersive_CommentDataSourceFlow_0004
     * @tc.desc      CommentDataSource call flow pushItem > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0004 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(90.73);
      const step2: number = subject.getData(-4);
      logInfo(`step2 getData(-4): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0005
     * @tc.name      Immersive_CommentDataSourceFlow_0005
     * @tc.desc      CommentDataSource call flow pushItem > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0005 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(98);
      const step2: number = subject.getData(45.86);
      logInfo(`step2 getData(45.86): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0006
     * @tc.name      Immersive_CommentDataSourceFlow_0006
     * @tc.desc      CommentDataSource call flow totalCount > pushItem > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0006 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushItem(62.47);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0007
     * @tc.name      Immersive_CommentDataSourceFlow_0007
     * @tc.desc      CommentDataSource call flow getData > pushItem > getData > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0007 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(105);
      logInfo(`step1 getData(105): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(79);
      const step3: number = subject.getData(54.89);
      logInfo(`step3 getData(54.89): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushItem(80);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0008
     * @tc.name      Immersive_CommentDataSourceFlow_0008
     * @tc.desc      CommentDataSource call flow pushItem > pushItem > pushItem > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0008 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(41);
      subject.pushItem(25);
      subject.pushItem(98.34);
      const step4: number = subject.getData(58.45);
      logInfo(`step4 getData(58.45): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0009
     * @tc.name      Immersive_CommentDataSourceFlow_0009
     * @tc.desc      CommentDataSource call flow totalCount > getData > pushItem > pushItem > getData keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0009 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.getData(75);
      logInfo(`step2 getData(75): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushItem(199);
      subject.pushItem(-18);
      const step5: number = subject.getData(49.89);
      logInfo(`step5 getData(49.89): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0010
     * @tc.name      Immersive_CommentDataSourceFlow_0010
     * @tc.desc      CommentDataSource call flow totalCount > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0010 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.getData(151);
      logInfo(`step2 getData(151): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(1.88);
      logInfo(`step3 getData(1.88): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0011
     * @tc.name      Immersive_CommentDataSourceFlow_0011
     * @tc.desc      CommentDataSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0011 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0012
     * @tc.name      Immersive_CommentDataSourceFlow_0012
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > pushItem > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0012 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.pushItem(21);
      const step4: number = subject.getData(-85);
      logInfo(`step4 getData(-85): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0013
     * @tc.name      Immersive_CommentDataSourceFlow_0013
     * @tc.desc      CommentDataSource call flow totalCount > pushItem > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0013 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      subject.pushItem(44);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0014
     * @tc.name      Immersive_CommentDataSourceFlow_0014
     * @tc.desc      CommentDataSource call flow totalCount > getData > pushItem > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0014 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.getData(-57);
      logInfo(`step2 getData(-57): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushItem(22);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(3);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0015
     * @tc.name      Immersive_CommentDataSourceFlow_0015
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > getData > getData > getData keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0015 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.getData(67.81);
      logInfo(`step3 getData(67.81): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.getData(-13);
      logInfo(`step4 getData(-13): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.getData(91);
      logInfo(`step5 getData(91): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0016
     * @tc.name      Immersive_CommentDataSourceFlow_0016
     * @tc.desc      CommentDataSource call flow totalCount > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0016 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      subject.pushItem(3.46);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0017
     * @tc.name      Immersive_CommentDataSourceFlow_0017
     * @tc.desc      CommentDataSource call flow pushItem > getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0017 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(-26);
      const step2: number = subject.getData(-68);
      logInfo(`step2 getData(-68): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(155);
      logInfo(`step3 getData(155): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.getData(94);
      logInfo(`step4 getData(94): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0018
     * @tc.name      Immersive_CommentDataSourceFlow_0018
     * @tc.desc      CommentDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0018 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.getData(92.38);
      logInfo(`step2 getData(92.38): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0019
     * @tc.name      Immersive_CommentDataSourceFlow_0019
     * @tc.desc      CommentDataSource call flow pushItem > getData > getData > totalCount > totalCount keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0019 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(60);
      const step2: number = subject.getData(84.29);
      logInfo(`step2 getData(84.29): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(130);
      logInfo(`step3 getData(130): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0020
     * @tc.name      Immersive_CommentDataSourceFlow_0020
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0020 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(105);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0021
     * @tc.name      Immersive_CommentDataSourceFlow_0021
     * @tc.desc      CommentDataSource call flow totalCount > pushItem > pushItem > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0021 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.pushItem(115);
      subject.pushItem(68);
      subject.pushItem(32.89);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0022
     * @tc.name      Immersive_CommentDataSourceFlow_0022
     * @tc.desc      CommentDataSource call flow totalCount > getData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0022 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.getData(61.12);
      logInfo(`step2 getData(61.12): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0023
     * @tc.name      Immersive_CommentDataSourceFlow_0023
     * @tc.desc      CommentDataSource call flow pushItem > getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0023 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(44);
      const step2: number = subject.getData(143);
      logInfo(`step2 getData(143): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(67.81);
      logInfo(`step3 getData(67.81): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0024
     * @tc.name      Immersive_CommentDataSourceFlow_0024
     * @tc.desc      CommentDataSource call flow totalCount > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0024 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.getData(13.84);
      logInfo(`step2 getData(13.84): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0025
     * @tc.name      Immersive_CommentDataSourceFlow_0025
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0025 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.getData(6.57);
      logInfo(`step3 getData(6.57): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0026
     * @tc.name      Immersive_CommentDataSourceFlow_0026
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > totalCount > getData > totalCount keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0026 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(-30);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.getData(-92);
      logInfo(`step4 getData(-92): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0027
     * @tc.name      Immersive_CommentDataSourceFlow_0027
     * @tc.desc      CommentDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0027 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(63.07);
      logInfo(`step1 getData(63.07): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0028
     * @tc.name      Immersive_CommentDataSourceFlow_0028
     * @tc.desc      CommentDataSource call flow totalCount > pushItem > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0028 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushItem(89);
      const step3: number = subject.getData(61.12);
      logInfo(`step3 getData(61.12): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0029
     * @tc.name      Immersive_CommentDataSourceFlow_0029
     * @tc.desc      CommentDataSource call flow pushItem > pushItem > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0029 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(108);
      subject.pushItem(90.73);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(4);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(4);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0030
     * @tc.name      Immersive_CommentDataSourceFlow_0030
     * @tc.desc      CommentDataSource call flow totalCount > pushItem > getData > totalCount > getData keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0030 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.pushItem(115);
      const step3: number = subject.getData(80);
      logInfo(`step3 getData(80): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(3);
      const step5: number = subject.getData(144);
      logInfo(`step5 getData(144): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0031
     * @tc.name      Immersive_CommentDataSourceFlow_0031
     * @tc.desc      CommentDataSource call flow totalCount > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0031 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushItem(171);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0032
     * @tc.name      Immersive_CommentDataSourceFlow_0032
     * @tc.desc      CommentDataSource call flow pushItem > pushItem > getData > pushItem > totalCount keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0032 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(88.11);
      subject.pushItem(113);
      const step3: number = subject.getData(183);
      logInfo(`step3 getData(183): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushItem(72.41);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(5);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0033
     * @tc.name      Immersive_CommentDataSourceFlow_0033
     * @tc.desc      CommentDataSource call flow getData > totalCount > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0033 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(62.91);
      logInfo(`step1 getData(62.91): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0034
     * @tc.name      Immersive_CommentDataSourceFlow_0034
     * @tc.desc      CommentDataSource call flow pushItem > pushItem > totalCount > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0034 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(192);
      subject.pushItem(-41);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      subject.pushItem(-89);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0035
     * @tc.name      Immersive_CommentDataSourceFlow_0035
     * @tc.desc      CommentDataSource call flow pushItem > getData > pushItem > pushItem > totalCount keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0035 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(103);
      const step2: number = subject.getData(198);
      logInfo(`step2 getData(198): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushItem(9);
      subject.pushItem(77);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(4);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0036
     * @tc.name      Immersive_CommentDataSourceFlow_0036
     * @tc.desc      CommentDataSource call flow totalCount > getData > totalCount > pushItem > getData keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0036 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.getData(60.95);
      logInfo(`step2 getData(60.95): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.pushItem(38);
      const step5: number = subject.getData(17.08);
      logInfo(`step5 getData(17.08): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0037
     * @tc.name      Immersive_CommentDataSourceFlow_0037
     * @tc.desc      CommentDataSource call flow getData > pushItem > getData > totalCount > totalCount keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0037 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(84.06);
      logInfo(`step1 getData(84.06): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(78.52);
      const step3: number = subject.getData(39.63);
      logInfo(`step3 getData(39.63): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0038
     * @tc.name      Immersive_CommentDataSourceFlow_0038
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > pushItem > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0038 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(3.65);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(3);
      subject.pushItem(-99);
      subject.pushItem(195);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0039
     * @tc.name      Immersive_CommentDataSourceFlow_0039
     * @tc.desc      CommentDataSource call flow pushItem > pushItem > pushItem > totalCount > getData keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0039 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(37);
      subject.pushItem(-4);
      subject.pushItem(45.41);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(3);
      const step5: number = subject.getData(-95);
      logInfo(`step5 getData(-95): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0040
     * @tc.name      Immersive_CommentDataSourceFlow_0040
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0040 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.getData(86);
      logInfo(`step3 getData(86): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0041
     * @tc.name      Immersive_CommentDataSourceFlow_0041
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > totalCount > totalCount > totalCount keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0041 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(15.58);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0042
     * @tc.name      Immersive_CommentDataSourceFlow_0042
     * @tc.desc      CommentDataSource call flow totalCount > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0042 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.getData(36);
      logInfo(`step2 getData(36): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(-33);
      logInfo(`step3 getData(-33): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0043
     * @tc.name      Immersive_CommentDataSourceFlow_0043
     * @tc.desc      CommentDataSource call flow pushItem > pushItem > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0043 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(2.26);
      subject.pushItem(22);
      const step3: number = subject.getData(78.4);
      logInfo(`step3 getData(78.4): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0044
     * @tc.name      Immersive_CommentDataSourceFlow_0044
     * @tc.desc      CommentDataSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0044 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0045
     * @tc.name      Immersive_CommentDataSourceFlow_0045
     * @tc.desc      CommentDataSource call flow pushItem > pushItem > getData > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0045 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(176);
      subject.pushItem(71.14);
      const step3: number = subject.getData(129);
      logInfo(`step3 getData(129): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushItem(56.29);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0046
     * @tc.name      Immersive_CommentDataSourceFlow_0046
     * @tc.desc      CommentDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0046 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(100);
      logInfo(`step1 getData(100): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0047
     * @tc.name      Immersive_CommentDataSourceFlow_0047
     * @tc.desc      CommentDataSource call flow getData > totalCount > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0047 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(122);
      logInfo(`step1 getData(122): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.pushItem(18.77);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0048
     * @tc.name      Immersive_CommentDataSourceFlow_0048
     * @tc.desc      CommentDataSource call flow pushItem > getData > totalCount > getData > totalCount keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0048 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(88.11);
      const step2: number = subject.getData(54.87);
      logInfo(`step2 getData(54.87): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(3);
      const step4: number = subject.getData(50.47);
      logInfo(`step4 getData(50.47): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0049
     * @tc.name      Immersive_CommentDataSourceFlow_0049
     * @tc.desc      CommentDataSource call flow totalCount > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0049 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.getData(148);
      logInfo(`step2 getData(148): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0050
     * @tc.name      Immersive_CommentDataSourceFlow_0050
     * @tc.desc      CommentDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0050 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(-71);
      logInfo(`step1 getData(-71): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(32.33);
      logInfo(`step2 getData(32.33): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0051
     * @tc.name      Immersive_CommentDataSourceFlow_0051
     * @tc.desc      CommentDataSource call flow pushItem > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0051 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(62.47);
      const step2: number = subject.getData(91.15);
      logInfo(`step2 getData(91.15): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0052
     * @tc.name      Immersive_CommentDataSourceFlow_0052
     * @tc.desc      CommentDataSource call flow totalCount > pushItem > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0052 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushItem(-19);
      const step3: number = subject.getData(-68);
      logInfo(`step3 getData(-68): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0053
     * @tc.name      Immersive_CommentDataSourceFlow_0053
     * @tc.desc      CommentDataSource call flow totalCount > getData > pushItem > getData > totalCount keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0053 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.getData(6.09);
      logInfo(`step2 getData(6.09): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushItem(106);
      const step4: number = subject.getData(17.08);
      logInfo(`step4 getData(17.08): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0054
     * @tc.name      Immersive_CommentDataSourceFlow_0054
     * @tc.desc      CommentDataSource call flow totalCount > getData > getData > getData > getData keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0054 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.getData(53);
      logInfo(`step2 getData(53): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(127);
      logInfo(`step3 getData(127): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.getData(73.87);
      logInfo(`step4 getData(73.87): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.getData(88);
      logInfo(`step5 getData(88): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0054 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0055
     * @tc.name      Immersive_CommentDataSourceFlow_0055
     * @tc.desc      CommentDataSource call flow getData > getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0055 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(10);
      logInfo(`step1 getData(10): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(54.87);
      logInfo(`step2 getData(54.87): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(-3);
      logInfo(`step3 getData(-3): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0056
     * @tc.name      Immersive_CommentDataSourceFlow_0056
     * @tc.desc      CommentDataSource call flow getData > getData > totalCount > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0056 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(-15);
      logInfo(`step1 getData(-15): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(19);
      logInfo(`step2 getData(19): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.pushItem(30);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0057
     * @tc.name      Immersive_CommentDataSourceFlow_0057
     * @tc.desc      CommentDataSource call flow getData > pushItem > pushItem > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0057 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(147);
      logInfo(`step1 getData(147): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(-60);
      subject.pushItem(21);
      const step4: number = subject.getData(-78);
      logInfo(`step4 getData(-78): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0058
     * @tc.name      Immersive_CommentDataSourceFlow_0058
     * @tc.desc      CommentDataSource call flow totalCount > getData > getData > getData > totalCount keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0058 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.getData(176);
      logInfo(`step2 getData(176): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(-8);
      logInfo(`step3 getData(-8): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.getData(66.81);
      logInfo(`step4 getData(66.81): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0059
     * @tc.name      Immersive_CommentDataSourceFlow_0059
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > totalCount > totalCount keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0059 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0059 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0060
     * @tc.name      Immersive_CommentDataSourceFlow_0060
     * @tc.desc      CommentDataSource call flow getData > totalCount > getData > totalCount > pushItem keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0060 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(-91);
      logInfo(`step1 getData(-91): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.getData(42.73);
      logInfo(`step3 getData(42.73): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.pushItem(79);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0060 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0061
     * @tc.name      Immersive_CommentDataSourceFlow_0061
     * @tc.desc      CommentDataSource call flow getData > pushItem > totalCount > getData > pushItem keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0061 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(-22);
      logInfo(`step1 getData(-22): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(6.7);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(3);
      const step4: number = subject.getData(-5);
      logInfo(`step4 getData(-5): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.pushItem(-84);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0061 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0062
     * @tc.name      Immersive_CommentDataSourceFlow_0062
     * @tc.desc      CommentDataSource call flow pushItem > pushItem > totalCount > pushItem > getData keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0062 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(48);
      subject.pushItem(158);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(3);
      subject.pushItem(152);
      const step5: number = subject.getData(91.51);
      logInfo(`step5 getData(91.51): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0062 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0063
     * @tc.name      Immersive_CommentDataSourceFlow_0063
     * @tc.desc      CommentDataSource call flow getData > pushItem > totalCount > pushItem > totalCount keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0063 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(69.87);
      logInfo(`step1 getData(69.87): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(89);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(3);
      subject.pushItem(64.02);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(4);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0063 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0064
     * @tc.name      Immersive_CommentDataSourceFlow_0064
     * @tc.desc      CommentDataSource call flow getData > pushItem > pushItem > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0064 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(140);
      logInfo(`step1 getData(140): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(92);
      subject.pushItem(58);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0064 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0065
     * @tc.name      Immersive_CommentDataSourceFlow_0065
     * @tc.desc      CommentDataSource call flow pushItem > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0065 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(171);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0065 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0066
     * @tc.name      Immersive_CommentDataSourceFlow_0066
     * @tc.desc      CommentDataSource call flow getData > totalCount > totalCount > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0066 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(181);
      logInfo(`step1 getData(181): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      subject.pushItem(25);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0066 end`);
    });
  });
}
