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

/** Logic checks for CommentDataSource flow (74 cases). */
export default function commentDataSourceFlow11Test(): void {
  describe('CommentDataSourceFlow11Test', (): void => {
    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0614
     * @tc.name      Immersive_CommentDataSourceFlow_0614
     * @tc.desc      CommentDataSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0614', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0614 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0614 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0615
     * @tc.name      Immersive_CommentDataSourceFlow_0615
     * @tc.desc      CommentDataSource call flow getData > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0615', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0615 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(62);
      logInfo(`step1 getData(62): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(182);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0615 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0616
     * @tc.name      Immersive_CommentDataSourceFlow_0616
     * @tc.desc      CommentDataSource call flow pushItem > getData > getData > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0616', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0616 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(107);
      const step2: number = subject.getData(62.45);
      logInfo(`step2 getData(62.45): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(20);
      logInfo(`step3 getData(20): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushItem(60.54);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0616 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0617
     * @tc.name      Immersive_CommentDataSourceFlow_0617
     * @tc.desc      CommentDataSource call flow getData > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0617', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0617 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(88.71);
      logInfo(`step1 getData(88.71): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(20);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0617 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0618
     * @tc.name      Immersive_CommentDataSourceFlow_0618
     * @tc.desc      CommentDataSource call flow pushItem > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0618', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0618 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(163);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0618 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0619
     * @tc.name      Immersive_CommentDataSourceFlow_0619
     * @tc.desc      CommentDataSource call flow totalCount > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0619', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0619 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.getData(97.99);
      logInfo(`step2 getData(97.99): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(48);
      logInfo(`step3 getData(48): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0619 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0620
     * @tc.name      Immersive_CommentDataSourceFlow_0620
     * @tc.desc      CommentDataSource call flow pushItem > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0620', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0620 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(75.52);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(3);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0620 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0621
     * @tc.name      Immersive_CommentDataSourceFlow_0621
     * @tc.desc      CommentDataSource call flow getData > pushItem > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0621', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0621 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(33.74);
      logInfo(`step1 getData(33.74): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(107);
      const step3: number = subject.getData(62.53);
      logInfo(`step3 getData(62.53): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0621 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0622
     * @tc.name      Immersive_CommentDataSourceFlow_0622
     * @tc.desc      CommentDataSource call flow totalCount > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0622', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0622 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.pushItem(28.21);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0622 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0623
     * @tc.name      Immersive_CommentDataSourceFlow_0623
     * @tc.desc      CommentDataSource call flow getData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0623', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0623 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(170);
      logInfo(`step1 getData(170): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0623 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0624
     * @tc.name      Immersive_CommentDataSourceFlow_0624
     * @tc.desc      CommentDataSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0624', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0624 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0624 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0625
     * @tc.name      Immersive_CommentDataSourceFlow_0625
     * @tc.desc      CommentDataSource call flow pushItem > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0625', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0625 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(62.5);
      const step2: number = subject.getData(-63);
      logInfo(`step2 getData(-63): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0625 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0626
     * @tc.name      Immersive_CommentDataSourceFlow_0626
     * @tc.desc      CommentDataSource call flow getData > getData > pushItem > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0626', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0626 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(-54);
      logInfo(`step1 getData(-54): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(116);
      logInfo(`step2 getData(116): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushItem(66.11);
      subject.pushItem(56.29);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0626 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0627
     * @tc.name      Immersive_CommentDataSourceFlow_0627
     * @tc.desc      CommentDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0627', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0627 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.getData(-65);
      logInfo(`step2 getData(-65): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0627 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0628
     * @tc.name      Immersive_CommentDataSourceFlow_0628
     * @tc.desc      CommentDataSource call flow getData > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0628', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0628 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(23.33);
      logInfo(`step1 getData(23.33): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(71.6);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0628 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0629
     * @tc.name      Immersive_CommentDataSourceFlow_0629
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > getData > pushItem > pushItem keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0629', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0629 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.getData(6.09);
      logInfo(`step3 getData(6.09): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushItem(66.38);
      subject.pushItem(50);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0629 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0630
     * @tc.name      Immersive_CommentDataSourceFlow_0630
     * @tc.desc      CommentDataSource call flow getData > getData > pushItem > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0630', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0630 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(69);
      logInfo(`step1 getData(69): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(166);
      logInfo(`step2 getData(166): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushItem(-11);
      subject.pushItem(55.54);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0630 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0631
     * @tc.name      Immersive_CommentDataSourceFlow_0631
     * @tc.desc      CommentDataSource call flow totalCount > getData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0631', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0631 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.getData(-89);
      logInfo(`step2 getData(-89): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0631 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0632
     * @tc.name      Immersive_CommentDataSourceFlow_0632
     * @tc.desc      CommentDataSource call flow pushItem > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0632', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0632 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(100);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(3);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0632 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0633
     * @tc.name      Immersive_CommentDataSourceFlow_0633
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > totalCount > totalCount > totalCount keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0633', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0633 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(88.07);
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
      logInfo(`${BUNDLE}CommentDataSourceFlow_0633 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0634
     * @tc.name      Immersive_CommentDataSourceFlow_0634
     * @tc.desc      CommentDataSource call flow pushItem > getData > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0634', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0634 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(94);
      const step2: number = subject.getData(54.87);
      logInfo(`step2 getData(54.87): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushItem(13.01);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0634 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0635
     * @tc.name      Immersive_CommentDataSourceFlow_0635
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0635', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0635 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(145);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0635 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0636
     * @tc.name      Immersive_CommentDataSourceFlow_0636
     * @tc.desc      CommentDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0636', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0636 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(153);
      logInfo(`step1 getData(153): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0636 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0637
     * @tc.name      Immersive_CommentDataSourceFlow_0637
     * @tc.desc      CommentDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0637', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0637 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.getData(25.97);
      logInfo(`step2 getData(25.97): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0637 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0638
     * @tc.name      Immersive_CommentDataSourceFlow_0638
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0638', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0638 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.pushItem(163);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0638 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0639
     * @tc.name      Immersive_CommentDataSourceFlow_0639
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0639', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0639 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.getData(180);
      logInfo(`step3 getData(180): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0639 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0640
     * @tc.name      Immersive_CommentDataSourceFlow_0640
     * @tc.desc      CommentDataSource call flow totalCount > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0640', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0640 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.pushItem(-64);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0640 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0641
     * @tc.name      Immersive_CommentDataSourceFlow_0641
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > totalCount > totalCount keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0641', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0641 begin`);
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
      logInfo(`${BUNDLE}CommentDataSourceFlow_0641 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0642
     * @tc.name      Immersive_CommentDataSourceFlow_0642
     * @tc.desc      CommentDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0642', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0642 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.getData(30.5);
      logInfo(`step2 getData(30.5): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0642 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0643
     * @tc.name      Immersive_CommentDataSourceFlow_0643
     * @tc.desc      CommentDataSource call flow pushItem > getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0643', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0643 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(98.98);
      const step2: number = subject.getData(158);
      logInfo(`step2 getData(158): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(23.58);
      logInfo(`step3 getData(23.58): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.getData(67.05);
      logInfo(`step4 getData(67.05): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0643 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0644
     * @tc.name      Immersive_CommentDataSourceFlow_0644
     * @tc.desc      CommentDataSource call flow getData > pushItem > getData > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0644', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0644 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(13.43);
      logInfo(`step1 getData(13.43): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(85.4);
      const step3: number = subject.getData(5.65);
      logInfo(`step3 getData(5.65): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushItem(98.79);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0644 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0645
     * @tc.name      Immersive_CommentDataSourceFlow_0645
     * @tc.desc      CommentDataSource call flow pushItem > getData > getData > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0645', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0645 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(97.63);
      const step2: number = subject.getData(43.58);
      logInfo(`step2 getData(43.58): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(101);
      logInfo(`step3 getData(101): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushItem(-100);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0645 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0646
     * @tc.name      Immersive_CommentDataSourceFlow_0646
     * @tc.desc      CommentDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0646', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0646 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(62.53);
      logInfo(`step1 getData(62.53): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(180);
      logInfo(`step2 getData(180): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0646 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0647
     * @tc.name      Immersive_CommentDataSourceFlow_0647
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0647', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0647 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.getData(62.91);
      logInfo(`step3 getData(62.91): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0647 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0648
     * @tc.name      Immersive_CommentDataSourceFlow_0648
     * @tc.desc      CommentDataSource call flow getData > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0648', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0648 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(51.81);
      logInfo(`step1 getData(51.81): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(3.46);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0648 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0649
     * @tc.name      Immersive_CommentDataSourceFlow_0649
     * @tc.desc      CommentDataSource call flow totalCount > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0649', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0649 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.getData(42.73);
      logInfo(`step2 getData(42.73): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0649 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0650
     * @tc.name      Immersive_CommentDataSourceFlow_0650
     * @tc.desc      CommentDataSource call flow pushItem > pushItem > getData > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0650', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0650 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(125);
      subject.pushItem(-2);
      const step3: number = subject.getData(73);
      logInfo(`step3 getData(73): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushItem(25);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0650 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0651
     * @tc.name      Immersive_CommentDataSourceFlow_0651
     * @tc.desc      CommentDataSource call flow getData > getData > pushItem > pushItem > getData keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0651', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0651 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(79);
      logInfo(`step1 getData(79): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(175);
      logInfo(`step2 getData(175): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushItem(109);
      subject.pushItem(115);
      const step5: number = subject.getData(150);
      logInfo(`step5 getData(150): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0651 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0652
     * @tc.name      Immersive_CommentDataSourceFlow_0652
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > totalCount > totalCount > pushItem keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0652', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0652 begin`);
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
      subject.pushItem(82.23);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0652 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0653
     * @tc.name      Immersive_CommentDataSourceFlow_0653
     * @tc.desc      CommentDataSource call flow pushItem > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0653', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0653 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(120);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0653 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0654
     * @tc.name      Immersive_CommentDataSourceFlow_0654
     * @tc.desc      CommentDataSource call flow getData > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0654', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0654 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(-2);
      logInfo(`step1 getData(-2): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(-78);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0654 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0655
     * @tc.name      Immersive_CommentDataSourceFlow_0655
     * @tc.desc      CommentDataSource call flow pushItem > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0655', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0655 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(94);
      const step2: number = subject.getData(73.87);
      logInfo(`step2 getData(73.87): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0655 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0656
     * @tc.name      Immersive_CommentDataSourceFlow_0656
     * @tc.desc      CommentDataSource call flow totalCount > pushItem > totalCount > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0656', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0656 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushItem(75.46);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.pushItem(107);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0656 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0657
     * @tc.name      Immersive_CommentDataSourceFlow_0657
     * @tc.desc      CommentDataSource call flow getData > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0657', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0657 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(33.91);
      logInfo(`step1 getData(33.91): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(-35);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0657 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0658
     * @tc.name      Immersive_CommentDataSourceFlow_0658
     * @tc.desc      CommentDataSource call flow pushItem > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0658', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0658 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(-49);
      const step2: number = subject.getData(97);
      logInfo(`step2 getData(97): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0658 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0659
     * @tc.name      Immersive_CommentDataSourceFlow_0659
     * @tc.desc      CommentDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0659', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0659 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(144);
      logInfo(`step1 getData(144): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(83.4);
      logInfo(`step2 getData(83.4): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0659 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0660
     * @tc.name      Immersive_CommentDataSourceFlow_0660
     * @tc.desc      CommentDataSource call flow getData > pushItem > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0660', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0660 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(12);
      logInfo(`step1 getData(12): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(94.05);
      const step3: number = subject.getData(25);
      logInfo(`step3 getData(25): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0660 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0661
     * @tc.name      Immersive_CommentDataSourceFlow_0661
     * @tc.desc      CommentDataSource call flow pushItem > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0661', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0661 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(197);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0661 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0662
     * @tc.name      Immersive_CommentDataSourceFlow_0662
     * @tc.desc      CommentDataSource call flow getData > getData > getData > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0662', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0662 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(138);
      logInfo(`step1 getData(138): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(46);
      logInfo(`step2 getData(46): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(99.04);
      logInfo(`step3 getData(99.04): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushItem(108);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0662 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0663
     * @tc.name      Immersive_CommentDataSourceFlow_0663
     * @tc.desc      CommentDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0663', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0663 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(149);
      logInfo(`step1 getData(149): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(131);
      logInfo(`step2 getData(131): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0663 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0664
     * @tc.name      Immersive_CommentDataSourceFlow_0664
     * @tc.desc      CommentDataSource call flow pushItem > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0664', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0664 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(55.03);
      const step2: number = subject.getData(51.77);
      logInfo(`step2 getData(51.77): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(35.47);
      logInfo(`step3 getData(35.47): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0664 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0665
     * @tc.name      Immersive_CommentDataSourceFlow_0665
     * @tc.desc      CommentDataSource call flow getData > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0665', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0665 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(143);
      logInfo(`step1 getData(143): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(99);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0665 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0666
     * @tc.name      Immersive_CommentDataSourceFlow_0666
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0666', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0666 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      subject.pushItem(23.31);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0666 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0667
     * @tc.name      Immersive_CommentDataSourceFlow_0667
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0667', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0667 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(16.07);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0667 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0668
     * @tc.name      Immersive_CommentDataSourceFlow_0668
     * @tc.desc      CommentDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0668', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0668 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(62.53);
      logInfo(`step1 getData(62.53): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0668 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0669
     * @tc.name      Immersive_CommentDataSourceFlow_0669
     * @tc.desc      CommentDataSource call flow getData > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0669', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0669 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(23.33);
      logInfo(`step1 getData(23.33): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(101);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0669 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0670
     * @tc.name      Immersive_CommentDataSourceFlow_0670
     * @tc.desc      CommentDataSource call flow getData > getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0670', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0670 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(32);
      logInfo(`step1 getData(32): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(-19);
      logInfo(`step2 getData(-19): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(83);
      logInfo(`step3 getData(83): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0670 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0671
     * @tc.name      Immersive_CommentDataSourceFlow_0671
     * @tc.desc      CommentDataSource call flow getData > pushItem > pushItem > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0671', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0671 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(64.8);
      logInfo(`step1 getData(64.8): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(-84);
      subject.pushItem(82.96);
      subject.pushItem(69.6);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0671 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0672
     * @tc.name      Immersive_CommentDataSourceFlow_0672
     * @tc.desc      CommentDataSource call flow pushItem > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0672', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0672 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(42);
      const step2: number = subject.getData(99.04);
      logInfo(`step2 getData(99.04): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0672 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0673
     * @tc.name      Immersive_CommentDataSourceFlow_0673
     * @tc.desc      CommentDataSource call flow getData > pushItem > pushItem > getData > getData keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0673', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0673 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(96.87);
      logInfo(`step1 getData(96.87): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(77);
      subject.pushItem(142);
      const step4: number = subject.getData(186);
      logInfo(`step4 getData(186): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.getData(33.52);
      logInfo(`step5 getData(33.52): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0673 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0674
     * @tc.name      Immersive_CommentDataSourceFlow_0674
     * @tc.desc      CommentDataSource call flow pushItem > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0674', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0674 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(-34);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0674 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0675
     * @tc.name      Immersive_CommentDataSourceFlow_0675
     * @tc.desc      CommentDataSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0675', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0675 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0675 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0676
     * @tc.name      Immersive_CommentDataSourceFlow_0676
     * @tc.desc      CommentDataSource call flow getData > totalCount > getData > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0676', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0676 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(-37);
      logInfo(`step1 getData(-37): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.getData(2);
      logInfo(`step3 getData(2): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushItem(15);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0676 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0677
     * @tc.name      Immersive_CommentDataSourceFlow_0677
     * @tc.desc      CommentDataSource call flow totalCount > getData > pushItem > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0677', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0677 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.getData(172);
      logInfo(`step2 getData(172): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushItem(40);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(3);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0677 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0678
     * @tc.name      Immersive_CommentDataSourceFlow_0678
     * @tc.desc      CommentDataSource call flow getData > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0678', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0678 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(23);
      logInfo(`step1 getData(23): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(31.37);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0678 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0679
     * @tc.name      Immersive_CommentDataSourceFlow_0679
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > getData > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0679', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0679 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.getData(98.1);
      logInfo(`step3 getData(98.1): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushItem(192);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0679 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0680
     * @tc.name      Immersive_CommentDataSourceFlow_0680
     * @tc.desc      CommentDataSource call flow getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0680', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0680 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(172);
      logInfo(`step1 getData(172): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(-30);
      logInfo(`step2 getData(-30): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0680 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0681
     * @tc.name      Immersive_CommentDataSourceFlow_0681
     * @tc.desc      CommentDataSource call flow totalCount > pushItem > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0681', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0681 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushItem(98.34);
      subject.pushItem(10.09);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0681 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0682
     * @tc.name      Immersive_CommentDataSourceFlow_0682
     * @tc.desc      CommentDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0682', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0682 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(23.9);
      logInfo(`step1 getData(23.9): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0682 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0683
     * @tc.name      Immersive_CommentDataSourceFlow_0683
     * @tc.desc      CommentDataSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0683', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0683 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0683 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0684
     * @tc.name      Immersive_CommentDataSourceFlow_0684
     * @tc.desc      CommentDataSource call flow getData > pushItem > pushItem > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0684', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0684 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(48.29);
      logInfo(`step1 getData(48.29): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(128);
      subject.pushItem(-8);
      const step4: number = subject.getData(-35);
      logInfo(`step4 getData(-35): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0684 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0685
     * @tc.name      Immersive_CommentDataSourceFlow_0685
     * @tc.desc      CommentDataSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0685', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0685 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(98.55);
      logInfo(`step1 getData(98.55): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0685 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0686
     * @tc.name      Immersive_CommentDataSourceFlow_0686
     * @tc.desc      CommentDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0686', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0686 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(62.91);
      logInfo(`step1 getData(62.91): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(13.84);
      logInfo(`step2 getData(13.84): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0686 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0687
     * @tc.name      Immersive_CommentDataSourceFlow_0687
     * @tc.desc      CommentDataSource call flow totalCount > pushItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0687', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0687 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushItem(87);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0687 end`);
    });
  });
}
