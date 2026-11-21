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
  ResolutionEventModel,
} from '../model/ResolutionLogic';

/** EventNotifyFlowTest logic checks (46 cases). */
export default function eventNotifyFlowTest(): void {
  describe('EventNotifyFlowTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0001
     * @tc.name      Resolution_EventFlow_0001
     * @tc.desc      notification sequence 0 tallies to 1:0:0:0:0:0:0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_EventFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}EventFlow_0001 begin`);
      const subject: ResolutionEventModel = new ResolutionEventModel();
      subject.onFrameStart();
      logInfo("notification sequence seed 0");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:0:0:0:0:0");
      expect(actual).assertEqual("1:0:0:0:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0002
     * @tc.name      Resolution_EventFlow_0002
     * @tc.desc      notification sequence 1 tallies to 0:0:1:1:0:0:0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EventFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventFlow_0002 begin`);
      const subject: ResolutionEventModel = new ResolutionEventModel();
      subject.onPhotoAsset('asset');
      subject.onPhotoAvailable(4);
      logInfo("notification sequence seed 1");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:1:1:0:0:0");
      expect(actual).assertEqual("0:0:1:1:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0003
     * @tc.name      Resolution_EventFlow_0003
     * @tc.desc      notification sequence 2 tallies to 0:0:0:1:1:1:0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EventFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventFlow_0003 begin`);
      const subject: ResolutionEventModel = new ResolutionEventModel();
      subject.onPhotoAvailable(4);
      subject.onError(500);
      subject.onStatus(1);
      logInfo("notification sequence seed 2");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:0:1:1:1:0");
      expect(actual).assertEqual("0:0:0:1:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0004
     * @tc.name      Resolution_EventFlow_0004
     * @tc.desc      notification sequence 3 tallies to 1:0:0:0:1:1:1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EventFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventFlow_0004 begin`);
      const subject: ResolutionEventModel = new ResolutionEventModel();
      subject.onError(500);
      subject.onStatus(1);
      subject.onFold(1);
      subject.onFrameStart();
      logInfo("notification sequence seed 3");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:0:0:1:1:1");
      expect(actual).assertEqual("1:0:0:0:1:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0005
     * @tc.name      Resolution_EventFlow_0005
     * @tc.desc      notification sequence 4 tallies to 0:0:0:0:0:1:0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EventFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventFlow_0005 begin`);
      const subject: ResolutionEventModel = new ResolutionEventModel();
      subject.onStatus(1);
      logInfo("notification sequence seed 4");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:0:0:0:1:0");
      expect(actual).assertEqual("0:0:0:0:0:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0006
     * @tc.name      Resolution_EventFlow_0006
     * @tc.desc      notification sequence 5 tallies to 1:0:0:0:0:0:1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EventFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventFlow_0006 begin`);
      const subject: ResolutionEventModel = new ResolutionEventModel();
      subject.onFold(1);
      subject.onFrameStart();
      logInfo("notification sequence seed 5");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:0:0:0:0:1");
      expect(actual).assertEqual("1:0:0:0:0:0:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0007
     * @tc.name      Resolution_EventFlow_0007
     * @tc.desc      notification sequence 6 tallies to 1:0:1:1:0:0:0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EventFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventFlow_0007 begin`);
      const subject: ResolutionEventModel = new ResolutionEventModel();
      subject.onFrameStart();
      subject.onPhotoAsset('asset');
      subject.onPhotoAvailable(4);
      logInfo("notification sequence seed 6");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:1:1:0:0:0");
      expect(actual).assertEqual("1:0:1:1:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0008
     * @tc.name      Resolution_EventFlow_0008
     * @tc.desc      notification sequence 7 tallies to 0:0:1:1:1:1:0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EventFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventFlow_0008 begin`);
      const subject: ResolutionEventModel = new ResolutionEventModel();
      subject.onPhotoAsset('asset');
      subject.onPhotoAvailable(4);
      subject.onError(500);
      subject.onStatus(1);
      logInfo("notification sequence seed 7");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:1:1:1:1:0");
      expect(actual).assertEqual("0:0:1:1:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0009
     * @tc.name      Resolution_EventFlow_0009
     * @tc.desc      notification sequence 8 tallies to 0:0:0:1:0:0:0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EventFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventFlow_0009 begin`);
      const subject: ResolutionEventModel = new ResolutionEventModel();
      subject.onPhotoAvailable(4);
      logInfo("notification sequence seed 8");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:0:1:0:0:0");
      expect(actual).assertEqual("0:0:0:1:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0010
     * @tc.name      Resolution_EventFlow_0010
     * @tc.desc      notification sequence 9 tallies to 0:0:0:0:1:1:0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EventFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventFlow_0010 begin`);
      const subject: ResolutionEventModel = new ResolutionEventModel();
      subject.onError(500);
      subject.onStatus(1);
      logInfo("notification sequence seed 9");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:0:0:1:1:0");
      expect(actual).assertEqual("0:0:0:0:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0011
     * @tc.name      Resolution_EventFlow_0011
     * @tc.desc      notification sequence 10 tallies to 1:0:0:0:0:1:1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EventFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventFlow_0011 begin`);
      const subject: ResolutionEventModel = new ResolutionEventModel();
      subject.onStatus(1);
      subject.onFold(1);
      subject.onFrameStart();
      logInfo("notification sequence seed 10");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:0:0:0:1:1");
      expect(actual).assertEqual("1:0:0:0:0:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0012
     * @tc.name      Resolution_EventFlow_0012
     * @tc.desc      notification sequence 11 tallies to 1:0:1:1:0:0:1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_EventFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}EventFlow_0012 begin`);
      const subject: ResolutionEventModel = new ResolutionEventModel();
      subject.onFold(1);
      subject.onFrameStart();
      subject.onPhotoAsset('asset');
      subject.onPhotoAvailable(4);
      logInfo("notification sequence seed 11");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:1:1:0:0:1");
      expect(actual).assertEqual("1:0:1:1:0:0:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0013
     * @tc.name      Resolution_EventFlow_0013
     * @tc.desc      notification sequence 12 tallies to 1:0:0:0:0:0:0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EventFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventFlow_0013 begin`);
      const subject: ResolutionEventModel = new ResolutionEventModel();
      subject.onFrameStart();
      logInfo("notification sequence seed 12");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:0:0:0:0:0");
      expect(actual).assertEqual("1:0:0:0:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0014
     * @tc.name      Resolution_EventFlow_0014
     * @tc.desc      notification sequence 13 tallies to 0:0:1:1:0:0:0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EventFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventFlow_0014 begin`);
      const subject: ResolutionEventModel = new ResolutionEventModel();
      subject.onPhotoAsset('asset');
      subject.onPhotoAvailable(4);
      logInfo("notification sequence seed 13");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:1:1:0:0:0");
      expect(actual).assertEqual("0:0:1:1:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0015
     * @tc.name      Resolution_EventFlow_0015
     * @tc.desc      notification sequence 14 tallies to 0:0:0:1:1:1:0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EventFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventFlow_0015 begin`);
      const subject: ResolutionEventModel = new ResolutionEventModel();
      subject.onPhotoAvailable(4);
      subject.onError(500);
      subject.onStatus(1);
      logInfo("notification sequence seed 14");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:0:1:1:1:0");
      expect(actual).assertEqual("0:0:0:1:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0016
     * @tc.name      Resolution_EventFlow_0016
     * @tc.desc      notification sequence 15 tallies to 1:0:0:0:1:1:1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EventFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventFlow_0016 begin`);
      const subject: ResolutionEventModel = new ResolutionEventModel();
      subject.onError(500);
      subject.onStatus(1);
      subject.onFold(1);
      subject.onFrameStart();
      logInfo("notification sequence seed 15");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:0:0:1:1:1");
      expect(actual).assertEqual("1:0:0:0:1:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0017
     * @tc.name      Resolution_EventFlow_0017
     * @tc.desc      notification sequence 16 tallies to 0:0:0:0:0:1:0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EventFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventFlow_0017 begin`);
      const subject: ResolutionEventModel = new ResolutionEventModel();
      subject.onStatus(1);
      logInfo("notification sequence seed 16");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:0:0:0:1:0");
      expect(actual).assertEqual("0:0:0:0:0:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0018
     * @tc.name      Resolution_EventFlow_0018
     * @tc.desc      notification sequence 17 tallies to 1:0:0:0:0:0:1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_EventFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}EventFlow_0018 begin`);
      const subject: ResolutionEventModel = new ResolutionEventModel();
      subject.onFold(1);
      subject.onFrameStart();
      logInfo("notification sequence seed 17");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:0:0:0:0:1");
      expect(actual).assertEqual("1:0:0:0:0:0:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0019
     * @tc.name      Resolution_EventFlow_0019
     * @tc.desc      notification sequence 18 tallies to 1:0:1:1:0:0:0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EventFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventFlow_0019 begin`);
      const subject: ResolutionEventModel = new ResolutionEventModel();
      subject.onFrameStart();
      subject.onPhotoAsset('asset');
      subject.onPhotoAvailable(4);
      logInfo("notification sequence seed 18");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:1:1:0:0:0");
      expect(actual).assertEqual("1:0:1:1:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0020
     * @tc.name      Resolution_EventFlow_0020
     * @tc.desc      notification sequence 19 tallies to 0:0:1:1:1:1:0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EventFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventFlow_0020 begin`);
      const subject: ResolutionEventModel = new ResolutionEventModel();
      subject.onPhotoAsset('asset');
      subject.onPhotoAvailable(4);
      subject.onError(500);
      subject.onStatus(1);
      logInfo("notification sequence seed 19");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:1:1:1:1:0");
      expect(actual).assertEqual("0:0:1:1:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0021
     * @tc.name      Resolution_EventFlow_0021
     * @tc.desc      notification sequence 20 tallies to 0:0:0:1:0:0:0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EventFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventFlow_0021 begin`);
      const subject: ResolutionEventModel = new ResolutionEventModel();
      subject.onPhotoAvailable(4);
      logInfo("notification sequence seed 20");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:0:1:0:0:0");
      expect(actual).assertEqual("0:0:0:1:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0022
     * @tc.name      Resolution_EventFlow_0022
     * @tc.desc      notification sequence 21 tallies to 0:0:0:0:1:1:0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EventFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventFlow_0022 begin`);
      const subject: ResolutionEventModel = new ResolutionEventModel();
      subject.onError(500);
      subject.onStatus(1);
      logInfo("notification sequence seed 21");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:0:0:1:1:0");
      expect(actual).assertEqual("0:0:0:0:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0023
     * @tc.name      Resolution_EventFlow_0023
     * @tc.desc      notification sequence 22 tallies to 1:0:0:0:0:1:1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_EventFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}EventFlow_0023 begin`);
      const subject: ResolutionEventModel = new ResolutionEventModel();
      subject.onStatus(1);
      subject.onFold(1);
      subject.onFrameStart();
      logInfo("notification sequence seed 22");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:0:0:0:1:1");
      expect(actual).assertEqual("1:0:0:0:0:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0024
     * @tc.name      Resolution_EventFlow_0024
     * @tc.desc      notification sequence 23 tallies to 1:0:1:1:0:0:1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EventFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventFlow_0024 begin`);
      const subject: ResolutionEventModel = new ResolutionEventModel();
      subject.onFold(1);
      subject.onFrameStart();
      subject.onPhotoAsset('asset');
      subject.onPhotoAvailable(4);
      logInfo("notification sequence seed 23");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:1:1:0:0:1");
      expect(actual).assertEqual("1:0:1:1:0:0:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0025
     * @tc.name      Resolution_EventFlow_0025
     * @tc.desc      notification sequence 24 tallies to 1:0:0:0:0:0:0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EventFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventFlow_0025 begin`);
      const subject: ResolutionEventModel = new ResolutionEventModel();
      subject.onFrameStart();
      logInfo("notification sequence seed 24");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:0:0:0:0:0");
      expect(actual).assertEqual("1:0:0:0:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0026
     * @tc.name      Resolution_EventFlow_0026
     * @tc.desc      notification sequence 25 tallies to 0:0:1:1:0:0:0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EventFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventFlow_0026 begin`);
      const subject: ResolutionEventModel = new ResolutionEventModel();
      subject.onPhotoAsset('asset');
      subject.onPhotoAvailable(4);
      logInfo("notification sequence seed 25");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:1:1:0:0:0");
      expect(actual).assertEqual("0:0:1:1:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0027
     * @tc.name      Resolution_EventFlow_0027
     * @tc.desc      notification sequence 26 tallies to 0:0:0:1:1:1:0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EventFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventFlow_0027 begin`);
      const subject: ResolutionEventModel = new ResolutionEventModel();
      subject.onPhotoAvailable(4);
      subject.onError(500);
      subject.onStatus(1);
      logInfo("notification sequence seed 26");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:0:1:1:1:0");
      expect(actual).assertEqual("0:0:0:1:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0028
     * @tc.name      Resolution_EventFlow_0028
     * @tc.desc      notification sequence 27 tallies to 1:0:0:0:1:1:1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EventFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventFlow_0028 begin`);
      const subject: ResolutionEventModel = new ResolutionEventModel();
      subject.onError(500);
      subject.onStatus(1);
      subject.onFold(1);
      subject.onFrameStart();
      logInfo("notification sequence seed 27");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:0:0:1:1:1");
      expect(actual).assertEqual("1:0:0:0:1:1:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0029
     * @tc.name      Resolution_EventFlow_0029
     * @tc.desc      notification sequence 28 tallies to 0:0:0:0:0:1:0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EventFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventFlow_0029 begin`);
      const subject: ResolutionEventModel = new ResolutionEventModel();
      subject.onStatus(1);
      logInfo("notification sequence seed 28");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:0:0:0:1:0");
      expect(actual).assertEqual("0:0:0:0:0:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0030
     * @tc.name      Resolution_EventFlow_0030
     * @tc.desc      notification sequence 29 tallies to 1:0:0:0:0:0:1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EventFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventFlow_0030 begin`);
      const subject: ResolutionEventModel = new ResolutionEventModel();
      subject.onFold(1);
      subject.onFrameStart();
      logInfo("notification sequence seed 29");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:0:0:0:0:1");
      expect(actual).assertEqual("1:0:0:0:0:0:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0031
     * @tc.name      Resolution_EventFlow_0031
     * @tc.desc      notification sequence 30 tallies to 1:0:1:1:0:0:0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EventFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventFlow_0031 begin`);
      const subject: ResolutionEventModel = new ResolutionEventModel();
      subject.onFrameStart();
      subject.onPhotoAsset('asset');
      subject.onPhotoAvailable(4);
      logInfo("notification sequence seed 30");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "1:0:1:1:0:0:0");
      expect(actual).assertEqual("1:0:1:1:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0032
     * @tc.name      Resolution_EventFlow_0032
     * @tc.desc      notification sequence 31 tallies to 0:0:1:1:1:1:0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EventFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventFlow_0032 begin`);
      const subject: ResolutionEventModel = new ResolutionEventModel();
      subject.onPhotoAsset('asset');
      subject.onPhotoAvailable(4);
      subject.onError(500);
      subject.onStatus(1);
      logInfo("notification sequence seed 31");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:1:1:1:1:0");
      expect(actual).assertEqual("0:0:1:1:1:1:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0033
     * @tc.name      Resolution_EventFlow_0033
     * @tc.desc      notification sequence 32 tallies to 0:0:0:1:0:0:0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EventFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EventFlow_0033 begin`);
      const subject: ResolutionEventModel = new ResolutionEventModel();
      subject.onPhotoAvailable(4);
      logInfo("notification sequence seed 32");
      const actual: string = subject.counts();
      logInfo('actual=' + String(actual) + ', expected=' + "0:0:0:1:0:0:0");
      expect(actual).assertEqual("0:0:0:1:0:0:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EventFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EVENT_FLOW_0034
     * @tc.name      Resolution_EventFlow_0034
     * @tc.desc      notification sequence 33 tallies to 0:0:0:0:1:1:0.
