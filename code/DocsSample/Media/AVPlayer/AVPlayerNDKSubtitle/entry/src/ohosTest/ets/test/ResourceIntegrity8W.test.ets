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
import { describe, it, expect } from '@ohos/hypium';


export default function resourceIntegrity8wTest() {
  describe('resourceIntegrity8wTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0001
     * @tc.name      test8wResourceIntegrity0001
     * @tc.desc      Resource 682 splits into chunks of 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0001', 0, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0002
     * @tc.name      test8wResourceIntegrity0002
     * @tc.desc      Resource 21780300 splits into chunks of 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0002', 0, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0003
     * @tc.name      test8wResourceIntegrity0003
     * @tc.desc      Resource 1024 splits into chunks of 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0003', 0, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0004
     * @tc.name      test8wResourceIntegrity0004
     * @tc.desc      Resource 2048 splits into chunks of 512 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0004', 0, () => {
      const total: number = 2048;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(512);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0005
     * @tc.name      test8wResourceIntegrity0005
     * @tc.desc      Resource 4096 splits into chunks of 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0005', 0, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0006
     * @tc.name      test8wResourceIntegrity0006
     * @tc.desc      Resource 682 splits into chunks of 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0006', 0, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0007
     * @tc.name      test8wResourceIntegrity0007
     * @tc.desc      Resource 21780300 splits into chunks of 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0007', 0, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0008
     * @tc.name      test8wResourceIntegrity0008
     * @tc.desc      Resource 1024 splits into chunks of 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0008', 0, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0009
     * @tc.name      test8wResourceIntegrity0009
     * @tc.desc      Resource 2048 splits into chunks of 512 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0009', 0, () => {
      const total: number = 2048;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(512);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0010
     * @tc.name      test8wResourceIntegrity0010
     * @tc.desc      Resource 4096 splits into chunks of 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0010', 0, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0011
     * @tc.name      test8wResourceIntegrity0011
     * @tc.desc      Resource 682 splits into chunks of 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0011', 0, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0012
     * @tc.name      test8wResourceIntegrity0012
     * @tc.desc      Resource 21780300 splits into chunks of 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0012', 0, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0013
     * @tc.name      test8wResourceIntegrity0013
     * @tc.desc      Resource 1024 splits into chunks of 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0013', 0, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0014
     * @tc.name      test8wResourceIntegrity0014
     * @tc.desc      Resource 2048 splits into chunks of 512 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0014', 0, () => {
      const total: number = 2048;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(512);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0015
     * @tc.name      test8wResourceIntegrity0015
     * @tc.desc      Resource 4096 splits into chunks of 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0015', 0, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0016
     * @tc.name      test8wResourceIntegrity0016
     * @tc.desc      Resource 682 splits into chunks of 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0016', 0, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0017
     * @tc.name      test8wResourceIntegrity0017
     * @tc.desc      Resource 21780300 splits into chunks of 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0017', 0, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0018
     * @tc.name      test8wResourceIntegrity0018
     * @tc.desc      Resource 1024 splits into chunks of 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0018', 0, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0019
     * @tc.name      test8wResourceIntegrity0019
     * @tc.desc      Resource 2048 splits into chunks of 512 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0019', 0, () => {
      const total: number = 2048;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(512);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0020
     * @tc.name      test8wResourceIntegrity0020
     * @tc.desc      Resource 4096 splits into chunks of 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0020', 0, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0021
     * @tc.name      test8wResourceIntegrity0021
     * @tc.desc      Resource 682 splits into chunks of 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0021', 0, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0022
     * @tc.name      test8wResourceIntegrity0022
     * @tc.desc      Resource 21780300 splits into chunks of 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0022', 0, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0023
     * @tc.name      test8wResourceIntegrity0023
     * @tc.desc      Resource 1024 splits into chunks of 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0023', 0, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0024
     * @tc.name      test8wResourceIntegrity0024
     * @tc.desc      Resource 2048 splits into chunks of 512 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0024', 0, () => {
      const total: number = 2048;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(512);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0025
     * @tc.name      test8wResourceIntegrity0025
     * @tc.desc      Resource 4096 splits into chunks of 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0025', 0, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0026
     * @tc.name      test8wResourceIntegrity0026
     * @tc.desc      Resource 682 splits into chunks of 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0026', 0, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0027
     * @tc.name      test8wResourceIntegrity0027
     * @tc.desc      Resource 21780300 splits into chunks of 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0027', 0, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0028
     * @tc.name      test8wResourceIntegrity0028
     * @tc.desc      Resource 1024 splits into chunks of 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0028', 0, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0029
     * @tc.name      test8wResourceIntegrity0029
     * @tc.desc      Resource 2048 splits into chunks of 512 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0029', 0, () => {
      const total: number = 2048;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(512);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0030
     * @tc.name      test8wResourceIntegrity0030
     * @tc.desc      Resource 4096 splits into chunks of 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0030', 0, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0031
     * @tc.name      test8wResourceIntegrity0031
     * @tc.desc      Resource 682 splits into chunks of 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0031', 0, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0032
     * @tc.name      test8wResourceIntegrity0032
     * @tc.desc      Resource 21780300 splits into chunks of 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0032', 0, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0033
     * @tc.name      test8wResourceIntegrity0033
     * @tc.desc      Resource 1024 splits into chunks of 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0033', 0, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0034
     * @tc.name      test8wResourceIntegrity0034
     * @tc.desc      Resource 2048 splits into chunks of 512 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0034', 0, () => {
      const total: number = 2048;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(512);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0035
     * @tc.name      test8wResourceIntegrity0035
     * @tc.desc      Resource 4096 splits into chunks of 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0035', 0, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0036
     * @tc.name      test8wResourceIntegrity0036
     * @tc.desc      Resource 682 splits into chunks of 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0036', 0, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0037
     * @tc.name      test8wResourceIntegrity0037
     * @tc.desc      Resource 21780300 splits into chunks of 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0037', 0, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0038
     * @tc.name      test8wResourceIntegrity0038
     * @tc.desc      Resource 1024 splits into chunks of 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0038', 0, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0039
     * @tc.name      test8wResourceIntegrity0039
     * @tc.desc      Resource 2048 splits into chunks of 512 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0039', 0, () => {
      const total: number = 2048;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(512);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0040
     * @tc.name      test8wResourceIntegrity0040
     * @tc.desc      Resource 4096 splits into chunks of 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0040', 0, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0041
     * @tc.name      test8wResourceIntegrity0041
     * @tc.desc      Resource 682 splits into chunks of 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0041', 0, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0042
     * @tc.name      test8wResourceIntegrity0042
     * @tc.desc      Resource 21780300 splits into chunks of 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0042', 0, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0043
     * @tc.name      test8wResourceIntegrity0043
     * @tc.desc      Resource 1024 splits into chunks of 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0043', 0, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0044
     * @tc.name      test8wResourceIntegrity0044
     * @tc.desc      Resource 2048 splits into chunks of 512 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0044', 0, () => {
      const total: number = 2048;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(512);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0045
     * @tc.name      test8wResourceIntegrity0045
     * @tc.desc      Resource 4096 splits into chunks of 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0045', 0, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0046
     * @tc.name      test8wResourceIntegrity0046
     * @tc.desc      Resource 682 splits into chunks of 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0046', 0, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0047
     * @tc.name      test8wResourceIntegrity0047
     * @tc.desc      Resource 21780300 splits into chunks of 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0047', 0, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0048
     * @tc.name      test8wResourceIntegrity0048
     * @tc.desc      Resource 1024 splits into chunks of 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0048', 0, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0049
     * @tc.name      test8wResourceIntegrity0049
     * @tc.desc      Resource 2048 splits into chunks of 512 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0049', 0, () => {
      const total: number = 2048;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(512);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0050
     * @tc.name      test8wResourceIntegrity0050
     * @tc.desc      Resource 4096 splits into chunks of 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0050', 0, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0051
     * @tc.name      test8wResourceIntegrity0051
     * @tc.desc      Resource 682 splits into chunks of 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0051', 0, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0052
     * @tc.name      test8wResourceIntegrity0052
     * @tc.desc      Resource 21780300 splits into chunks of 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0052', 0, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0053
     * @tc.name      test8wResourceIntegrity0053
     * @tc.desc      Resource 1024 splits into chunks of 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0053', 0, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0054
     * @tc.name      test8wResourceIntegrity0054
     * @tc.desc      Resource 2048 splits into chunks of 512 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0054', 0, () => {
      const total: number = 2048;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(512);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0055
     * @tc.name      test8wResourceIntegrity0055
     * @tc.desc      Resource 4096 splits into chunks of 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0055', 0, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0056
     * @tc.name      test8wResourceIntegrity0056
     * @tc.desc      Resource 682 splits into chunks of 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0056', 0, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0057
     * @tc.name      test8wResourceIntegrity0057
     * @tc.desc      Resource 21780300 splits into chunks of 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0057', 0, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0058
     * @tc.name      test8wResourceIntegrity0058
     * @tc.desc      Resource 1024 splits into chunks of 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0058', 0, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0059
     * @tc.name      test8wResourceIntegrity0059
     * @tc.desc      Resource 2048 splits into chunks of 512 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0059', 0, () => {
      const total: number = 2048;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(512);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0060
     * @tc.name      test8wResourceIntegrity0060
     * @tc.desc      Resource 4096 splits into chunks of 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0060', 0, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0061
     * @tc.name      test8wResourceIntegrity0061
     * @tc.desc      Resource 682 splits into chunks of 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0061', 0, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0062
     * @tc.name      test8wResourceIntegrity0062
     * @tc.desc      Resource 21780300 splits into chunks of 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0062', 0, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0063
     * @tc.name      test8wResourceIntegrity0063
     * @tc.desc      Resource 1024 splits into chunks of 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0063', 0, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0064
     * @tc.name      test8wResourceIntegrity0064
     * @tc.desc      Resource 2048 splits into chunks of 512 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0064', 0, () => {
      const total: number = 2048;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(512);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0065
     * @tc.name      test8wResourceIntegrity0065
     * @tc.desc      Resource 4096 splits into chunks of 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0065', 0, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0066
     * @tc.name      test8wResourceIntegrity0066
     * @tc.desc      Resource 682 splits into chunks of 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0066', 0, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0067
     * @tc.name      test8wResourceIntegrity0067
     * @tc.desc      Resource 21780300 splits into chunks of 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0067', 0, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0068
     * @tc.name      test8wResourceIntegrity0068
     * @tc.desc      Resource 1024 splits into chunks of 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0068', 0, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0069
     * @tc.name      test8wResourceIntegrity0069
     * @tc.desc      Resource 2048 splits into chunks of 512 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0069', 0, () => {
      const total: number = 2048;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(512);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0070
     * @tc.name      test8wResourceIntegrity0070
     * @tc.desc      Resource 4096 splits into chunks of 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0070', 0, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0071
     * @tc.name      test8wResourceIntegrity0071
     * @tc.desc      Resource 682 splits into chunks of 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0071', 0, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0072
     * @tc.name      test8wResourceIntegrity0072
     * @tc.desc      Resource 21780300 splits into chunks of 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0072', 0, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0073
     * @tc.name      test8wResourceIntegrity0073
     * @tc.desc      Resource 1024 splits into chunks of 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0073', 0, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0074
     * @tc.name      test8wResourceIntegrity0074
     * @tc.desc      Resource 2048 splits into chunks of 512 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0074', 0, () => {
      const total: number = 2048;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(512);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0075
     * @tc.name      test8wResourceIntegrity0075
     * @tc.desc      Resource 4096 splits into chunks of 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0075', 0, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0076
     * @tc.name      test8wResourceIntegrity0076
     * @tc.desc      Resource 682 splits into chunks of 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0076', 0, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0077
     * @tc.name      test8wResourceIntegrity0077
     * @tc.desc      Resource 21780300 splits into chunks of 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0077', 0, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0078
     * @tc.name      test8wResourceIntegrity0078
     * @tc.desc      Resource 1024 splits into chunks of 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0078', 0, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0079
     * @tc.name      test8wResourceIntegrity0079
     * @tc.desc      Resource 2048 splits into chunks of 512 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0079', 0, () => {
      const total: number = 2048;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(512);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0080
     * @tc.name      test8wResourceIntegrity0080
     * @tc.desc      Resource 4096 splits into chunks of 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0080', 0, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0081
     * @tc.name      test8wResourceIntegrity0081
     * @tc.desc      Resource 682 splits into chunks of 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0081', 0, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0082
     * @tc.name      test8wResourceIntegrity0082
     * @tc.desc      Resource 21780300 splits into chunks of 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0082', 0, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0083
     * @tc.name      test8wResourceIntegrity0083
     * @tc.desc      Resource 1024 splits into chunks of 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0083', 0, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0084
     * @tc.name      test8wResourceIntegrity0084
     * @tc.desc      Resource 2048 splits into chunks of 512 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0084', 0, () => {
      const total: number = 2048;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(512);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0085
     * @tc.name      test8wResourceIntegrity0085
     * @tc.desc      Resource 4096 splits into chunks of 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0085', 0, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0086
     * @tc.name      test8wResourceIntegrity0086
     * @tc.desc      Resource 682 splits into chunks of 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0086', 0, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0087
     * @tc.name      test8wResourceIntegrity0087
     * @tc.desc      Resource 21780300 splits into chunks of 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0087', 0, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0088
     * @tc.name      test8wResourceIntegrity0088
     * @tc.desc      Resource 1024 splits into chunks of 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0088', 0, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0089
     * @tc.name      test8wResourceIntegrity0089
     * @tc.desc      Resource 2048 splits into chunks of 512 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0089', 0, () => {
      const total: number = 2048;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(512);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0090
     * @tc.name      test8wResourceIntegrity0090
     * @tc.desc      Resource 4096 splits into chunks of 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0090', 0, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0091
     * @tc.name      test8wResourceIntegrity0091
     * @tc.desc      Resource 682 splits into chunks of 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0091', 0, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0092
     * @tc.name      test8wResourceIntegrity0092
     * @tc.desc      Resource 21780300 splits into chunks of 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0092', 0, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0093
     * @tc.name      test8wResourceIntegrity0093
     * @tc.desc      Resource 1024 splits into chunks of 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0093', 0, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0094
     * @tc.name      test8wResourceIntegrity0094
     * @tc.desc      Resource 2048 splits into chunks of 512 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0094', 0, () => {
      const total: number = 2048;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(512);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0095
     * @tc.name      test8wResourceIntegrity0095
     * @tc.desc      Resource 4096 splits into chunks of 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0095', 0, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0096
     * @tc.name      test8wResourceIntegrity0096
     * @tc.desc      Resource 682 splits into chunks of 170 with remainder 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0096', 0, () => {
      const total: number = 682;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(170);
      expect(remainder).assertEqual(2);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0097
     * @tc.name      test8wResourceIntegrity0097
     * @tc.desc      Resource 21780300 splits into chunks of 5445075 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0097', 0, () => {
      const total: number = 21780300;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(5445075);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0098
     * @tc.name      test8wResourceIntegrity0098
     * @tc.desc      Resource 1024 splits into chunks of 256 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0098', 0, () => {
      const total: number = 1024;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(256);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0099
     * @tc.name      test8wResourceIntegrity0099
     * @tc.desc      Resource 2048 splits into chunks of 512 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0099', 0, () => {
      const total: number = 2048;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(512);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_RES_0100
     * @tc.name      test8wResourceIntegrity0100
     * @tc.desc      Resource 4096 splits into chunks of 1024 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wResourceIntegrity0100', 0, () => {
      const total: number = 4096;
      const chunk: number = Math.floor(total / 4);
      const remainder: number = total % 4;
      expect(chunk).assertEqual(1024);
      expect(remainder).assertEqual(0);
      expect(chunk * 4 + remainder).assertEqual(total);
      expect(total).assertLarger(0);
    })
  })
}
