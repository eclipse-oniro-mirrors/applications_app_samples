/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { logInfo, BUNDLE } from '../common/ResolutionTestSupport';
import {
  CameraInit2Model,
} from '../model/ResolutionLogic';

/** CameraInit2SequenceTest logic checks (46 cases). */
export default function cameraInit2SequenceTest(): void {
  describe('CameraInit2SequenceTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0001
     * @tc.name      Resolution_Init2Seq_0001
     * @tc.desc      initCamera2 after 0 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_Init2Seq_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Init2Seq_0001 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      logInfo("init then 0 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "7:1");
      expect(actual).assertEqual("7:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0002
     * @tc.name      Resolution_Init2Seq_0002
     * @tc.desc      initCamera2 after 1 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0002 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      subject.switchPosition();
      logInfo("init then 1 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "8:2");
      expect(actual).assertEqual("8:2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0003
     * @tc.name      Resolution_Init2Seq_0003
     * @tc.desc      initCamera2 after 2 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0003 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      subject.switchPosition();
      subject.switchPosition();
      logInfo("init then 2 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "9:1");
      expect(actual).assertEqual("9:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
