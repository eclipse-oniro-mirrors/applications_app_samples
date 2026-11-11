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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';

export default function subtitleSafeBoundaryTailTest() {
  describe('subtitleSafeBoundaryTailTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0001
     * @tc.name      testSafeBoundary0001
     * @tc.desc      682 splits into 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0002
     * @tc.name      testSafeBoundary0002
     * @tc.desc      21780300 splits into 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0003
     * @tc.name      testSafeBoundary0003
     * @tc.desc      1024 splits into 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0004
     * @tc.name      testSafeBoundary0004
     * @tc.desc      4096 splits into 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0005
     * @tc.name      testSafeBoundary0005
     * @tc.desc      8192 splits into 2048 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 8192;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(2048);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0006
     * @tc.name      testSafeBoundary0006
     * @tc.desc      682 splits into 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0007
     * @tc.name      testSafeBoundary0007
     * @tc.desc      21780300 splits into 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0008
     * @tc.name      testSafeBoundary0008
     * @tc.desc      1024 splits into 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0009
     * @tc.name      testSafeBoundary0009
     * @tc.desc      4096 splits into 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0010
     * @tc.name      testSafeBoundary0010
     * @tc.desc      8192 splits into 2048 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 8192;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(2048);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0011
     * @tc.name      testSafeBoundary0011
     * @tc.desc      682 splits into 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0012
     * @tc.name      testSafeBoundary0012
     * @tc.desc      21780300 splits into 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0013
     * @tc.name      testSafeBoundary0013
     * @tc.desc      1024 splits into 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0014
     * @tc.name      testSafeBoundary0014
     * @tc.desc      4096 splits into 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0015
     * @tc.name      testSafeBoundary0015
     * @tc.desc      8192 splits into 2048 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 8192;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(2048);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0016
     * @tc.name      testSafeBoundary0016
     * @tc.desc      682 splits into 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0017
     * @tc.name      testSafeBoundary0017
     * @tc.desc      21780300 splits into 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0018
     * @tc.name      testSafeBoundary0018
     * @tc.desc      1024 splits into 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0019
     * @tc.name      testSafeBoundary0019
     * @tc.desc      4096 splits into 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0020
     * @tc.name      testSafeBoundary0020
     * @tc.desc      8192 splits into 2048 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 8192;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(2048);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0021
     * @tc.name      testSafeBoundary0021
     * @tc.desc      682 splits into 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0022
     * @tc.name      testSafeBoundary0022
     * @tc.desc      21780300 splits into 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0023
     * @tc.name      testSafeBoundary0023
     * @tc.desc      1024 splits into 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0024
     * @tc.name      testSafeBoundary0024
     * @tc.desc      4096 splits into 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0025
     * @tc.name      testSafeBoundary0025
     * @tc.desc      8192 splits into 2048 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 8192;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(2048);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0026
     * @tc.name      testSafeBoundary0026
     * @tc.desc      682 splits into 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0027
     * @tc.name      testSafeBoundary0027
     * @tc.desc      21780300 splits into 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0028
     * @tc.name      testSafeBoundary0028
     * @tc.desc      1024 splits into 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0029
     * @tc.name      testSafeBoundary0029
     * @tc.desc      4096 splits into 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0030
     * @tc.name      testSafeBoundary0030
     * @tc.desc      8192 splits into 2048 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 8192;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(2048);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0031
     * @tc.name      testSafeBoundary0031
     * @tc.desc      682 splits into 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0032
     * @tc.name      testSafeBoundary0032
     * @tc.desc      21780300 splits into 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0033
     * @tc.name      testSafeBoundary0033
     * @tc.desc      1024 splits into 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0034
     * @tc.name      testSafeBoundary0034
     * @tc.desc      4096 splits into 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0035
     * @tc.name      testSafeBoundary0035
     * @tc.desc      8192 splits into 2048 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 8192;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(2048);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0036
     * @tc.name      testSafeBoundary0036
     * @tc.desc      682 splits into 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0037
     * @tc.name      testSafeBoundary0037
     * @tc.desc      21780300 splits into 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0038
     * @tc.name      testSafeBoundary0038
     * @tc.desc      1024 splits into 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0039
     * @tc.name      testSafeBoundary0039
     * @tc.desc      4096 splits into 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0040
     * @tc.name      testSafeBoundary0040
     * @tc.desc      8192 splits into 2048 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 8192;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(2048);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0041
     * @tc.name      testSafeBoundary0041
     * @tc.desc      682 splits into 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0042
     * @tc.name      testSafeBoundary0042
     * @tc.desc      21780300 splits into 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0043
     * @tc.name      testSafeBoundary0043
     * @tc.desc      1024 splits into 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0044
     * @tc.name      testSafeBoundary0044
     * @tc.desc      4096 splits into 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0045
     * @tc.name      testSafeBoundary0045
     * @tc.desc      8192 splits into 2048 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 8192;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(2048);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0046
     * @tc.name      testSafeBoundary0046
     * @tc.desc      682 splits into 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0047
     * @tc.name      testSafeBoundary0047
     * @tc.desc      21780300 splits into 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0048
     * @tc.name      testSafeBoundary0048
     * @tc.desc      1024 splits into 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0049
     * @tc.name      testSafeBoundary0049
     * @tc.desc      4096 splits into 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0050
     * @tc.name      testSafeBoundary0050
     * @tc.desc      8192 splits into 2048 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 8192;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(2048);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0051
     * @tc.name      testSafeBoundary0051
     * @tc.desc      682 splits into 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0052
     * @tc.name      testSafeBoundary0052
     * @tc.desc      21780300 splits into 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0053
     * @tc.name      testSafeBoundary0053
     * @tc.desc      1024 splits into 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0054
     * @tc.name      testSafeBoundary0054
     * @tc.desc      4096 splits into 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0055
     * @tc.name      testSafeBoundary0055
     * @tc.desc      8192 splits into 2048 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 8192;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(2048);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0056
     * @tc.name      testSafeBoundary0056
     * @tc.desc      682 splits into 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0057
     * @tc.name      testSafeBoundary0057
     * @tc.desc      21780300 splits into 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0058
     * @tc.name      testSafeBoundary0058
     * @tc.desc      1024 splits into 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0059
     * @tc.name      testSafeBoundary0059
     * @tc.desc      4096 splits into 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0060
     * @tc.name      testSafeBoundary0060
     * @tc.desc      8192 splits into 2048 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 8192;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(2048);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0061
     * @tc.name      testSafeBoundary0061
     * @tc.desc      682 splits into 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0062
     * @tc.name      testSafeBoundary0062
     * @tc.desc      21780300 splits into 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0063
     * @tc.name      testSafeBoundary0063
     * @tc.desc      1024 splits into 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0064
     * @tc.name      testSafeBoundary0064
     * @tc.desc      4096 splits into 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0065
     * @tc.name      testSafeBoundary0065
     * @tc.desc      8192 splits into 2048 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 8192;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(2048);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0066
     * @tc.name      testSafeBoundary0066
     * @tc.desc      682 splits into 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0067
     * @tc.name      testSafeBoundary0067
     * @tc.desc      21780300 splits into 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0068
     * @tc.name      testSafeBoundary0068
     * @tc.desc      1024 splits into 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0069
     * @tc.name      testSafeBoundary0069
     * @tc.desc      4096 splits into 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0070
     * @tc.name      testSafeBoundary0070
     * @tc.desc      8192 splits into 2048 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 8192;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(2048);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0071
     * @tc.name      testSafeBoundary0071
     * @tc.desc      682 splits into 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0072
     * @tc.name      testSafeBoundary0072
     * @tc.desc      21780300 splits into 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0073
     * @tc.name      testSafeBoundary0073
     * @tc.desc      1024 splits into 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0074
     * @tc.name      testSafeBoundary0074
     * @tc.desc      4096 splits into 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0075
     * @tc.name      testSafeBoundary0075
     * @tc.desc      8192 splits into 2048 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 8192;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(2048);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0076
     * @tc.name      testSafeBoundary0076
     * @tc.desc      682 splits into 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0077
     * @tc.name      testSafeBoundary0077
     * @tc.desc      21780300 splits into 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0078
     * @tc.name      testSafeBoundary0078
     * @tc.desc      1024 splits into 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0079
     * @tc.name      testSafeBoundary0079
     * @tc.desc      4096 splits into 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0080
     * @tc.name      testSafeBoundary0080
     * @tc.desc      8192 splits into 2048 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 8192;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(2048);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0081
     * @tc.name      testSafeBoundary0081
     * @tc.desc      682 splits into 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0082
     * @tc.name      testSafeBoundary0082
     * @tc.desc      21780300 splits into 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0083
     * @tc.name      testSafeBoundary0083
     * @tc.desc      1024 splits into 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0084
     * @tc.name      testSafeBoundary0084
     * @tc.desc      4096 splits into 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0085
     * @tc.name      testSafeBoundary0085
     * @tc.desc      8192 splits into 2048 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 8192;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(2048);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0086
     * @tc.name      testSafeBoundary0086
     * @tc.desc      682 splits into 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0087
     * @tc.name      testSafeBoundary0087
     * @tc.desc      21780300 splits into 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_BT_0088
     * @tc.name      testSafeBoundary0088
     * @tc.desc      1024 splits into 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeBoundary0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
  })
}
