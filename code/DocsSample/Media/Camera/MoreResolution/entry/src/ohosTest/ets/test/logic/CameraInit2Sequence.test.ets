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
      logInfo(`${BUNDLE}Init2Seq_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0004
     * @tc.name      Resolution_Init2Seq_0004
     * @tc.desc      initCamera2 after 3 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0004 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      subject.switchPosition();
      subject.switchPosition();
      subject.switchPosition();
      logInfo("init then 3 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "10:2");
      expect(actual).assertEqual("10:2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0005
     * @tc.name      Resolution_Init2Seq_0005
     * @tc.desc      initCamera2 after 4 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0005 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      subject.switchPosition();
      subject.switchPosition();
      subject.switchPosition();
      subject.switchPosition();
      logInfo("init then 4 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "11:1");
      expect(actual).assertEqual("11:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0006
     * @tc.name      Resolution_Init2Seq_0006
     * @tc.desc      initCamera2 after 0 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0006 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      logInfo("init then 0 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "7:1");
      expect(actual).assertEqual("7:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0007
     * @tc.name      Resolution_Init2Seq_0007
     * @tc.desc      initCamera2 after 1 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0007 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      subject.switchPosition();
      logInfo("init then 1 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "8:2");
      expect(actual).assertEqual("8:2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0008
     * @tc.name      Resolution_Init2Seq_0008
     * @tc.desc      initCamera2 after 2 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0008 begin`);
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
      logInfo(`${BUNDLE}Init2Seq_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0009
     * @tc.name      Resolution_Init2Seq_0009
     * @tc.desc      initCamera2 after 3 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0009 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      subject.switchPosition();
      subject.switchPosition();
      subject.switchPosition();
      logInfo("init then 3 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "10:2");
      expect(actual).assertEqual("10:2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0010
     * @tc.name      Resolution_Init2Seq_0010
     * @tc.desc      initCamera2 after 4 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0010 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      subject.switchPosition();
      subject.switchPosition();
      subject.switchPosition();
      subject.switchPosition();
      logInfo("init then 4 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "11:1");
      expect(actual).assertEqual("11:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0011
     * @tc.name      Resolution_Init2Seq_0011
     * @tc.desc      initCamera2 after 0 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0011 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      logInfo("init then 0 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "7:1");
      expect(actual).assertEqual("7:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0012
     * @tc.name      Resolution_Init2Seq_0012
     * @tc.desc      initCamera2 after 1 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_Init2Seq_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Init2Seq_0012 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      subject.switchPosition();
      logInfo("init then 1 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "8:2");
      expect(actual).assertEqual("8:2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0013
     * @tc.name      Resolution_Init2Seq_0013
     * @tc.desc      initCamera2 after 2 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0013 begin`);
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
      logInfo(`${BUNDLE}Init2Seq_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0014
     * @tc.name      Resolution_Init2Seq_0014
     * @tc.desc      initCamera2 after 3 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0014 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      subject.switchPosition();
      subject.switchPosition();
      subject.switchPosition();
      logInfo("init then 3 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "10:2");
      expect(actual).assertEqual("10:2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0015
     * @tc.name      Resolution_Init2Seq_0015
     * @tc.desc      initCamera2 after 4 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0015 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      subject.switchPosition();
      subject.switchPosition();
      subject.switchPosition();
      subject.switchPosition();
      logInfo("init then 4 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "11:1");
      expect(actual).assertEqual("11:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0016
     * @tc.name      Resolution_Init2Seq_0016
     * @tc.desc      initCamera2 after 0 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0016 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      logInfo("init then 0 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "7:1");
      expect(actual).assertEqual("7:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0016 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0017
     * @tc.name      Resolution_Init2Seq_0017
     * @tc.desc      initCamera2 after 1 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0017 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      subject.switchPosition();
      logInfo("init then 1 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "8:2");
      expect(actual).assertEqual("8:2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0017 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0018
     * @tc.name      Resolution_Init2Seq_0018
     * @tc.desc      initCamera2 after 2 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_Init2Seq_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Init2Seq_0018 begin`);
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
      logInfo(`${BUNDLE}Init2Seq_0018 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0019
     * @tc.name      Resolution_Init2Seq_0019
     * @tc.desc      initCamera2 after 3 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0019 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      subject.switchPosition();
      subject.switchPosition();
      subject.switchPosition();
      logInfo("init then 3 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "10:2");
      expect(actual).assertEqual("10:2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0019 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0020
     * @tc.name      Resolution_Init2Seq_0020
     * @tc.desc      initCamera2 after 4 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0020 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      subject.switchPosition();
      subject.switchPosition();
      subject.switchPosition();
      subject.switchPosition();
      logInfo("init then 4 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "11:1");
      expect(actual).assertEqual("11:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0020 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0021
     * @tc.name      Resolution_Init2Seq_0021
     * @tc.desc      initCamera2 after 0 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0021 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      logInfo("init then 0 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "7:1");
      expect(actual).assertEqual("7:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0021 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0022
     * @tc.name      Resolution_Init2Seq_0022
     * @tc.desc      initCamera2 after 1 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0022 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      subject.switchPosition();
      logInfo("init then 1 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "8:2");
      expect(actual).assertEqual("8:2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0022 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0023
     * @tc.name      Resolution_Init2Seq_0023
     * @tc.desc      initCamera2 after 2 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_Init2Seq_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Init2Seq_0023 begin`);
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
      logInfo(`${BUNDLE}Init2Seq_0023 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0024
     * @tc.name      Resolution_Init2Seq_0024
     * @tc.desc      initCamera2 after 3 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0024 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      subject.switchPosition();
      subject.switchPosition();
      subject.switchPosition();
      logInfo("init then 3 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "10:2");
      expect(actual).assertEqual("10:2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0024 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0025
     * @tc.name      Resolution_Init2Seq_0025
     * @tc.desc      initCamera2 after 4 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0025 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      subject.switchPosition();
      subject.switchPosition();
      subject.switchPosition();
      subject.switchPosition();
      logInfo("init then 4 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "11:1");
      expect(actual).assertEqual("11:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0025 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0026
     * @tc.name      Resolution_Init2Seq_0026
     * @tc.desc      initCamera2 after 0 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0026 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      logInfo("init then 0 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "7:1");
      expect(actual).assertEqual("7:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0026 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0027
     * @tc.name      Resolution_Init2Seq_0027
     * @tc.desc      initCamera2 after 1 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0027 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      subject.switchPosition();
      logInfo("init then 1 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "8:2");
      expect(actual).assertEqual("8:2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0027 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0028
     * @tc.name      Resolution_Init2Seq_0028
     * @tc.desc      initCamera2 after 2 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0028 begin`);
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
      logInfo(`${BUNDLE}Init2Seq_0028 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0029
     * @tc.name      Resolution_Init2Seq_0029
     * @tc.desc      initCamera2 after 3 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0029 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      subject.switchPosition();
      subject.switchPosition();
      subject.switchPosition();
      logInfo("init then 3 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "10:2");
      expect(actual).assertEqual("10:2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0029 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0030
     * @tc.name      Resolution_Init2Seq_0030
     * @tc.desc      initCamera2 after 4 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0030 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      subject.switchPosition();
      subject.switchPosition();
      subject.switchPosition();
      subject.switchPosition();
      logInfo("init then 4 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "11:1");
      expect(actual).assertEqual("11:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0030 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0031
     * @tc.name      Resolution_Init2Seq_0031
     * @tc.desc      initCamera2 after 0 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0031 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      logInfo("init then 0 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "7:1");
      expect(actual).assertEqual("7:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0031 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0032
     * @tc.name      Resolution_Init2Seq_0032
     * @tc.desc      initCamera2 after 1 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0032 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      subject.switchPosition();
      logInfo("init then 1 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "8:2");
      expect(actual).assertEqual("8:2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0032 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0033
     * @tc.name      Resolution_Init2Seq_0033
     * @tc.desc      initCamera2 after 2 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0033 begin`);
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
      logInfo(`${BUNDLE}Init2Seq_0033 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0034
     * @tc.name      Resolution_Init2Seq_0034
     * @tc.desc      initCamera2 after 3 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_Init2Seq_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Init2Seq_0034 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      subject.switchPosition();
      subject.switchPosition();
      subject.switchPosition();
      logInfo("init then 3 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "10:2");
      expect(actual).assertEqual("10:2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0034 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0035
     * @tc.name      Resolution_Init2Seq_0035
     * @tc.desc      initCamera2 after 4 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_Init2Seq_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Init2Seq_0035 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      subject.switchPosition();
      subject.switchPosition();
      subject.switchPosition();
      subject.switchPosition();
      logInfo("init then 4 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "11:1");
      expect(actual).assertEqual("11:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0035 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0036
     * @tc.name      Resolution_Init2Seq_0036
     * @tc.desc      initCamera2 after 0 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0036 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      logInfo("init then 0 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "7:1");
      expect(actual).assertEqual("7:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0036 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0037
     * @tc.name      Resolution_Init2Seq_0037
     * @tc.desc      initCamera2 after 1 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0037 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      subject.switchPosition();
      logInfo("init then 1 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "8:2");
      expect(actual).assertEqual("8:2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0037 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0038
     * @tc.name      Resolution_Init2Seq_0038
     * @tc.desc      initCamera2 after 2 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0038 begin`);
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
      logInfo(`${BUNDLE}Init2Seq_0038 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0039
     * @tc.name      Resolution_Init2Seq_0039
     * @tc.desc      initCamera2 after 3 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0039 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      subject.switchPosition();
      subject.switchPosition();
      subject.switchPosition();
      logInfo("init then 3 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "10:2");
      expect(actual).assertEqual("10:2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0039 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0040
     * @tc.name      Resolution_Init2Seq_0040
     * @tc.desc      initCamera2 after 4 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0040 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      subject.switchPosition();
      subject.switchPosition();
      subject.switchPosition();
      subject.switchPosition();
      logInfo("init then 4 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "11:1");
      expect(actual).assertEqual("11:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0040 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0041
     * @tc.name      Resolution_Init2Seq_0041
     * @tc.desc      initCamera2 after 0 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0041 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      logInfo("init then 0 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "7:1");
      expect(actual).assertEqual("7:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0041 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0042
     * @tc.name      Resolution_Init2Seq_0042
     * @tc.desc      initCamera2 after 1 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0042 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      subject.switchPosition();
      logInfo("init then 1 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "8:2");
      expect(actual).assertEqual("8:2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0042 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0043
     * @tc.name      Resolution_Init2Seq_0043
     * @tc.desc      initCamera2 after 2 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0043 begin`);
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
      logInfo(`${BUNDLE}Init2Seq_0043 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0044
     * @tc.name      Resolution_Init2Seq_0044
     * @tc.desc      initCamera2 after 3 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0044 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      subject.switchPosition();
      subject.switchPosition();
      subject.switchPosition();
      logInfo("init then 3 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "10:2");
      expect(actual).assertEqual("10:2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0044 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0045
     * @tc.name      Resolution_Init2Seq_0045
     * @tc.desc      initCamera2 after 4 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_Init2Seq_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Init2Seq_0045 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      subject.switchPosition();
      subject.switchPosition();
      subject.switchPosition();
      subject.switchPosition();
      logInfo("init then 4 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "11:1");
      expect(actual).assertEqual("11:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0045 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_SEQ_0046
     * @tc.name      Resolution_Init2Seq_0046
     * @tc.desc      initCamera2 after 0 switches keeps a consistent position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Seq_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Seq_0046 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.init(true, 2, true, true, true, true, true, true, true, true);
      logInfo("init then 0 switches");
      const actual: string = subject.eventCount() + ':' + subject.positionValue();
      logInfo('actual=' + String(actual) + ', expected=' + "7:1");
      expect(actual).assertEqual("7:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Seq_0046 end`);
    });
  });
}
