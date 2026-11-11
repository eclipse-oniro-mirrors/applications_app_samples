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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level, Assert } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_MediaSourceRangeCore]';
const DOMAIN: number = 0xF812;

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

function expect(actual: string | number | boolean | Object | null | undefined): Assert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function mediaSourceRangeCoreTest(): void {
  describe('mediaSourceRangeCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0001
     * @tc.name      testSafeRange0001
     * @tc.desc      Range request 0+512 formats as bytes=0-511.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 0;
      const length: number = 512;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=0-511');
      expect(end).assertEqual(511);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0002
     * @tc.name      testSafeRange0002
     * @tc.desc      Range request 1024+513 formats as bytes=1024-1536.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1024;
      const length: number = 513;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=1024-1536');
      expect(end).assertEqual(1536);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0003
     * @tc.name      testSafeRange0003
     * @tc.desc      Range request 2048+514 formats as bytes=2048-2561.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 2048;
      const length: number = 514;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=2048-2561');
      expect(end).assertEqual(2561);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0004
     * @tc.name      testSafeRange0004
     * @tc.desc      Range request 3072+515 formats as bytes=3072-3586.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 3072;
      const length: number = 515;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=3072-3586');
      expect(end).assertEqual(3586);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0005
     * @tc.name      testSafeRange0005
     * @tc.desc      Range request 4096+516 formats as bytes=4096-4611.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 4096;
      const length: number = 516;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=4096-4611');
      expect(end).assertEqual(4611);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0006
     * @tc.name      testSafeRange0006
     * @tc.desc      Range request 5120+517 formats as bytes=5120-5636.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 5120;
      const length: number = 517;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=5120-5636');
      expect(end).assertEqual(5636);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0007
     * @tc.name      testSafeRange0007
     * @tc.desc      Range request 6144+518 formats as bytes=6144-6661.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 6144;
      const length: number = 518;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=6144-6661');
      expect(end).assertEqual(6661);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0008
     * @tc.name      testSafeRange0008
     * @tc.desc      Range request 7168+519 formats as bytes=7168-7686.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 7168;
      const length: number = 519;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=7168-7686');
      expect(end).assertEqual(7686);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0009
     * @tc.name      testSafeRange0009
     * @tc.desc      Range request 8192+520 formats as bytes=8192-8711.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 8192;
      const length: number = 520;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=8192-8711');
      expect(end).assertEqual(8711);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0010
     * @tc.name      testSafeRange0010
     * @tc.desc      Range request 9216+521 formats as bytes=9216-9736.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 9216;
      const length: number = 521;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=9216-9736');
      expect(end).assertEqual(9736);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0011
     * @tc.name      testSafeRange0011
     * @tc.desc      Range request 10240+522 formats as bytes=10240-10761.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 10240;
      const length: number = 522;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=10240-10761');
      expect(end).assertEqual(10761);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0012
     * @tc.name      testSafeRange0012
     * @tc.desc      Range request 11264+523 formats as bytes=11264-11786.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 11264;
      const length: number = 523;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=11264-11786');
      expect(end).assertEqual(11786);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0013
     * @tc.name      testSafeRange0013
     * @tc.desc      Range request 12288+524 formats as bytes=12288-12811.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 12288;
      const length: number = 524;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=12288-12811');
      expect(end).assertEqual(12811);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0014
     * @tc.name      testSafeRange0014
     * @tc.desc      Range request 13312+525 formats as bytes=13312-13836.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 13312;
      const length: number = 525;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=13312-13836');
      expect(end).assertEqual(13836);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0015
     * @tc.name      testSafeRange0015
     * @tc.desc      Range request 14336+526 formats as bytes=14336-14861.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 14336;
      const length: number = 526;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=14336-14861');
      expect(end).assertEqual(14861);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0016
     * @tc.name      testSafeRange0016
     * @tc.desc      Range request 15360+527 formats as bytes=15360-15886.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 15360;
      const length: number = 527;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=15360-15886');
      expect(end).assertEqual(15886);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0017
     * @tc.name      testSafeRange0017
     * @tc.desc      Range request 16384+528 formats as bytes=16384-16911.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 16384;
      const length: number = 528;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=16384-16911');
      expect(end).assertEqual(16911);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0018
     * @tc.name      testSafeRange0018
     * @tc.desc      Range request 17408+529 formats as bytes=17408-17936.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 17408;
      const length: number = 529;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=17408-17936');
      expect(end).assertEqual(17936);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0019
     * @tc.name      testSafeRange0019
     * @tc.desc      Range request 18432+530 formats as bytes=18432-18961.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 18432;
      const length: number = 530;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=18432-18961');
      expect(end).assertEqual(18961);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0020
     * @tc.name      testSafeRange0020
     * @tc.desc      Range request 19456+531 formats as bytes=19456-19986.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 19456;
      const length: number = 531;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=19456-19986');
      expect(end).assertEqual(19986);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0021
     * @tc.name      testSafeRange0021
     * @tc.desc      Range request 20480+532 formats as bytes=20480-21011.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 20480;
      const length: number = 532;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=20480-21011');
      expect(end).assertEqual(21011);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0022
     * @tc.name      testSafeRange0022
     * @tc.desc      Range request 21504+533 formats as bytes=21504-22036.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 21504;
      const length: number = 533;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=21504-22036');
      expect(end).assertEqual(22036);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0023
     * @tc.name      testSafeRange0023
     * @tc.desc      Range request 22528+534 formats as bytes=22528-23061.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 22528;
      const length: number = 534;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=22528-23061');
      expect(end).assertEqual(23061);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0024
     * @tc.name      testSafeRange0024
     * @tc.desc      Range request 23552+535 formats as bytes=23552-24086.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 23552;
      const length: number = 535;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=23552-24086');
      expect(end).assertEqual(24086);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0025
     * @tc.name      testSafeRange0025
     * @tc.desc      Range request 24576+536 formats as bytes=24576-25111.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 24576;
      const length: number = 536;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=24576-25111');
      expect(end).assertEqual(25111);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0026
     * @tc.name      testSafeRange0026
     * @tc.desc      Range request 25600+537 formats as bytes=25600-26136.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 25600;
      const length: number = 537;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=25600-26136');
      expect(end).assertEqual(26136);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0027
     * @tc.name      testSafeRange0027
     * @tc.desc      Range request 26624+538 formats as bytes=26624-27161.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 26624;
      const length: number = 538;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=26624-27161');
      expect(end).assertEqual(27161);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0028
     * @tc.name      testSafeRange0028
     * @tc.desc      Range request 27648+539 formats as bytes=27648-28186.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 27648;
      const length: number = 539;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=27648-28186');
      expect(end).assertEqual(28186);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0029
     * @tc.name      testSafeRange0029
     * @tc.desc      Range request 28672+540 formats as bytes=28672-29211.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 28672;
      const length: number = 540;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=28672-29211');
      expect(end).assertEqual(29211);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0030
     * @tc.name      testSafeRange0030
     * @tc.desc      Range request 29696+541 formats as bytes=29696-30236.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 29696;
      const length: number = 541;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=29696-30236');
      expect(end).assertEqual(30236);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0031
     * @tc.name      testSafeRange0031
     * @tc.desc      Range request 30720+542 formats as bytes=30720-31261.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 30720;
      const length: number = 542;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=30720-31261');
      expect(end).assertEqual(31261);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0032
     * @tc.name      testSafeRange0032
     * @tc.desc      Range request 31744+543 formats as bytes=31744-32286.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 31744;
      const length: number = 543;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=31744-32286');
      expect(end).assertEqual(32286);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0033
     * @tc.name      testSafeRange0033
     * @tc.desc      Range request 32768+544 formats as bytes=32768-33311.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 32768;
      const length: number = 544;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=32768-33311');
      expect(end).assertEqual(33311);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0034
     * @tc.name      testSafeRange0034
     * @tc.desc      Range request 33792+545 formats as bytes=33792-34336.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 33792;
      const length: number = 545;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=33792-34336');
      expect(end).assertEqual(34336);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0035
     * @tc.name      testSafeRange0035
     * @tc.desc      Range request 34816+546 formats as bytes=34816-35361.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 34816;
      const length: number = 546;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=34816-35361');
      expect(end).assertEqual(35361);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0036
     * @tc.name      testSafeRange0036
     * @tc.desc      Range request 35840+547 formats as bytes=35840-36386.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 35840;
      const length: number = 547;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=35840-36386');
      expect(end).assertEqual(36386);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0037
     * @tc.name      testSafeRange0037
     * @tc.desc      Range request 36864+548 formats as bytes=36864-37411.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 36864;
      const length: number = 548;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=36864-37411');
      expect(end).assertEqual(37411);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0038
     * @tc.name      testSafeRange0038
     * @tc.desc      Range request 37888+549 formats as bytes=37888-38436.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 37888;
      const length: number = 549;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=37888-38436');
      expect(end).assertEqual(38436);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0039
     * @tc.name      testSafeRange0039
     * @tc.desc      Range request 38912+550 formats as bytes=38912-39461.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 38912;
      const length: number = 550;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=38912-39461');
      expect(end).assertEqual(39461);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0040
     * @tc.name      testSafeRange0040
     * @tc.desc      Range request 39936+551 formats as bytes=39936-40486.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 39936;
      const length: number = 551;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=39936-40486');
      expect(end).assertEqual(40486);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0041
     * @tc.name      testSafeRange0041
     * @tc.desc      Range request 40960+552 formats as bytes=40960-41511.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 40960;
      const length: number = 552;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=40960-41511');
      expect(end).assertEqual(41511);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0042
     * @tc.name      testSafeRange0042
     * @tc.desc      Range request 41984+553 formats as bytes=41984-42536.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 41984;
      const length: number = 553;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=41984-42536');
      expect(end).assertEqual(42536);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0043
     * @tc.name      testSafeRange0043
     * @tc.desc      Range request 43008+554 formats as bytes=43008-43561.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 43008;
      const length: number = 554;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=43008-43561');
      expect(end).assertEqual(43561);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0044
     * @tc.name      testSafeRange0044
     * @tc.desc      Range request 44032+555 formats as bytes=44032-44586.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 44032;
      const length: number = 555;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=44032-44586');
      expect(end).assertEqual(44586);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0045
     * @tc.name      testSafeRange0045
     * @tc.desc      Range request 45056+556 formats as bytes=45056-45611.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 45056;
      const length: number = 556;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=45056-45611');
      expect(end).assertEqual(45611);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0046
     * @tc.name      testSafeRange0046
     * @tc.desc      Range request 46080+557 formats as bytes=46080-46636.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 46080;
      const length: number = 557;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=46080-46636');
      expect(end).assertEqual(46636);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0047
     * @tc.name      testSafeRange0047
     * @tc.desc      Range request 47104+558 formats as bytes=47104-47661.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 47104;
      const length: number = 558;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=47104-47661');
      expect(end).assertEqual(47661);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0048
     * @tc.name      testSafeRange0048
     * @tc.desc      Range request 48128+559 formats as bytes=48128-48686.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 48128;
      const length: number = 559;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=48128-48686');
      expect(end).assertEqual(48686);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0049
     * @tc.name      testSafeRange0049
     * @tc.desc      Range request 49152+560 formats as bytes=49152-49711.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 49152;
      const length: number = 560;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=49152-49711');
      expect(end).assertEqual(49711);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0050
     * @tc.name      testSafeRange0050
     * @tc.desc      Range request 50176+561 formats as bytes=50176-50736.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 50176;
      const length: number = 561;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=50176-50736');
      expect(end).assertEqual(50736);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0051
     * @tc.name      testSafeRange0051
     * @tc.desc      Range request 51200+562 formats as bytes=51200-51761.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 51200;
      const length: number = 562;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=51200-51761');
      expect(end).assertEqual(51761);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0052
     * @tc.name      testSafeRange0052
     * @tc.desc      Range request 52224+563 formats as bytes=52224-52786.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 52224;
      const length: number = 563;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=52224-52786');
      expect(end).assertEqual(52786);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0053
     * @tc.name      testSafeRange0053
     * @tc.desc      Range request 53248+564 formats as bytes=53248-53811.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 53248;
      const length: number = 564;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=53248-53811');
      expect(end).assertEqual(53811);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0054
     * @tc.name      testSafeRange0054
     * @tc.desc      Range request 54272+565 formats as bytes=54272-54836.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 54272;
      const length: number = 565;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=54272-54836');
      expect(end).assertEqual(54836);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0055
     * @tc.name      testSafeRange0055
     * @tc.desc      Range request 55296+566 formats as bytes=55296-55861.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 55296;
      const length: number = 566;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=55296-55861');
      expect(end).assertEqual(55861);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0056
     * @tc.name      testSafeRange0056
     * @tc.desc      Range request 56320+567 formats as bytes=56320-56886.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 56320;
      const length: number = 567;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=56320-56886');
      expect(end).assertEqual(56886);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0057
     * @tc.name      testSafeRange0057
     * @tc.desc      Range request 57344+568 formats as bytes=57344-57911.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 57344;
      const length: number = 568;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=57344-57911');
      expect(end).assertEqual(57911);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0058
     * @tc.name      testSafeRange0058
     * @tc.desc      Range request 58368+569 formats as bytes=58368-58936.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 58368;
      const length: number = 569;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=58368-58936');
      expect(end).assertEqual(58936);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0059
     * @tc.name      testSafeRange0059
     * @tc.desc      Range request 59392+570 formats as bytes=59392-59961.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 59392;
      const length: number = 570;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=59392-59961');
      expect(end).assertEqual(59961);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0060
     * @tc.name      testSafeRange0060
     * @tc.desc      Range request 60416+571 formats as bytes=60416-60986.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 60416;
      const length: number = 571;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=60416-60986');
      expect(end).assertEqual(60986);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0061
     * @tc.name      testSafeRange0061
     * @tc.desc      Range request 61440+572 formats as bytes=61440-62011.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 61440;
      const length: number = 572;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=61440-62011');
      expect(end).assertEqual(62011);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0062
     * @tc.name      testSafeRange0062
     * @tc.desc      Range request 62464+573 formats as bytes=62464-63036.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 62464;
      const length: number = 573;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=62464-63036');
      expect(end).assertEqual(63036);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0063
     * @tc.name      testSafeRange0063
     * @tc.desc      Range request 63488+574 formats as bytes=63488-64061.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 63488;
      const length: number = 574;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=63488-64061');
      expect(end).assertEqual(64061);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0064
     * @tc.name      testSafeRange0064
     * @tc.desc      Range request 64512+575 formats as bytes=64512-65086.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 64512;
      const length: number = 575;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=64512-65086');
      expect(end).assertEqual(65086);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0065
     * @tc.name      testSafeRange0065
     * @tc.desc      Range request 65536+576 formats as bytes=65536-66111.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 65536;
      const length: number = 576;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=65536-66111');
      expect(end).assertEqual(66111);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0066
     * @tc.name      testSafeRange0066
     * @tc.desc      Range request 66560+577 formats as bytes=66560-67136.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 66560;
      const length: number = 577;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=66560-67136');
      expect(end).assertEqual(67136);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0067
     * @tc.name      testSafeRange0067
     * @tc.desc      Range request 67584+578 formats as bytes=67584-68161.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 67584;
      const length: number = 578;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=67584-68161');
      expect(end).assertEqual(68161);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0068
     * @tc.name      testSafeRange0068
     * @tc.desc      Range request 68608+579 formats as bytes=68608-69186.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 68608;
      const length: number = 579;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=68608-69186');
      expect(end).assertEqual(69186);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0069
     * @tc.name      testSafeRange0069
     * @tc.desc      Range request 69632+580 formats as bytes=69632-70211.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 69632;
      const length: number = 580;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=69632-70211');
      expect(end).assertEqual(70211);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0070
     * @tc.name      testSafeRange0070
     * @tc.desc      Range request 70656+581 formats as bytes=70656-71236.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 70656;
      const length: number = 581;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=70656-71236');
      expect(end).assertEqual(71236);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0071
     * @tc.name      testSafeRange0071
     * @tc.desc      Range request 71680+582 formats as bytes=71680-72261.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 71680;
      const length: number = 582;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=71680-72261');
      expect(end).assertEqual(72261);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0072
     * @tc.name      testSafeRange0072
     * @tc.desc      Range request 72704+583 formats as bytes=72704-73286.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 72704;
      const length: number = 583;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=72704-73286');
      expect(end).assertEqual(73286);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0073
     * @tc.name      testSafeRange0073
     * @tc.desc      Range request 73728+584 formats as bytes=73728-74311.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 73728;
      const length: number = 584;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=73728-74311');
      expect(end).assertEqual(74311);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0074
     * @tc.name      testSafeRange0074
     * @tc.desc      Range request 74752+585 formats as bytes=74752-75336.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 74752;
      const length: number = 585;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=74752-75336');
      expect(end).assertEqual(75336);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0075
     * @tc.name      testSafeRange0075
     * @tc.desc      Range request 75776+586 formats as bytes=75776-76361.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 75776;
      const length: number = 586;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=75776-76361');
      expect(end).assertEqual(76361);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0076
     * @tc.name      testSafeRange0076
     * @tc.desc      Range request 76800+587 formats as bytes=76800-77386.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 76800;
      const length: number = 587;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=76800-77386');
      expect(end).assertEqual(77386);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0077
     * @tc.name      testSafeRange0077
     * @tc.desc      Range request 77824+588 formats as bytes=77824-78411.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 77824;
      const length: number = 588;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=77824-78411');
      expect(end).assertEqual(78411);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0078
     * @tc.name      testSafeRange0078
     * @tc.desc      Range request 78848+589 formats as bytes=78848-79436.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 78848;
      const length: number = 589;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=78848-79436');
      expect(end).assertEqual(79436);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0079
     * @tc.name      testSafeRange0079
     * @tc.desc      Range request 79872+590 formats as bytes=79872-80461.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 79872;
      const length: number = 590;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=79872-80461');
      expect(end).assertEqual(80461);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0080
     * @tc.name      testSafeRange0080
     * @tc.desc      Range request 80896+591 formats as bytes=80896-81486.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 80896;
      const length: number = 591;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=80896-81486');
      expect(end).assertEqual(81486);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0081
     * @tc.name      testSafeRange0081
     * @tc.desc      Range request 81920+592 formats as bytes=81920-82511.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 81920;
      const length: number = 592;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=81920-82511');
      expect(end).assertEqual(82511);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0082
     * @tc.name      testSafeRange0082
     * @tc.desc      Range request 82944+593 formats as bytes=82944-83536.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 82944;
      const length: number = 593;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=82944-83536');
      expect(end).assertEqual(83536);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0083
     * @tc.name      testSafeRange0083
     * @tc.desc      Range request 83968+594 formats as bytes=83968-84561.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 83968;
      const length: number = 594;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=83968-84561');
      expect(end).assertEqual(84561);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0084
     * @tc.name      testSafeRange0084
     * @tc.desc      Range request 84992+595 formats as bytes=84992-85586.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 84992;
      const length: number = 595;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=84992-85586');
      expect(end).assertEqual(85586);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0085
     * @tc.name      testSafeRange0085
     * @tc.desc      Range request 86016+596 formats as bytes=86016-86611.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 86016;
      const length: number = 596;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=86016-86611');
      expect(end).assertEqual(86611);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0086
     * @tc.name      testSafeRange0086
     * @tc.desc      Range request 87040+597 formats as bytes=87040-87636.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 87040;
      const length: number = 597;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=87040-87636');
      expect(end).assertEqual(87636);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0087
     * @tc.name      testSafeRange0087
     * @tc.desc      Range request 88064+598 formats as bytes=88064-88661.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 88064;
      const length: number = 598;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=88064-88661');
      expect(end).assertEqual(88661);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0088
     * @tc.name      testSafeRange0088
     * @tc.desc      Range request 89088+599 formats as bytes=89088-89686.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 89088;
      const length: number = 599;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=89088-89686');
      expect(end).assertEqual(89686);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0089
     * @tc.name      testSafeRange0089
     * @tc.desc      Range request 90112+600 formats as bytes=90112-90711.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 90112;
      const length: number = 600;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=90112-90711');
      expect(end).assertEqual(90711);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0090
     * @tc.name      testSafeRange0090
     * @tc.desc      Range request 91136+601 formats as bytes=91136-91736.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 91136;
      const length: number = 601;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=91136-91736');
      expect(end).assertEqual(91736);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0091
     * @tc.name      testSafeRange0091
     * @tc.desc      Range request 92160+602 formats as bytes=92160-92761.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 92160;
      const length: number = 602;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=92160-92761');
      expect(end).assertEqual(92761);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0092
     * @tc.name      testSafeRange0092
     * @tc.desc      Range request 93184+603 formats as bytes=93184-93786.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 93184;
      const length: number = 603;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=93184-93786');
      expect(end).assertEqual(93786);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0093
     * @tc.name      testSafeRange0093
     * @tc.desc      Range request 94208+604 formats as bytes=94208-94811.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 94208;
      const length: number = 604;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=94208-94811');
      expect(end).assertEqual(94811);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0094
     * @tc.name      testSafeRange0094
     * @tc.desc      Range request 95232+605 formats as bytes=95232-95836.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 95232;
      const length: number = 605;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=95232-95836');
      expect(end).assertEqual(95836);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0095
     * @tc.name      testSafeRange0095
     * @tc.desc      Range request 96256+606 formats as bytes=96256-96861.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 96256;
      const length: number = 606;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=96256-96861');
      expect(end).assertEqual(96861);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0096
     * @tc.name      testSafeRange0096
     * @tc.desc      Range request 97280+607 formats as bytes=97280-97886.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 97280;
      const length: number = 607;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=97280-97886');
      expect(end).assertEqual(97886);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0097
     * @tc.name      testSafeRange0097
     * @tc.desc      Range request 98304+608 formats as bytes=98304-98911.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 98304;
      const length: number = 608;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=98304-98911');
      expect(end).assertEqual(98911);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0098
     * @tc.name      testSafeRange0098
     * @tc.desc      Range request 99328+609 formats as bytes=99328-99936.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 99328;
      const length: number = 609;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=99328-99936');
      expect(end).assertEqual(99936);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0099
     * @tc.name      testSafeRange0099
     * @tc.desc      Range request 100352+610 formats as bytes=100352-100961.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 100352;
      const length: number = 610;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=100352-100961');
      expect(end).assertEqual(100961);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RNG_0100
     * @tc.name      testSafeRange0100
     * @tc.desc      Range request 101376+611 formats as bytes=101376-101986.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRange0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 101376;
      const length: number = 611;
      const end: number = offset + length - 1;
      const header: string = `bytes=${offset}-${end}`;
      expect(header).assertEqual('bytes=101376-101986');
      expect(end).assertEqual(101986);
      expect(length).assertLarger(0);
    })
  })
}
