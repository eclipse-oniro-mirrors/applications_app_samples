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

/** Logic checks for CommentDataSource flow (58 cases). */
export default function commentDataSourceFlow9Test(): void {
  describe('CommentDataSourceFlow9Test', (): void => {
    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0488
     * @tc.name      Immersive_CommentDataSourceFlow_0488
     * @tc.desc      CommentDataSource call flow pushItem > pushItem > totalCount > totalCount > totalCount keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0488', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0488 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(144);
      subject.pushItem(111);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0488 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0489
     * @tc.name      Immersive_CommentDataSourceFlow_0489
     * @tc.desc      CommentDataSource call flow totalCount > pushItem > getData > totalCount > getData keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0489', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0489 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      subject.pushItem(26);
      const step3: number = subject.getData(89);
      logInfo(`step3 getData(89): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.getData(144);
      logInfo(`step5 getData(144): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0489 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0490
     * @tc.name      Immersive_CommentDataSourceFlow_0490
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0490', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0490 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(147);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: number = subject.getData(0);
      logInfo(`step3 getData(0): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0490 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0491
     * @tc.name      Immersive_CommentDataSourceFlow_0491
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > getData > totalCount > totalCount keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0491', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0491 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.getData(92.84);
      logInfo(`step3 getData(92.84): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0491 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0492
     * @tc.name      Immersive_CommentDataSourceFlow_0492
     * @tc.desc      CommentDataSource call flow getData > pushItem > totalCount > pushItem > totalCount keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0492', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0492 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(69.87);
      logInfo(`step1 getData(69.87): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(145);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      subject.pushItem(50);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0492 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0493
     * @tc.name      Immersive_CommentDataSourceFlow_0493
     * @tc.desc      CommentDataSource call flow totalCount > pushItem > totalCount > getData > getData keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0493', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0493 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushItem(31.37);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.getData(60.3);
      logInfo(`step4 getData(60.3): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.getData(183);
      logInfo(`step5 getData(183): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0493 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0494
     * @tc.name      Immersive_CommentDataSourceFlow_0494
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > getData > totalCount > totalCount keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0494', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0494 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.getData(45.86);
      logInfo(`step3 getData(45.86): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0494 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0495
     * @tc.name      Immersive_CommentDataSourceFlow_0495
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > getData > getData > getData keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0495', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0495 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(-81);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.getData(191);
      logInfo(`step3 getData(191): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.getData(120);
      logInfo(`step4 getData(120): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.getData(62);
      logInfo(`step5 getData(62): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0495 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0496
     * @tc.name      Immersive_CommentDataSourceFlow_0496
     * @tc.desc      CommentDataSource call flow pushItem > pushItem > getData > getData > totalCount keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0496', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0496 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(169);
      subject.pushItem(8.4);
      const step3: number = subject.getData(6.96);
      logInfo(`step3 getData(6.96): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.getData(8.28);
      logInfo(`step4 getData(8.28): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0496 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0497
     * @tc.name      Immersive_CommentDataSourceFlow_0497
     * @tc.desc      CommentDataSource call flow getData > pushItem > totalCount > pushItem > getData keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0497', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0497 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(70);
      logInfo(`step1 getData(70): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(91);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(3);
      subject.pushItem(36.85);
      const step5: number = subject.getData(70.43);
      logInfo(`step5 getData(70.43): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0497 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0498
     * @tc.name      Immersive_CommentDataSourceFlow_0498
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > getData > getData > getData keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0498', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0498 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(18.04);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: number = subject.getData(116);
      logInfo(`step3 getData(116): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.getData(128);
      logInfo(`step4 getData(128): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.getData(25);
      logInfo(`step5 getData(25): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0498 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0499
     * @tc.name      Immersive_CommentDataSourceFlow_0499
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > getData > totalCount > getData keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0499', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0499 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.getData(99);
      logInfo(`step3 getData(99): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.getData(0);
      logInfo(`step5 getData(0): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0499 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0500
     * @tc.name      Immersive_CommentDataSourceFlow_0500
     * @tc.desc      CommentDataSource call flow getData > pushItem > totalCount > getData > totalCount keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0500 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(1.88);
      logInfo(`step1 getData(1.88): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(36.85);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.getData(147);
      logInfo(`step4 getData(147): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0500 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0501
     * @tc.name      Immersive_CommentDataSourceFlow_0501
     * @tc.desc      CommentDataSource call flow pushItem > pushItem > pushItem > totalCount > pushItem keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0501', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0501 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(193);
      subject.pushItem(188);
      subject.pushItem(77.99);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(3);
      subject.pushItem(94);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0501 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0502
     * @tc.name      Immersive_CommentDataSourceFlow_0502
     * @tc.desc      CommentDataSource call flow totalCount > getData > totalCount > pushItem > getData keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0502', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0502 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.getData(17.08);
      logInfo(`step2 getData(17.08): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.pushItem(-88);
      const step5: number = subject.getData(63.73);
      logInfo(`step5 getData(63.73): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0502 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0503
     * @tc.name      Immersive_CommentDataSourceFlow_0503
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > getData > pushItem > totalCount keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0503', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0503 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(73.6);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: number = subject.getData(61.12);
      logInfo(`step3 getData(61.12): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushItem(68);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(4);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0503 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0504
     * @tc.name      Immersive_CommentDataSourceFlow_0504
     * @tc.desc      CommentDataSource call flow totalCount > getData > pushItem > totalCount > totalCount keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0504', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0504 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.getData(77.67);
      logInfo(`step2 getData(77.67): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushItem(110);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(3);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0504 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0505
     * @tc.name      Immersive_CommentDataSourceFlow_0505
     * @tc.desc      CommentDataSource call flow getData > totalCount > totalCount > getData > totalCount keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0505', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0505 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(130);
      logInfo(`step1 getData(130): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.getData(-55);
      logInfo(`step4 getData(-55): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0505 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0506
     * @tc.name      Immersive_CommentDataSourceFlow_0506
     * @tc.desc      CommentDataSource call flow getData > pushItem > getData > pushItem > totalCount keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0506', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0506 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(-14);
      logInfo(`step1 getData(-14): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(123);
      const step3: number = subject.getData(-15);
      logInfo(`step3 getData(-15): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushItem(13.37);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(4);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0506 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0507
     * @tc.name      Immersive_CommentDataSourceFlow_0507
     * @tc.desc      CommentDataSource call flow getData > getData > pushItem > totalCount > totalCount keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0507', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0507 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(60);
      logInfo(`step1 getData(60): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(75.26);
      logInfo(`step2 getData(75.26): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushItem(62.5);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0507 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0508
     * @tc.name      Immersive_CommentDataSourceFlow_0508
     * @tc.desc      CommentDataSource call flow totalCount > pushItem > getData > getData > totalCount keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0508', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0508 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushItem(23.31);
      const step3: number = subject.getData(-98);
      logInfo(`step3 getData(-98): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.getData(115);
      logInfo(`step4 getData(115): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0508 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0509
     * @tc.name      Immersive_CommentDataSourceFlow_0509
     * @tc.desc      CommentDataSource call flow totalCount > getData > getData > getData > totalCount keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0509', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0509 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.getData(77.67);
      logInfo(`step2 getData(77.67): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(67.05);
      logInfo(`step3 getData(67.05): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.getData(72.28);
      logInfo(`step4 getData(72.28): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0509 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0510
     * @tc.name      Immersive_CommentDataSourceFlow_0510
     * @tc.desc      CommentDataSource call flow totalCount > getData > getData > pushItem > getData keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0510 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.getData(16.3);
      logInfo(`step2 getData(16.3): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(-98);
      logInfo(`step3 getData(-98): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushItem(-35);
      const step5: number = subject.getData(-68);
      logInfo(`step5 getData(-68): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0510 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0511
     * @tc.name      Immersive_CommentDataSourceFlow_0511
     * @tc.desc      CommentDataSource call flow totalCount > getData > getData > getData > getData keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0511', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0511 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.getData(6.57);
      logInfo(`step2 getData(6.57): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(180);
      logInfo(`step3 getData(180): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.getData(142);
      logInfo(`step4 getData(142): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.getData(54.87);
      logInfo(`step5 getData(54.87): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0511 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0512
     * @tc.name      Immersive_CommentDataSourceFlow_0512
     * @tc.desc      CommentDataSource call flow totalCount > getData > pushItem > getData > pushItem keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0512', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0512 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.getData(144);
      logInfo(`step2 getData(144): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushItem(-35);
      const step4: number = subject.getData(-29);
      logInfo(`step4 getData(-29): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.pushItem(30);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0512 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0513
     * @tc.name      Immersive_CommentDataSourceFlow_0513
     * @tc.desc      CommentDataSource call flow totalCount > getData > totalCount > getData > totalCount keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0513', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0513 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.getData(91);
      logInfo(`step2 getData(91): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.getData(47.34);
      logInfo(`step4 getData(47.34): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0513 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0514
     * @tc.name      Immersive_CommentDataSourceFlow_0514
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > totalCount > getData > getData keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0514', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0514 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(41);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(3);
      const step4: number = subject.getData(59);
      logInfo(`step4 getData(59): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.getData(79.04);
      logInfo(`step5 getData(79.04): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0514 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0515
     * @tc.name      Immersive_CommentDataSourceFlow_0515
     * @tc.desc      CommentDataSource call flow getData > pushItem > totalCount > getData > totalCount keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0515', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0515 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(93);
      logInfo(`step1 getData(93): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(66);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.getData(70.81);
      logInfo(`step4 getData(70.81): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0515 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0516
     * @tc.name      Immersive_CommentDataSourceFlow_0516
     * @tc.desc      CommentDataSource call flow pushItem > pushItem > totalCount > totalCount > getData keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0516', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0516 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(88.11);
      subject.pushItem(97);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.getData(55);
      logInfo(`step5 getData(55): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0516 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0517
     * @tc.name      Immersive_CommentDataSourceFlow_0517
     * @tc.desc      CommentDataSource call flow totalCount > pushItem > pushItem > pushItem > getData keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0517', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0517 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.pushItem(42.35);
      subject.pushItem(8.4);
      subject.pushItem(35.65);
      const step5: number = subject.getData(200);
      logInfo(`step5 getData(200): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0517 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0518
     * @tc.name      Immersive_CommentDataSourceFlow_0518
     * @tc.desc      CommentDataSource call flow pushItem > pushItem > getData > getData > totalCount keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0518', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0518 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(30);
      subject.pushItem(4.3);
      const step3: number = subject.getData(30);
      logInfo(`step3 getData(30): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.getData(127);
      logInfo(`step4 getData(127): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0518 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0519
     * @tc.name      Immersive_CommentDataSourceFlow_0519
     * @tc.desc      CommentDataSource call flow getData > getData > pushItem > getData > totalCount keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0519', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0519 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(-35);
      logInfo(`step1 getData(-35): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(139);
      logInfo(`step2 getData(139): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushItem(2.26);
      const step4: number = subject.getData(165);
      logInfo(`step4 getData(165): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0519 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0520
     * @tc.name      Immersive_CommentDataSourceFlow_0520
     * @tc.desc      CommentDataSource call flow getData > getData > pushItem > getData > totalCount keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0520', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0520 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(-10);
      logInfo(`step1 getData(-10): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(24);
      logInfo(`step2 getData(24): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushItem(156);
      const step4: number = subject.getData(14.12);
      logInfo(`step4 getData(14.12): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0520 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0521
     * @tc.name      Immersive_CommentDataSourceFlow_0521
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > pushItem > totalCount > getData keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0521', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0521 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(-99);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.pushItem(79);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.getData(19.5);
      logInfo(`step5 getData(19.5): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0521 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0522
     * @tc.name      Immersive_CommentDataSourceFlow_0522
     * @tc.desc      CommentDataSource call flow getData > totalCount > pushItem > pushItem > getData keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0522', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0522 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(105);
      logInfo(`step1 getData(105): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      subject.pushItem(27);
      subject.pushItem(65);
      const step5: number = subject.getData(-35);
      logInfo(`step5 getData(-35): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0522 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0523
     * @tc.name      Immersive_CommentDataSourceFlow_0523
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > totalCount > totalCount > getData keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0523', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0523 begin`);
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
      const step5: number = subject.getData(5.65);
      logInfo(`step5 getData(5.65): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0523 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0524
     * @tc.name      Immersive_CommentDataSourceFlow_0524
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > totalCount > totalCount > getData keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0524', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0524 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(37.91);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.getData(-23);
      logInfo(`step5 getData(-23): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0524 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0525
     * @tc.name      Immersive_CommentDataSourceFlow_0525
     * @tc.desc      CommentDataSource call flow pushItem > getData > pushItem > getData > totalCount keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0525', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0525 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(95);
      const step2: number = subject.getData(-30);
      logInfo(`step2 getData(-30): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushItem(184);
      const step4: number = subject.getData(69.87);
      logInfo(`step4 getData(69.87): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0525 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0526
     * @tc.name      Immersive_CommentDataSourceFlow_0526
     * @tc.desc      CommentDataSource call flow pushItem > pushItem > getData > getData > totalCount keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0526', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0526 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(152);
      subject.pushItem(13.01);
      const step3: number = subject.getData(197);
      logInfo(`step3 getData(197): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.getData(116);
      logInfo(`step4 getData(116): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(4);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0526 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0527
     * @tc.name      Immersive_CommentDataSourceFlow_0527
     * @tc.desc      CommentDataSource call flow totalCount > getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0527', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0527 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.getData(-33);
      logInfo(`step2 getData(-33): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(2.03);
      logInfo(`step3 getData(2.03): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.getData(52);
      logInfo(`step4 getData(52): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0527 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0528
     * @tc.name      Immersive_CommentDataSourceFlow_0528
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > pushItem > totalCount > getData keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0528', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0528 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(182);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      subject.pushItem(-64);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(3);
      const step5: number = subject.getData(46.04);
      logInfo(`step5 getData(46.04): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0528 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0529
     * @tc.name      Immersive_CommentDataSourceFlow_0529
     * @tc.desc      CommentDataSource call flow getData > getData > pushItem > pushItem > totalCount keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0529', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0529 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(30);
      logInfo(`step1 getData(30): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(55);
      logInfo(`step2 getData(55): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushItem(82);
      subject.pushItem(92);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0529 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0530
     * @tc.name      Immersive_CommentDataSourceFlow_0530
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > pushItem > totalCount > totalCount keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0530', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0530 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(62.5);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.pushItem(-37);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0530 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0531
     * @tc.name      Immersive_CommentDataSourceFlow_0531
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > getData > totalCount > getData keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0531', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0531 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.getData(164);
      logInfo(`step3 getData(164): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.getData(88.71);
      logInfo(`step5 getData(88.71): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0531 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0532
     * @tc.name      Immersive_CommentDataSourceFlow_0532
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > getData > totalCount > totalCount keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0532', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0532 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(-67);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.getData(91.66);
      logInfo(`step3 getData(91.66): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0532 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0533
     * @tc.name      Immersive_CommentDataSourceFlow_0533
     * @tc.desc      CommentDataSource call flow totalCount > getData > getData > pushItem > getData keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0533', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0533 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.getData(176);
      logInfo(`step2 getData(176): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(29);
      logInfo(`step3 getData(29): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushItem(19);
      const step5: number = subject.getData(162);
      logInfo(`step5 getData(162): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0533 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0534
     * @tc.name      Immersive_CommentDataSourceFlow_0534
     * @tc.desc      CommentDataSource call flow totalCount > getData > totalCount > pushItem > totalCount keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0534', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0534 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.getData(62.45);
      logInfo(`step2 getData(62.45): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.pushItem(188);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0534 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0535
     * @tc.name      Immersive_CommentDataSourceFlow_0535
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > pushItem > pushItem > totalCount keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0535', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0535 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.pushItem(152);
      subject.pushItem(20.21);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0535 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0536
     * @tc.name      Immersive_CommentDataSourceFlow_0536
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > totalCount > pushItem > totalCount keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0536', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0536 begin`);
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
      subject.pushItem(23.03);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0536 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0537
     * @tc.name      Immersive_CommentDataSourceFlow_0537
     * @tc.desc      CommentDataSource call flow getData > totalCount > getData > totalCount > totalCount keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0537', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0537 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(115);
      logInfo(`step1 getData(115): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.getData(-4);
      logInfo(`step3 getData(-4): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0537 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0538
     * @tc.name      Immersive_CommentDataSourceFlow_0538
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > totalCount > totalCount > getData keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0538', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0538 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(98.34);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.getData(98.35);
      logInfo(`step5 getData(98.35): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0538 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0539
     * @tc.name      Immersive_CommentDataSourceFlow_0539
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > pushItem > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0539', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0539 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.pushItem(150);
      const step4: number = subject.getData(42.73);
      logInfo(`step4 getData(42.73): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0539 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0540
     * @tc.name      Immersive_CommentDataSourceFlow_0540
     * @tc.desc      CommentDataSource call flow getData > pushItem > totalCount > totalCount > totalCount keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0540', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0540 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(144);
      logInfo(`step1 getData(144): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(84.62);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0540 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0541
     * @tc.name      Immersive_CommentDataSourceFlow_0541
     * @tc.desc      CommentDataSource call flow totalCount > pushItem > pushItem > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0541', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0541 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushItem(98.98);
      subject.pushItem(8.4);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0541 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0542
     * @tc.name      Immersive_CommentDataSourceFlow_0542
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > pushItem > getData > totalCount keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0542', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0542 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(127);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.pushItem(93.37);
      const step4: number = subject.getData(128);
      logInfo(`step4 getData(128): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0542 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0543
     * @tc.name      Immersive_CommentDataSourceFlow_0543
     * @tc.desc      CommentDataSource call flow getData > totalCount > pushItem > getData > totalCount keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0543', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0543 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(95.05);
      logInfo(`step1 getData(95.05): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      subject.pushItem(39.05);
      const step4: number = subject.getData(41);
      logInfo(`step4 getData(41): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0543 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0544
     * @tc.name      Immersive_CommentDataSourceFlow_0544
     * @tc.desc      CommentDataSource call flow totalCount > getData > totalCount > totalCount > getData keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0544', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0544 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.getData(60.6);
      logInfo(`step2 getData(60.6): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.getData(80);
      logInfo(`step5 getData(80): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0544 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0545
     * @tc.name      Immersive_CommentDataSourceFlow_0545
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > totalCount > totalCount > getData keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0545', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0545 begin`);
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
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.getData(14.12);
      logInfo(`step5 getData(14.12): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0545 end`);
    });
  });
}
