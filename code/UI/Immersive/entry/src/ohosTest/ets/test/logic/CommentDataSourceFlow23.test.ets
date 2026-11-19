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

/** Logic checks for CommentDataSource flow (68 cases). */
export default function commentDataSourceFlow23Test(): void {
  describe('CommentDataSourceFlow23Test', (): void => {
    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1471
     * @tc.name      Immersive_CommentDataSourceFlow_1471
     * @tc.desc      CommentDataSource call flow totalCount > getData > totalCount > pushItem > totalCount keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1471', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1471 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.getData(119);
      logInfo(`step2 getData(119): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      subject.pushItem(30.84);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1471 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1472
     * @tc.name      Immersive_CommentDataSourceFlow_1472
     * @tc.desc      CommentDataSource call flow getData > getData > getData > pushItem > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1472', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1472 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(91.51);
      logInfo(`step1 getData(91.51): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(-4);
      logInfo(`step2 getData(-4): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(41);
      logInfo(`step3 getData(41): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushItem(13.01);
      const step5: number = subject.getData(195);
      logInfo(`step5 getData(195): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_1472 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1473
     * @tc.name      Immersive_CommentDataSourceFlow_1473
     * @tc.desc      CommentDataSource call flow pushItem > pushItem > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1473', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1473 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(104);
      subject.pushItem(71.6);
      const step3: number = subject.getData(61.45);
      logInfo(`step3 getData(61.45): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_1473 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1474
     * @tc.name      Immersive_CommentDataSourceFlow_1474
     * @tc.desc      CommentDataSource call flow getData > getData > pushItem > totalCount > totalCount keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1474', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1474 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(98.94);
      logInfo(`step1 getData(98.94): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(13.84);
      logInfo(`step2 getData(13.84): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushItem(79.23);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(3);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1474 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1475
     * @tc.name      Immersive_CommentDataSourceFlow_1475
     * @tc.desc      CommentDataSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1475', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1475 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1475 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1476
     * @tc.name      Immersive_CommentDataSourceFlow_1476
     * @tc.desc      CommentDataSource call flow totalCount > getData > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1476', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1476 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.getData(48.31);
      logInfo(`step2 getData(48.31): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushItem(115);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1476 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1477
     * @tc.name      Immersive_CommentDataSourceFlow_1477
     * @tc.desc      CommentDataSource call flow getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1477', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1477 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(20.69);
      logInfo(`step1 getData(20.69): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(190);
      logInfo(`step2 getData(190): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(-15);
      logInfo(`step3 getData(-15): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_1477 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1478
     * @tc.name      Immersive_CommentDataSourceFlow_1478
     * @tc.desc      CommentDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1478', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1478 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(192);
      logInfo(`step1 getData(192): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1478 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1479
     * @tc.name      Immersive_CommentDataSourceFlow_1479
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > totalCount > totalCount > pushItem keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1479', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1479 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(82);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(3);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(3);
      subject.pushItem(23.31);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1479 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1480
     * @tc.name      Immersive_CommentDataSourceFlow_1480
     * @tc.desc      CommentDataSource call flow getData > getData > pushItem > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1480', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1480 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(34);
      logInfo(`step1 getData(34): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(139);
      logInfo(`step2 getData(139): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushItem(94.07);
      const step4: number = subject.getData(23.58);
      logInfo(`step4 getData(23.58): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_1480 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1481
     * @tc.name      Immersive_CommentDataSourceFlow_1481
     * @tc.desc      CommentDataSource call flow getData > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1481', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1481 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(-3);
      logInfo(`step1 getData(-3): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.getData(39.12);
      logInfo(`step3 getData(39.12): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_1481 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1482
     * @tc.name      Immersive_CommentDataSourceFlow_1482
     * @tc.desc      CommentDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1482', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1482 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(39.06);
      logInfo(`step1 getData(39.06): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(73.87);
      logInfo(`step2 getData(73.87): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_1482 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1483
     * @tc.name      Immersive_CommentDataSourceFlow_1483
     * @tc.desc      CommentDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1483', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1483 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(171);
      logInfo(`step1 getData(171): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(98.94);
      logInfo(`step2 getData(98.94): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_1483 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1484
     * @tc.name      Immersive_CommentDataSourceFlow_1484
     * @tc.desc      CommentDataSource call flow getData > getData > pushItem > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1484', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1484 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(75);
      logInfo(`step1 getData(75): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(128);
      logInfo(`step2 getData(128): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushItem(4);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(3);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1484 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1485
     * @tc.name      Immersive_CommentDataSourceFlow_1485
     * @tc.desc      CommentDataSource call flow getData > pushItem > pushItem > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1485', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1485 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(-6);
      logInfo(`step1 getData(-6): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(30.84);
      subject.pushItem(60.88);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1485 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1486
     * @tc.name      Immersive_CommentDataSourceFlow_1486
     * @tc.desc      CommentDataSource call flow getData > totalCount > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1486', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1486 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(-22);
      logInfo(`step1 getData(-22): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.pushItem(96);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1486 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1487
     * @tc.name      Immersive_CommentDataSourceFlow_1487
     * @tc.desc      CommentDataSource call flow getData > totalCount > pushItem > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1487', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1487 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(-62);
      logInfo(`step1 getData(-62): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.pushItem(105);
      subject.pushItem(48);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1487 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1488
     * @tc.name      Immersive_CommentDataSourceFlow_1488
     * @tc.desc      CommentDataSource call flow getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1488', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1488 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(2.03);
      logInfo(`step1 getData(2.03): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(78);
      logInfo(`step2 getData(78): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1488 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1489
     * @tc.name      Immersive_CommentDataSourceFlow_1489
     * @tc.desc      CommentDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1489', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1489 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.getData(131);
      logInfo(`step2 getData(131): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_1489 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1490
     * @tc.name      Immersive_CommentDataSourceFlow_1490
     * @tc.desc      CommentDataSource call flow getData > pushItem > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1490', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1490 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(138);
      logInfo(`step1 getData(138): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(17.8);
      subject.pushItem(139);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1490 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1491
     * @tc.name      Immersive_CommentDataSourceFlow_1491
     * @tc.desc      CommentDataSource call flow getData > pushItem > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1491', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1491 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(-27);
      logInfo(`step1 getData(-27): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(131);
      const step3: number = subject.getData(173);
      logInfo(`step3 getData(173): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.getData(-30);
      logInfo(`step4 getData(-30): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_1491 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1492
     * @tc.name      Immersive_CommentDataSourceFlow_1492
     * @tc.desc      CommentDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1492', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1492 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(41.95);
      logInfo(`step1 getData(41.95): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(171);
      logInfo(`step2 getData(171): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_1492 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1493
     * @tc.name      Immersive_CommentDataSourceFlow_1493
     * @tc.desc      CommentDataSource call flow getData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1493', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1493 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(92.38);
      logInfo(`step1 getData(92.38): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1493 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1494
     * @tc.name      Immersive_CommentDataSourceFlow_1494
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > totalCount > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1494', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1494 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.pushItem(-16);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1494 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1495
     * @tc.name      Immersive_CommentDataSourceFlow_1495
     * @tc.desc      CommentDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1495', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1495 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.getData(27.04);
      logInfo(`step2 getData(27.04): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_1495 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1496
     * @tc.name      Immersive_CommentDataSourceFlow_1496
     * @tc.desc      CommentDataSource call flow totalCount > pushItem > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1496', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1496 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      subject.pushItem(-39);
      subject.pushItem(72.82);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1496 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1497
     * @tc.name      Immersive_CommentDataSourceFlow_1497
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > pushItem > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1497', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1497 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(177);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(3);
      subject.pushItem(147);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(4);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1497 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1498
     * @tc.name      Immersive_CommentDataSourceFlow_1498
     * @tc.desc      CommentDataSource call flow getData > pushItem > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1498', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1498 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(8.28);
      logInfo(`step1 getData(8.28): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(38);
      const step3: number = subject.getData(51.57);
      logInfo(`step3 getData(51.57): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1498 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1499
     * @tc.name      Immersive_CommentDataSourceFlow_1499
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > getData > pushItem > pushItem keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1499', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1499 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(192);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: number = subject.getData(23);
      logInfo(`step3 getData(23): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushItem(-4);
      subject.pushItem(13.37);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1499 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1500
     * @tc.name      Immersive_CommentDataSourceFlow_1500
     * @tc.desc      CommentDataSource call flow getData > getData > getData > getData > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1500 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(67);
      logInfo(`step1 getData(67): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(-90);
      logInfo(`step2 getData(-90): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(165);
      logInfo(`step3 getData(165): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.getData(98.55);
      logInfo(`step4 getData(98.55): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.pushItem(80.25);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1500 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1501
     * @tc.name      Immersive_CommentDataSourceFlow_1501
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > pushItem > totalCount > pushItem keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1501', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1501 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      subject.pushItem(76);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(3);
      subject.pushItem(-9);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1501 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1502
     * @tc.name      Immersive_CommentDataSourceFlow_1502
     * @tc.desc      CommentDataSource call flow getData > getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1502', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1502 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(79.04);
      logInfo(`step1 getData(79.04): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(73);
      logInfo(`step2 getData(73): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(-63);
      logInfo(`step3 getData(-63): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.getData(98.22);
      logInfo(`step4 getData(98.22): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_1502 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1503
     * @tc.name      Immersive_CommentDataSourceFlow_1503
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1503', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1503 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(99);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: number = subject.getData(81);
      logInfo(`step3 getData(81): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_1503 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1504
     * @tc.name      Immersive_CommentDataSourceFlow_1504
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1504', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1504 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.pushItem(55.54);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1504 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1505
     * @tc.name      Immersive_CommentDataSourceFlow_1505
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1505', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1505 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.getData(-15);
      logInfo(`step3 getData(-15): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.getData(61.12);
      logInfo(`step4 getData(61.12): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_1505 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1506
     * @tc.name      Immersive_CommentDataSourceFlow_1506
     * @tc.desc      CommentDataSource call flow getData > totalCount > pushItem > totalCount > pushItem keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1506', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1506 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(-5);
      logInfo(`step1 getData(-5): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.pushItem(19.39);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      subject.pushItem(26.78);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1506 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1507
     * @tc.name      Immersive_CommentDataSourceFlow_1507
     * @tc.desc      CommentDataSource call flow getData > totalCount > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1507', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1507 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(51.81);
      logInfo(`step1 getData(51.81): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.getData(58.45);
      logInfo(`step3 getData(58.45): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1507 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1508
     * @tc.name      Immersive_CommentDataSourceFlow_1508
     * @tc.desc      CommentDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1508', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1508 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.getData(99.04);
      logInfo(`step2 getData(99.04): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_1508 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1509
     * @tc.name      Immersive_CommentDataSourceFlow_1509
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > pushItem > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1509', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1509 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.pushItem(55.88);
      subject.pushItem(10.3);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1509 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1510
     * @tc.name      Immersive_CommentDataSourceFlow_1510
     * @tc.desc      CommentDataSource call flow totalCount > pushItem > totalCount > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1510 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      subject.pushItem(98.79);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      subject.pushItem(175);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1510 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1511
     * @tc.name      Immersive_CommentDataSourceFlow_1511
     * @tc.desc      CommentDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1511', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1511 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(58.24);
      logInfo(`step1 getData(58.24): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1511 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1512
     * @tc.name      Immersive_CommentDataSourceFlow_1512
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > getData > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1512', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1512 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.getData(160);
      logInfo(`step3 getData(160): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushItem(61);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1512 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1513
     * @tc.name      Immersive_CommentDataSourceFlow_1513
     * @tc.desc      CommentDataSource call flow pushItem > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1513', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1513 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(47.05);
      const step2: number = subject.getData(64.47);
      logInfo(`step2 getData(64.47): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(186);
      logInfo(`step3 getData(186): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_1513 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1514
     * @tc.name      Immersive_CommentDataSourceFlow_1514
     * @tc.desc      CommentDataSource call flow getData > totalCount > getData > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1514', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1514 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(27.04);
      logInfo(`step1 getData(27.04): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.getData(118);
      logInfo(`step3 getData(118): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushItem(-5);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1514 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1515
     * @tc.name      Immersive_CommentDataSourceFlow_1515
     * @tc.desc      CommentDataSource call flow getData > pushItem > getData > totalCount > pushItem keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1515', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1515 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(160);
      logInfo(`step1 getData(160): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(64.28);
      const step3: number = subject.getData(64.03);
      logInfo(`step3 getData(64.03): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      subject.pushItem(-1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1515 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1516
     * @tc.name      Immersive_CommentDataSourceFlow_1516
     * @tc.desc      CommentDataSource call flow getData > getData > totalCount > totalCount > pushItem keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1516', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1516 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(193);
      logInfo(`step1 getData(193): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(33.52);
      logInfo(`step2 getData(33.52): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      subject.pushItem(-44);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1516 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1517
     * @tc.name      Immersive_CommentDataSourceFlow_1517
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1517', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1517 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(48);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(3);
      subject.pushItem(36.85);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1517 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1518
     * @tc.name      Immersive_CommentDataSourceFlow_1518
     * @tc.desc      CommentDataSource call flow getData > getData > totalCount > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1518', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1518 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(179);
      logInfo(`step1 getData(179): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(70.43);
      logInfo(`step2 getData(70.43): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.pushItem(37.91);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1518 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1519
     * @tc.name      Immersive_CommentDataSourceFlow_1519
     * @tc.desc      CommentDataSource call flow getData > getData > totalCount > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1519', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1519 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(120);
      logInfo(`step1 getData(120): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(23.9);
      logInfo(`step2 getData(23.9): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.pushItem(180);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1519 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1520
     * @tc.name      Immersive_CommentDataSourceFlow_1520
     * @tc.desc      CommentDataSource call flow totalCount > pushItem > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1520', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1520 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.pushItem(3.46);
      subject.pushItem(-35);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1520 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1521
     * @tc.name      Immersive_CommentDataSourceFlow_1521
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1521', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1521 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(156);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.getData(110);
      logInfo(`step4 getData(110): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_1521 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1522
     * @tc.name      Immersive_CommentDataSourceFlow_1522
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1522', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1522 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.getData(60);
      logInfo(`step3 getData(60): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_1522 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1523
     * @tc.name      Immersive_CommentDataSourceFlow_1523
     * @tc.desc      CommentDataSource call flow getData > totalCount > pushItem > totalCount > pushItem keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1523', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1523 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(54.15);
      logInfo(`step1 getData(54.15): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.pushItem(26);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      subject.pushItem(-64);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1523 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1524
     * @tc.name      Immersive_CommentDataSourceFlow_1524
     * @tc.desc      CommentDataSource call flow totalCount > pushItem > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1524', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1524 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      subject.pushItem(122);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1524 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1525
     * @tc.name      Immersive_CommentDataSourceFlow_1525
     * @tc.desc      CommentDataSource call flow pushItem > getData > totalCount > totalCount > getData keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1525', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1525 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(2.26);
      const step2: number = subject.getData(20);
      logInfo(`step2 getData(20): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(3);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(3);
      const step5: number = subject.getData(-73);
      logInfo(`step5 getData(-73): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_1525 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1526
     * @tc.name      Immersive_CommentDataSourceFlow_1526
     * @tc.desc      CommentDataSource call flow getData > getData > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1526', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1526 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(53);
      logInfo(`step1 getData(53): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(-7);
      logInfo(`step2 getData(-7): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushItem(4.3);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1526 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1527
     * @tc.name      Immersive_CommentDataSourceFlow_1527
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > totalCount > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1527', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1527 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.pushItem(30.84);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1527 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1528
     * @tc.name      Immersive_CommentDataSourceFlow_1528
     * @tc.desc      CommentDataSource call flow totalCount > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1528', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1528 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.pushItem(93.14);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1528 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1529
     * @tc.name      Immersive_CommentDataSourceFlow_1529
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > pushItem > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1529', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1529 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.pushItem(21);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1529 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1530
     * @tc.name      Immersive_CommentDataSourceFlow_1530
     * @tc.desc      CommentDataSource call flow pushItem > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1530', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1530 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(-60);
      const step2: number = subject.getData(12);
      logInfo(`step2 getData(12): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_1530 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1531
     * @tc.name      Immersive_CommentDataSourceFlow_1531
     * @tc.desc      CommentDataSource call flow getData > pushItem > pushItem > getData > getData keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1531', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1531 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(64.8);
      logInfo(`step1 getData(64.8): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(144);
      subject.pushItem(32.25);
      const step4: number = subject.getData(197);
      logInfo(`step4 getData(197): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.getData(-61);
      logInfo(`step5 getData(-61): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_1531 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1532
     * @tc.name      Immersive_CommentDataSourceFlow_1532
     * @tc.desc      CommentDataSource call flow pushItem > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1532', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1532 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(90);
      const step2: number = subject.getData(39.63);
      logInfo(`step2 getData(39.63): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_1532 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1533
     * @tc.name      Immersive_CommentDataSourceFlow_1533
     * @tc.desc      CommentDataSource call flow getData > pushItem > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1533', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1533 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(69.87);
      logInfo(`step1 getData(69.87): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(82.96);
      const step3: number = subject.getData(194);
      logInfo(`step3 getData(194): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_1533 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1534
     * @tc.name      Immersive_CommentDataSourceFlow_1534
     * @tc.desc      CommentDataSource call flow totalCount > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1534', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1534 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.pushItem(177);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1534 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1535
     * @tc.name      Immersive_CommentDataSourceFlow_1535
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > pushItem > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1535', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1535 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.pushItem(-20);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1535 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1536
     * @tc.name      Immersive_CommentDataSourceFlow_1536
     * @tc.desc      CommentDataSource call flow pushItem > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1536', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1536 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(9.09);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_1536 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1537
     * @tc.name      Immersive_CommentDataSourceFlow_1537
     * @tc.desc      CommentDataSource call flow pushItem > pushItem > pushItem > getData > getData keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1537', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1537 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(-10);
      subject.pushItem(104);
      subject.pushItem(27);
      const step4: number = subject.getData(6.09);
      logInfo(`step4 getData(6.09): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.getData(67);
      logInfo(`step5 getData(67): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_1537 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_1538
     * @tc.name      Immersive_CommentDataSourceFlow_1538
     * @tc.desc      CommentDataSource call flow getData > totalCount > pushItem > getData > getData keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_1538', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_1538 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(179);
      logInfo(`step1 getData(179): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.pushItem(32.81);
      const step4: number = subject.getData(99);
      logInfo(`step4 getData(99): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.getData(176);
      logInfo(`step5 getData(176): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_1538 end`);
    });
  });
}
