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
export default function commentDataSourceFlow10Test(): void {
  describe('CommentDataSourceFlow10Test', (): void => {
    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0546
     * @tc.name      Immersive_CommentDataSourceFlow_0546
     * @tc.desc      CommentDataSource call flow pushItem > getData > getData > getData > totalCount keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0546', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0546 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(62.5);
      const step2: number = subject.getData(115);
      logInfo(`step2 getData(115): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(-80);
      logInfo(`step3 getData(-80): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.getData(142);
      logInfo(`step4 getData(142): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0546 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0547
     * @tc.name      Immersive_CommentDataSourceFlow_0547
     * @tc.desc      CommentDataSource call flow pushItem > pushItem > totalCount > totalCount > getData keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0547', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0547 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(63.17);
      subject.pushItem(-37);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(4);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(4);
      const step5: number = subject.getData(183);
      logInfo(`step5 getData(183): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0547 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0548
     * @tc.name      Immersive_CommentDataSourceFlow_0548
     * @tc.desc      CommentDataSource call flow getData > pushItem > getData > totalCount > getData keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0548', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0548 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(128);
      logInfo(`step1 getData(128): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(30.84);
      const step3: number = subject.getData(50.47);
      logInfo(`step3 getData(50.47): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.getData(181);
      logInfo(`step5 getData(181): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0548 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0549
     * @tc.name      Immersive_CommentDataSourceFlow_0549
     * @tc.desc      CommentDataSource call flow getData > totalCount > getData > getData > totalCount keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0549', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0549 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(60.95);
      logInfo(`step1 getData(60.95): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.getData(52);
      logInfo(`step3 getData(52): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.getData(-73);
      logInfo(`step4 getData(-73): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0549 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0550
     * @tc.name      Immersive_CommentDataSourceFlow_0550
     * @tc.desc      CommentDataSource call flow totalCount > pushItem > totalCount > pushItem > getData keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0550', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0550 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushItem(36.97);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.pushItem(60.88);
      const step5: number = subject.getData(98.94);
      logInfo(`step5 getData(98.94): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0550 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0551
     * @tc.name      Immersive_CommentDataSourceFlow_0551
     * @tc.desc      CommentDataSource call flow getData > totalCount > getData > pushItem > totalCount keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0551', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0551 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(195);
      logInfo(`step1 getData(195): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.getData(143);
      logInfo(`step3 getData(143): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushItem(143);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0551 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0552
     * @tc.name      Immersive_CommentDataSourceFlow_0552
     * @tc.desc      CommentDataSource call flow totalCount > pushItem > getData > pushItem > getData keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0552', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0552 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.pushItem(23.47);
      const step3: number = subject.getData(-80);
      logInfo(`step3 getData(-80): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushItem(93.41);
      const step5: number = subject.getData(-90);
      logInfo(`step5 getData(-90): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0552 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0553
     * @tc.name      Immersive_CommentDataSourceFlow_0553
     * @tc.desc      CommentDataSource call flow pushItem > pushItem > pushItem > totalCount > getData keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0553', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0553 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(133);
      subject.pushItem(93);
      subject.pushItem(39);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(4);
      const step5: number = subject.getData(17);
      logInfo(`step5 getData(17): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0553 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0554
     * @tc.name      Immersive_CommentDataSourceFlow_0554
     * @tc.desc      CommentDataSource call flow pushItem > pushItem > totalCount > totalCount > totalCount keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0554', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0554 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(56.29);
      subject.pushItem(72.31);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(4);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(4);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(4);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0554 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0555
     * @tc.name      Immersive_CommentDataSourceFlow_0555
     * @tc.desc      CommentDataSource call flow getData > pushItem > totalCount > totalCount > getData keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0555', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0555 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(35.47);
      logInfo(`step1 getData(35.47): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(74);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.getData(83);
      logInfo(`step5 getData(83): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0555 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0556
     * @tc.name      Immersive_CommentDataSourceFlow_0556
     * @tc.desc      CommentDataSource call flow totalCount > getData > totalCount > pushItem > getData keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0556', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0556 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.getData(179);
      logInfo(`step2 getData(179): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      subject.pushItem(-88);
      const step5: number = subject.getData(91.51);
      logInfo(`step5 getData(91.51): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0556 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0557
     * @tc.name      Immersive_CommentDataSourceFlow_0557
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > getData > getData > totalCount keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0557', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0557 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(39);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.getData(81);
      logInfo(`step3 getData(81): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.getData(91.15);
      logInfo(`step4 getData(91.15): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0557 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0558
     * @tc.name      Immersive_CommentDataSourceFlow_0558
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > totalCount > pushItem > totalCount keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0558', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0558 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(-52);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      subject.pushItem(-15);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0558 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0559
     * @tc.name      Immersive_CommentDataSourceFlow_0559
     * @tc.desc      CommentDataSource call flow getData > totalCount > pushItem > pushItem > totalCount keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0559', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0559 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(197);
      logInfo(`step1 getData(197): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.pushItem(-21);
      subject.pushItem(45.85);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0559 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0560
     * @tc.name      Immersive_CommentDataSourceFlow_0560
     * @tc.desc      CommentDataSource call flow getData > pushItem > totalCount > totalCount > getData keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0560', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0560 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(86.23);
      logInfo(`step1 getData(86.23): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(98.98);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.getData(-80);
      logInfo(`step5 getData(-80): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0560 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0561
     * @tc.name      Immersive_CommentDataSourceFlow_0561
     * @tc.desc      CommentDataSource call flow totalCount > getData > getData > pushItem > totalCount keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0561', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0561 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.getData(-22);
      logInfo(`step2 getData(-22): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(127);
      logInfo(`step3 getData(127): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushItem(71.07);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0561 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0562
     * @tc.name      Immersive_CommentDataSourceFlow_0562
     * @tc.desc      CommentDataSource call flow getData > totalCount > getData > getData > getData keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0562', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0562 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(53);
      logInfo(`step1 getData(53): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.getData(-68);
      logInfo(`step3 getData(-68): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.getData(48);
      logInfo(`step4 getData(48): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.getData(32.33);
      logInfo(`step5 getData(32.33): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0562 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0563
     * @tc.name      Immersive_CommentDataSourceFlow_0563
     * @tc.desc      CommentDataSource call flow totalCount > getData > pushItem > pushItem > totalCount keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0563', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0563 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.getData(61.45);
      logInfo(`step2 getData(61.45): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushItem(26);
      subject.pushItem(19);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(4);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0563 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0564
     * @tc.name      Immersive_CommentDataSourceFlow_0564
     * @tc.desc      CommentDataSource call flow getData > getData > getData > totalCount > getData keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0564', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0564 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(81);
      logInfo(`step1 getData(81): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(8.87);
      logInfo(`step2 getData(8.87): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(-3);
      logInfo(`step3 getData(-3): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.getData(187);
      logInfo(`step5 getData(187): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0564 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0565
     * @tc.name      Immersive_CommentDataSourceFlow_0565
     * @tc.desc      CommentDataSource call flow totalCount > pushItem > pushItem > getData > getData keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0565', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0565 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.pushItem(-64);
      subject.pushItem(-19);
      const step4: number = subject.getData(90.43);
      logInfo(`step4 getData(90.43): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.getData(83.4);
      logInfo(`step5 getData(83.4): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0565 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0566
     * @tc.name      Immersive_CommentDataSourceFlow_0566
     * @tc.desc      CommentDataSource call flow getData > getData > getData > getData > totalCount keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0566', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0566 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(9.67);
      logInfo(`step1 getData(9.67): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(89);
      logInfo(`step2 getData(89): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(71.11);
      logInfo(`step3 getData(71.11): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.getData(-14);
      logInfo(`step4 getData(-14): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0566 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0567
     * @tc.name      Immersive_CommentDataSourceFlow_0567
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > getData > getData > totalCount keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0567', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0567 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.getData(51);
      logInfo(`step3 getData(51): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.getData(31.55);
      logInfo(`step4 getData(31.55): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0567 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0568
     * @tc.name      Immersive_CommentDataSourceFlow_0568
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > getData > totalCount > totalCount keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0568', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0568 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.getData(8.37);
      logInfo(`step3 getData(8.37): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0568 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0569
     * @tc.name      Immersive_CommentDataSourceFlow_0569
     * @tc.desc      CommentDataSource call flow getData > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0569', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0569 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(-64);
      logInfo(`step1 getData(-64): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(127);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0569 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0570
     * @tc.name      Immersive_CommentDataSourceFlow_0570
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0570', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0570 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      subject.pushItem(80);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0570 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0571
     * @tc.name      Immersive_CommentDataSourceFlow_0571
     * @tc.desc      CommentDataSource call flow totalCount > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0571', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0571 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      subject.pushItem(-43);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0571 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0572
     * @tc.name      Immersive_CommentDataSourceFlow_0572
     * @tc.desc      CommentDataSource call flow totalCount > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0572', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0572 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      subject.pushItem(22.59);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0572 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0573
     * @tc.name      Immersive_CommentDataSourceFlow_0573
     * @tc.desc      CommentDataSource call flow pushItem > getData > getData > pushItem > pushItem keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0573', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0573 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(121);
      const step2: number = subject.getData(20.89);
      logInfo(`step2 getData(20.89): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(155);
      logInfo(`step3 getData(155): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushItem(-72);
      subject.pushItem(-29);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0573 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0574
     * @tc.name      Immersive_CommentDataSourceFlow_0574
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > totalCount > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0574', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0574 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(99.03);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.pushItem(42.35);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0574 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0575
     * @tc.name      Immersive_CommentDataSourceFlow_0575
     * @tc.desc      CommentDataSource call flow totalCount > pushItem > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0575', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0575 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      subject.pushItem(-14);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0575 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0576
     * @tc.name      Immersive_CommentDataSourceFlow_0576
     * @tc.desc      CommentDataSource call flow pushItem > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0576', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0576 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(75);
      const step2: number = subject.getData(17.08);
      logInfo(`step2 getData(17.08): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0576 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0577
     * @tc.name      Immersive_CommentDataSourceFlow_0577
     * @tc.desc      CommentDataSource call flow getData > pushItem > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0577', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0577 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(70.43);
      logInfo(`step1 getData(70.43): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(103);
      const step3: number = subject.getData(181);
      logInfo(`step3 getData(181): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0577 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0578
     * @tc.name      Immersive_CommentDataSourceFlow_0578
     * @tc.desc      CommentDataSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0578', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0578 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0578 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0579
     * @tc.name      Immersive_CommentDataSourceFlow_0579
     * @tc.desc      CommentDataSource call flow totalCount > pushItem > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0579', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0579 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushItem(43.71);
      subject.pushItem(-49);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0579 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0580
     * @tc.name      Immersive_CommentDataSourceFlow_0580
     * @tc.desc      CommentDataSource call flow getData > totalCount > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0580', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0580 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(-28);
      logInfo(`step1 getData(-28): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      subject.pushItem(-8);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0580 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0581
     * @tc.name      Immersive_CommentDataSourceFlow_0581
     * @tc.desc      CommentDataSource call flow totalCount > pushItem > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0581', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0581 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      subject.pushItem(93);
      subject.pushItem(-39);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0581 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0582
     * @tc.name      Immersive_CommentDataSourceFlow_0582
     * @tc.desc      CommentDataSource call flow pushItem > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0582', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0582 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(180);
      const step2: number = subject.getData(50);
      logInfo(`step2 getData(50): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0582 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0583
     * @tc.name      Immersive_CommentDataSourceFlow_0583
     * @tc.desc      CommentDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0583', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0583 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(-55);
      logInfo(`step1 getData(-55): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0583 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0584
     * @tc.name      Immersive_CommentDataSourceFlow_0584
     * @tc.desc      CommentDataSource call flow getData > pushItem > pushItem > pushItem > pushItem keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0584', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0584 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(-92);
      logInfo(`step1 getData(-92): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(76);
      subject.pushItem(131);
      subject.pushItem(-99);
      subject.pushItem(16.07);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0584 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0585
     * @tc.name      Immersive_CommentDataSourceFlow_0585
     * @tc.desc      CommentDataSource call flow pushItem > getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0585', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0585 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(105);
      const step2: number = subject.getData(183);
      logInfo(`step2 getData(183): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(88.98);
      logInfo(`step3 getData(88.98): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.getData(91.15);
      logInfo(`step4 getData(91.15): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0585 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0586
     * @tc.name      Immersive_CommentDataSourceFlow_0586
     * @tc.desc      CommentDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0586', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0586 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(63.73);
      logInfo(`step1 getData(63.73): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0586 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0587
     * @tc.name      Immersive_CommentDataSourceFlow_0587
     * @tc.desc      CommentDataSource call flow pushItem > pushItem > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0587', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0587 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(142);
      subject.pushItem(134);
      const step3: number = subject.getData(-14);
      logInfo(`step3 getData(-14): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0587 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0588
     * @tc.name      Immersive_CommentDataSourceFlow_0588
     * @tc.desc      CommentDataSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0588', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0588 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0588 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0589
     * @tc.name      Immersive_CommentDataSourceFlow_0589
     * @tc.desc      CommentDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0589', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0589 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.getData(39.63);
      logInfo(`step2 getData(39.63): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0589 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0590
     * @tc.name      Immersive_CommentDataSourceFlow_0590
     * @tc.desc      CommentDataSource call flow totalCount > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0590', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0590 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.pushItem(-60);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0590 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0591
     * @tc.name      Immersive_CommentDataSourceFlow_0591
     * @tc.desc      CommentDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0591', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0591 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.getData(77.19);
      logInfo(`step2 getData(77.19): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0591 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0592
     * @tc.name      Immersive_CommentDataSourceFlow_0592
     * @tc.desc      CommentDataSource call flow getData > getData > pushItem > pushItem > pushItem keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0592', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0592 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(50.47);
      logInfo(`step1 getData(50.47): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(-1);
      logInfo(`step2 getData(-1): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushItem(153);
      subject.pushItem(-55);
      subject.pushItem(49.59);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0592 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0593
     * @tc.name      Immersive_CommentDataSourceFlow_0593
     * @tc.desc      CommentDataSource call flow pushItem > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0593', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0593 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(37);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(3);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0593 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0594
     * @tc.name      Immersive_CommentDataSourceFlow_0594
     * @tc.desc      CommentDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0594', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0594 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(139);
      logInfo(`step1 getData(139): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0594 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0595
     * @tc.name      Immersive_CommentDataSourceFlow_0595
     * @tc.desc      CommentDataSource call flow pushItem > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0595', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0595 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(56.74);
      const step2: number = subject.getData(138);
      logInfo(`step2 getData(138): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(61.45);
      logInfo(`step3 getData(61.45): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0595 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0596
     * @tc.name      Immersive_CommentDataSourceFlow_0596
     * @tc.desc      CommentDataSource call flow pushItem > getData > pushItem > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0596', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0596 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(199);
      const step2: number = subject.getData(6.86);
      logInfo(`step2 getData(6.86): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushItem(-19);
      subject.pushItem(85.4);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0596 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0597
     * @tc.name      Immersive_CommentDataSourceFlow_0597
     * @tc.desc      CommentDataSource call flow getData > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0597', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0597 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(72.28);
      logInfo(`step1 getData(72.28): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(77);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0597 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0598
     * @tc.name      Immersive_CommentDataSourceFlow_0598
     * @tc.desc      CommentDataSource call flow pushItem > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0598', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0598 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(89);
      const step2: number = subject.getData(125);
      logInfo(`step2 getData(125): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0598 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0599
     * @tc.name      Immersive_CommentDataSourceFlow_0599
     * @tc.desc      CommentDataSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0599', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0599 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0599 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0600
     * @tc.name      Immersive_CommentDataSourceFlow_0600
     * @tc.desc      CommentDataSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0600 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0600 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0601
     * @tc.name      Immersive_CommentDataSourceFlow_0601
     * @tc.desc      CommentDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0601', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0601 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(-95);
      logInfo(`step1 getData(-95): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0601 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0602
     * @tc.name      Immersive_CommentDataSourceFlow_0602
     * @tc.desc      CommentDataSource call flow totalCount > getData > totalCount > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0602', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0602 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.getData(194);
      logInfo(`step2 getData(194): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.pushItem(88.11);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0602 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0603
     * @tc.name      Immersive_CommentDataSourceFlow_0603
     * @tc.desc      CommentDataSource call flow totalCount > pushItem > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0603', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0603 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushItem(-81);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0603 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0604
     * @tc.name      Immersive_CommentDataSourceFlow_0604
     * @tc.desc      CommentDataSource call flow pushItem > getData > getData > totalCount > pushItem keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0604', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0604 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(-30);
      const step2: number = subject.getData(-23);
      logInfo(`step2 getData(-23): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(-1);
      logInfo(`step3 getData(-1): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      subject.pushItem(89.17);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0604 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0605
     * @tc.name      Immersive_CommentDataSourceFlow_0605
     * @tc.desc      CommentDataSource call flow getData > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0605', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0605 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(62);
      logInfo(`step1 getData(62): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(35);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0605 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0606
     * @tc.name      Immersive_CommentDataSourceFlow_0606
     * @tc.desc      CommentDataSource call flow pushItem > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0606', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0606 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(-1);
      const step2: number = subject.getData(6);
      logInfo(`step2 getData(6): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0606 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0607
     * @tc.name      Immersive_CommentDataSourceFlow_0607
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0607', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0607 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.pushItem(62.64);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0607 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0608
     * @tc.name      Immersive_CommentDataSourceFlow_0608
     * @tc.desc      CommentDataSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0608', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0608 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0608 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0609
     * @tc.name      Immersive_CommentDataSourceFlow_0609
     * @tc.desc      CommentDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0609', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0609 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(-15);
      logInfo(`step1 getData(-15): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0609 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0610
     * @tc.name      Immersive_CommentDataSourceFlow_0610
     * @tc.desc      CommentDataSource call flow getData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0610', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0610 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(183);
      logInfo(`step1 getData(183): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0610 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0611
     * @tc.name      Immersive_CommentDataSourceFlow_0611
     * @tc.desc      CommentDataSource call flow getData > totalCount > pushItem > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0611', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0611 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(131);
      logInfo(`step1 getData(131): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.pushItem(130);
      subject.pushItem(32.89);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0611 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0612
     * @tc.name      Immersive_CommentDataSourceFlow_0612
     * @tc.desc      CommentDataSource call flow pushItem > pushItem > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0612', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0612 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(98.34);
      subject.pushItem(29);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(4);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(4);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0612 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0613
     * @tc.name      Immersive_CommentDataSourceFlow_0613
     * @tc.desc      CommentDataSource call flow pushItem > getData > totalCount > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0613', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0613 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(61.62);
      const step2: number = subject.getData(63.73);
      logInfo(`step2 getData(63.73): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.pushItem(96.87);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0613 end`);
    });
  });
}
