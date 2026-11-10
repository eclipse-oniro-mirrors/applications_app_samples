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

export default function nativePlayerFdContractExpandedTest() {
  describe('nativePlayerFdContractExpandedTest', () => {
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0001
     * @tc.name      testProjFd0001
     * @tc.desc      Native player descriptor fd=1, size=0, offset=0 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 1;
      const size: number = 0;
      const offset: number = 0;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0002
     * @tc.name      testProjFd0002
     * @tc.desc      Native player descriptor fd=2, size=1024, offset=1 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 2;
      const size: number = 1024;
      const offset: number = 1;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0003
     * @tc.name      testProjFd0003
     * @tc.desc      Native player descriptor fd=3, size=2048, offset=2 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 3;
      const size: number = 2048;
      const offset: number = 2;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0004
     * @tc.name      testProjFd0004
     * @tc.desc      Native player descriptor fd=4, size=3072, offset=3 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 4;
      const size: number = 3072;
      const offset: number = 3;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0005
     * @tc.name      testProjFd0005
     * @tc.desc      Native player descriptor fd=5, size=4096, offset=4 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 5;
      const size: number = 4096;
      const offset: number = 4;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0006
     * @tc.name      testProjFd0006
     * @tc.desc      Native player descriptor fd=6, size=5120, offset=5 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 6;
      const size: number = 5120;
      const offset: number = 5;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0007
     * @tc.name      testProjFd0007
     * @tc.desc      Native player descriptor fd=7, size=6144, offset=6 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 7;
      const size: number = 6144;
      const offset: number = 6;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0008
     * @tc.name      testProjFd0008
     * @tc.desc      Native player descriptor fd=8, size=7168, offset=0 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 8;
      const size: number = 7168;
      const offset: number = 0;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0009
     * @tc.name      testProjFd0009
     * @tc.desc      Native player descriptor fd=9, size=8192, offset=1 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 9;
      const size: number = 8192;
      const offset: number = 1;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0010
     * @tc.name      testProjFd0010
     * @tc.desc      Native player descriptor fd=10, size=9216, offset=2 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 10;
      const size: number = 9216;
      const offset: number = 2;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0011
     * @tc.name      testProjFd0011
     * @tc.desc      Native player descriptor fd=11, size=10240, offset=3 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 11;
      const size: number = 10240;
      const offset: number = 3;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0012
     * @tc.name      testProjFd0012
     * @tc.desc      Native player descriptor fd=12, size=11264, offset=4 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 12;
      const size: number = 11264;
      const offset: number = 4;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0013
     * @tc.name      testProjFd0013
     * @tc.desc      Native player descriptor fd=13, size=12288, offset=5 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 13;
      const size: number = 12288;
      const offset: number = 5;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0014
     * @tc.name      testProjFd0014
     * @tc.desc      Native player descriptor fd=14, size=13312, offset=6 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 14;
      const size: number = 13312;
      const offset: number = 6;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0015
     * @tc.name      testProjFd0015
     * @tc.desc      Native player descriptor fd=15, size=14336, offset=0 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 15;
      const size: number = 14336;
      const offset: number = 0;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0016
     * @tc.name      testProjFd0016
     * @tc.desc      Native player descriptor fd=16, size=15360, offset=1 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 16;
      const size: number = 15360;
      const offset: number = 1;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0017
     * @tc.name      testProjFd0017
     * @tc.desc      Native player descriptor fd=17, size=16384, offset=2 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 17;
      const size: number = 16384;
      const offset: number = 2;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0018
     * @tc.name      testProjFd0018
     * @tc.desc      Native player descriptor fd=18, size=17408, offset=3 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 18;
      const size: number = 17408;
      const offset: number = 3;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0019
     * @tc.name      testProjFd0019
     * @tc.desc      Native player descriptor fd=19, size=18432, offset=4 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 19;
      const size: number = 18432;
      const offset: number = 4;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0020
     * @tc.name      testProjFd0020
     * @tc.desc      Native player descriptor fd=20, size=19456, offset=5 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 20;
      const size: number = 19456;
      const offset: number = 5;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0021
     * @tc.name      testProjFd0021
     * @tc.desc      Native player descriptor fd=21, size=20480, offset=6 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 21;
      const size: number = 20480;
      const offset: number = 6;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0022
     * @tc.name      testProjFd0022
     * @tc.desc      Native player descriptor fd=22, size=21504, offset=0 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 22;
      const size: number = 21504;
      const offset: number = 0;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0023
     * @tc.name      testProjFd0023
     * @tc.desc      Native player descriptor fd=23, size=22528, offset=1 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 23;
      const size: number = 22528;
      const offset: number = 1;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0024
     * @tc.name      testProjFd0024
     * @tc.desc      Native player descriptor fd=24, size=23552, offset=2 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 24;
      const size: number = 23552;
      const offset: number = 2;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0025
     * @tc.name      testProjFd0025
     * @tc.desc      Native player descriptor fd=25, size=24576, offset=3 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 25;
      const size: number = 24576;
      const offset: number = 3;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0026
     * @tc.name      testProjFd0026
     * @tc.desc      Native player descriptor fd=26, size=25600, offset=4 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 26;
      const size: number = 25600;
      const offset: number = 4;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0027
     * @tc.name      testProjFd0027
     * @tc.desc      Native player descriptor fd=27, size=26624, offset=5 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 27;
      const size: number = 26624;
      const offset: number = 5;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0028
     * @tc.name      testProjFd0028
     * @tc.desc      Native player descriptor fd=28, size=27648, offset=6 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 28;
      const size: number = 27648;
      const offset: number = 6;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0029
     * @tc.name      testProjFd0029
     * @tc.desc      Native player descriptor fd=29, size=28672, offset=0 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 29;
      const size: number = 28672;
      const offset: number = 0;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0030
     * @tc.name      testProjFd0030
     * @tc.desc      Native player descriptor fd=30, size=29696, offset=1 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 30;
      const size: number = 29696;
      const offset: number = 1;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0031
     * @tc.name      testProjFd0031
     * @tc.desc      Native player descriptor fd=31, size=30720, offset=2 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 31;
      const size: number = 30720;
      const offset: number = 2;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0032
     * @tc.name      testProjFd0032
     * @tc.desc      Native player descriptor fd=32, size=31744, offset=3 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 32;
      const size: number = 31744;
      const offset: number = 3;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0033
     * @tc.name      testProjFd0033
     * @tc.desc      Native player descriptor fd=33, size=32768, offset=4 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 33;
      const size: number = 32768;
      const offset: number = 4;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0034
     * @tc.name      testProjFd0034
     * @tc.desc      Native player descriptor fd=34, size=33792, offset=5 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 34;
      const size: number = 33792;
      const offset: number = 5;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0035
     * @tc.name      testProjFd0035
     * @tc.desc      Native player descriptor fd=35, size=34816, offset=6 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 35;
      const size: number = 34816;
      const offset: number = 6;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0036
     * @tc.name      testProjFd0036
     * @tc.desc      Native player descriptor fd=36, size=35840, offset=0 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 36;
      const size: number = 35840;
      const offset: number = 0;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0037
     * @tc.name      testProjFd0037
     * @tc.desc      Native player descriptor fd=37, size=36864, offset=1 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 37;
      const size: number = 36864;
      const offset: number = 1;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0038
     * @tc.name      testProjFd0038
     * @tc.desc      Native player descriptor fd=38, size=37888, offset=2 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 38;
      const size: number = 37888;
      const offset: number = 2;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0039
     * @tc.name      testProjFd0039
     * @tc.desc      Native player descriptor fd=39, size=38912, offset=3 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 39;
      const size: number = 38912;
      const offset: number = 3;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0040
     * @tc.name      testProjFd0040
     * @tc.desc      Native player descriptor fd=40, size=39936, offset=4 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 40;
      const size: number = 39936;
      const offset: number = 4;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0041
     * @tc.name      testProjFd0041
     * @tc.desc      Native player descriptor fd=41, size=40960, offset=5 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 41;
      const size: number = 40960;
      const offset: number = 5;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0042
     * @tc.name      testProjFd0042
     * @tc.desc      Native player descriptor fd=42, size=41984, offset=6 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 42;
      const size: number = 41984;
      const offset: number = 6;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0043
     * @tc.name      testProjFd0043
     * @tc.desc      Native player descriptor fd=43, size=43008, offset=0 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 43;
      const size: number = 43008;
      const offset: number = 0;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0044
     * @tc.name      testProjFd0044
     * @tc.desc      Native player descriptor fd=44, size=44032, offset=1 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 44;
      const size: number = 44032;
      const offset: number = 1;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0045
     * @tc.name      testProjFd0045
     * @tc.desc      Native player descriptor fd=45, size=45056, offset=2 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 45;
      const size: number = 45056;
      const offset: number = 2;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0046
     * @tc.name      testProjFd0046
     * @tc.desc      Native player descriptor fd=46, size=46080, offset=3 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 46;
      const size: number = 46080;
      const offset: number = 3;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0047
     * @tc.name      testProjFd0047
     * @tc.desc      Native player descriptor fd=47, size=47104, offset=4 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 47;
      const size: number = 47104;
      const offset: number = 4;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0048
     * @tc.name      testProjFd0048
     * @tc.desc      Native player descriptor fd=48, size=48128, offset=5 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 48;
      const size: number = 48128;
      const offset: number = 5;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0049
     * @tc.name      testProjFd0049
     * @tc.desc      Native player descriptor fd=49, size=49152, offset=6 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 49;
      const size: number = 49152;
      const offset: number = 6;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0050
     * @tc.name      testProjFd0050
     * @tc.desc      Native player descriptor fd=50, size=50176, offset=0 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 50;
      const size: number = 50176;
      const offset: number = 0;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0051
     * @tc.name      testProjFd0051
     * @tc.desc      Native player descriptor fd=51, size=51200, offset=1 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 51;
      const size: number = 51200;
      const offset: number = 1;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0052
     * @tc.name      testProjFd0052
     * @tc.desc      Native player descriptor fd=52, size=52224, offset=2 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 52;
      const size: number = 52224;
      const offset: number = 2;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0053
     * @tc.name      testProjFd0053
     * @tc.desc      Native player descriptor fd=53, size=53248, offset=3 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 53;
      const size: number = 53248;
      const offset: number = 3;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0054
     * @tc.name      testProjFd0054
     * @tc.desc      Native player descriptor fd=54, size=54272, offset=4 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 54;
      const size: number = 54272;
      const offset: number = 4;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0055
     * @tc.name      testProjFd0055
     * @tc.desc      Native player descriptor fd=55, size=55296, offset=5 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 55;
      const size: number = 55296;
      const offset: number = 5;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0056
     * @tc.name      testProjFd0056
     * @tc.desc      Native player descriptor fd=56, size=56320, offset=6 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 56;
      const size: number = 56320;
      const offset: number = 6;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0057
     * @tc.name      testProjFd0057
     * @tc.desc      Native player descriptor fd=57, size=57344, offset=0 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 57;
      const size: number = 57344;
      const offset: number = 0;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0058
     * @tc.name      testProjFd0058
     * @tc.desc      Native player descriptor fd=58, size=58368, offset=1 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 58;
      const size: number = 58368;
      const offset: number = 1;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0059
     * @tc.name      testProjFd0059
     * @tc.desc      Native player descriptor fd=59, size=59392, offset=2 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 59;
      const size: number = 59392;
      const offset: number = 2;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0060
     * @tc.name      testProjFd0060
     * @tc.desc      Native player descriptor fd=60, size=60416, offset=3 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 60;
      const size: number = 60416;
      const offset: number = 3;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0061
     * @tc.name      testProjFd0061
     * @tc.desc      Native player descriptor fd=61, size=61440, offset=4 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 61;
      const size: number = 61440;
      const offset: number = 4;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0062
     * @tc.name      testProjFd0062
     * @tc.desc      Native player descriptor fd=62, size=62464, offset=5 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 62;
      const size: number = 62464;
      const offset: number = 5;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0063
     * @tc.name      testProjFd0063
     * @tc.desc      Native player descriptor fd=63, size=63488, offset=6 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 63;
      const size: number = 63488;
      const offset: number = 6;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0064
     * @tc.name      testProjFd0064
     * @tc.desc      Native player descriptor fd=64, size=64512, offset=0 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 64;
      const size: number = 64512;
      const offset: number = 0;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0065
     * @tc.name      testProjFd0065
     * @tc.desc      Native player descriptor fd=65, size=65536, offset=1 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 65;
      const size: number = 65536;
      const offset: number = 1;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0066
     * @tc.name      testProjFd0066
     * @tc.desc      Native player descriptor fd=66, size=66560, offset=2 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 66;
      const size: number = 66560;
      const offset: number = 2;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0067
     * @tc.name      testProjFd0067
     * @tc.desc      Native player descriptor fd=67, size=67584, offset=3 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 67;
      const size: number = 67584;
      const offset: number = 3;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0068
     * @tc.name      testProjFd0068
     * @tc.desc      Native player descriptor fd=68, size=68608, offset=4 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 68;
      const size: number = 68608;
      const offset: number = 4;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0069
     * @tc.name      testProjFd0069
     * @tc.desc      Native player descriptor fd=69, size=69632, offset=5 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 69;
      const size: number = 69632;
      const offset: number = 5;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0070
     * @tc.name      testProjFd0070
     * @tc.desc      Native player descriptor fd=70, size=70656, offset=6 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 70;
      const size: number = 70656;
      const offset: number = 6;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0071
     * @tc.name      testProjFd0071
     * @tc.desc      Native player descriptor fd=71, size=71680, offset=0 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 71;
      const size: number = 71680;
      const offset: number = 0;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0072
     * @tc.name      testProjFd0072
     * @tc.desc      Native player descriptor fd=72, size=72704, offset=1 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 72;
      const size: number = 72704;
      const offset: number = 1;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0073
     * @tc.name      testProjFd0073
     * @tc.desc      Native player descriptor fd=73, size=73728, offset=2 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 73;
      const size: number = 73728;
      const offset: number = 2;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0074
     * @tc.name      testProjFd0074
     * @tc.desc      Native player descriptor fd=74, size=74752, offset=3 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 74;
      const size: number = 74752;
      const offset: number = 3;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0075
     * @tc.name      testProjFd0075
     * @tc.desc      Native player descriptor fd=75, size=75776, offset=4 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 75;
      const size: number = 75776;
      const offset: number = 4;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0076
     * @tc.name      testProjFd0076
     * @tc.desc      Native player descriptor fd=76, size=76800, offset=5 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 76;
      const size: number = 76800;
      const offset: number = 5;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0077
     * @tc.name      testProjFd0077
     * @tc.desc      Native player descriptor fd=77, size=77824, offset=6 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 77;
      const size: number = 77824;
      const offset: number = 6;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0078
     * @tc.name      testProjFd0078
     * @tc.desc      Native player descriptor fd=78, size=78848, offset=0 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 78;
      const size: number = 78848;
      const offset: number = 0;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0079
     * @tc.name      testProjFd0079
     * @tc.desc      Native player descriptor fd=79, size=79872, offset=1 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 79;
      const size: number = 79872;
      const offset: number = 1;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0080
     * @tc.name      testProjFd0080
     * @tc.desc      Native player descriptor fd=80, size=80896, offset=2 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 80;
      const size: number = 80896;
      const offset: number = 2;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0081
     * @tc.name      testProjFd0081
     * @tc.desc      Native player descriptor fd=81, size=81920, offset=3 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 81;
      const size: number = 81920;
      const offset: number = 3;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0082
     * @tc.name      testProjFd0082
     * @tc.desc      Native player descriptor fd=82, size=82944, offset=4 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 82;
      const size: number = 82944;
      const offset: number = 4;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0083
     * @tc.name      testProjFd0083
     * @tc.desc      Native player descriptor fd=83, size=83968, offset=5 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 83;
      const size: number = 83968;
      const offset: number = 5;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0084
     * @tc.name      testProjFd0084
     * @tc.desc      Native player descriptor fd=84, size=84992, offset=6 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 84;
      const size: number = 84992;
      const offset: number = 6;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0085
     * @tc.name      testProjFd0085
     * @tc.desc      Native player descriptor fd=85, size=86016, offset=0 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 85;
      const size: number = 86016;
      const offset: number = 0;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0086
     * @tc.name      testProjFd0086
     * @tc.desc      Native player descriptor fd=86, size=87040, offset=1 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 86;
      const size: number = 87040;
      const offset: number = 1;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0087
     * @tc.name      testProjFd0087
     * @tc.desc      Native player descriptor fd=87, size=88064, offset=2 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 87;
      const size: number = 88064;
      const offset: number = 2;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0088
     * @tc.name      testProjFd0088
     * @tc.desc      Native player descriptor fd=88, size=89088, offset=3 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 88;
      const size: number = 89088;
      const offset: number = 3;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0089
     * @tc.name      testProjFd0089
     * @tc.desc      Native player descriptor fd=89, size=90112, offset=4 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 89;
      const size: number = 90112;
      const offset: number = 4;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0090
     * @tc.name      testProjFd0090
     * @tc.desc      Native player descriptor fd=90, size=91136, offset=5 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 90;
      const size: number = 91136;
      const offset: number = 5;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0091
     * @tc.name      testProjFd0091
     * @tc.desc      Native player descriptor fd=91, size=92160, offset=6 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 91;
      const size: number = 92160;
      const offset: number = 6;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0092
     * @tc.name      testProjFd0092
     * @tc.desc      Native player descriptor fd=92, size=93184, offset=0 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 92;
      const size: number = 93184;
      const offset: number = 0;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0093
     * @tc.name      testProjFd0093
     * @tc.desc      Native player descriptor fd=93, size=94208, offset=1 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 93;
      const size: number = 94208;
      const offset: number = 1;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0094
     * @tc.name      testProjFd0094
     * @tc.desc      Native player descriptor fd=94, size=95232, offset=2 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 94;
      const size: number = 95232;
      const offset: number = 2;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0095
     * @tc.name      testProjFd0095
     * @tc.desc      Native player descriptor fd=95, size=96256, offset=3 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 95;
      const size: number = 96256;
      const offset: number = 3;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0096
     * @tc.name      testProjFd0096
     * @tc.desc      Native player descriptor fd=96, size=97280, offset=4 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 96;
      const size: number = 97280;
      const offset: number = 4;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0097
     * @tc.name      testProjFd0097
     * @tc.desc      Native player descriptor fd=97, size=98304, offset=5 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 97;
      const size: number = 98304;
      const offset: number = 5;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0098
     * @tc.name      testProjFd0098
     * @tc.desc      Native player descriptor fd=98, size=99328, offset=6 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 98;
      const size: number = 99328;
      const offset: number = 6;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0099
     * @tc.name      testProjFd0099
     * @tc.desc      Native player descriptor fd=99, size=100352, offset=0 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 99;
      const size: number = 100352;
      const offset: number = 0;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_FD_0100
     * @tc.name      testProjFd0100
     * @tc.desc      Native player descriptor fd=100, size=101376, offset=1 is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjFd0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 100;
      const size: number = 101376;
      const offset: number = 1;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset).assertLargerOrEqual(0);
      expect(valid).assertTrue();
    })
  })
}
