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
import { BasicDataSource } from '../../../../main/ets/bridge/PullToRefreshTestBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for BasicDataSource flow (59 cases). */
export default function basicDataSourceFlowTest(): void {
  describe('BasicDataSourceFlowTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0001
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0001
     * @tc.desc      BasicDataSource call flow notifyDataDelete > notifyDataAdd > notifyDataDelete > totalCount > not...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_BasicDataSourceFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0001 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.notifyDataDelete(70);
      subject.notifyDataAdd(4);
      subject.notifyDataDelete(35);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.notifyDataMove(70, 2);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0002
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0002
     * @tc.desc      BasicDataSource call flow totalCount > totalCount > notifyDataReload > totalCount > notifyDataAd...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_BasicDataSourceFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0002 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.notifyDataReload();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.notifyDataAdd(148);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0003
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0003
     * @tc.desc      BasicDataSource call flow getData > notifyDataMove > totalCount > notifyDataAdd keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0003 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.getData(30);
      subject.notifyDataMove(45, 0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.notifyDataAdd(72);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0004
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0004
     * @tc.desc      BasicDataSource call flow notifyDataReload > totalCount > notifyDataDelete > getData > notifyDat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0004 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.notifyDataReload();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.notifyDataDelete(95);
      subject.getData(-3);
      subject.notifyDataDelete(-86);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0005
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0005
     * @tc.desc      BasicDataSource call flow totalCount > notifyDataReload keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0005 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataReload();
      logInfo(`${BUNDLE}BasicDataSourceFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0006
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0006
     * @tc.desc      BasicDataSource call flow totalCount > totalCount > notifyDataChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0006 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.notifyDataChange(85);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0007
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0007
     * @tc.desc      BasicDataSource call flow totalCount > notifyDataAdd > totalCount > notifyDataReload > notifyDat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0007 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataAdd(30.89);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.notifyDataReload();
      subject.notifyDataAdd(-92);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0008
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0008
     * @tc.desc      BasicDataSource call flow totalCount > notifyDataChange > notifyDataAdd > notifyDataAdd > totalC...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0008 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataChange(-2);
      subject.notifyDataAdd(5);
      subject.notifyDataAdd(58);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0009
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0009
     * @tc.desc      BasicDataSource call flow totalCount > notifyDataAdd > totalCount > notifyDataDelete > totalCoun...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0009 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataAdd(90);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.notifyDataDelete(-84);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0010
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0010
     * @tc.desc      BasicDataSource call flow notifyDataReload > totalCount > totalCount > totalCount keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0010 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.notifyDataReload();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0011
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0011
     * @tc.desc      BasicDataSource call flow notifyDataDelete > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0011 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.notifyDataDelete(39.95);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0012
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0012
     * @tc.desc      BasicDataSource call flow totalCount > notifyDataDelete > notifyDataChange > totalCount > totalC...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0012 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataDelete(5);
      subject.notifyDataChange(29);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0013
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0013
     * @tc.desc      BasicDataSource call flow notifyDataAdd > notifyDataAdd > totalCount > totalCount keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0013 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.notifyDataAdd(0.86);
      subject.notifyDataAdd(171);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0014
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0014
     * @tc.desc      BasicDataSource call flow notifyDataAdd > notifyDataDelete > notifyDataMove > notifyDataChange >...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0014 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.notifyDataAdd(93.26);
      subject.notifyDataDelete(71);
      subject.notifyDataMove(35, 95);
      subject.notifyDataChange(-92);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0015
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0015
     * @tc.desc      BasicDataSource call flow getData > totalCount > notifyDataChange > totalCount keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0015 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.getData(-76);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.notifyDataChange(57);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0016
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0016
     * @tc.desc      BasicDataSource call flow notifyDataDelete > totalCount > notifyDataAdd > notifyDataAdd > totalC...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0016 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.notifyDataDelete(130);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.notifyDataAdd(155);
      subject.notifyDataAdd(-86);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0017
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0017
     * @tc.desc      BasicDataSource call flow totalCount > notifyDataMove > notifyDataDelete > totalCount keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0017 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataMove(90, -1);
      subject.notifyDataDelete(65.22);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0018
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0018
     * @tc.desc      BasicDataSource call flow totalCount > notifyDataChange > totalCount > totalCount keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0018 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataChange(110);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0019
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0019
     * @tc.desc      BasicDataSource call flow totalCount > totalCount > totalCount > notifyDataAdd > notifyDataDelet...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0019 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.notifyDataAdd(140);
      subject.notifyDataDelete(143);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0020
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0020
     * @tc.desc      BasicDataSource call flow notifyDataMove > notifyDataChange > getData > totalCount keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0020 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.notifyDataMove(65, 15);
      subject.notifyDataChange(177);
      subject.getData(100);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0021
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0021
     * @tc.desc      BasicDataSource call flow notifyDataDelete > notifyDataAdd > notifyDataDelete > totalCount keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0021 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.notifyDataDelete(60);
      subject.notifyDataAdd(48.46);
      subject.notifyDataDelete(56.91);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0022
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0022
     * @tc.desc      BasicDataSource call flow totalCount > notifyDataDelete > notifyDataChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0022 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataDelete(-99);
      subject.notifyDataChange(29);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0023
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0023
     * @tc.desc      BasicDataSource call flow totalCount > notifyDataDelete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0023 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataDelete(145);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0024
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0024
     * @tc.desc      BasicDataSource call flow totalCount > notifyDataAdd > notifyDataAdd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0024 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataAdd(140);
      subject.notifyDataAdd(140);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0025
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0025
     * @tc.desc      BasicDataSource call flow notifyDataChange > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0025 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.notifyDataChange(14);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0026
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0026
     * @tc.desc      BasicDataSource call flow totalCount > notifyDataReload keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0026 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataReload();
      logInfo(`${BUNDLE}BasicDataSourceFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0027
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0027
     * @tc.desc      BasicDataSource call flow notifyDataDelete > notifyDataChange > totalCount > getData keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0027 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.notifyDataDelete(62.69);
      subject.notifyDataChange(55);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.getData(26);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0028
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0028
     * @tc.desc      BasicDataSource call flow notifyDataReload > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0028 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.notifyDataReload();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0029
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0029
     * @tc.desc      BasicDataSource call flow notifyDataChange > notifyDataAdd > notifyDataReload > totalCount > not...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0029 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.notifyDataChange(15);
      subject.notifyDataAdd(45);
      subject.notifyDataReload();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.notifyDataDelete(15);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0030
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0030
     * @tc.desc      BasicDataSource call flow notifyDataChange > totalCount > notifyDataReload keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0030 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.notifyDataChange(125);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.notifyDataReload();
      logInfo(`${BUNDLE}BasicDataSourceFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0031
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0031
     * @tc.desc      BasicDataSource call flow getData > notifyDataReload > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0031 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.getData(-3);
      subject.notifyDataReload();
      subject.getData(25);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0032
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0032
     * @tc.desc      BasicDataSource call flow notifyDataReload > notifyDataAdd > notifyDataChange > totalCount keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0032 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.notifyDataReload();
      subject.notifyDataAdd(72);
      subject.notifyDataChange(190);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0033
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0033
     * @tc.desc      BasicDataSource call flow notifyDataReload > notifyDataDelete > notifyDataReload > totalCount > ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0033 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.notifyDataReload();
      subject.notifyDataDelete(20);
      subject.notifyDataReload();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.notifyDataDelete(95);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0034
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0034
     * @tc.desc      BasicDataSource call flow notifyDataReload > totalCount > notifyDataMove > notifyDataDelete > no...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0034 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.notifyDataReload();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.notifyDataMove(55, 115);
      subject.notifyDataDelete(129);
      subject.notifyDataAdd(185);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0035
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0035
     * @tc.desc      BasicDataSource call flow totalCount > getData > notifyDataMove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0035 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.getData(-71);
      subject.notifyDataMove(55, 105);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0036
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0036
     * @tc.desc      BasicDataSource call flow notifyDataChange > notifyDataAdd > notifyDataChange > totalCount keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0036 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.notifyDataChange(140);
      subject.notifyDataAdd(-85);
      subject.notifyDataChange(156);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0037
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0037
     * @tc.desc      BasicDataSource call flow totalCount > notifyDataMove > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0037 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataMove(60, 75);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0038
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0038
     * @tc.desc      BasicDataSource call flow notifyDataAdd > totalCount > notifyDataMove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0038 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.notifyDataAdd(6);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.notifyDataMove(105, 25);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0039
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0039
     * @tc.desc      BasicDataSource call flow notifyDataReload > totalCount > notifyDataMove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0039 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.notifyDataReload();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.notifyDataMove(95, 105);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0040
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0040
     * @tc.desc      BasicDataSource call flow notifyDataChange > notifyDataReload > totalCount > notifyDataAdd > not...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0040 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.notifyDataChange(35.75);
      subject.notifyDataReload();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.notifyDataAdd(105);
      subject.notifyDataMove(0, 45);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0041
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0041
     * @tc.desc      BasicDataSource call flow notifyDataChange > totalCount > notifyDataAdd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0041 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.notifyDataChange(76.56);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.notifyDataAdd(39.13);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0042
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0042
     * @tc.desc      BasicDataSource call flow notifyDataChange > notifyDataReload > totalCount > notifyDataChange > ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0042 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.notifyDataChange(46);
      subject.notifyDataReload();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.notifyDataChange(88.82);
      subject.notifyDataChange(186);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0043
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0043
     * @tc.desc      BasicDataSource call flow notifyDataReload > totalCount > totalCount > totalCount keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0043 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.notifyDataReload();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0044
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0044
     * @tc.desc      BasicDataSource call flow notifyDataMove > notifyDataDelete > totalCount > notifyDataAdd keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0044 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.notifyDataMove(85, 10);
      subject.notifyDataDelete(-21);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.notifyDataAdd(30);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0045
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0045
     * @tc.desc      BasicDataSource call flow notifyDataMove > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0045 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.notifyDataMove(0, 95);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0046
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0046
     * @tc.desc      BasicDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0046 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.getData(164);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0047
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0047
     * @tc.desc      BasicDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0047 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.getData(188);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0048
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0048
     * @tc.desc      BasicDataSource call flow getData > notifyDataDelete > notifyDataAdd > totalCount keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0048 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.getData(25);
      subject.notifyDataDelete(11.24);
      subject.notifyDataAdd(132);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0049
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0049
     * @tc.desc      BasicDataSource call flow notifyDataMove > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0049 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.notifyDataMove(40, 3);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0050
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0050
     * @tc.desc      BasicDataSource call flow notifyDataDelete > notifyDataAdd > totalCount > notifyDataMove > notif...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0050 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.notifyDataDelete(171);
      subject.notifyDataAdd(141);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.notifyDataMove(85, 55);
      subject.notifyDataDelete(30);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0051
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0051
     * @tc.desc      BasicDataSource call flow notifyDataAdd > notifyDataAdd > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0051 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.notifyDataAdd(43.06);
      subject.notifyDataAdd(95);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0052
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0052
     * @tc.desc      BasicDataSource call flow totalCount > notifyDataMove > notifyDataReload keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0052 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataMove(115, 137);
      subject.notifyDataReload();
      logInfo(`${BUNDLE}BasicDataSourceFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0053
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0053
     * @tc.desc      BasicDataSource call flow totalCount > notifyDataAdd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0053 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataAdd(105);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0054
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0054
     * @tc.desc      BasicDataSource call flow totalCount > notifyDataDelete > totalCount > getData > notifyDataChang...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0054 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataDelete(57);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.getData(169);
      subject.notifyDataChange(0);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0054 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0055
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0055
     * @tc.desc      BasicDataSource call flow notifyDataReload > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0055 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.notifyDataReload();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0056
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0056
     * @tc.desc      BasicDataSource call flow notifyDataAdd > notifyDataMove > notifyDataReload > totalCount > notif...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0056 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.notifyDataAdd(42.05);
      subject.notifyDataMove(25, 0);
      subject.notifyDataReload();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.notifyDataAdd(-86);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0057
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0057
     * @tc.desc      BasicDataSource call flow totalCount > notifyDataMove > notifyDataAdd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0057 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataMove(85, -1);
      subject.notifyDataAdd(85);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0058
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0058
     * @tc.desc      BasicDataSource call flow notifyDataDelete > totalCount > totalCount > totalCount > notifyDataCh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0058 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      subject.notifyDataDelete(182);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.notifyDataChange(40);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_BASIC_DATA_SOURCE_FLOW_0059
     * @tc.name      PullToRefresh_BasicDataSourceFlow_0059
     * @tc.desc      BasicDataSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_BasicDataSourceFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BasicDataSourceFlow_0059 begin`);
      const subject: BasicDataSource = new BasicDataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}BasicDataSourceFlow_0059 end`);
    });
  });
}
