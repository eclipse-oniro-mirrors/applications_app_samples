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

/** Logic checks for CommentDataSource flow (60 cases). */
export default function commentDataSourceFlow4Test(): void {
  describe('CommentDataSourceFlow4Test', (): void => {
    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0191
     * @tc.name      Immersive_CommentDataSourceFlow_0191
     * @tc.desc      CommentDataSource call flow getData > getData > getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0191 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(125);
      logInfo(`step1 getData(125): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(99.04);
      logInfo(`step2 getData(99.04): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(185);
      logInfo(`step3 getData(185): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.getData(91.15);
      logInfo(`step4 getData(91.15): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.getData(-18);
      logInfo(`step5 getData(-18): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0191 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0192
     * @tc.name      Immersive_CommentDataSourceFlow_0192
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0192 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(-72);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.getData(14.64);
      logInfo(`step3 getData(14.64): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.getData(138);
      logInfo(`step4 getData(138): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0192 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0193
     * @tc.name      Immersive_CommentDataSourceFlow_0193
     * @tc.desc      CommentDataSource call flow totalCount > pushItem > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0193 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.pushItem(51.08);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(3);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(3);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0193 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0194
     * @tc.name      Immersive_CommentDataSourceFlow_0194
     * @tc.desc      CommentDataSource call flow getData > totalCount > totalCount > pushItem > getData keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0194 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(30);
      logInfo(`step1 getData(30): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      subject.pushItem(120);
      const step5: number = subject.getData(15);
      logInfo(`step5 getData(15): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0194 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0195
     * @tc.name      Immersive_CommentDataSourceFlow_0195
     * @tc.desc      CommentDataSource call flow getData > totalCount > pushItem > getData > pushItem keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0195 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(72.28);
      logInfo(`step1 getData(72.28): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.pushItem(2.26);
      const step4: number = subject.getData(4.78);
      logInfo(`step4 getData(4.78): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.pushItem(141);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0195 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0196
     * @tc.name      Immersive_CommentDataSourceFlow_0196
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > getData > totalCount > getData keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0196 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(170);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.getData(42.39);
      logInfo(`step3 getData(42.39): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.getData(63.07);
      logInfo(`step5 getData(63.07): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0196 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0197
     * @tc.name      Immersive_CommentDataSourceFlow_0197
     * @tc.desc      CommentDataSource call flow getData > totalCount > getData > getData > getData keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0197 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(-1);
      logInfo(`step1 getData(-1): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.getData(-35);
      logInfo(`step3 getData(-35): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.getData(140);
      logInfo(`step4 getData(140): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.getData(67.81);
      logInfo(`step5 getData(67.81): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0197 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0198
     * @tc.name      Immersive_CommentDataSourceFlow_0198
     * @tc.desc      CommentDataSource call flow getData > totalCount > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0198 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(8.28);
      logInfo(`step1 getData(8.28): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0198 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0199
     * @tc.name      Immersive_CommentDataSourceFlow_0199
     * @tc.desc      CommentDataSource call flow totalCount > getData > getData > getData > totalCount keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0199 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.getData(-33);
      logInfo(`step2 getData(-33): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(66);
      logInfo(`step3 getData(66): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.getData(54.15);
      logInfo(`step4 getData(54.15): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0199 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0200
     * @tc.name      Immersive_CommentDataSourceFlow_0200
     * @tc.desc      CommentDataSource call flow getData > totalCount > getData > pushItem > totalCount keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0200 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(69.04);
      logInfo(`step1 getData(69.04): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.getData(128);
      logInfo(`step3 getData(128): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushItem(4.88);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0200 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0201
     * @tc.name      Immersive_CommentDataSourceFlow_0201
     * @tc.desc      CommentDataSource call flow getData > getData > totalCount > pushItem > getData keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0201 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(127);
      logInfo(`step1 getData(127): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(109);
      logInfo(`step2 getData(109): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.pushItem(18.77);
      const step5: number = subject.getData(51);
      logInfo(`step5 getData(51): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0201 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0202
     * @tc.name      Immersive_CommentDataSourceFlow_0202
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > totalCount > totalCount > totalCount keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0202 begin`);
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
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0202 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0203
     * @tc.name      Immersive_CommentDataSourceFlow_0203
     * @tc.desc      CommentDataSource call flow pushItem > getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0203 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(23.31);
      const step2: number = subject.getData(-3);
      logInfo(`step2 getData(-3): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(67.81);
      logInfo(`step3 getData(67.81): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(3);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0203 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0204
     * @tc.name      Immersive_CommentDataSourceFlow_0204
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0204 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(89);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.getData(27.04);
      logInfo(`step4 getData(27.04): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0204 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0205
     * @tc.name      Immersive_CommentDataSourceFlow_0205
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0205 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(-61);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.getData(79);
      logInfo(`step3 getData(79): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0205 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0206
     * @tc.name      Immersive_CommentDataSourceFlow_0206
     * @tc.desc      CommentDataSource call flow getData > totalCount > pushItem > totalCount > totalCount keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0206 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(69);
      logInfo(`step1 getData(69): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.pushItem(81);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0206 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0207
     * @tc.name      Immersive_CommentDataSourceFlow_0207
     * @tc.desc      CommentDataSource call flow getData > getData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0207 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(45);
      logInfo(`step1 getData(45): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(126);
      logInfo(`step2 getData(126): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0207 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0208
     * @tc.name      Immersive_CommentDataSourceFlow_0208
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > pushItem > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0208 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(98);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(3);
      subject.pushItem(94.07);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(4);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0208 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0209
     * @tc.name      Immersive_CommentDataSourceFlow_0209
     * @tc.desc      CommentDataSource call flow totalCount > pushItem > pushItem > totalCount > pushItem keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0209 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.pushItem(-11);
      subject.pushItem(34.27);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(4);
      subject.pushItem(93.14);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0209 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0210
     * @tc.name      Immersive_CommentDataSourceFlow_0210
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > pushItem > pushItem > getData keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0210 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(139);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.pushItem(170);
      subject.pushItem(78.52);
      const step5: number = subject.getData(151);
      logInfo(`step5 getData(151): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0210 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0211
     * @tc.name      Immersive_CommentDataSourceFlow_0211
     * @tc.desc      CommentDataSource call flow pushItem > pushItem > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0211 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(142);
      subject.pushItem(16.2);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(3);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(3);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0211 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0212
     * @tc.name      Immersive_CommentDataSourceFlow_0212
     * @tc.desc      CommentDataSource call flow pushItem > getData > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0212 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(16.07);
      const step2: number = subject.getData(66);
      logInfo(`step2 getData(66): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.getData(-7);
      logInfo(`step4 getData(-7): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0212 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0213
     * @tc.name      Immersive_CommentDataSourceFlow_0213
     * @tc.desc      CommentDataSource call flow pushItem > pushItem > pushItem > pushItem > getData keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0213 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(176);
      subject.pushItem(53.63);
      subject.pushItem(91);
      subject.pushItem(-51);
      const step5: number = subject.getData(84);
      logInfo(`step5 getData(84): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0213 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0214
     * @tc.name      Immersive_CommentDataSourceFlow_0214
     * @tc.desc      CommentDataSource call flow getData > totalCount > pushItem > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0214 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(87);
      logInfo(`step1 getData(87): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.pushItem(35.54);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0214 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0215
     * @tc.name      Immersive_CommentDataSourceFlow_0215
     * @tc.desc      CommentDataSource call flow getData > getData > pushItem > totalCount > pushItem keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0215 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(20.69);
      logInfo(`step1 getData(20.69): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(31);
      logInfo(`step2 getData(31): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushItem(200);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(3);
      subject.pushItem(39.05);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0215 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0216
     * @tc.name      Immersive_CommentDataSourceFlow_0216
     * @tc.desc      CommentDataSource call flow getData > totalCount > pushItem > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0216 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(83.4);
      logInfo(`step1 getData(83.4): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.pushItem(13.49);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0216 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0217
     * @tc.name      Immersive_CommentDataSourceFlow_0217
     * @tc.desc      CommentDataSource call flow totalCount > pushItem > pushItem > getData > pushItem keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0217 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushItem(30.49);
      subject.pushItem(13.49);
      const step4: number = subject.getData(6.57);
      logInfo(`step4 getData(6.57): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.pushItem(58);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0217 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0218
     * @tc.name      Immersive_CommentDataSourceFlow_0218
     * @tc.desc      CommentDataSource call flow pushItem > getData > pushItem > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0218 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(30);
      const step2: number = subject.getData(68);
      logInfo(`step2 getData(68): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushItem(78.52);
      const step4: number = subject.getData(176);
      logInfo(`step4 getData(176): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0218 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0219
     * @tc.name      Immersive_CommentDataSourceFlow_0219
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > pushItem > getData > totalCount keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0219 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.pushItem(44);
      const step4: number = subject.getData(92.38);
      logInfo(`step4 getData(92.38): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0219 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0220
     * @tc.name      Immersive_CommentDataSourceFlow_0220
     * @tc.desc      CommentDataSource call flow getData > totalCount > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0220 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(93);
      logInfo(`step1 getData(93): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.getData(19);
      logInfo(`step3 getData(19): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.getData(23.58);
      logInfo(`step4 getData(23.58): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0220 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0221
     * @tc.name      Immersive_CommentDataSourceFlow_0221
     * @tc.desc      CommentDataSource call flow getData > pushItem > getData > totalCount > totalCount keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0221 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(51);
      logInfo(`step1 getData(51): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(26.78);
      const step3: number = subject.getData(173);
      logInfo(`step3 getData(173): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(3);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0221 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0222
     * @tc.name      Immersive_CommentDataSourceFlow_0222
     * @tc.desc      CommentDataSource call flow getData > pushItem > totalCount > pushItem > getData keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0222 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(155);
      logInfo(`step1 getData(155): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(191);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.pushItem(19);
      const step5: number = subject.getData(6.09);
      logInfo(`step5 getData(6.09): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0222 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0223
     * @tc.name      Immersive_CommentDataSourceFlow_0223
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > getData > getData > pushItem keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0223 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.getData(142);
      logInfo(`step3 getData(142): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.getData(98.22);
      logInfo(`step4 getData(98.22): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.pushItem(9);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0223 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0224
     * @tc.name      Immersive_CommentDataSourceFlow_0224
     * @tc.desc      CommentDataSource call flow getData > getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0224 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(79.04);
      logInfo(`step1 getData(79.04): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(45);
      logInfo(`step2 getData(45): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(-50);
      logInfo(`step3 getData(-50): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0224 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0225
     * @tc.name      Immersive_CommentDataSourceFlow_0225
     * @tc.desc      CommentDataSource call flow getData > getData > pushItem > totalCount > totalCount keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0225 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(83.4);
      logInfo(`step1 getData(83.4): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(51);
      logInfo(`step2 getData(51): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushItem(56);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(3);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0225 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0226
     * @tc.name      Immersive_CommentDataSourceFlow_0226
     * @tc.desc      CommentDataSource call flow getData > getData > pushItem > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0226 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(115);
      logInfo(`step1 getData(115): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(4.78);
      logInfo(`step2 getData(4.78): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushItem(-15);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0226 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0227
     * @tc.name      Immersive_CommentDataSourceFlow_0227
     * @tc.desc      CommentDataSource call flow pushItem > getData > getData > totalCount > getData keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0227 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(90.91);
      const step2: number = subject.getData(119);
      logInfo(`step2 getData(119): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(93);
      logInfo(`step3 getData(93): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(3);
      const step5: number = subject.getData(35.47);
      logInfo(`step5 getData(35.47): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0227 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0228
     * @tc.name      Immersive_CommentDataSourceFlow_0228
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0228 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      subject.pushItem(153);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.getData(18.71);
      logInfo(`step4 getData(18.71): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0228 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0229
     * @tc.name      Immersive_CommentDataSourceFlow_0229
     * @tc.desc      CommentDataSource call flow pushItem > getData > getData > getData > totalCount keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0229 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(98.34);
      const step2: number = subject.getData(99);
      logInfo(`step2 getData(99): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(41);
      logInfo(`step3 getData(41): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.getData(33.52);
      logInfo(`step4 getData(33.52): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0229 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0230
     * @tc.name      Immersive_CommentDataSourceFlow_0230
     * @tc.desc      CommentDataSource call flow getData > getData > getData > totalCount > totalCount keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0230 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(-62);
      logInfo(`step1 getData(-62): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(146);
      logInfo(`step2 getData(146): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(120);
      logInfo(`step3 getData(120): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0230 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0231
     * @tc.name      Immersive_CommentDataSourceFlow_0231
     * @tc.desc      CommentDataSource call flow getData > getData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0231 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(77.19);
      logInfo(`step1 getData(77.19): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.getData(76);
      logInfo(`step2 getData(76): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0231 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0232
     * @tc.name      Immersive_CommentDataSourceFlow_0232
     * @tc.desc      CommentDataSource call flow pushItem > getData > pushItem > getData > totalCount keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0232 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(-43);
      const step2: number = subject.getData(23.33);
      logInfo(`step2 getData(23.33): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushItem(60.54);
      const step4: number = subject.getData(12);
      logInfo(`step4 getData(12): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(4);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0232 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0233
     * @tc.name      Immersive_CommentDataSourceFlow_0233
     * @tc.desc      CommentDataSource call flow getData > totalCount > pushItem > totalCount > getData keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0233 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(-73);
      logInfo(`step1 getData(-73): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.pushItem(-60);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.getData(8.37);
      logInfo(`step5 getData(8.37): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0233 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0234
     * @tc.name      Immersive_CommentDataSourceFlow_0234
     * @tc.desc      CommentDataSource call flow getData > pushItem > totalCount > totalCount > pushItem keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0234 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(133);
      logInfo(`step1 getData(133): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(15.58);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      subject.pushItem(140);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0234 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0235
     * @tc.name      Immersive_CommentDataSourceFlow_0235
     * @tc.desc      CommentDataSource call flow getData > pushItem > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0235 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(117);
      logInfo(`step1 getData(117): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(35.32);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0235 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0236
     * @tc.name      Immersive_CommentDataSourceFlow_0236
     * @tc.desc      CommentDataSource call flow getData > pushItem > pushItem > pushItem > getData keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0236 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(73.87);
      logInfo(`step1 getData(73.87): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(83);
      subject.pushItem(98.98);
      subject.pushItem(61);
      const step5: number = subject.getData(-95);
      logInfo(`step5 getData(-95): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0236 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0237
     * @tc.name      Immersive_CommentDataSourceFlow_0237
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > pushItem > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0237 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(88.07);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      subject.pushItem(116);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(3);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0237 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0238
     * @tc.name      Immersive_CommentDataSourceFlow_0238
     * @tc.desc      CommentDataSource call flow totalCount > getData > pushItem > getData > getData keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0238 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.getData(66);
      logInfo(`step2 getData(66): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushItem(5);
      const step4: number = subject.getData(95);
      logInfo(`step4 getData(95): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.getData(51.57);
      logInfo(`step5 getData(51.57): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0238 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0239
     * @tc.name      Immersive_CommentDataSourceFlow_0239
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > pushItem > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0239 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(140);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      subject.pushItem(21);
      const step4: number = subject.getData(14.12);
      logInfo(`step4 getData(14.12): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0239 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0240
     * @tc.name      Immersive_CommentDataSourceFlow_0240
     * @tc.desc      CommentDataSource call flow totalCount > pushItem > totalCount > totalCount > getData keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0240 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushItem(17.27);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.getData(95.05);
      logInfo(`step5 getData(95.05): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0240 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0241
     * @tc.name      Immersive_CommentDataSourceFlow_0241
     * @tc.desc      CommentDataSource call flow pushItem > totalCount > totalCount > totalCount > totalCount keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0241 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      subject.pushItem(-19);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(3);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(3);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0241 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0242
     * @tc.name      Immersive_CommentDataSourceFlow_0242
     * @tc.desc      CommentDataSource call flow totalCount > getData > getData > totalCount > totalCount keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0242 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.getData(87);
      logInfo(`step2 getData(87): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.getData(85.35);
      logInfo(`step3 getData(85.35): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0242 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0243
     * @tc.name      Immersive_CommentDataSourceFlow_0243
     * @tc.desc      CommentDataSource call flow getData > pushItem > getData > getData > totalCount keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0243 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.getData(116);
      logInfo(`step1 getData(116): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushItem(-4);
      const step3: number = subject.getData(-55);
      logInfo(`step3 getData(-55): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.getData(48.29);
      logInfo(`step4 getData(48.29): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0243 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0244
     * @tc.name      Immersive_CommentDataSourceFlow_0244
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > totalCount > getData > totalCount keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0244 begin`);
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
      const step4: number = subject.getData(72);
      logInfo(`step4 getData(72): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0244 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0245
     * @tc.name      Immersive_CommentDataSourceFlow_0245
     * @tc.desc      CommentDataSource call flow getData > totalCount > totalCount > pushItem > totalCount keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0245 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      const step1: number = subject.getData(92.38);
      logInfo(`step1 getData(92.38): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.pushItem(75);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0245 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0246
     * @tc.name      Immersive_CommentDataSourceFlow_0246
     * @tc.desc      CommentDataSource call flow totalCount > pushItem > totalCount > totalCount > pushItem keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0246 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushItem(112);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      subject.pushItem(84.62);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0246 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0247
     * @tc.name      Immersive_CommentDataSourceFlow_0247
     * @tc.desc      CommentDataSource call flow totalCount > totalCount > getData > pushItem > getData keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0247 begin`);
      const subject: CommentDataSource = new CommentDataSource([0, 1]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.getData(75);
      logInfo(`step3 getData(75): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushItem(35.65);
      const step5: number = subject.getData(75);
      logInfo(`step5 getData(75): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0247 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0248
     * @tc.name      Immersive_CommentDataSourceFlow_0248
     * @tc.desc      CommentDataSource call flow pushItem > pushItem > getData > pushItem > totalCount keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0248 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(43);
      subject.pushItem(31.37);
      const step3: number = subject.getData(8.87);
      logInfo(`step3 getData(8.87): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushItem(14.41);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(4);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0248 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0249
     * @tc.name      Immersive_CommentDataSourceFlow_0249
     * @tc.desc      CommentDataSource call flow getData > totalCount > pushItem > totalCount > totalCount keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0249 begin`);
      const subject: CommentDataSource = new CommentDataSource([]);
      const step1: number = subject.getData(92.38);
      logInfo(`step1 getData(92.38): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.pushItem(35);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`${BUNDLE}CommentDataSourceFlow_0249 end`);
    });

    /**
     * @tc.number    SUB_IMMERSIVE_COMMENT_DATA_SOURCE_FLOW_0250
     * @tc.name      Immersive_CommentDataSourceFlow_0250
     * @tc.desc      CommentDataSource call flow pushItem > pushItem > getData > pushItem > getData keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Immersive_CommentDataSourceFlow_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CommentDataSourceFlow_0250 begin`);
      const subject: CommentDataSource = new CommentDataSource([0]);
      subject.pushItem(-87);
      subject.pushItem(98.79);
      const step3: number = subject.getData(69);
      logInfo(`step3 getData(69): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushItem(199);
      const step5: number = subject.getData(54.87);
      logInfo(`step5 getData(54.87): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}CommentDataSourceFlow_0250 end`);
    });
  });
}
