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

/** Logic checks for resolveIP (33 cases). */
export default function resolveIP2Test(): void {
  describe('ResolveIP2Test', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0096
     * @tc.name      Socket_ResolveIP_0096
     * @tc.desc      resolveIP(ip=2251649063.48) returns "134.53.112.39"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0096 begin`);
      const actual: string = resolveIP(2251649063.48);
      logInfo(`resolveIP(ip=2251649063.48): actual=${actual}`);
      expect(actual).assertEqual('134.53.112.39');
      logInfo(`${BUNDLE}ResolveIP_0096 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0097
     * @tc.name      Socket_ResolveIP_0097
     * @tc.desc      resolveIP(ip=2485454867.42) returns "148.37.8.19"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0097 begin`);
      const actual: string = resolveIP(2485454867.42);
      logInfo(`resolveIP(ip=2485454867.42): actual=${actual}`);
      expect(actual).assertEqual('148.37.8.19');
      logInfo(`${BUNDLE}ResolveIP_0097 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0098
     * @tc.name      Socket_ResolveIP_0098
     * @tc.desc      resolveIP(ip=4286586759) returns "255.128.31.135"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0098 begin`);
      const actual: string = resolveIP(4286586759);
      logInfo(`resolveIP(ip=4286586759): actual=${actual}`);
      expect(actual).assertEqual('255.128.31.135');
      logInfo(`${BUNDLE}ResolveIP_0098 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0099
     * @tc.name      Socket_ResolveIP_0099
     * @tc.desc      resolveIP(ip=2480035899) returns "147.210.88.59"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0099 begin`);
      const actual: string = resolveIP(2480035899);
      logInfo(`resolveIP(ip=2480035899): actual=${actual}`);
      expect(actual).assertEqual('147.210.88.59');
      logInfo(`${BUNDLE}ResolveIP_0099 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0100
     * @tc.name      Socket_ResolveIP_0100
     * @tc.desc      resolveIP(ip=2089630961) returns "124.141.60.241"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0100 begin`);
      const actual: string = resolveIP(2089630961);
      logInfo(`resolveIP(ip=2089630961): actual=${actual}`);
      expect(actual).assertEqual('124.141.60.241');
      logInfo(`${BUNDLE}ResolveIP_0100 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0101
     * @tc.name      Socket_ResolveIP_0101
     * @tc.desc      resolveIP(ip=1679524794) returns "100.27.131.186"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0101 begin`);
      const actual: string = resolveIP(1679524794);
      logInfo(`resolveIP(ip=1679524794): actual=${actual}`);
      expect(actual).assertEqual('100.27.131.186');
      logInfo(`${BUNDLE}ResolveIP_0101 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0102
     * @tc.name      Socket_ResolveIP_0102
     * @tc.desc      resolveIP(ip=1629140095) returns "97.26.180.127"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0102 begin`);
      const actual: string = resolveIP(1629140095);
      logInfo(`resolveIP(ip=1629140095): actual=${actual}`);
      expect(actual).assertEqual('97.26.180.127');
      logInfo(`${BUNDLE}ResolveIP_0102 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0103
     * @tc.name      Socket_ResolveIP_0103
     * @tc.desc      resolveIP(ip=91000629.98) returns "5.108.143.53"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0103 begin`);
      const actual: string = resolveIP(91000629.98);
      logInfo(`resolveIP(ip=91000629.98): actual=${actual}`);
      expect(actual).assertEqual('5.108.143.53');
      logInfo(`${BUNDLE}ResolveIP_0103 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0104
     * @tc.name      Socket_ResolveIP_0104
     * @tc.desc      resolveIP(ip=3753574297) returns "223.186.255.153"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0104 begin`);
      const actual: string = resolveIP(3753574297);
      logInfo(`resolveIP(ip=3753574297): actual=${actual}`);
      expect(actual).assertEqual('223.186.255.153');
      logInfo(`${BUNDLE}ResolveIP_0104 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0105
     * @tc.name      Socket_ResolveIP_0105
     * @tc.desc      resolveIP(ip=1710203539) returns "101.239.162.147"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0105 begin`);
      const actual: string = resolveIP(1710203539);
      logInfo(`resolveIP(ip=1710203539): actual=${actual}`);
      expect(actual).assertEqual('101.239.162.147');
      logInfo(`${BUNDLE}ResolveIP_0105 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0106
     * @tc.name      Socket_ResolveIP_0106
     * @tc.desc      resolveIP(ip=3780676563) returns "225.88.139.211"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0106 begin`);
      const actual: string = resolveIP(3780676563);
      logInfo(`resolveIP(ip=3780676563): actual=${actual}`);
      expect(actual).assertEqual('225.88.139.211');
      logInfo(`${BUNDLE}ResolveIP_0106 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0107
     * @tc.name      Socket_ResolveIP_0107
     * @tc.desc      resolveIP(ip=1151100234) returns "68.156.101.74"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0107 begin`);
      const actual: string = resolveIP(1151100234);
      logInfo(`resolveIP(ip=1151100234): actual=${actual}`);
      expect(actual).assertEqual('68.156.101.74');
      logInfo(`${BUNDLE}ResolveIP_0107 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0108
     * @tc.name      Socket_ResolveIP_0108
     * @tc.desc      resolveIP(ip=2129781113.5) returns "126.241.225.121"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ResolveIP_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResolveIP_0108 begin`);
      const actual: string = resolveIP(2129781113.5);
      logInfo(`resolveIP(ip=2129781113.5): actual=${actual}`);
      expect(actual).assertEqual('126.241.225.121');
      logInfo(`${BUNDLE}ResolveIP_0108 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0109
     * @tc.name      Socket_ResolveIP_0109
     * @tc.desc      resolveIP(ip=4294967296) throws an error
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ResolveIP_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResolveIP_0109 begin`);
      let thrown: boolean = false;
      try {
        resolveIP(4294967296);
      } catch (error) {
        thrown = true;
      }
      logInfo(`resolveIP(ip=4294967296): thrown=${thrown}`);
      expect(thrown).assertTrue();
      logInfo(`${BUNDLE}ResolveIP_0109 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0110
     * @tc.name      Socket_ResolveIP_0110
     * @tc.desc      resolveIP(ip=8589934590) throws an error
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ResolveIP_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResolveIP_0110 begin`);
      let thrown: boolean = false;
      try {
        resolveIP(8589934590);
      } catch (error) {
        thrown = true;
      }
      logInfo(`resolveIP(ip=8589934590): thrown=${thrown}`);
      expect(thrown).assertTrue();
      logInfo(`${BUNDLE}ResolveIP_0110 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0111
     * @tc.name      Socket_ResolveIP_0111
     * @tc.desc      resolveIP(ip=4294967300) throws an error
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ResolveIP_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResolveIP_0111 begin`);
      let thrown: boolean = false;
      try {
        resolveIP(4294967300);
      } catch (error) {
        thrown = true;
      }
      logInfo(`resolveIP(ip=4294967300): thrown=${thrown}`);
      expect(thrown).assertTrue();
      logInfo(`${BUNDLE}ResolveIP_0111 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0112
     * @tc.name      Socket_ResolveIP_0112
     * @tc.desc      resolveIP(ip=4724464030) throws an error
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ResolveIP_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResolveIP_0112 begin`);
      let thrown: boolean = false;
      try {
        resolveIP(4724464030);
      } catch (error) {
        thrown = true;
      }
      logInfo(`resolveIP(ip=4724464030): thrown=${thrown}`);
      expect(thrown).assertTrue();
      logInfo(`${BUNDLE}ResolveIP_0112 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0113
     * @tc.name      Socket_ResolveIP_0113
     * @tc.desc      resolveIP(ip=5153960760) throws an error
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ResolveIP_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResolveIP_0113 begin`);
      let thrown: boolean = false;
      try {
        resolveIP(5153960760);
      } catch (error) {
        thrown = true;
      }
      logInfo(`resolveIP(ip=5153960760): thrown=${thrown}`);
      expect(thrown).assertTrue();
      logInfo(`${BUNDLE}ResolveIP_0113 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0114
     * @tc.name      Socket_ResolveIP_0114
     * @tc.desc      resolveIP(ip=5583457490) throws an error
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ResolveIP_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResolveIP_0114 begin`);
      let thrown: boolean = false;
      try {
        resolveIP(5583457490);
      } catch (error) {
        thrown = true;
      }
      logInfo(`resolveIP(ip=5583457490): thrown=${thrown}`);
      expect(thrown).assertTrue();
      logInfo(`${BUNDLE}ResolveIP_0114 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0115
     * @tc.name      Socket_ResolveIP_0115
     * @tc.desc      resolveIP(ip=6012954220) throws an error
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ResolveIP_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResolveIP_0115 begin`);
      let thrown: boolean = false;
      try {
        resolveIP(6012954220);
      } catch (error) {
        thrown = true;
      }
      logInfo(`resolveIP(ip=6012954220): thrown=${thrown}`);
      expect(thrown).assertTrue();
      logInfo(`${BUNDLE}ResolveIP_0115 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0116
     * @tc.name      Socket_ResolveIP_0116
     * @tc.desc      resolveIP(ip=6442450950) throws an error
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ResolveIP_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResolveIP_0116 begin`);
      let thrown: boolean = false;
      try {
        resolveIP(6442450950);
      } catch (error) {
        thrown = true;
      }
      logInfo(`resolveIP(ip=6442450950): thrown=${thrown}`);
      expect(thrown).assertTrue();
      logInfo(`${BUNDLE}ResolveIP_0116 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0117
     * @tc.name      Socket_ResolveIP_0117
     * @tc.desc      resolveIP(ip=6871947680) throws an error
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ResolveIP_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResolveIP_0117 begin`);
      let thrown: boolean = false;
      try {
        resolveIP(6871947680);
      } catch (error) {
        thrown = true;
      }
      logInfo(`resolveIP(ip=6871947680): thrown=${thrown}`);
      expect(thrown).assertTrue();
      logInfo(`${BUNDLE}ResolveIP_0117 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0118
     * @tc.name      Socket_ResolveIP_0118
     * @tc.desc      resolveIP(ip=7301444410) throws an error
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ResolveIP_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResolveIP_0118 begin`);
      let thrown: boolean = false;
      try {
        resolveIP(7301444410);
      } catch (error) {
        thrown = true;
      }
      logInfo(`resolveIP(ip=7301444410): thrown=${thrown}`);
      expect(thrown).assertTrue();
      logInfo(`${BUNDLE}ResolveIP_0118 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0119
     * @tc.name      Socket_ResolveIP_0119
     * @tc.desc      resolveIP(ip=7730941140) throws an error
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ResolveIP_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResolveIP_0119 begin`);
      let thrown: boolean = false;
      try {
        resolveIP(7730941140);
      } catch (error) {
        thrown = true;
      }
      logInfo(`resolveIP(ip=7730941140): thrown=${thrown}`);
      expect(thrown).assertTrue();
      logInfo(`${BUNDLE}ResolveIP_0119 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0120
     * @tc.name      Socket_ResolveIP_0120
     * @tc.desc      resolveIP(ip=8160437870) throws an error
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ResolveIP_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResolveIP_0120 begin`);
      let thrown: boolean = false;
      try {
        resolveIP(8160437870);
      } catch (error) {
        thrown = true;
      }
      logInfo(`resolveIP(ip=8160437870): thrown=${thrown}`);
      expect(thrown).assertTrue();
      logInfo(`${BUNDLE}ResolveIP_0120 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0121
     * @tc.name      Socket_ResolveIP_0121
     * @tc.desc      resolveIP(ip=8589934600) throws an error
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ResolveIP_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResolveIP_0121 begin`);
      let thrown: boolean = false;
      try {
        resolveIP(8589934600);
      } catch (error) {
        thrown = true;
      }
      logInfo(`resolveIP(ip=8589934600): thrown=${thrown}`);
      expect(thrown).assertTrue();
      logInfo(`${BUNDLE}ResolveIP_0121 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0122
     * @tc.name      Socket_ResolveIP_0122
     * @tc.desc      resolveIP(ip=9019431330) throws an error
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ResolveIP_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResolveIP_0122 begin`);
      let thrown: boolean = false;
      try {
        resolveIP(9019431330);
      } catch (error) {
        thrown = true;
      }
      logInfo(`resolveIP(ip=9019431330): thrown=${thrown}`);
      expect(thrown).assertTrue();
      logInfo(`${BUNDLE}ResolveIP_0122 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0123
     * @tc.name      Socket_ResolveIP_0123
     * @tc.desc      resolveIP(ip=9448928060) throws an error
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ResolveIP_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResolveIP_0123 begin`);
      let thrown: boolean = false;
      try {
        resolveIP(9448928060);
      } catch (error) {
        thrown = true;
      }
      logInfo(`resolveIP(ip=9448928060): thrown=${thrown}`);
      expect(thrown).assertTrue();
      logInfo(`${BUNDLE}ResolveIP_0123 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0124
     * @tc.name      Socket_ResolveIP_0124
     * @tc.desc      resolveIP(ip=9878424790) throws an error
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ResolveIP_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResolveIP_0124 begin`);
      let thrown: boolean = false;
      try {
        resolveIP(9878424790);
      } catch (error) {
        thrown = true;
      }
      logInfo(`resolveIP(ip=9878424790): thrown=${thrown}`);
      expect(thrown).assertTrue();
      logInfo(`${BUNDLE}ResolveIP_0124 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0125
     * @tc.name      Socket_ResolveIP_0125
     * @tc.desc      resolveIP(ip=10307921520) throws an error
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ResolveIP_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResolveIP_0125 begin`);
      let thrown: boolean = false;
      try {
        resolveIP(10307921520);
      } catch (error) {
        thrown = true;
      }
      logInfo(`resolveIP(ip=10307921520): thrown=${thrown}`);
      expect(thrown).assertTrue();
      logInfo(`${BUNDLE}ResolveIP_0125 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0126
     * @tc.name      Socket_ResolveIP_0126
     * @tc.desc      resolveIP(ip=10737418250) throws an error
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ResolveIP_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResolveIP_0126 begin`);
      let thrown: boolean = false;
      try {
        resolveIP(10737418250);
      } catch (error) {
        thrown = true;
      }
      logInfo(`resolveIP(ip=10737418250): thrown=${thrown}`);
      expect(thrown).assertTrue();
      logInfo(`${BUNDLE}ResolveIP_0126 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0127
     * @tc.name      Socket_ResolveIP_0127
     * @tc.desc      resolveIP(ip=11166914980) throws an error
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ResolveIP_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResolveIP_0127 begin`);
      let thrown: boolean = false;
      try {
        resolveIP(11166914980);
      } catch (error) {
        thrown = true;
      }
      logInfo(`resolveIP(ip=11166914980): thrown=${thrown}`);
      expect(thrown).assertTrue();
      logInfo(`${BUNDLE}ResolveIP_0127 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_RESOLVE_IP_0128
     * @tc.name      Socket_ResolveIP_0128
     * @tc.desc      resolveIP(ip=11596411710) throws an error
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ResolveIP_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResolveIP_0128 begin`);
      let thrown: boolean = false;
      try {
        resolveIP(11596411710);
      } catch (error) {
        thrown = true;
      }
      logInfo(`resolveIP(ip=11596411710): thrown=${thrown}`);
      expect(thrown).assertTrue();
      logInfo(`${BUNDLE}ResolveIP_0128 end`);
    });
  });
}
