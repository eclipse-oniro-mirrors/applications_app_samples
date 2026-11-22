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
import { logInfo, BUNDLE } from '../common/VPNTestSupport';
import {
  tunnelCreatedForPage,
  tunnelCreatedForExtension,
} from '../model/VPNLogic';

/** TunnelCreatedTest logic checks (44 cases). */
export default function tunnelCreatedTest(): void {
  describe('TunnelCreatedTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0001
     * @tc.name      VPN_TunnelCreated_0001
     * @tc.desc      tunnel fd -20 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_TunnelCreated_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TunnelCreated_0001 begin`);
      logInfo("tunnelCreatedForPage(-20) + ':' + tunnelCreatedForExtension(-20)");
      const actual: string = tunnelCreatedForPage(-20) + ':' + tunnelCreatedForExtension(-20);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false");
      expect(actual).assertEqual("true:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TunnelCreated_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0002
     * @tc.name      VPN_TunnelCreated_0002
     * @tc.desc      tunnel fd -19 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0002 begin`);
      logInfo("tunnelCreatedForPage(-19) + ':' + tunnelCreatedForExtension(-19)");
      const actual: string = tunnelCreatedForPage(-19) + ':' + tunnelCreatedForExtension(-19);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false");
      expect(actual).assertEqual("true:false");
      logInfo(`${BUNDLE}TunnelCreated_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0003
     * @tc.name      VPN_TunnelCreated_0003
     * @tc.desc      tunnel fd -18 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0003 begin`);
      logInfo("tunnelCreatedForPage(-18) + ':' + tunnelCreatedForExtension(-18)");
      const actual: string = tunnelCreatedForPage(-18) + ':' + tunnelCreatedForExtension(-18);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false");
      expect(actual).assertEqual("true:false");
      logInfo(`${BUNDLE}TunnelCreated_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0004
     * @tc.name      VPN_TunnelCreated_0004
     * @tc.desc      tunnel fd -17 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0004 begin`);
      logInfo("tunnelCreatedForPage(-17) + ':' + tunnelCreatedForExtension(-17)");
      const actual: string = tunnelCreatedForPage(-17) + ':' + tunnelCreatedForExtension(-17);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false");
      expect(actual).assertEqual("true:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TunnelCreated_0004 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0005
     * @tc.name      VPN_TunnelCreated_0005
     * @tc.desc      tunnel fd -16 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0005 begin`);
      logInfo("tunnelCreatedForPage(-16) + ':' + tunnelCreatedForExtension(-16)");
      const actual: string = tunnelCreatedForPage(-16) + ':' + tunnelCreatedForExtension(-16);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false");
      expect(actual).assertEqual("true:false");
      logInfo(`${BUNDLE}TunnelCreated_0005 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0006
     * @tc.name      VPN_TunnelCreated_0006
     * @tc.desc      tunnel fd -15 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0006 begin`);
      logInfo("tunnelCreatedForPage(-15) + ':' + tunnelCreatedForExtension(-15)");
      const actual: string = tunnelCreatedForPage(-15) + ':' + tunnelCreatedForExtension(-15);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false");
      expect(actual).assertEqual("true:false");
      logInfo(`${BUNDLE}TunnelCreated_0006 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0007
     * @tc.name      VPN_TunnelCreated_0007
     * @tc.desc      tunnel fd -14 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0007 begin`);
      logInfo("tunnelCreatedForPage(-14) + ':' + tunnelCreatedForExtension(-14)");
      const actual: string = tunnelCreatedForPage(-14) + ':' + tunnelCreatedForExtension(-14);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false");
      expect(actual).assertEqual("true:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TunnelCreated_0007 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0008
     * @tc.name      VPN_TunnelCreated_0008
     * @tc.desc      tunnel fd -13 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0008 begin`);
      logInfo("tunnelCreatedForPage(-13) + ':' + tunnelCreatedForExtension(-13)");
      const actual: string = tunnelCreatedForPage(-13) + ':' + tunnelCreatedForExtension(-13);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false");
      expect(actual).assertEqual("true:false");
      logInfo(`${BUNDLE}TunnelCreated_0008 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0009
     * @tc.name      VPN_TunnelCreated_0009
     * @tc.desc      tunnel fd -12 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0009 begin`);
      logInfo("tunnelCreatedForPage(-12) + ':' + tunnelCreatedForExtension(-12)");
      const actual: string = tunnelCreatedForPage(-12) + ':' + tunnelCreatedForExtension(-12);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false");
      expect(actual).assertEqual("true:false");
      logInfo(`${BUNDLE}TunnelCreated_0009 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0010
     * @tc.name      VPN_TunnelCreated_0010
     * @tc.desc      tunnel fd -11 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0010 begin`);
      logInfo("tunnelCreatedForPage(-11) + ':' + tunnelCreatedForExtension(-11)");
      const actual: string = tunnelCreatedForPage(-11) + ':' + tunnelCreatedForExtension(-11);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false");
      expect(actual).assertEqual("true:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TunnelCreated_0010 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0011
     * @tc.name      VPN_TunnelCreated_0011
     * @tc.desc      tunnel fd -10 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0011 begin`);
      logInfo("tunnelCreatedForPage(-10) + ':' + tunnelCreatedForExtension(-10)");
      const actual: string = tunnelCreatedForPage(-10) + ':' + tunnelCreatedForExtension(-10);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false");
      expect(actual).assertEqual("true:false");
      logInfo(`${BUNDLE}TunnelCreated_0011 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0012
     * @tc.name      VPN_TunnelCreated_0012
     * @tc.desc      tunnel fd -9 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_TunnelCreated_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TunnelCreated_0012 begin`);
      logInfo("tunnelCreatedForPage(-9) + ':' + tunnelCreatedForExtension(-9)");
      const actual: string = tunnelCreatedForPage(-9) + ':' + tunnelCreatedForExtension(-9);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false");
      expect(actual).assertEqual("true:false");
      logInfo(`${BUNDLE}TunnelCreated_0012 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0013
     * @tc.name      VPN_TunnelCreated_0013
     * @tc.desc      tunnel fd -8 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0013 begin`);
      logInfo("tunnelCreatedForPage(-8) + ':' + tunnelCreatedForExtension(-8)");
      const actual: string = tunnelCreatedForPage(-8) + ':' + tunnelCreatedForExtension(-8);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false");
      expect(actual).assertEqual("true:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TunnelCreated_0013 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0014
     * @tc.name      VPN_TunnelCreated_0014
     * @tc.desc      tunnel fd -7 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0014 begin`);
      logInfo("tunnelCreatedForPage(-7) + ':' + tunnelCreatedForExtension(-7)");
      const actual: string = tunnelCreatedForPage(-7) + ':' + tunnelCreatedForExtension(-7);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false");
      expect(actual).assertEqual("true:false");
      logInfo(`${BUNDLE}TunnelCreated_0014 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0015
     * @tc.name      VPN_TunnelCreated_0015
     * @tc.desc      tunnel fd -6 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0015 begin`);
      logInfo("tunnelCreatedForPage(-6) + ':' + tunnelCreatedForExtension(-6)");
      const actual: string = tunnelCreatedForPage(-6) + ':' + tunnelCreatedForExtension(-6);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false");
      expect(actual).assertEqual("true:false");
      logInfo(`${BUNDLE}TunnelCreated_0015 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0016
     * @tc.name      VPN_TunnelCreated_0016
     * @tc.desc      tunnel fd -5 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0016 begin`);
      logInfo("tunnelCreatedForPage(-5) + ':' + tunnelCreatedForExtension(-5)");
      const actual: string = tunnelCreatedForPage(-5) + ':' + tunnelCreatedForExtension(-5);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false");
      expect(actual).assertEqual("true:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TunnelCreated_0016 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0017
     * @tc.name      VPN_TunnelCreated_0017
     * @tc.desc      tunnel fd -4 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0017 begin`);
      logInfo("tunnelCreatedForPage(-4) + ':' + tunnelCreatedForExtension(-4)");
      const actual: string = tunnelCreatedForPage(-4) + ':' + tunnelCreatedForExtension(-4);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false");
      expect(actual).assertEqual("true:false");
      logInfo(`${BUNDLE}TunnelCreated_0017 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0018
     * @tc.name      VPN_TunnelCreated_0018
     * @tc.desc      tunnel fd -3 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_TunnelCreated_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TunnelCreated_0018 begin`);
      logInfo("tunnelCreatedForPage(-3) + ':' + tunnelCreatedForExtension(-3)");
      const actual: string = tunnelCreatedForPage(-3) + ':' + tunnelCreatedForExtension(-3);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false");
      expect(actual).assertEqual("true:false");
      logInfo(`${BUNDLE}TunnelCreated_0018 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0019
     * @tc.name      VPN_TunnelCreated_0019
     * @tc.desc      tunnel fd -2 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0019 begin`);
      logInfo("tunnelCreatedForPage(-2) + ':' + tunnelCreatedForExtension(-2)");
      const actual: string = tunnelCreatedForPage(-2) + ':' + tunnelCreatedForExtension(-2);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false");
      expect(actual).assertEqual("true:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TunnelCreated_0019 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0020
     * @tc.name      VPN_TunnelCreated_0020
     * @tc.desc      tunnel fd -1 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0020 begin`);
      logInfo("tunnelCreatedForPage(-1) + ':' + tunnelCreatedForExtension(-1)");
      const actual: string = tunnelCreatedForPage(-1) + ':' + tunnelCreatedForExtension(-1);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false");
      expect(actual).assertEqual("true:false");
      logInfo(`${BUNDLE}TunnelCreated_0020 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0021
     * @tc.name      VPN_TunnelCreated_0021
     * @tc.desc      tunnel fd 0 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0021 begin`);
      logInfo("tunnelCreatedForPage(0) + ':' + tunnelCreatedForExtension(0)");
      const actual: string = tunnelCreatedForPage(0) + ':' + tunnelCreatedForExtension(0);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true");
      expect(actual).assertEqual("false:true");
      logInfo(`${BUNDLE}TunnelCreated_0021 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0022
     * @tc.name      VPN_TunnelCreated_0022
     * @tc.desc      tunnel fd 1 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0022 begin`);
      logInfo("tunnelCreatedForPage(1) + ':' + tunnelCreatedForExtension(1)");
      const actual: string = tunnelCreatedForPage(1) + ':' + tunnelCreatedForExtension(1);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true");
      expect(actual).assertEqual("true:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TunnelCreated_0022 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0023
     * @tc.name      VPN_TunnelCreated_0023
     * @tc.desc      tunnel fd 2 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_TunnelCreated_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TunnelCreated_0023 begin`);
      logInfo("tunnelCreatedForPage(2) + ':' + tunnelCreatedForExtension(2)");
      const actual: string = tunnelCreatedForPage(2) + ':' + tunnelCreatedForExtension(2);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true");
      expect(actual).assertEqual("true:true");
      logInfo(`${BUNDLE}TunnelCreated_0023 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0024
     * @tc.name      VPN_TunnelCreated_0024
     * @tc.desc      tunnel fd 3 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0024 begin`);
      logInfo("tunnelCreatedForPage(3) + ':' + tunnelCreatedForExtension(3)");
      const actual: string = tunnelCreatedForPage(3) + ':' + tunnelCreatedForExtension(3);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true");
      expect(actual).assertEqual("true:true");
      logInfo(`${BUNDLE}TunnelCreated_0024 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0025
     * @tc.name      VPN_TunnelCreated_0025
     * @tc.desc      tunnel fd 4 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0025 begin`);
      logInfo("tunnelCreatedForPage(4) + ':' + tunnelCreatedForExtension(4)");
      const actual: string = tunnelCreatedForPage(4) + ':' + tunnelCreatedForExtension(4);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true");
      expect(actual).assertEqual("true:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TunnelCreated_0025 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0026
     * @tc.name      VPN_TunnelCreated_0026
     * @tc.desc      tunnel fd 5 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0026 begin`);
      logInfo("tunnelCreatedForPage(5) + ':' + tunnelCreatedForExtension(5)");
      const actual: string = tunnelCreatedForPage(5) + ':' + tunnelCreatedForExtension(5);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true");
      expect(actual).assertEqual("true:true");
      logInfo(`${BUNDLE}TunnelCreated_0026 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0027
     * @tc.name      VPN_TunnelCreated_0027
     * @tc.desc      tunnel fd 6 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0027 begin`);
      logInfo("tunnelCreatedForPage(6) + ':' + tunnelCreatedForExtension(6)");
      const actual: string = tunnelCreatedForPage(6) + ':' + tunnelCreatedForExtension(6);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true");
      expect(actual).assertEqual("true:true");
      logInfo(`${BUNDLE}TunnelCreated_0027 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0028
     * @tc.name      VPN_TunnelCreated_0028
     * @tc.desc      tunnel fd 7 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0028 begin`);
      logInfo("tunnelCreatedForPage(7) + ':' + tunnelCreatedForExtension(7)");
      const actual: string = tunnelCreatedForPage(7) + ':' + tunnelCreatedForExtension(7);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true");
      expect(actual).assertEqual("true:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TunnelCreated_0028 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0029
     * @tc.name      VPN_TunnelCreated_0029
     * @tc.desc      tunnel fd 8 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0029 begin`);
      logInfo("tunnelCreatedForPage(8) + ':' + tunnelCreatedForExtension(8)");
      const actual: string = tunnelCreatedForPage(8) + ':' + tunnelCreatedForExtension(8);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true");
      expect(actual).assertEqual("true:true");
      logInfo(`${BUNDLE}TunnelCreated_0029 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0030
     * @tc.name      VPN_TunnelCreated_0030
     * @tc.desc      tunnel fd 9 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0030 begin`);
      logInfo("tunnelCreatedForPage(9) + ':' + tunnelCreatedForExtension(9)");
      const actual: string = tunnelCreatedForPage(9) + ':' + tunnelCreatedForExtension(9);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true");
      expect(actual).assertEqual("true:true");
      logInfo(`${BUNDLE}TunnelCreated_0030 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0031
     * @tc.name      VPN_TunnelCreated_0031
     * @tc.desc      tunnel fd 10 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0031 begin`);
      logInfo("tunnelCreatedForPage(10) + ':' + tunnelCreatedForExtension(10)");
      const actual: string = tunnelCreatedForPage(10) + ':' + tunnelCreatedForExtension(10);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true");
      expect(actual).assertEqual("true:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TunnelCreated_0031 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0032
     * @tc.name      VPN_TunnelCreated_0032
     * @tc.desc      tunnel fd 11 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0032 begin`);
      logInfo("tunnelCreatedForPage(11) + ':' + tunnelCreatedForExtension(11)");
      const actual: string = tunnelCreatedForPage(11) + ':' + tunnelCreatedForExtension(11);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true");
      expect(actual).assertEqual("true:true");
      logInfo(`${BUNDLE}TunnelCreated_0032 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0033
     * @tc.name      VPN_TunnelCreated_0033
     * @tc.desc      tunnel fd 12 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0033 begin`);
      logInfo("tunnelCreatedForPage(12) + ':' + tunnelCreatedForExtension(12)");
      const actual: string = tunnelCreatedForPage(12) + ':' + tunnelCreatedForExtension(12);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true");
      expect(actual).assertEqual("true:true");
      logInfo(`${BUNDLE}TunnelCreated_0033 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0034
     * @tc.name      VPN_TunnelCreated_0034
     * @tc.desc      tunnel fd 13 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_TunnelCreated_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TunnelCreated_0034 begin`);
      logInfo("tunnelCreatedForPage(13) + ':' + tunnelCreatedForExtension(13)");
      const actual: string = tunnelCreatedForPage(13) + ':' + tunnelCreatedForExtension(13);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true");
      expect(actual).assertEqual("true:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TunnelCreated_0034 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0035
     * @tc.name      VPN_TunnelCreated_0035
     * @tc.desc      tunnel fd 14 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_TunnelCreated_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TunnelCreated_0035 begin`);
      logInfo("tunnelCreatedForPage(14) + ':' + tunnelCreatedForExtension(14)");
      const actual: string = tunnelCreatedForPage(14) + ':' + tunnelCreatedForExtension(14);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true");
      expect(actual).assertEqual("true:true");
      logInfo(`${BUNDLE}TunnelCreated_0035 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0036
     * @tc.name      VPN_TunnelCreated_0036
     * @tc.desc      tunnel fd 15 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0036 begin`);
      logInfo("tunnelCreatedForPage(15) + ':' + tunnelCreatedForExtension(15)");
      const actual: string = tunnelCreatedForPage(15) + ':' + tunnelCreatedForExtension(15);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true");
      expect(actual).assertEqual("true:true");
      logInfo(`${BUNDLE}TunnelCreated_0036 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0037
     * @tc.name      VPN_TunnelCreated_0037
     * @tc.desc      tunnel fd 16 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0037 begin`);
      logInfo("tunnelCreatedForPage(16) + ':' + tunnelCreatedForExtension(16)");
      const actual: string = tunnelCreatedForPage(16) + ':' + tunnelCreatedForExtension(16);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true");
      expect(actual).assertEqual("true:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TunnelCreated_0037 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0038
     * @tc.name      VPN_TunnelCreated_0038
     * @tc.desc      tunnel fd 17 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0038 begin`);
      logInfo("tunnelCreatedForPage(17) + ':' + tunnelCreatedForExtension(17)");
      const actual: string = tunnelCreatedForPage(17) + ':' + tunnelCreatedForExtension(17);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true");
      expect(actual).assertEqual("true:true");
      logInfo(`${BUNDLE}TunnelCreated_0038 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0039
     * @tc.name      VPN_TunnelCreated_0039
     * @tc.desc      tunnel fd 18 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0039 begin`);
      logInfo("tunnelCreatedForPage(18) + ':' + tunnelCreatedForExtension(18)");
      const actual: string = tunnelCreatedForPage(18) + ':' + tunnelCreatedForExtension(18);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true");
      expect(actual).assertEqual("true:true");
      logInfo(`${BUNDLE}TunnelCreated_0039 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0040
     * @tc.name      VPN_TunnelCreated_0040
     * @tc.desc      tunnel fd 19 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0040 begin`);
      logInfo("tunnelCreatedForPage(19) + ':' + tunnelCreatedForExtension(19)");
      const actual: string = tunnelCreatedForPage(19) + ':' + tunnelCreatedForExtension(19);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true");
      expect(actual).assertEqual("true:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TunnelCreated_0040 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0041
     * @tc.name      VPN_TunnelCreated_0041
     * @tc.desc      tunnel fd 20 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0041 begin`);
      logInfo("tunnelCreatedForPage(20) + ':' + tunnelCreatedForExtension(20)");
      const actual: string = tunnelCreatedForPage(20) + ':' + tunnelCreatedForExtension(20);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true");
      expect(actual).assertEqual("true:true");
      logInfo(`${BUNDLE}TunnelCreated_0041 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0042
     * @tc.name      VPN_TunnelCreated_0042
     * @tc.desc      tunnel fd 21 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0042 begin`);
      logInfo("tunnelCreatedForPage(21) + ':' + tunnelCreatedForExtension(21)");
      const actual: string = tunnelCreatedForPage(21) + ':' + tunnelCreatedForExtension(21);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true");
      expect(actual).assertEqual("true:true");
      logInfo(`${BUNDLE}TunnelCreated_0042 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0043
     * @tc.name      VPN_TunnelCreated_0043
     * @tc.desc      tunnel fd 22 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0043 begin`);
      logInfo("tunnelCreatedForPage(22) + ':' + tunnelCreatedForExtension(22)");
      const actual: string = tunnelCreatedForPage(22) + ':' + tunnelCreatedForExtension(22);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true");
      expect(actual).assertEqual("true:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}TunnelCreated_0043 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_TUNNEL_CREATED_0044
     * @tc.name      VPN_TunnelCreated_0044
     * @tc.desc      tunnel fd 23 page/extension acceptance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_TunnelCreated_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TunnelCreated_0044 begin`);
      logInfo("tunnelCreatedForPage(23) + ':' + tunnelCreatedForExtension(23)");
      const actual: string = tunnelCreatedForPage(23) + ':' + tunnelCreatedForExtension(23);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true");
      expect(actual).assertEqual("true:true");
      logInfo(`${BUNDLE}TunnelCreated_0044 end`);
    });
  });
}
