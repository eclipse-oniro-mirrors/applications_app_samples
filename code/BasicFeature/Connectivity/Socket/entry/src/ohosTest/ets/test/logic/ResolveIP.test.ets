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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../EventLoopYield';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { resolveIP } from '../../../../main/ets/utils/Util';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Socket]';
const BUNDLE: string = 'Socket_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for resolveIP (95 cases). */
export default function resolveIPTest(): void {
  describe('ResolveIPTest', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0001
     * @tc.name      Socket_ResolveIP_0001
     * @tc.desc      resolveIP(ip=400) returns "0.0.1.144"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Socket_ResolveIP_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResolveIP_0001 begin`);
      const actual: string = resolveIP(400);
      logInfo(`resolveIP(ip=400): actual=${actual}`);
      expect(actual).assertEqual('0.0.1.144');
      logInfo(`${BUNDLE}ResolveIP_0001 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0002
     * @tc.name      Socket_ResolveIP_0002
     * @tc.desc      resolveIP(ip=399) returns "0.0.1.143"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Socket_ResolveIP_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResolveIP_0002 begin`);
      const actual: string = resolveIP(399);
      logInfo(`resolveIP(ip=399): actual=${actual}`);
      expect(actual).assertEqual('0.0.1.143');
      logInfo(`${BUNDLE}ResolveIP_0002 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0003
     * @tc.name      Socket_ResolveIP_0003
     * @tc.desc      resolveIP(ip=401) returns "0.0.1.145"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Socket_ResolveIP_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ResolveIP_0003 begin`);
      const actual: string = resolveIP(401);
      logInfo(`resolveIP(ip=401): actual=${actual}`);
      expect(actual).assertEqual('0.0.1.145');
      logInfo(`${BUNDLE}ResolveIP_0003 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0004
     * @tc.name      Socket_ResolveIP_0004
     * @tc.desc      resolveIP(ip=800) returns "0.0.3.32"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0004 begin`);
      const actual: string = resolveIP(800);
      logInfo(`resolveIP(ip=800): actual=${actual}`);
      expect(actual).assertEqual('0.0.3.32');
      logInfo(`${BUNDLE}ResolveIP_0004 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0005
     * @tc.name      Socket_ResolveIP_0005
     * @tc.desc      resolveIP(ip=200) returns "0.0.0.200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0005 begin`);
      const actual: string = resolveIP(200);
      logInfo(`resolveIP(ip=200): actual=${actual}`);
      expect(actual).assertEqual('0.0.0.200');
      logInfo(`${BUNDLE}ResolveIP_0005 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0006
     * @tc.name      Socket_ResolveIP_0006
     * @tc.desc      resolveIP(ip=0) returns "0.0.0.0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Socket_ResolveIP_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ResolveIP_0006 begin`);
      const actual: string = resolveIP(0);
      logInfo(`resolveIP(ip=0): actual=${actual}`);
      expect(actual).assertEqual('0.0.0.0');
      logInfo(`${BUNDLE}ResolveIP_0006 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0007
     * @tc.name      Socket_ResolveIP_0007
     * @tc.desc      resolveIP(ip=-1) throws an error
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ResolveIP_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResolveIP_0007 begin`);
      let thrown: boolean = false;
      try {
        resolveIP(-1);
      } catch (error) {
        thrown = true;
      }
      logInfo(`resolveIP(ip=-1): thrown=${thrown}`);
      expect(thrown).assertTrue();
      logInfo(`${BUNDLE}ResolveIP_0007 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0008
     * @tc.name      Socket_ResolveIP_0008
     * @tc.desc      resolveIP(ip=1) returns "0.0.0.1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Socket_ResolveIP_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ResolveIP_0008 begin`);
      const actual: string = resolveIP(1);
      logInfo(`resolveIP(ip=1): actual=${actual}`);
      expect(actual).assertEqual('0.0.0.1');
      logInfo(`${BUNDLE}ResolveIP_0008 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0009
     * @tc.name      Socket_ResolveIP_0009
     * @tc.desc      resolveIP(ip=4294967295) returns "255.255.255.255"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Socket_ResolveIP_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ResolveIP_0009 begin`);
      const actual: string = resolveIP(4294967295);
      logInfo(`resolveIP(ip=4294967295): actual=${actual}`);
      expect(actual).assertEqual('255.255.255.255');
      logInfo(`${BUNDLE}ResolveIP_0009 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0010
     * @tc.name      Socket_ResolveIP_0010
     * @tc.desc      resolveIP(ip=4294967294) returns "255.255.255.254"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Socket_ResolveIP_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ResolveIP_0010 begin`);
      const actual: string = resolveIP(4294967294);
      logInfo(`resolveIP(ip=4294967294): actual=${actual}`);
      expect(actual).assertEqual('255.255.255.254');
      logInfo(`${BUNDLE}ResolveIP_0010 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0011
     * @tc.name      Socket_ResolveIP_0011
     * @tc.desc      resolveIP(ip=2147483647) returns "127.255.255.255"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0011 begin`);
      const actual: string = resolveIP(2147483647);
      logInfo(`resolveIP(ip=2147483647): actual=${actual}`);
      expect(actual).assertEqual('127.255.255.255');
      logInfo(`${BUNDLE}ResolveIP_0011 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0012
     * @tc.name      Socket_ResolveIP_0012
     * @tc.desc      resolveIP(ip=24) returns "0.0.0.24"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Socket_ResolveIP_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ResolveIP_0012 begin`);
      const actual: string = resolveIP(24);
      logInfo(`resolveIP(ip=24): actual=${actual}`);
      expect(actual).assertEqual('0.0.0.24');
      logInfo(`${BUNDLE}ResolveIP_0012 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0013
     * @tc.name      Socket_ResolveIP_0013
     * @tc.desc      resolveIP(ip=23) returns "0.0.0.23"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Socket_ResolveIP_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ResolveIP_0013 begin`);
      const actual: string = resolveIP(23);
      logInfo(`resolveIP(ip=23): actual=${actual}`);
      expect(actual).assertEqual('0.0.0.23');
      logInfo(`${BUNDLE}ResolveIP_0013 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0014
     * @tc.name      Socket_ResolveIP_0014
     * @tc.desc      resolveIP(ip=25) returns "0.0.0.25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Socket_ResolveIP_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ResolveIP_0014 begin`);
      const actual: string = resolveIP(25);
      logInfo(`resolveIP(ip=25): actual=${actual}`);
      expect(actual).assertEqual('0.0.0.25');
      logInfo(`${BUNDLE}ResolveIP_0014 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0015
     * @tc.name      Socket_ResolveIP_0015
     * @tc.desc      resolveIP(ip=48) returns "0.0.0.48"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0015 begin`);
      const actual: string = resolveIP(48);
      logInfo(`resolveIP(ip=48): actual=${actual}`);
      expect(actual).assertEqual('0.0.0.48');
      logInfo(`${BUNDLE}ResolveIP_0015 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0016
     * @tc.name      Socket_ResolveIP_0016
     * @tc.desc      resolveIP(ip=12) returns "0.0.0.12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0016 begin`);
      const actual: string = resolveIP(12);
      logInfo(`resolveIP(ip=12): actual=${actual}`);
      expect(actual).assertEqual('0.0.0.12');
      logInfo(`${BUNDLE}ResolveIP_0016 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0017
     * @tc.name      Socket_ResolveIP_0017
     * @tc.desc      resolveIP(ip=16) returns "0.0.0.16"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Socket_ResolveIP_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ResolveIP_0017 begin`);
      const actual: string = resolveIP(16);
      logInfo(`resolveIP(ip=16): actual=${actual}`);
      expect(actual).assertEqual('0.0.0.16');
      logInfo(`${BUNDLE}ResolveIP_0017 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0018
     * @tc.name      Socket_ResolveIP_0018
     * @tc.desc      resolveIP(ip=15) returns "0.0.0.15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Socket_ResolveIP_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ResolveIP_0018 begin`);
      const actual: string = resolveIP(15);
      logInfo(`resolveIP(ip=15): actual=${actual}`);
      expect(actual).assertEqual('0.0.0.15');
      logInfo(`${BUNDLE}ResolveIP_0018 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0019
     * @tc.name      Socket_ResolveIP_0019
     * @tc.desc      resolveIP(ip=17) returns "0.0.0.17"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Socket_ResolveIP_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ResolveIP_0019 begin`);
      const actual: string = resolveIP(17);
      logInfo(`resolveIP(ip=17): actual=${actual}`);
      expect(actual).assertEqual('0.0.0.17');
      logInfo(`${BUNDLE}ResolveIP_0019 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0020
     * @tc.name      Socket_ResolveIP_0020
     * @tc.desc      resolveIP(ip=32) returns "0.0.0.32"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0020 begin`);
      const actual: string = resolveIP(32);
      logInfo(`resolveIP(ip=32): actual=${actual}`);
      expect(actual).assertEqual('0.0.0.32');
      logInfo(`${BUNDLE}ResolveIP_0020 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0021
     * @tc.name      Socket_ResolveIP_0021
     * @tc.desc      resolveIP(ip=8) returns "0.0.0.8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0021 begin`);
      const actual: string = resolveIP(8);
      logInfo(`resolveIP(ip=8): actual=${actual}`);
      expect(actual).assertEqual('0.0.0.8');
      logInfo(`${BUNDLE}ResolveIP_0021 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0022
     * @tc.name      Socket_ResolveIP_0022
     * @tc.desc      resolveIP(ip=255) returns "0.0.0.255"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Socket_ResolveIP_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ResolveIP_0022 begin`);
      const actual: string = resolveIP(255);
      logInfo(`resolveIP(ip=255): actual=${actual}`);
      expect(actual).assertEqual('0.0.0.255');
      logInfo(`${BUNDLE}ResolveIP_0022 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0023
     * @tc.name      Socket_ResolveIP_0023
     * @tc.desc      resolveIP(ip=254) returns "0.0.0.254"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Socket_ResolveIP_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ResolveIP_0023 begin`);
      const actual: string = resolveIP(254);
      logInfo(`resolveIP(ip=254): actual=${actual}`);
      expect(actual).assertEqual('0.0.0.254');
      logInfo(`${BUNDLE}ResolveIP_0023 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0024
     * @tc.name      Socket_ResolveIP_0024
     * @tc.desc      resolveIP(ip=256) returns "0.0.1.0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Socket_ResolveIP_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ResolveIP_0024 begin`);
      const actual: string = resolveIP(256);
      logInfo(`resolveIP(ip=256): actual=${actual}`);
      expect(actual).assertEqual('0.0.1.0');
      logInfo(`${BUNDLE}ResolveIP_0024 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0025
     * @tc.name      Socket_ResolveIP_0025
     * @tc.desc      resolveIP(ip=510) returns "0.0.1.254"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0025 begin`);
      const actual: string = resolveIP(510);
      logInfo(`resolveIP(ip=510): actual=${actual}`);
      expect(actual).assertEqual('0.0.1.254');
      logInfo(`${BUNDLE}ResolveIP_0025 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0026
     * @tc.name      Socket_ResolveIP_0026
     * @tc.desc      resolveIP(ip=127) returns "0.0.0.127"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0026 begin`);
      const actual: string = resolveIP(127);
      logInfo(`resolveIP(ip=127): actual=${actual}`);
      expect(actual).assertEqual('0.0.0.127');
      logInfo(`${BUNDLE}ResolveIP_0026 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0027
     * @tc.name      Socket_ResolveIP_0027
     * @tc.desc      resolveIP(ip=7) returns "0.0.0.7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Socket_ResolveIP_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ResolveIP_0027 begin`);
      const actual: string = resolveIP(7);
      logInfo(`resolveIP(ip=7): actual=${actual}`);
      expect(actual).assertEqual('0.0.0.7');
      logInfo(`${BUNDLE}ResolveIP_0027 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0028
     * @tc.name      Socket_ResolveIP_0028
     * @tc.desc      resolveIP(ip=9) returns "0.0.0.9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Socket_ResolveIP_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ResolveIP_0028 begin`);
      const actual: string = resolveIP(9);
      logInfo(`resolveIP(ip=9): actual=${actual}`);
      expect(actual).assertEqual('0.0.0.9');
      logInfo(`${BUNDLE}ResolveIP_0028 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0029
     * @tc.name      Socket_ResolveIP_0029
     * @tc.desc      resolveIP(ip=2) returns "0.0.0.2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0029 begin`);
      const actual: string = resolveIP(2);
      logInfo(`resolveIP(ip=2): actual=${actual}`);
      expect(actual).assertEqual('0.0.0.2');
      logInfo(`${BUNDLE}ResolveIP_0029 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0030
     * @tc.name      Socket_ResolveIP_0030
     * @tc.desc      resolveIP(ip=3) returns "0.0.0.3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0030 begin`);
      const actual: string = resolveIP(3);
      logInfo(`resolveIP(ip=3): actual=${actual}`);
      expect(actual).assertEqual('0.0.0.3');
      logInfo(`${BUNDLE}ResolveIP_0030 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0031
     * @tc.name      Socket_ResolveIP_0031
     * @tc.desc      resolveIP(ip=10) returns "0.0.0.10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0031 begin`);
      const actual: string = resolveIP(10);
      logInfo(`resolveIP(ip=10): actual=${actual}`);
      expect(actual).assertEqual('0.0.0.10');
      logInfo(`${BUNDLE}ResolveIP_0031 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0032
     * @tc.name      Socket_ResolveIP_0032
     * @tc.desc      resolveIP(ip=100) returns "0.0.0.100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0032 begin`);
      const actual: string = resolveIP(100);
      logInfo(`resolveIP(ip=100): actual=${actual}`);
      expect(actual).assertEqual('0.0.0.100');
      logInfo(`${BUNDLE}ResolveIP_0032 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0033
     * @tc.name      Socket_ResolveIP_0033
     * @tc.desc      resolveIP(ip=429496730) returns "25.153.153.154"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0033 begin`);
      const actual: string = resolveIP(429496730);
      logInfo(`resolveIP(ip=429496730): actual=${actual}`);
      expect(actual).assertEqual('25.153.153.154');
      logInfo(`${BUNDLE}ResolveIP_0033 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0034
     * @tc.name      Socket_ResolveIP_0034
     * @tc.desc      resolveIP(ip=858993460) returns "51.51.51.52"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0034 begin`);
      const actual: string = resolveIP(858993460);
      logInfo(`resolveIP(ip=858993460): actual=${actual}`);
      expect(actual).assertEqual('51.51.51.52');
      logInfo(`${BUNDLE}ResolveIP_0034 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0035
     * @tc.name      Socket_ResolveIP_0035
     * @tc.desc      resolveIP(ip=1288490190) returns "76.204.204.206"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0035 begin`);
      const actual: string = resolveIP(1288490190);
      logInfo(`resolveIP(ip=1288490190): actual=${actual}`);
      expect(actual).assertEqual('76.204.204.206');
      logInfo(`${BUNDLE}ResolveIP_0035 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0036
     * @tc.name      Socket_ResolveIP_0036
     * @tc.desc      resolveIP(ip=1717986920) returns "102.102.102.104"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0036 begin`);
      const actual: string = resolveIP(1717986920);
      logInfo(`resolveIP(ip=1717986920): actual=${actual}`);
      expect(actual).assertEqual('102.102.102.104');
      logInfo(`${BUNDLE}ResolveIP_0036 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0037
     * @tc.name      Socket_ResolveIP_0037
     * @tc.desc      resolveIP(ip=2147483650) returns "128.0.0.2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0037 begin`);
      const actual: string = resolveIP(2147483650);
      logInfo(`resolveIP(ip=2147483650): actual=${actual}`);
      expect(actual).assertEqual('128.0.0.2');
      logInfo(`${BUNDLE}ResolveIP_0037 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0038
     * @tc.name      Socket_ResolveIP_0038
     * @tc.desc      resolveIP(ip=2576980380) returns "153.153.153.156"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0038 begin`);
      const actual: string = resolveIP(2576980380);
      logInfo(`resolveIP(ip=2576980380): actual=${actual}`);
      expect(actual).assertEqual('153.153.153.156');
      logInfo(`${BUNDLE}ResolveIP_0038 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0039
     * @tc.name      Socket_ResolveIP_0039
     * @tc.desc      resolveIP(ip=3006477110) returns "179.51.51.54"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0039 begin`);
      const actual: string = resolveIP(3006477110);
      logInfo(`resolveIP(ip=3006477110): actual=${actual}`);
      expect(actual).assertEqual('179.51.51.54');
      logInfo(`${BUNDLE}ResolveIP_0039 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0040
     * @tc.name      Socket_ResolveIP_0040
     * @tc.desc      resolveIP(ip=3435973840) returns "204.204.204.208"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0040 begin`);
      const actual: string = resolveIP(3435973840);
      logInfo(`resolveIP(ip=3435973840): actual=${actual}`);
      expect(actual).assertEqual('204.204.204.208');
      logInfo(`${BUNDLE}ResolveIP_0040 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0041
     * @tc.name      Socket_ResolveIP_0041
     * @tc.desc      resolveIP(ip=3865470570) returns "230.102.102.106"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0041 begin`);
      const actual: string = resolveIP(3865470570);
      logInfo(`resolveIP(ip=3865470570): actual=${actual}`);
      expect(actual).assertEqual('230.102.102.106');
      logInfo(`${BUNDLE}ResolveIP_0041 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0042
     * @tc.name      Socket_ResolveIP_0042
     * @tc.desc      resolveIP(ip=1287912921.7) returns "76.195.253.217"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0042 begin`);
      const actual: string = resolveIP(1287912921.7);
      logInfo(`resolveIP(ip=1287912921.7): actual=${actual}`);
      expect(actual).assertEqual('76.195.253.217');
      logInfo(`${BUNDLE}ResolveIP_0042 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0043
     * @tc.name      Socket_ResolveIP_0043
     * @tc.desc      resolveIP(ip=3595808504) returns "214.83.174.248"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0043 begin`);
      const actual: string = resolveIP(3595808504);
      logInfo(`resolveIP(ip=3595808504): actual=${actual}`);
      expect(actual).assertEqual('214.83.174.248');
      logInfo(`${BUNDLE}ResolveIP_0043 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0044
     * @tc.name      Socket_ResolveIP_0044
     * @tc.desc      resolveIP(ip=3877857194) returns "231.35.103.170"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0044 begin`);
      const actual: string = resolveIP(3877857194);
      logInfo(`resolveIP(ip=3877857194): actual=${actual}`);
      expect(actual).assertEqual('231.35.103.170');
      logInfo(`${BUNDLE}ResolveIP_0044 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0045
     * @tc.name      Socket_ResolveIP_0045
     * @tc.desc      resolveIP(ip=4035561620) returns "240.137.200.148"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0045 begin`);
      const actual: string = resolveIP(4035561620);
      logInfo(`resolveIP(ip=4035561620): actual=${actual}`);
      expect(actual).assertEqual('240.137.200.148');
      logInfo(`${BUNDLE}ResolveIP_0045 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0046
     * @tc.name      Socket_ResolveIP_0046
     * @tc.desc      resolveIP(ip=1504701933.65) returns "89.175.237.237"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0046 begin`);
      const actual: string = resolveIP(1504701933.65);
      logInfo(`resolveIP(ip=1504701933.65): actual=${actual}`);
      expect(actual).assertEqual('89.175.237.237');
      logInfo(`${BUNDLE}ResolveIP_0046 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0047
     * @tc.name      Socket_ResolveIP_0047
     * @tc.desc      resolveIP(ip=3724309505) returns "221.252.116.1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0047 begin`);
      const actual: string = resolveIP(3724309505);
      logInfo(`resolveIP(ip=3724309505): actual=${actual}`);
      expect(actual).assertEqual('221.252.116.1');
      logInfo(`${BUNDLE}ResolveIP_0047 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0048
     * @tc.name      Socket_ResolveIP_0048
     * @tc.desc      resolveIP(ip=1368289941) returns "81.142.114.149"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0048 begin`);
      const actual: string = resolveIP(1368289941);
      logInfo(`resolveIP(ip=1368289941): actual=${actual}`);
      expect(actual).assertEqual('81.142.114.149');
      logInfo(`${BUNDLE}ResolveIP_0048 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0049
     * @tc.name      Socket_ResolveIP_0049
     * @tc.desc      resolveIP(ip=1110123215) returns "66.43.34.207"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0049 begin`);
      const actual: string = resolveIP(1110123215);
      logInfo(`resolveIP(ip=1110123215): actual=${actual}`);
      expect(actual).assertEqual('66.43.34.207');
      logInfo(`${BUNDLE}ResolveIP_0049 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0050
     * @tc.name      Socket_ResolveIP_0050
     * @tc.desc      resolveIP(ip=3819163971.11) returns "227.163.209.67"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0050 begin`);
      const actual: string = resolveIP(3819163971.11);
      logInfo(`resolveIP(ip=3819163971.11): actual=${actual}`);
      expect(actual).assertEqual('227.163.209.67');
      logInfo(`${BUNDLE}ResolveIP_0050 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0051
     * @tc.name      Socket_ResolveIP_0051
     * @tc.desc      resolveIP(ip=2318334460) returns "138.46.249.252"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0051 begin`);
      const actual: string = resolveIP(2318334460);
      logInfo(`resolveIP(ip=2318334460): actual=${actual}`);
      expect(actual).assertEqual('138.46.249.252');
      logInfo(`${BUNDLE}ResolveIP_0051 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0052
     * @tc.name      Socket_ResolveIP_0052
     * @tc.desc      resolveIP(ip=2184516640) returns "130.53.20.32"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0052 begin`);
      const actual: string = resolveIP(2184516640);
      logInfo(`resolveIP(ip=2184516640): actual=${actual}`);
      expect(actual).assertEqual('130.53.20.32');
      logInfo(`${BUNDLE}ResolveIP_0052 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0053
     * @tc.name      Socket_ResolveIP_0053
     * @tc.desc      resolveIP(ip=1400389543.67) returns "83.120.63.167"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0053 begin`);
      const actual: string = resolveIP(1400389543.67);
      logInfo(`resolveIP(ip=1400389543.67): actual=${actual}`);
      expect(actual).assertEqual('83.120.63.167');
      logInfo(`${BUNDLE}ResolveIP_0053 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0054
     * @tc.name      Socket_ResolveIP_0054
     * @tc.desc      resolveIP(ip=4088736055) returns "243.181.41.55"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0054 begin`);
      const actual: string = resolveIP(4088736055);
      logInfo(`resolveIP(ip=4088736055): actual=${actual}`);
      expect(actual).assertEqual('243.181.41.55');
      logInfo(`${BUNDLE}ResolveIP_0054 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0055
     * @tc.name      Socket_ResolveIP_0055
     * @tc.desc      resolveIP(ip=1046293839.76) returns "62.93.45.79"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0055 begin`);
      const actual: string = resolveIP(1046293839.76);
      logInfo(`resolveIP(ip=1046293839.76): actual=${actual}`);
      expect(actual).assertEqual('62.93.45.79');
      logInfo(`${BUNDLE}ResolveIP_0055 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0056
     * @tc.name      Socket_ResolveIP_0056
     * @tc.desc      resolveIP(ip=488291323) returns "29.26.187.251"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0056 begin`);
      const actual: string = resolveIP(488291323);
      logInfo(`resolveIP(ip=488291323): actual=${actual}`);
      expect(actual).assertEqual('29.26.187.251');
      logInfo(`${BUNDLE}ResolveIP_0056 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0057
     * @tc.name      Socket_ResolveIP_0057
     * @tc.desc      resolveIP(ip=308310583.93) returns "18.96.114.55"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0057 begin`);
      const actual: string = resolveIP(308310583.93);
      logInfo(`resolveIP(ip=308310583.93): actual=${actual}`);
      expect(actual).assertEqual('18.96.114.55');
      logInfo(`${BUNDLE}ResolveIP_0057 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0058
     * @tc.name      Socket_ResolveIP_0058
     * @tc.desc      resolveIP(ip=2507367093.42) returns "149.115.98.181"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0058 begin`);
      const actual: string = resolveIP(2507367093.42);
      logInfo(`resolveIP(ip=2507367093.42): actual=${actual}`);
      expect(actual).assertEqual('149.115.98.181');
      logInfo(`${BUNDLE}ResolveIP_0058 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0059
     * @tc.name      Socket_ResolveIP_0059
     * @tc.desc      resolveIP(ip=1055280027.75) returns "62.230.75.155"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0059 begin`);
      const actual: string = resolveIP(1055280027.75);
      logInfo(`resolveIP(ip=1055280027.75): actual=${actual}`);
      expect(actual).assertEqual('62.230.75.155');
      logInfo(`${BUNDLE}ResolveIP_0059 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0060
     * @tc.name      Socket_ResolveIP_0060
     * @tc.desc      resolveIP(ip=4177384661.03) returns "248.253.212.213"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0060 begin`);
      const actual: string = resolveIP(4177384661.03);
      logInfo(`resolveIP(ip=4177384661.03): actual=${actual}`);
      expect(actual).assertEqual('248.253.212.213');
      logInfo(`${BUNDLE}ResolveIP_0060 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0061
     * @tc.name      Socket_ResolveIP_0061
     * @tc.desc      resolveIP(ip=4120104830) returns "245.147.207.126"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0061 begin`);
      const actual: string = resolveIP(4120104830);
      logInfo(`resolveIP(ip=4120104830): actual=${actual}`);
      expect(actual).assertEqual('245.147.207.126');
      logInfo(`${BUNDLE}ResolveIP_0061 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0062
     * @tc.name      Socket_ResolveIP_0062
     * @tc.desc      resolveIP(ip=1032842926) returns "61.143.238.174"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0062 begin`);
      const actual: string = resolveIP(1032842926);
      logInfo(`resolveIP(ip=1032842926): actual=${actual}`);
      expect(actual).assertEqual('61.143.238.174');
      logInfo(`${BUNDLE}ResolveIP_0062 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0063
     * @tc.name      Socket_ResolveIP_0063
     * @tc.desc      resolveIP(ip=1325372895) returns "78.255.149.223"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0063 begin`);
      const actual: string = resolveIP(1325372895);
      logInfo(`resolveIP(ip=1325372895): actual=${actual}`);
      expect(actual).assertEqual('78.255.149.223');
      logInfo(`${BUNDLE}ResolveIP_0063 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0064
     * @tc.name      Socket_ResolveIP_0064
     * @tc.desc      resolveIP(ip=801823297.81) returns "47.202.218.65"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0064 begin`);
      const actual: string = resolveIP(801823297.81);
      logInfo(`resolveIP(ip=801823297.81): actual=${actual}`);
      expect(actual).assertEqual('47.202.218.65');
      logInfo(`${BUNDLE}ResolveIP_0064 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0065
     * @tc.name      Socket_ResolveIP_0065
     * @tc.desc      resolveIP(ip=1864493419.57) returns "111.33.233.107"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0065 begin`);
      const actual: string = resolveIP(1864493419.57);
      logInfo(`resolveIP(ip=1864493419.57): actual=${actual}`);
      expect(actual).assertEqual('111.33.233.107');
      logInfo(`${BUNDLE}ResolveIP_0065 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0066
     * @tc.name      Socket_ResolveIP_0066
     * @tc.desc      resolveIP(ip=871847123.8) returns "51.247.84.211"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0066 begin`);
      const actual: string = resolveIP(871847123.8);
      logInfo(`resolveIP(ip=871847123.8): actual=${actual}`);
      expect(actual).assertEqual('51.247.84.211');
      logInfo(`${BUNDLE}ResolveIP_0066 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0067
     * @tc.name      Socket_ResolveIP_0067
     * @tc.desc      resolveIP(ip=2017507775.53) returns "120.64.185.191"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0067 begin`);
      const actual: string = resolveIP(2017507775.53);
      logInfo(`resolveIP(ip=2017507775.53): actual=${actual}`);
      expect(actual).assertEqual('120.64.185.191');
      logInfo(`${BUNDLE}ResolveIP_0067 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0068
     * @tc.name      Socket_ResolveIP_0068
     * @tc.desc      resolveIP(ip=1952138982) returns "116.91.70.230"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0068 begin`);
      const actual: string = resolveIP(1952138982);
      logInfo(`resolveIP(ip=1952138982): actual=${actual}`);
      expect(actual).assertEqual('116.91.70.230');
      logInfo(`${BUNDLE}ResolveIP_0068 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0069
     * @tc.name      Socket_ResolveIP_0069
     * @tc.desc      resolveIP(ip=3171680175) returns "189.11.255.175"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0069 begin`);
      const actual: string = resolveIP(3171680175);
      logInfo(`resolveIP(ip=3171680175): actual=${actual}`);
      expect(actual).assertEqual('189.11.255.175');
      logInfo(`${BUNDLE}ResolveIP_0069 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0070
     * @tc.name      Socket_ResolveIP_0070
     * @tc.desc      resolveIP(ip=1920119056) returns "114.114.177.16"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0070 begin`);
      const actual: string = resolveIP(1920119056);
      logInfo(`resolveIP(ip=1920119056): actual=${actual}`);
      expect(actual).assertEqual('114.114.177.16');
      logInfo(`${BUNDLE}ResolveIP_0070 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0071
     * @tc.name      Socket_ResolveIP_0071
     * @tc.desc      resolveIP(ip=3427570619.2) returns "204.76.147.187"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0071 begin`);
      const actual: string = resolveIP(3427570619.2);
      logInfo(`resolveIP(ip=3427570619.2): actual=${actual}`);
      expect(actual).assertEqual('204.76.147.187');
      logInfo(`${BUNDLE}ResolveIP_0071 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0072
     * @tc.name      Socket_ResolveIP_0072
     * @tc.desc      resolveIP(ip=1563672655.64) returns "93.51.192.79"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0072 begin`);
      const actual: string = resolveIP(1563672655.64);
      logInfo(`resolveIP(ip=1563672655.64): actual=${actual}`);
      expect(actual).assertEqual('93.51.192.79');
      logInfo(`${BUNDLE}ResolveIP_0072 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0073
     * @tc.name      Socket_ResolveIP_0073
     * @tc.desc      resolveIP(ip=2997110131) returns "178.164.69.115"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0073 begin`);
      const actual: string = resolveIP(2997110131);
      logInfo(`resolveIP(ip=2997110131): actual=${actual}`);
      expect(actual).assertEqual('178.164.69.115');
      logInfo(`${BUNDLE}ResolveIP_0073 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0074
     * @tc.name      Socket_ResolveIP_0074
     * @tc.desc      resolveIP(ip=3250151077.24) returns "193.185.94.165"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0074 begin`);
      const actual: string = resolveIP(3250151077.24);
      logInfo(`resolveIP(ip=3250151077.24): actual=${actual}`);
      expect(actual).assertEqual('193.185.94.165');
      logInfo(`${BUNDLE}ResolveIP_0074 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0075
     * @tc.name      Socket_ResolveIP_0075
     * @tc.desc      resolveIP(ip=3382326647.21) returns "201.154.53.119"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0075 begin`);
      const actual: string = resolveIP(3382326647.21);
      logInfo(`resolveIP(ip=3382326647.21): actual=${actual}`);
      expect(actual).assertEqual('201.154.53.119');
      logInfo(`${BUNDLE}ResolveIP_0075 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0076
     * @tc.name      Socket_ResolveIP_0076
     * @tc.desc      resolveIP(ip=381125923.91) returns "22.183.133.35"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0076 begin`);
      const actual: string = resolveIP(381125923.91);
      logInfo(`resolveIP(ip=381125923.91): actual=${actual}`);
      expect(actual).assertEqual('22.183.133.35');
      logInfo(`${BUNDLE}ResolveIP_0076 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0077
     * @tc.name      Socket_ResolveIP_0077
     * @tc.desc      resolveIP(ip=250344357.94) returns "14.235.243.165"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0077 begin`);
      const actual: string = resolveIP(250344357.94);
      logInfo(`resolveIP(ip=250344357.94): actual=${actual}`);
      expect(actual).assertEqual('14.235.243.165');
      logInfo(`${BUNDLE}ResolveIP_0077 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0078
     * @tc.name      Socket_ResolveIP_0078
     * @tc.desc      resolveIP(ip=2693706567.37) returns "160.142.179.71"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0078 begin`);
      const actual: string = resolveIP(2693706567.37);
      logInfo(`resolveIP(ip=2693706567.37): actual=${actual}`);
      expect(actual).assertEqual('160.142.179.71');
      logInfo(`${BUNDLE}ResolveIP_0078 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0079
     * @tc.name      Socket_ResolveIP_0079
     * @tc.desc      resolveIP(ip=1064331491) returns "63.112.104.227"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0079 begin`);
      const actual: string = resolveIP(1064331491);
      logInfo(`resolveIP(ip=1064331491): actual=${actual}`);
      expect(actual).assertEqual('63.112.104.227');
      logInfo(`${BUNDLE}ResolveIP_0079 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0080
     * @tc.name      Socket_ResolveIP_0080
     * @tc.desc      resolveIP(ip=3735486925.13) returns "222.167.1.205"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0080 begin`);
      const actual: string = resolveIP(3735486925.13);
      logInfo(`resolveIP(ip=3735486925.13): actual=${actual}`);
      expect(actual).assertEqual('222.167.1.205');
      logInfo(`${BUNDLE}ResolveIP_0080 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0081
     * @tc.name      Socket_ResolveIP_0081
     * @tc.desc      resolveIP(ip=4099923641) returns "244.95.222.185"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0081 begin`);
      const actual: string = resolveIP(4099923641);
      logInfo(`resolveIP(ip=4099923641): actual=${actual}`);
      expect(actual).assertEqual('244.95.222.185');
      logInfo(`${BUNDLE}ResolveIP_0081 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0082
     * @tc.name      Socket_ResolveIP_0082
     * @tc.desc      resolveIP(ip=3390857639) returns "202.28.97.167"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0082 begin`);
      const actual: string = resolveIP(3390857639);
      logInfo(`resolveIP(ip=3390857639): actual=${actual}`);
      expect(actual).assertEqual('202.28.97.167');
      logInfo(`${BUNDLE}ResolveIP_0082 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0083
     * @tc.name      Socket_ResolveIP_0083
     * @tc.desc      resolveIP(ip=2701204143.37) returns "161.1.26.175"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0083 begin`);
      const actual: string = resolveIP(2701204143.37);
      logInfo(`resolveIP(ip=2701204143.37): actual=${actual}`);
      expect(actual).assertEqual('161.1.26.175');
      logInfo(`${BUNDLE}ResolveIP_0083 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0084
     * @tc.name      Socket_ResolveIP_0084
     * @tc.desc      resolveIP(ip=390054683) returns "23.63.195.27"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0084 begin`);
      const actual: string = resolveIP(390054683);
      logInfo(`resolveIP(ip=390054683): actual=${actual}`);
      expect(actual).assertEqual('23.63.195.27');
      logInfo(`${BUNDLE}ResolveIP_0084 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0085
     * @tc.name      Socket_ResolveIP_0085
     * @tc.desc      resolveIP(ip=2162245683.5) returns "128.225.64.51"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0085 begin`);
      const actual: string = resolveIP(2162245683.5);
      logInfo(`resolveIP(ip=2162245683.5): actual=${actual}`);
      expect(actual).assertEqual('128.225.64.51');
      logInfo(`${BUNDLE}ResolveIP_0085 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0086
     * @tc.name      Socket_ResolveIP_0086
     * @tc.desc      resolveIP(ip=4132133699.04) returns "246.75.91.67"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0086 begin`);
      const actual: string = resolveIP(4132133699.04);
      logInfo(`resolveIP(ip=4132133699.04): actual=${actual}`);
      expect(actual).assertEqual('246.75.91.67');
      logInfo(`${BUNDLE}ResolveIP_0086 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0087
     * @tc.name      Socket_ResolveIP_0087
     * @tc.desc      resolveIP(ip=3950775617) returns "235.124.13.65"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0087 begin`);
      const actual: string = resolveIP(3950775617);
      logInfo(`resolveIP(ip=3950775617): actual=${actual}`);
      expect(actual).assertEqual('235.124.13.65');
      logInfo(`${BUNDLE}ResolveIP_0087 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0088
     * @tc.name      Socket_ResolveIP_0088
     * @tc.desc      resolveIP(ip=3488500123.19) returns "207.238.73.155"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0088 begin`);
      const actual: string = resolveIP(3488500123.19);
      logInfo(`resolveIP(ip=3488500123.19): actual=${actual}`);
      expect(actual).assertEqual('207.238.73.155');
      logInfo(`${BUNDLE}ResolveIP_0088 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0089
     * @tc.name      Socket_ResolveIP_0089
     * @tc.desc      resolveIP(ip=870951385) returns "51.233.169.217"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0089 begin`);
      const actual: string = resolveIP(870951385);
      logInfo(`resolveIP(ip=870951385): actual=${actual}`);
      expect(actual).assertEqual('51.233.169.217');
      logInfo(`${BUNDLE}ResolveIP_0089 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0090
     * @tc.name      Socket_ResolveIP_0090
     * @tc.desc      resolveIP(ip=2824924043) returns "168.96.235.139"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0090 begin`);
      const actual: string = resolveIP(2824924043);
      logInfo(`resolveIP(ip=2824924043): actual=${actual}`);
      expect(actual).assertEqual('168.96.235.139');
      logInfo(`${BUNDLE}ResolveIP_0090 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0091
     * @tc.name      Socket_ResolveIP_0091
     * @tc.desc      resolveIP(ip=504362923.88) returns "30.15.247.171"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0091 begin`);
      const actual: string = resolveIP(504362923.88);
      logInfo(`resolveIP(ip=504362923.88): actual=${actual}`);
      expect(actual).assertEqual('30.15.247.171');
      logInfo(`${BUNDLE}ResolveIP_0091 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0092
     * @tc.name      Socket_ResolveIP_0092
     * @tc.desc      resolveIP(ip=413208269.9) returns "24.161.14.205"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0092 begin`);
      const actual: string = resolveIP(413208269.9);
      logInfo(`resolveIP(ip=413208269.9): actual=${actual}`);
      expect(actual).assertEqual('24.161.14.205');
      logInfo(`${BUNDLE}ResolveIP_0092 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0093
     * @tc.name      Socket_ResolveIP_0093
     * @tc.desc      resolveIP(ip=897492961.79) returns "53.126.167.225"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0093 begin`);
      const actual: string = resolveIP(897492961.79);
      logInfo(`resolveIP(ip=897492961.79): actual=${actual}`);
      expect(actual).assertEqual('53.126.167.225');
      logInfo(`${BUNDLE}ResolveIP_0093 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0094
     * @tc.name      Socket_ResolveIP_0094
     * @tc.desc      resolveIP(ip=2114332139) returns "126.6.37.235"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0094 begin`);
      const actual: string = resolveIP(2114332139);
      logInfo(`resolveIP(ip=2114332139): actual=${actual}`);
      expect(actual).assertEqual('126.6.37.235');
      logInfo(`${BUNDLE}ResolveIP_0094 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0095
     * @tc.name      Socket_ResolveIP_0095
     * @tc.desc      resolveIP(ip=4274952433) returns "254.206.152.241"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0095 begin`);
      const actual: string = resolveIP(4274952433);
      logInfo(`resolveIP(ip=4274952433): actual=${actual}`);
      expect(actual).assertEqual('254.206.152.241');
      logInfo(`${BUNDLE}ResolveIP_0095 end`);
    });
  });
}
