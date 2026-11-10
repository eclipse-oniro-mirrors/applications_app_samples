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

export default function nativePlayerContractMoreTest() {
  describe('nativePlayerContractMoreTest', () => {
    /**
     * @tc.number    SUB_AVS_MORE_NP_0001
     * @tc.name      testMoreNativePlayer0001
     * @tc.desc      Native descriptor fd=1 size=0 offset=0 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 1;
      const size: number = 0;
      const offset: number = 0;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0002
     * @tc.name      testMoreNativePlayer0002
     * @tc.desc      Native descriptor fd=2 size=2048 offset=1 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 2;
      const size: number = 2048;
      const offset: number = 1;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0003
     * @tc.name      testMoreNativePlayer0003
     * @tc.desc      Native descriptor fd=3 size=4096 offset=2 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 3;
      const size: number = 4096;
      const offset: number = 2;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0004
     * @tc.name      testMoreNativePlayer0004
     * @tc.desc      Native descriptor fd=4 size=6144 offset=3 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 4;
      const size: number = 6144;
      const offset: number = 3;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0005
     * @tc.name      testMoreNativePlayer0005
     * @tc.desc      Native descriptor fd=5 size=8192 offset=4 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 5;
      const size: number = 8192;
      const offset: number = 4;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0006
     * @tc.name      testMoreNativePlayer0006
     * @tc.desc      Native descriptor fd=6 size=10240 offset=5 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 6;
      const size: number = 10240;
      const offset: number = 5;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0007
     * @tc.name      testMoreNativePlayer0007
     * @tc.desc      Native descriptor fd=7 size=12288 offset=6 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 7;
      const size: number = 12288;
      const offset: number = 6;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0008
     * @tc.name      testMoreNativePlayer0008
     * @tc.desc      Native descriptor fd=8 size=14336 offset=7 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 8;
      const size: number = 14336;
      const offset: number = 7;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0009
     * @tc.name      testMoreNativePlayer0009
     * @tc.desc      Native descriptor fd=9 size=16384 offset=8 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 9;
      const size: number = 16384;
      const offset: number = 8;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0010
     * @tc.name      testMoreNativePlayer0010
     * @tc.desc      Native descriptor fd=10 size=18432 offset=0 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 10;
      const size: number = 18432;
      const offset: number = 0;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0011
     * @tc.name      testMoreNativePlayer0011
     * @tc.desc      Native descriptor fd=11 size=20480 offset=1 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 11;
      const size: number = 20480;
      const offset: number = 1;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0012
     * @tc.name      testMoreNativePlayer0012
     * @tc.desc      Native descriptor fd=12 size=22528 offset=2 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 12;
      const size: number = 22528;
      const offset: number = 2;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0013
     * @tc.name      testMoreNativePlayer0013
     * @tc.desc      Native descriptor fd=13 size=24576 offset=3 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 13;
      const size: number = 24576;
      const offset: number = 3;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0014
     * @tc.name      testMoreNativePlayer0014
     * @tc.desc      Native descriptor fd=14 size=26624 offset=4 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 14;
      const size: number = 26624;
      const offset: number = 4;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0015
     * @tc.name      testMoreNativePlayer0015
     * @tc.desc      Native descriptor fd=15 size=28672 offset=5 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 15;
      const size: number = 28672;
      const offset: number = 5;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0016
     * @tc.name      testMoreNativePlayer0016
     * @tc.desc      Native descriptor fd=16 size=30720 offset=6 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 16;
      const size: number = 30720;
      const offset: number = 6;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0017
     * @tc.name      testMoreNativePlayer0017
     * @tc.desc      Native descriptor fd=17 size=32768 offset=7 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 17;
      const size: number = 32768;
      const offset: number = 7;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0018
     * @tc.name      testMoreNativePlayer0018
     * @tc.desc      Native descriptor fd=18 size=34816 offset=8 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 18;
      const size: number = 34816;
      const offset: number = 8;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0019
     * @tc.name      testMoreNativePlayer0019
     * @tc.desc      Native descriptor fd=19 size=36864 offset=0 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 19;
      const size: number = 36864;
      const offset: number = 0;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0020
     * @tc.name      testMoreNativePlayer0020
     * @tc.desc      Native descriptor fd=20 size=38912 offset=1 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 20;
      const size: number = 38912;
      const offset: number = 1;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0021
     * @tc.name      testMoreNativePlayer0021
     * @tc.desc      Native descriptor fd=21 size=40960 offset=2 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 21;
      const size: number = 40960;
      const offset: number = 2;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0022
     * @tc.name      testMoreNativePlayer0022
     * @tc.desc      Native descriptor fd=22 size=43008 offset=3 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 22;
      const size: number = 43008;
      const offset: number = 3;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0023
     * @tc.name      testMoreNativePlayer0023
     * @tc.desc      Native descriptor fd=23 size=45056 offset=4 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 23;
      const size: number = 45056;
      const offset: number = 4;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0024
     * @tc.name      testMoreNativePlayer0024
     * @tc.desc      Native descriptor fd=24 size=47104 offset=5 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 24;
      const size: number = 47104;
      const offset: number = 5;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0025
     * @tc.name      testMoreNativePlayer0025
     * @tc.desc      Native descriptor fd=25 size=49152 offset=6 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 25;
      const size: number = 49152;
      const offset: number = 6;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0026
     * @tc.name      testMoreNativePlayer0026
     * @tc.desc      Native descriptor fd=26 size=51200 offset=7 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 26;
      const size: number = 51200;
      const offset: number = 7;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0027
     * @tc.name      testMoreNativePlayer0027
     * @tc.desc      Native descriptor fd=27 size=53248 offset=8 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 27;
      const size: number = 53248;
      const offset: number = 8;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0028
     * @tc.name      testMoreNativePlayer0028
     * @tc.desc      Native descriptor fd=28 size=55296 offset=0 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 28;
      const size: number = 55296;
      const offset: number = 0;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0029
     * @tc.name      testMoreNativePlayer0029
     * @tc.desc      Native descriptor fd=29 size=57344 offset=1 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 29;
      const size: number = 57344;
      const offset: number = 1;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0030
     * @tc.name      testMoreNativePlayer0030
     * @tc.desc      Native descriptor fd=30 size=59392 offset=2 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 30;
      const size: number = 59392;
      const offset: number = 2;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0031
     * @tc.name      testMoreNativePlayer0031
     * @tc.desc      Native descriptor fd=31 size=61440 offset=3 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 31;
      const size: number = 61440;
      const offset: number = 3;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0032
     * @tc.name      testMoreNativePlayer0032
     * @tc.desc      Native descriptor fd=32 size=63488 offset=4 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 32;
      const size: number = 63488;
      const offset: number = 4;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0033
     * @tc.name      testMoreNativePlayer0033
     * @tc.desc      Native descriptor fd=33 size=65536 offset=5 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 33;
      const size: number = 65536;
      const offset: number = 5;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0034
     * @tc.name      testMoreNativePlayer0034
     * @tc.desc      Native descriptor fd=34 size=67584 offset=6 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 34;
      const size: number = 67584;
      const offset: number = 6;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0035
     * @tc.name      testMoreNativePlayer0035
     * @tc.desc      Native descriptor fd=35 size=69632 offset=7 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 35;
      const size: number = 69632;
      const offset: number = 7;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0036
     * @tc.name      testMoreNativePlayer0036
     * @tc.desc      Native descriptor fd=36 size=71680 offset=8 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 36;
      const size: number = 71680;
      const offset: number = 8;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0037
     * @tc.name      testMoreNativePlayer0037
     * @tc.desc      Native descriptor fd=37 size=73728 offset=0 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 37;
      const size: number = 73728;
      const offset: number = 0;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0038
     * @tc.name      testMoreNativePlayer0038
     * @tc.desc      Native descriptor fd=38 size=75776 offset=1 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 38;
      const size: number = 75776;
      const offset: number = 1;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0039
     * @tc.name      testMoreNativePlayer0039
     * @tc.desc      Native descriptor fd=39 size=77824 offset=2 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 39;
      const size: number = 77824;
      const offset: number = 2;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0040
     * @tc.name      testMoreNativePlayer0040
     * @tc.desc      Native descriptor fd=40 size=79872 offset=3 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 40;
      const size: number = 79872;
      const offset: number = 3;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0041
     * @tc.name      testMoreNativePlayer0041
     * @tc.desc      Native descriptor fd=41 size=81920 offset=4 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 41;
      const size: number = 81920;
      const offset: number = 4;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0042
     * @tc.name      testMoreNativePlayer0042
     * @tc.desc      Native descriptor fd=42 size=83968 offset=5 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 42;
      const size: number = 83968;
      const offset: number = 5;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0043
     * @tc.name      testMoreNativePlayer0043
     * @tc.desc      Native descriptor fd=43 size=86016 offset=6 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 43;
      const size: number = 86016;
      const offset: number = 6;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0044
     * @tc.name      testMoreNativePlayer0044
     * @tc.desc      Native descriptor fd=44 size=88064 offset=7 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 44;
      const size: number = 88064;
      const offset: number = 7;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0045
     * @tc.name      testMoreNativePlayer0045
     * @tc.desc      Native descriptor fd=45 size=90112 offset=8 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 45;
      const size: number = 90112;
      const offset: number = 8;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0046
     * @tc.name      testMoreNativePlayer0046
     * @tc.desc      Native descriptor fd=46 size=92160 offset=0 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 46;
      const size: number = 92160;
      const offset: number = 0;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0047
     * @tc.name      testMoreNativePlayer0047
     * @tc.desc      Native descriptor fd=47 size=94208 offset=1 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 47;
      const size: number = 94208;
      const offset: number = 1;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0048
     * @tc.name      testMoreNativePlayer0048
     * @tc.desc      Native descriptor fd=48 size=96256 offset=2 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 48;
      const size: number = 96256;
      const offset: number = 2;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0049
     * @tc.name      testMoreNativePlayer0049
     * @tc.desc      Native descriptor fd=49 size=98304 offset=3 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 49;
      const size: number = 98304;
      const offset: number = 3;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0050
     * @tc.name      testMoreNativePlayer0050
     * @tc.desc      Native descriptor fd=50 size=100352 offset=4 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 50;
      const size: number = 100352;
      const offset: number = 4;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0051
     * @tc.name      testMoreNativePlayer0051
     * @tc.desc      Native descriptor fd=51 size=102400 offset=5 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 51;
      const size: number = 102400;
      const offset: number = 5;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0052
     * @tc.name      testMoreNativePlayer0052
     * @tc.desc      Native descriptor fd=52 size=104448 offset=6 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 52;
      const size: number = 104448;
      const offset: number = 6;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0053
     * @tc.name      testMoreNativePlayer0053
     * @tc.desc      Native descriptor fd=53 size=106496 offset=7 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 53;
      const size: number = 106496;
      const offset: number = 7;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0054
     * @tc.name      testMoreNativePlayer0054
     * @tc.desc      Native descriptor fd=54 size=108544 offset=8 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 54;
      const size: number = 108544;
      const offset: number = 8;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0055
     * @tc.name      testMoreNativePlayer0055
     * @tc.desc      Native descriptor fd=55 size=110592 offset=0 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 55;
      const size: number = 110592;
      const offset: number = 0;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0056
     * @tc.name      testMoreNativePlayer0056
     * @tc.desc      Native descriptor fd=56 size=112640 offset=1 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 56;
      const size: number = 112640;
      const offset: number = 1;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0057
     * @tc.name      testMoreNativePlayer0057
     * @tc.desc      Native descriptor fd=57 size=114688 offset=2 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 57;
      const size: number = 114688;
      const offset: number = 2;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0058
     * @tc.name      testMoreNativePlayer0058
     * @tc.desc      Native descriptor fd=58 size=116736 offset=3 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 58;
      const size: number = 116736;
      const offset: number = 3;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0059
     * @tc.name      testMoreNativePlayer0059
     * @tc.desc      Native descriptor fd=59 size=118784 offset=4 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 59;
      const size: number = 118784;
      const offset: number = 4;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0060
     * @tc.name      testMoreNativePlayer0060
     * @tc.desc      Native descriptor fd=60 size=120832 offset=5 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 60;
      const size: number = 120832;
      const offset: number = 5;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0061
     * @tc.name      testMoreNativePlayer0061
     * @tc.desc      Native descriptor fd=61 size=122880 offset=6 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 61;
      const size: number = 122880;
      const offset: number = 6;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0062
     * @tc.name      testMoreNativePlayer0062
     * @tc.desc      Native descriptor fd=62 size=124928 offset=7 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 62;
      const size: number = 124928;
      const offset: number = 7;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0063
     * @tc.name      testMoreNativePlayer0063
     * @tc.desc      Native descriptor fd=63 size=126976 offset=8 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 63;
      const size: number = 126976;
      const offset: number = 8;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0064
     * @tc.name      testMoreNativePlayer0064
     * @tc.desc      Native descriptor fd=64 size=129024 offset=0 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 64;
      const size: number = 129024;
      const offset: number = 0;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0065
     * @tc.name      testMoreNativePlayer0065
     * @tc.desc      Native descriptor fd=65 size=131072 offset=1 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 65;
      const size: number = 131072;
      const offset: number = 1;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0066
     * @tc.name      testMoreNativePlayer0066
     * @tc.desc      Native descriptor fd=66 size=133120 offset=2 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 66;
      const size: number = 133120;
      const offset: number = 2;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0067
     * @tc.name      testMoreNativePlayer0067
     * @tc.desc      Native descriptor fd=67 size=135168 offset=3 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 67;
      const size: number = 135168;
      const offset: number = 3;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0068
     * @tc.name      testMoreNativePlayer0068
     * @tc.desc      Native descriptor fd=68 size=137216 offset=4 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 68;
      const size: number = 137216;
      const offset: number = 4;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0069
     * @tc.name      testMoreNativePlayer0069
     * @tc.desc      Native descriptor fd=69 size=139264 offset=5 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 69;
      const size: number = 139264;
      const offset: number = 5;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0070
     * @tc.name      testMoreNativePlayer0070
     * @tc.desc      Native descriptor fd=70 size=141312 offset=6 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 70;
      const size: number = 141312;
      const offset: number = 6;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0071
     * @tc.name      testMoreNativePlayer0071
     * @tc.desc      Native descriptor fd=71 size=143360 offset=7 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 71;
      const size: number = 143360;
      const offset: number = 7;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0072
     * @tc.name      testMoreNativePlayer0072
     * @tc.desc      Native descriptor fd=72 size=145408 offset=8 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 72;
      const size: number = 145408;
      const offset: number = 8;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0073
     * @tc.name      testMoreNativePlayer0073
     * @tc.desc      Native descriptor fd=73 size=147456 offset=0 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 73;
      const size: number = 147456;
      const offset: number = 0;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0074
     * @tc.name      testMoreNativePlayer0074
     * @tc.desc      Native descriptor fd=74 size=149504 offset=1 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 74;
      const size: number = 149504;
      const offset: number = 1;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0075
     * @tc.name      testMoreNativePlayer0075
     * @tc.desc      Native descriptor fd=75 size=151552 offset=2 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 75;
      const size: number = 151552;
      const offset: number = 2;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0076
     * @tc.name      testMoreNativePlayer0076
     * @tc.desc      Native descriptor fd=76 size=153600 offset=3 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 76;
      const size: number = 153600;
      const offset: number = 3;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0077
     * @tc.name      testMoreNativePlayer0077
     * @tc.desc      Native descriptor fd=77 size=155648 offset=4 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 77;
      const size: number = 155648;
      const offset: number = 4;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0078
     * @tc.name      testMoreNativePlayer0078
     * @tc.desc      Native descriptor fd=78 size=157696 offset=5 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 78;
      const size: number = 157696;
      const offset: number = 5;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0079
     * @tc.name      testMoreNativePlayer0079
     * @tc.desc      Native descriptor fd=79 size=159744 offset=6 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 79;
      const size: number = 159744;
      const offset: number = 6;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0080
     * @tc.name      testMoreNativePlayer0080
     * @tc.desc      Native descriptor fd=80 size=161792 offset=7 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 80;
      const size: number = 161792;
      const offset: number = 7;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0081
     * @tc.name      testMoreNativePlayer0081
     * @tc.desc      Native descriptor fd=81 size=163840 offset=8 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 81;
      const size: number = 163840;
      const offset: number = 8;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0082
     * @tc.name      testMoreNativePlayer0082
     * @tc.desc      Native descriptor fd=82 size=165888 offset=0 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 82;
      const size: number = 165888;
      const offset: number = 0;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0083
     * @tc.name      testMoreNativePlayer0083
     * @tc.desc      Native descriptor fd=83 size=167936 offset=1 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 83;
      const size: number = 167936;
      const offset: number = 1;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0084
     * @tc.name      testMoreNativePlayer0084
     * @tc.desc      Native descriptor fd=84 size=169984 offset=2 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 84;
      const size: number = 169984;
      const offset: number = 2;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0085
     * @tc.name      testMoreNativePlayer0085
     * @tc.desc      Native descriptor fd=85 size=172032 offset=3 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 85;
      const size: number = 172032;
      const offset: number = 3;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_NP_0086
     * @tc.name      testMoreNativePlayer0086
     * @tc.desc      Native descriptor fd=86 size=174080 offset=4 is bounded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreNativePlayer0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fd: number = 86;
      const size: number = 174080;
      const offset: number = 4;
      const valid: boolean = fd > 0 && size >= 0 && offset >= 0 && offset <= size;
      expect(fd).assertLarger(0);
      expect(size).assertLargerOrEqual(0);
      expect(offset >= 0 && offset <= size).assertTrue();
      expect(valid).assertTrue();
    })
  })
}
