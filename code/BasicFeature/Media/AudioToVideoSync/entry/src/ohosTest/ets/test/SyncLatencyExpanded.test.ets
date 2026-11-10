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
import { TestType, Size, Level } from '@ohos/hypium';
import { describe, it, expect } from '@ohos/hypium';

export default function syncLatencyExpandedTest() {
  describe('syncLatencyExpandedTest', () => {
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0001
     * @tc.name      testProjLatency0001
     * @tc.desc      Latency 0 ms scales to 0 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 0;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(0);
      expect(ratio).assertEqual(0.0);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0002
     * @tc.name      testProjLatency0002
     * @tc.desc      Latency 7 ms scales to 11 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 7;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(11);
      expect(ratio).assertEqual(0.007);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0003
     * @tc.name      testProjLatency0003
     * @tc.desc      Latency 14 ms scales to 21 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 14;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(21);
      expect(ratio).assertEqual(0.014);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0004
     * @tc.name      testProjLatency0004
     * @tc.desc      Latency 21 ms scales to 32 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 21;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(32);
      expect(ratio).assertEqual(0.021);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0005
     * @tc.name      testProjLatency0005
     * @tc.desc      Latency 28 ms scales to 42 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 28;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(42);
      expect(ratio).assertEqual(0.028);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0006
     * @tc.name      testProjLatency0006
     * @tc.desc      Latency 35 ms scales to 53 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 35;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(53);
      expect(ratio).assertEqual(0.035);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0007
     * @tc.name      testProjLatency0007
     * @tc.desc      Latency 42 ms scales to 63 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 42;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(63);
      expect(ratio).assertEqual(0.042);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0008
     * @tc.name      testProjLatency0008
     * @tc.desc      Latency 49 ms scales to 74 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 49;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(74);
      expect(ratio).assertEqual(0.049);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0009
     * @tc.name      testProjLatency0009
     * @tc.desc      Latency 56 ms scales to 84 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 56;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(84);
      expect(ratio).assertEqual(0.056);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0010
     * @tc.name      testProjLatency0010
     * @tc.desc      Latency 63 ms scales to 95 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 63;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(95);
      expect(ratio).assertEqual(0.063);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0011
     * @tc.name      testProjLatency0011
     * @tc.desc      Latency 70 ms scales to 105 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 70;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(105);
      expect(ratio).assertEqual(0.07);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0012
     * @tc.name      testProjLatency0012
     * @tc.desc      Latency 77 ms scales to 116 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 77;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(116);
      expect(ratio).assertEqual(0.077);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0013
     * @tc.name      testProjLatency0013
     * @tc.desc      Latency 84 ms scales to 126 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 84;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(126);
      expect(ratio).assertEqual(0.084);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0014
     * @tc.name      testProjLatency0014
     * @tc.desc      Latency 91 ms scales to 137 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 91;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(137);
      expect(ratio).assertEqual(0.091);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0015
     * @tc.name      testProjLatency0015
     * @tc.desc      Latency 98 ms scales to 147 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 98;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(147);
      expect(ratio).assertEqual(0.098);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0016
     * @tc.name      testProjLatency0016
     * @tc.desc      Latency 105 ms scales to 158 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 105;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(158);
      expect(ratio).assertEqual(0.105);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0017
     * @tc.name      testProjLatency0017
     * @tc.desc      Latency 112 ms scales to 168 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 112;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(168);
      expect(ratio).assertEqual(0.112);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0018
     * @tc.name      testProjLatency0018
     * @tc.desc      Latency 119 ms scales to 179 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 119;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(179);
      expect(ratio).assertEqual(0.119);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0019
     * @tc.name      testProjLatency0019
     * @tc.desc      Latency 126 ms scales to 189 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 126;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(189);
      expect(ratio).assertEqual(0.126);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0020
     * @tc.name      testProjLatency0020
     * @tc.desc      Latency 133 ms scales to 200 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 133;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(200);
      expect(ratio).assertEqual(0.133);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0021
     * @tc.name      testProjLatency0021
     * @tc.desc      Latency 140 ms scales to 210 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 140;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(210);
      expect(ratio).assertEqual(0.14);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0022
     * @tc.name      testProjLatency0022
     * @tc.desc      Latency 147 ms scales to 221 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 147;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(221);
      expect(ratio).assertEqual(0.147);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0023
     * @tc.name      testProjLatency0023
     * @tc.desc      Latency 154 ms scales to 231 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 154;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(231);
      expect(ratio).assertEqual(0.154);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0024
     * @tc.name      testProjLatency0024
     * @tc.desc      Latency 161 ms scales to 242 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 161;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(242);
      expect(ratio).assertEqual(0.161);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0025
     * @tc.name      testProjLatency0025
     * @tc.desc      Latency 168 ms scales to 252 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 168;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(252);
      expect(ratio).assertEqual(0.168);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0026
     * @tc.name      testProjLatency0026
     * @tc.desc      Latency 175 ms scales to 263 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 175;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(263);
      expect(ratio).assertEqual(0.175);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0027
     * @tc.name      testProjLatency0027
     * @tc.desc      Latency 182 ms scales to 273 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 182;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(273);
      expect(ratio).assertEqual(0.182);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0028
     * @tc.name      testProjLatency0028
     * @tc.desc      Latency 189 ms scales to 284 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 189;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(284);
      expect(ratio).assertEqual(0.189);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0029
     * @tc.name      testProjLatency0029
     * @tc.desc      Latency 196 ms scales to 294 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 196;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(294);
      expect(ratio).assertEqual(0.196);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0030
     * @tc.name      testProjLatency0030
     * @tc.desc      Latency 203 ms scales to 305 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 203;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(305);
      expect(ratio).assertEqual(0.203);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0031
     * @tc.name      testProjLatency0031
     * @tc.desc      Latency 210 ms scales to 315 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 210;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(315);
      expect(ratio).assertEqual(0.21);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0032
     * @tc.name      testProjLatency0032
     * @tc.desc      Latency 217 ms scales to 326 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 217;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(326);
      expect(ratio).assertEqual(0.217);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0033
     * @tc.name      testProjLatency0033
     * @tc.desc      Latency 224 ms scales to 336 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 224;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(336);
      expect(ratio).assertEqual(0.224);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0034
     * @tc.name      testProjLatency0034
     * @tc.desc      Latency 231 ms scales to 347 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 231;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(347);
      expect(ratio).assertEqual(0.231);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0035
     * @tc.name      testProjLatency0035
     * @tc.desc      Latency 238 ms scales to 357 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 238;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(357);
      expect(ratio).assertEqual(0.238);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0036
     * @tc.name      testProjLatency0036
     * @tc.desc      Latency 245 ms scales to 368 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 245;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(368);
      expect(ratio).assertEqual(0.245);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0037
     * @tc.name      testProjLatency0037
     * @tc.desc      Latency 252 ms scales to 378 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 252;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(378);
      expect(ratio).assertEqual(0.252);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0038
     * @tc.name      testProjLatency0038
     * @tc.desc      Latency 259 ms scales to 389 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 259;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(389);
      expect(ratio).assertEqual(0.259);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0039
     * @tc.name      testProjLatency0039
     * @tc.desc      Latency 266 ms scales to 399 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 266;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(399);
      expect(ratio).assertEqual(0.266);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0040
     * @tc.name      testProjLatency0040
     * @tc.desc      Latency 273 ms scales to 410 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 273;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(410);
      expect(ratio).assertEqual(0.273);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0041
     * @tc.name      testProjLatency0041
     * @tc.desc      Latency 280 ms scales to 420 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 280;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(420);
      expect(ratio).assertEqual(0.28);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0042
     * @tc.name      testProjLatency0042
     * @tc.desc      Latency 287 ms scales to 431 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 287;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(431);
      expect(ratio).assertEqual(0.287);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0043
     * @tc.name      testProjLatency0043
     * @tc.desc      Latency 294 ms scales to 441 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 294;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(441);
      expect(ratio).assertEqual(0.294);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0044
     * @tc.name      testProjLatency0044
     * @tc.desc      Latency 301 ms scales to 452 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 301;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(452);
      expect(ratio).assertEqual(0.301);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0045
     * @tc.name      testProjLatency0045
     * @tc.desc      Latency 308 ms scales to 462 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 308;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(462);
      expect(ratio).assertEqual(0.308);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0046
     * @tc.name      testProjLatency0046
     * @tc.desc      Latency 315 ms scales to 473 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 315;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(473);
      expect(ratio).assertEqual(0.315);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0047
     * @tc.name      testProjLatency0047
     * @tc.desc      Latency 322 ms scales to 483 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 322;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(483);
      expect(ratio).assertEqual(0.322);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0048
     * @tc.name      testProjLatency0048
     * @tc.desc      Latency 329 ms scales to 494 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 329;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(494);
      expect(ratio).assertEqual(0.329);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0049
     * @tc.name      testProjLatency0049
     * @tc.desc      Latency 336 ms scales to 504 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 336;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(504);
      expect(ratio).assertEqual(0.336);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0050
     * @tc.name      testProjLatency0050
     * @tc.desc      Latency 343 ms scales to 515 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 343;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(515);
      expect(ratio).assertEqual(0.343);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0051
     * @tc.name      testProjLatency0051
     * @tc.desc      Latency 350 ms scales to 525 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 350;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(525);
      expect(ratio).assertEqual(0.35);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0052
     * @tc.name      testProjLatency0052
     * @tc.desc      Latency 357 ms scales to 536 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 357;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(536);
      expect(ratio).assertEqual(0.357);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0053
     * @tc.name      testProjLatency0053
     * @tc.desc      Latency 364 ms scales to 546 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 364;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(546);
      expect(ratio).assertEqual(0.364);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0054
     * @tc.name      testProjLatency0054
     * @tc.desc      Latency 371 ms scales to 557 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 371;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(557);
      expect(ratio).assertEqual(0.371);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0055
     * @tc.name      testProjLatency0055
     * @tc.desc      Latency 378 ms scales to 567 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 378;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(567);
      expect(ratio).assertEqual(0.378);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0056
     * @tc.name      testProjLatency0056
     * @tc.desc      Latency 385 ms scales to 578 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 385;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(578);
      expect(ratio).assertEqual(0.385);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0057
     * @tc.name      testProjLatency0057
     * @tc.desc      Latency 392 ms scales to 588 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 392;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(588);
      expect(ratio).assertEqual(0.392);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0058
     * @tc.name      testProjLatency0058
     * @tc.desc      Latency 399 ms scales to 599 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 399;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(599);
      expect(ratio).assertEqual(0.399);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0059
     * @tc.name      testProjLatency0059
     * @tc.desc      Latency 406 ms scales to 609 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 406;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(609);
      expect(ratio).assertEqual(0.406);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0060
     * @tc.name      testProjLatency0060
     * @tc.desc      Latency 413 ms scales to 620 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 413;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(620);
      expect(ratio).assertEqual(0.413);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0061
     * @tc.name      testProjLatency0061
     * @tc.desc      Latency 420 ms scales to 630 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 420;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(630);
      expect(ratio).assertEqual(0.42);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0062
     * @tc.name      testProjLatency0062
     * @tc.desc      Latency 427 ms scales to 641 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 427;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(641);
      expect(ratio).assertEqual(0.427);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0063
     * @tc.name      testProjLatency0063
     * @tc.desc      Latency 434 ms scales to 651 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 434;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(651);
      expect(ratio).assertEqual(0.434);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0064
     * @tc.name      testProjLatency0064
     * @tc.desc      Latency 441 ms scales to 662 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 441;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(662);
      expect(ratio).assertEqual(0.441);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0065
     * @tc.name      testProjLatency0065
     * @tc.desc      Latency 448 ms scales to 672 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 448;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(672);
      expect(ratio).assertEqual(0.448);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0066
     * @tc.name      testProjLatency0066
     * @tc.desc      Latency 455 ms scales to 683 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 455;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(683);
      expect(ratio).assertEqual(0.455);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0067
     * @tc.name      testProjLatency0067
     * @tc.desc      Latency 462 ms scales to 693 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 462;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(693);
      expect(ratio).assertEqual(0.462);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0068
     * @tc.name      testProjLatency0068
     * @tc.desc      Latency 469 ms scales to 704 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 469;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(704);
      expect(ratio).assertEqual(0.469);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0069
     * @tc.name      testProjLatency0069
     * @tc.desc      Latency 476 ms scales to 714 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 476;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(714);
      expect(ratio).assertEqual(0.476);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0070
     * @tc.name      testProjLatency0070
     * @tc.desc      Latency 483 ms scales to 725 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 483;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(725);
      expect(ratio).assertEqual(0.483);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0071
     * @tc.name      testProjLatency0071
     * @tc.desc      Latency 490 ms scales to 735 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 490;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(735);
      expect(ratio).assertEqual(0.49);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0072
     * @tc.name      testProjLatency0072
     * @tc.desc      Latency 497 ms scales to 746 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 497;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(746);
      expect(ratio).assertEqual(0.497);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0073
     * @tc.name      testProjLatency0073
     * @tc.desc      Latency 504 ms scales to 756 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 504;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(756);
      expect(ratio).assertEqual(0.504);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0074
     * @tc.name      testProjLatency0074
     * @tc.desc      Latency 511 ms scales to 767 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 511;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(767);
      expect(ratio).assertEqual(0.511);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0075
     * @tc.name      testProjLatency0075
     * @tc.desc      Latency 518 ms scales to 777 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 518;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(777);
      expect(ratio).assertEqual(0.518);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0076
     * @tc.name      testProjLatency0076
     * @tc.desc      Latency 525 ms scales to 788 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 525;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(788);
      expect(ratio).assertEqual(0.525);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0077
     * @tc.name      testProjLatency0077
     * @tc.desc      Latency 532 ms scales to 798 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 532;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(798);
      expect(ratio).assertEqual(0.532);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0078
     * @tc.name      testProjLatency0078
     * @tc.desc      Latency 539 ms scales to 809 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 539;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(809);
      expect(ratio).assertEqual(0.539);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0079
     * @tc.name      testProjLatency0079
     * @tc.desc      Latency 546 ms scales to 819 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 546;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(819);
      expect(ratio).assertEqual(0.546);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0080
     * @tc.name      testProjLatency0080
     * @tc.desc      Latency 553 ms scales to 830 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 553;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(830);
      expect(ratio).assertEqual(0.553);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0081
     * @tc.name      testProjLatency0081
     * @tc.desc      Latency 560 ms scales to 840 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 560;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(840);
      expect(ratio).assertEqual(0.56);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0082
     * @tc.name      testProjLatency0082
     * @tc.desc      Latency 567 ms scales to 851 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 567;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(851);
      expect(ratio).assertEqual(0.567);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0083
     * @tc.name      testProjLatency0083
     * @tc.desc      Latency 574 ms scales to 861 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 574;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(861);
      expect(ratio).assertEqual(0.574);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0084
     * @tc.name      testProjLatency0084
     * @tc.desc      Latency 581 ms scales to 872 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 581;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(872);
      expect(ratio).assertEqual(0.581);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0085
     * @tc.name      testProjLatency0085
     * @tc.desc      Latency 588 ms scales to 882 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 588;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(882);
      expect(ratio).assertEqual(0.588);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0086
     * @tc.name      testProjLatency0086
     * @tc.desc      Latency 595 ms scales to 893 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 595;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(893);
      expect(ratio).assertEqual(0.595);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0087
     * @tc.name      testProjLatency0087
     * @tc.desc      Latency 602 ms scales to 903 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 602;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(903);
      expect(ratio).assertEqual(0.602);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0088
     * @tc.name      testProjLatency0088
     * @tc.desc      Latency 609 ms scales to 914 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 609;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(914);
      expect(ratio).assertEqual(0.609);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0089
     * @tc.name      testProjLatency0089
     * @tc.desc      Latency 616 ms scales to 924 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 616;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(924);
      expect(ratio).assertEqual(0.616);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0090
     * @tc.name      testProjLatency0090
     * @tc.desc      Latency 623 ms scales to 935 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 623;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(935);
      expect(ratio).assertEqual(0.623);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0091
     * @tc.name      testProjLatency0091
     * @tc.desc      Latency 630 ms scales to 945 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 630;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(945);
      expect(ratio).assertEqual(0.63);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0092
     * @tc.name      testProjLatency0092
     * @tc.desc      Latency 637 ms scales to 956 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 637;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(956);
      expect(ratio).assertEqual(0.637);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0093
     * @tc.name      testProjLatency0093
     * @tc.desc      Latency 644 ms scales to 966 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 644;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(966);
      expect(ratio).assertEqual(0.644);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0094
     * @tc.name      testProjLatency0094
     * @tc.desc      Latency 651 ms scales to 977 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 651;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(977);
      expect(ratio).assertEqual(0.651);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0095
     * @tc.name      testProjLatency0095
     * @tc.desc      Latency 658 ms scales to 987 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 658;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(987);
      expect(ratio).assertEqual(0.658);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0096
     * @tc.name      testProjLatency0096
     * @tc.desc      Latency 665 ms scales to 998 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 665;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(998);
      expect(ratio).assertEqual(0.665);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0097
     * @tc.name      testProjLatency0097
     * @tc.desc      Latency 672 ms scales to 1008 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 672;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(1008);
      expect(ratio).assertEqual(0.672);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0098
     * @tc.name      testProjLatency0098
     * @tc.desc      Latency 679 ms scales to 1019 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 679;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(1019);
      expect(ratio).assertEqual(0.679);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0099
     * @tc.name      testProjLatency0099
     * @tc.desc      Latency 686 ms scales to 1029 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 686;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(1029);
      expect(ratio).assertEqual(0.686);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
    /**
     * @tc.number    SUB_AVS_PROJ_LAT_0100
     * @tc.name      testProjLatency0100
     * @tc.desc      Latency 693 ms scales to 1040 ms adjusted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjLatency0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const latency: number = 693;
      const adjusted: number = Math.round(latency * 1.5);
      const ratio: number = latency / 1000;
      expect(adjusted).assertEqual(1040);
      expect(ratio).assertEqual(0.693);
      expect(latency).assertLargerOrEqual(0);
      expect(adjusted).assertLargerOrEqual(latency);
    })
  })
}
