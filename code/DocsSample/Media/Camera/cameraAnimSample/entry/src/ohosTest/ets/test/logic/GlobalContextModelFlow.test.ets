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
  GlobalContextModel,
} from '../model/CameraLogic';

/** GlobalContextModelFlowTest logic checks (46 cases). */
export default function globalContextModelFlowTest(): void {
  describe('GlobalContextModelFlowTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0001
     * @tc.name      Camera_GlobalContextModelFlow_0001
     * @tc.desc      global context size after 1 applies (removed=false, extra=false) is 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_GlobalContextModelFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0001 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.apply('index');
      logInfo("apply x1 removed=false extra=false stringFirst=false");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0002
     * @tc.name      Camera_GlobalContextModelFlow_0002
     * @tc.desc      global context size after 1 applies (removed=false, extra=false) is 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0002 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.apply('surfaceId');
      logInfo("apply x1 removed=false extra=false stringFirst=true");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0003
     * @tc.name      Camera_GlobalContextModelFlow_0003
     * @tc.desc      global context size after 1 applies (removed=false, extra=true) is 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0003 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.apply('index');
      subject.setString('mode', 'video');
      logInfo("apply x1 removed=false extra=true stringFirst=false");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0004
     * @tc.name      Camera_GlobalContextModelFlow_0004
     * @tc.desc      global context size after 1 applies (removed=false, extra=true) is 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0004 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.apply('surfaceId');
      subject.setString('mode', 'video');
      logInfo("apply x1 removed=false extra=true stringFirst=true");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0005
     * @tc.name      Camera_GlobalContextModelFlow_0005
     * @tc.desc      global context size after 1 applies (removed=true, extra=false) is 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0005 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.remove('index');
      subject.apply('index');
      logInfo("apply x1 removed=true extra=false stringFirst=false");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0006
     * @tc.name      Camera_GlobalContextModelFlow_0006
     * @tc.desc      global context size after 1 applies (removed=true, extra=false) is 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0006 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.remove('index');
      subject.apply('surfaceId');
      logInfo("apply x1 removed=true extra=false stringFirst=true");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0007
     * @tc.name      Camera_GlobalContextModelFlow_0007
     * @tc.desc      global context size after 1 applies (removed=true, extra=true) is 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0007 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.remove('index');
      subject.apply('index');
      subject.setString('mode', 'video');
      logInfo("apply x1 removed=true extra=true stringFirst=false");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0008
     * @tc.name      Camera_GlobalContextModelFlow_0008
     * @tc.desc      global context size after 1 applies (removed=true, extra=true) is 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0008 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.remove('index');
      subject.apply('surfaceId');
      subject.setString('mode', 'video');
      logInfo("apply x1 removed=true extra=true stringFirst=true");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0009
     * @tc.name      Camera_GlobalContextModelFlow_0009
     * @tc.desc      global context size after 2 applies (removed=false, extra=false) is 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0009 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.apply('index');
      subject.apply('surfaceId');
      logInfo("apply x2 removed=false extra=false stringFirst=false");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0010
     * @tc.name      Camera_GlobalContextModelFlow_0010
     * @tc.desc      global context size after 2 applies (removed=false, extra=false) is 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0010 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.apply('surfaceId');
      subject.apply('index');
      logInfo("apply x2 removed=false extra=false stringFirst=true");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0011
     * @tc.name      Camera_GlobalContextModelFlow_0011
     * @tc.desc      global context size after 2 applies (removed=false, extra=true) is 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0011 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.apply('index');
      subject.apply('surfaceId');
      subject.setString('mode', 'video');
      logInfo("apply x2 removed=false extra=true stringFirst=false");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0012
     * @tc.name      Camera_GlobalContextModelFlow_0012
     * @tc.desc      global context size after 2 applies (removed=false, extra=true) is 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_GlobalContextModelFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0012 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.apply('surfaceId');
      subject.apply('index');
      subject.setString('mode', 'video');
      logInfo("apply x2 removed=false extra=true stringFirst=true");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0013
     * @tc.name      Camera_GlobalContextModelFlow_0013
     * @tc.desc      global context size after 2 applies (removed=true, extra=false) is 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0013 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.remove('index');
      subject.apply('index');
      subject.apply('surfaceId');
      logInfo("apply x2 removed=true extra=false stringFirst=false");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0014
     * @tc.name      Camera_GlobalContextModelFlow_0014
     * @tc.desc      global context size after 2 applies (removed=true, extra=false) is 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0014 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.remove('index');
      subject.apply('surfaceId');
      subject.apply('index');
      logInfo("apply x2 removed=true extra=false stringFirst=true");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0015
     * @tc.name      Camera_GlobalContextModelFlow_0015
     * @tc.desc      global context size after 2 applies (removed=true, extra=true) is 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0015 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.remove('index');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.setString('mode', 'video');
      logInfo("apply x2 removed=true extra=true stringFirst=false");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0016
     * @tc.name      Camera_GlobalContextModelFlow_0016
     * @tc.desc      global context size after 2 applies (removed=true, extra=true) is 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0016 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.remove('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.setString('mode', 'video');
      logInfo("apply x2 removed=true extra=true stringFirst=true");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0017
     * @tc.name      Camera_GlobalContextModelFlow_0017
     * @tc.desc      global context size after 3 applies (removed=false, extra=false) is 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0017 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      logInfo("apply x3 removed=false extra=false stringFirst=false");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0018
     * @tc.name      Camera_GlobalContextModelFlow_0018
     * @tc.desc      global context size after 3 applies (removed=false, extra=false) is 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_GlobalContextModelFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0018 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      logInfo("apply x3 removed=false extra=false stringFirst=true");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0019
     * @tc.name      Camera_GlobalContextModelFlow_0019
     * @tc.desc      global context size after 3 applies (removed=false, extra=true) is 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0019 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.setString('mode', 'video');
      logInfo("apply x3 removed=false extra=true stringFirst=false");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0020
     * @tc.name      Camera_GlobalContextModelFlow_0020
     * @tc.desc      global context size after 3 applies (removed=false, extra=true) is 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0020 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.setString('mode', 'video');
      logInfo("apply x3 removed=false extra=true stringFirst=true");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0021
     * @tc.name      Camera_GlobalContextModelFlow_0021
     * @tc.desc      global context size after 3 applies (removed=true, extra=false) is 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0021 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.remove('index');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      logInfo("apply x3 removed=true extra=false stringFirst=false");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0022
     * @tc.name      Camera_GlobalContextModelFlow_0022
     * @tc.desc      global context size after 3 applies (removed=true, extra=false) is 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0022 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.remove('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      logInfo("apply x3 removed=true extra=false stringFirst=true");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0023
     * @tc.name      Camera_GlobalContextModelFlow_0023
     * @tc.desc      global context size after 3 applies (removed=true, extra=true) is 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_GlobalContextModelFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0023 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.remove('index');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.setString('mode', 'video');
      logInfo("apply x3 removed=true extra=true stringFirst=false");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0024
     * @tc.name      Camera_GlobalContextModelFlow_0024
     * @tc.desc      global context size after 4 applies (removed=false, extra=false) is 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0024 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      logInfo("apply x4 removed=false extra=false stringFirst=false");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0025
     * @tc.name      Camera_GlobalContextModelFlow_0025
     * @tc.desc      global context size after 4 applies (removed=false, extra=false) is 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0025 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      logInfo("apply x4 removed=false extra=false stringFirst=true");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0026
     * @tc.name      Camera_GlobalContextModelFlow_0026
     * @tc.desc      global context size after 4 applies (removed=false, extra=true) is 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0026 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.setString('mode', 'video');
      logInfo("apply x4 removed=false extra=true stringFirst=false");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0027
     * @tc.name      Camera_GlobalContextModelFlow_0027
     * @tc.desc      global context size after 4 applies (removed=false, extra=true) is 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0027 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.setString('mode', 'video');
      logInfo("apply x4 removed=false extra=true stringFirst=true");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0028
     * @tc.name      Camera_GlobalContextModelFlow_0028
     * @tc.desc      global context size after 4 applies (removed=true, extra=false) is 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0028 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.remove('index');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      logInfo("apply x4 removed=true extra=false stringFirst=false");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0029
     * @tc.name      Camera_GlobalContextModelFlow_0029
     * @tc.desc      global context size after 4 applies (removed=true, extra=false) is 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0029 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.remove('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      logInfo("apply x4 removed=true extra=false stringFirst=true");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0030
     * @tc.name      Camera_GlobalContextModelFlow_0030
     * @tc.desc      global context size after 4 applies (removed=true, extra=true) is 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0030 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.remove('index');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.setString('mode', 'video');
      logInfo("apply x4 removed=true extra=true stringFirst=false");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0031
     * @tc.name      Camera_GlobalContextModelFlow_0031
     * @tc.desc      global context size after 4 applies (removed=true, extra=true) is 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0031 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.remove('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.setString('mode', 'video');
      logInfo("apply x4 removed=true extra=true stringFirst=true");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0032
     * @tc.name      Camera_GlobalContextModelFlow_0032
     * @tc.desc      global context size after 5 applies (removed=false, extra=false) is 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0032 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      logInfo("apply x5 removed=false extra=false stringFirst=false");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0033
     * @tc.name      Camera_GlobalContextModelFlow_0033
     * @tc.desc      global context size after 5 applies (removed=false, extra=false) is 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0033 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      logInfo("apply x5 removed=false extra=false stringFirst=true");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0034
     * @tc.name      Camera_GlobalContextModelFlow_0034
     * @tc.desc      global context size after 5 applies (removed=false, extra=true) is 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_GlobalContextModelFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0034 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.setString('mode', 'video');
      logInfo("apply x5 removed=false extra=true stringFirst=false");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0035
     * @tc.name      Camera_GlobalContextModelFlow_0035
     * @tc.desc      global context size after 5 applies (removed=false, extra=true) is 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_GlobalContextModelFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0035 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.setString('mode', 'video');
      logInfo("apply x5 removed=false extra=true stringFirst=true");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0036
     * @tc.name      Camera_GlobalContextModelFlow_0036
     * @tc.desc      global context size after 5 applies (removed=true, extra=false) is 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0036 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.remove('index');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      logInfo("apply x5 removed=true extra=false stringFirst=false");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0037
     * @tc.name      Camera_GlobalContextModelFlow_0037
     * @tc.desc      global context size after 5 applies (removed=true, extra=false) is 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0037 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.remove('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      logInfo("apply x5 removed=true extra=false stringFirst=true");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0038
     * @tc.name      Camera_GlobalContextModelFlow_0038
     * @tc.desc      global context size after 5 applies (removed=true, extra=true) is 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0038 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.remove('index');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.setString('mode', 'video');
      logInfo("apply x5 removed=true extra=true stringFirst=false");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0039
     * @tc.name      Camera_GlobalContextModelFlow_0039
     * @tc.desc      global context size after 5 applies (removed=true, extra=true) is 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0039 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.remove('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.setString('mode', 'video');
      logInfo("apply x5 removed=true extra=true stringFirst=true");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0040
     * @tc.name      Camera_GlobalContextModelFlow_0040
     * @tc.desc      global context size after 6 applies (removed=false, extra=false) is 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0040 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      logInfo("apply x6 removed=false extra=false stringFirst=false");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0041
     * @tc.name      Camera_GlobalContextModelFlow_0041
     * @tc.desc      global context size after 6 applies (removed=false, extra=false) is 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0041 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      logInfo("apply x6 removed=false extra=false stringFirst=true");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0042
     * @tc.name      Camera_GlobalContextModelFlow_0042
     * @tc.desc      global context size after 6 applies (removed=false, extra=true) is 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0042 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.setString('mode', 'video');
      logInfo("apply x6 removed=false extra=true stringFirst=false");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0043
     * @tc.name      Camera_GlobalContextModelFlow_0043
     * @tc.desc      global context size after 6 applies (removed=false, extra=true) is 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0043 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.setString('mode', 'video');
      logInfo("apply x6 removed=false extra=true stringFirst=true");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0044
     * @tc.name      Camera_GlobalContextModelFlow_0044
     * @tc.desc      global context size after 6 applies (removed=true, extra=false) is 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0044 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.remove('index');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      logInfo("apply x6 removed=true extra=false stringFirst=false");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0045
     * @tc.name      Camera_GlobalContextModelFlow_0045
     * @tc.desc      global context size after 6 applies (removed=true, extra=false) is 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_GlobalContextModelFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0045 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.remove('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      logInfo("apply x6 removed=true extra=false stringFirst=true");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_GLOBAL_CONTEXT_FLOW_0046
     * @tc.name      Camera_GlobalContextModelFlow_0046
     * @tc.desc      global context size after 6 applies (removed=true, extra=true) is 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_GlobalContextModelFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GlobalContextModelFlow_0046 begin`);
      const subject: GlobalContextModel = new GlobalContextModel();
      subject.setString('surfaceId', 'surface');
      subject.setNumber('index', 3);
      subject.remove('index');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.apply('index');
      subject.apply('surfaceId');
      subject.setString('mode', 'video');
      logInfo("apply x6 removed=true extra=true stringFirst=false");
      const actual: number = subject.size();
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}GlobalContextModelFlow_0046 end`);
    });
  });
}
