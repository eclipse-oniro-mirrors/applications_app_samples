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
import { logInfo, BUNDLE } from '../common/CameraTestSupport';
import {
  WhiteBalanceModel,
} from '../model/CameraLogic';

/** WhiteBalanceModelFlowTest logic checks (12 cases). */
export default function whiteBalanceModelFlowTest(): void {
  describe('WhiteBalanceModelFlowTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_WB_MODEL_FLOW_0001
     * @tc.name      Camera_WhiteBalanceModelFlow_0001
     * @tc.desc      white balance applied 1 times ends on option 0 -> "自动".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_WhiteBalanceModelFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WhiteBalanceModelFlow_0001 begin`);
      const subject: WhiteBalanceModel = new WhiteBalanceModel();
      subject.toggleOptions();
      subject.apply(0);
      logInfo("apply(0) after 1 selections options=true");
      const actual: string = subject.text();
      logInfo('actual=' + String(actual) + ', expected=' + "自动");
      expect(actual).assertEqual("自动");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}WhiteBalanceModelFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WB_MODEL_FLOW_0002
     * @tc.name      Camera_WhiteBalanceModelFlow_0002
     * @tc.desc      white balance applied 2 times ends on option 2 -> "白炽光".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceModelFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceModelFlow_0002 begin`);
      const subject: WhiteBalanceModel = new WhiteBalanceModel();
      subject.apply(1);
      subject.apply(2);
      logInfo("apply(2) after 2 selections options=false");
      const actual: string = subject.text();
      logInfo('actual=' + String(actual) + ', expected=' + "白炽光");
      expect(actual).assertEqual("白炽光");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}WhiteBalanceModelFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WB_MODEL_FLOW_0003
     * @tc.name      Camera_WhiteBalanceModelFlow_0003
     * @tc.desc      white balance applied 3 times ends on option 4 -> "日光".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceModelFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceModelFlow_0003 begin`);
      const subject: WhiteBalanceModel = new WhiteBalanceModel();
      subject.toggleOptions();
      subject.apply(2);
      subject.apply(3);
      subject.apply(4);
      logInfo("apply(4) after 3 selections options=true");
      const actual: string = subject.text();
      logInfo('actual=' + String(actual) + ', expected=' + "日光");
      expect(actual).assertEqual("日光");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}WhiteBalanceModelFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WB_MODEL_FLOW_0004
     * @tc.name      Camera_WhiteBalanceModelFlow_0004
     * @tc.desc      white balance applied 4 times ends on option 6 -> "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceModelFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceModelFlow_0004 begin`);
      const subject: WhiteBalanceModel = new WhiteBalanceModel();
      subject.apply(3);
      subject.apply(4);
      subject.apply(5);
      subject.apply(6);
      logInfo("apply(6) after 4 selections options=false");
      const actual: string = subject.text();
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}WhiteBalanceModelFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WB_MODEL_FLOW_0005
     * @tc.name      Camera_WhiteBalanceModelFlow_0005
     * @tc.desc      white balance applied 1 times ends on option 4 -> "日光".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceModelFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceModelFlow_0005 begin`);
      const subject: WhiteBalanceModel = new WhiteBalanceModel();
      subject.toggleOptions();
      subject.apply(4);
      logInfo("apply(4) after 1 selections options=true");
      const actual: string = subject.text();
      logInfo('actual=' + String(actual) + ', expected=' + "日光");
      expect(actual).assertEqual("日光");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}WhiteBalanceModelFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WB_MODEL_FLOW_0006
     * @tc.name      Camera_WhiteBalanceModelFlow_0006
     * @tc.desc      white balance applied 2 times ends on option 6 -> "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceModelFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceModelFlow_0006 begin`);
      const subject: WhiteBalanceModel = new WhiteBalanceModel();
      subject.apply(5);
      subject.apply(6);
      logInfo("apply(6) after 2 selections options=false");
      const actual: string = subject.text();
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}WhiteBalanceModelFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WB_MODEL_FLOW_0007
     * @tc.name      Camera_WhiteBalanceModelFlow_0007
     * @tc.desc      white balance applied 3 times ends on option 2 -> "白炽光".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceModelFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceModelFlow_0007 begin`);
      const subject: WhiteBalanceModel = new WhiteBalanceModel();
      subject.toggleOptions();
      subject.apply(0);
      subject.apply(1);
      subject.apply(2);
      logInfo("apply(2) after 3 selections options=true");
      const actual: string = subject.text();
      logInfo('actual=' + String(actual) + ', expected=' + "白炽光");
      expect(actual).assertEqual("白炽光");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}WhiteBalanceModelFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WB_MODEL_FLOW_0008
     * @tc.name      Camera_WhiteBalanceModelFlow_0008
     * @tc.desc      white balance applied 4 times ends on option 4 -> "日光".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceModelFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceModelFlow_0008 begin`);
      const subject: WhiteBalanceModel = new WhiteBalanceModel();
      subject.apply(1);
      subject.apply(2);
      subject.apply(3);
      subject.apply(4);
      logInfo("apply(4) after 4 selections options=false");
      const actual: string = subject.text();
      logInfo('actual=' + String(actual) + ', expected=' + "日光");
      expect(actual).assertEqual("日光");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}WhiteBalanceModelFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WB_MODEL_FLOW_0009
     * @tc.name      Camera_WhiteBalanceModelFlow_0009
     * @tc.desc      white balance applied 1 times ends on option 2 -> "白炽光".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceModelFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceModelFlow_0009 begin`);
      const subject: WhiteBalanceModel = new WhiteBalanceModel();
      subject.toggleOptions();
      subject.apply(2);
      logInfo("apply(2) after 1 selections options=true");
      const actual: string = subject.text();
      logInfo('actual=' + String(actual) + ', expected=' + "白炽光");
      expect(actual).assertEqual("白炽光");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}WhiteBalanceModelFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WB_MODEL_FLOW_0010
     * @tc.name      Camera_WhiteBalanceModelFlow_0010
     * @tc.desc      white balance applied 2 times ends on option 4 -> "日光".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceModelFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceModelFlow_0010 begin`);
      const subject: WhiteBalanceModel = new WhiteBalanceModel();
      subject.apply(3);
      subject.apply(4);
      logInfo("apply(4) after 2 selections options=false");
      const actual: string = subject.text();
      logInfo('actual=' + String(actual) + ', expected=' + "日光");
      expect(actual).assertEqual("日光");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}WhiteBalanceModelFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WB_MODEL_FLOW_0011
     * @tc.name      Camera_WhiteBalanceModelFlow_0011
     * @tc.desc      white balance applied 3 times ends on option 6 -> "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_WhiteBalanceModelFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WhiteBalanceModelFlow_0011 begin`);
      const subject: WhiteBalanceModel = new WhiteBalanceModel();
      subject.toggleOptions();
      subject.apply(4);
      subject.apply(5);
      subject.apply(6);
      logInfo("apply(6) after 3 selections options=true");
      const actual: string = subject.text();
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}WhiteBalanceModelFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_WB_MODEL_FLOW_0012
     * @tc.name      Camera_WhiteBalanceModelFlow_0012
     * @tc.desc      white balance applied 4 times ends on option 1 -> "阴天".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_WhiteBalanceModelFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WhiteBalanceModelFlow_0012 begin`);
      const subject: WhiteBalanceModel = new WhiteBalanceModel();
      subject.apply(5);
      subject.apply(6);
      subject.apply(0);
      subject.apply(1);
      logInfo("apply(1) after 4 selections options=false");
      const actual: string = subject.text();
      logInfo('actual=' + String(actual) + ', expected=' + "阴天");
      expect(actual).assertEqual("阴天");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}WhiteBalanceModelFlow_0012 end`);
    });
  });
}
