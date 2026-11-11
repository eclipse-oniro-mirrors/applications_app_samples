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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeAll, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';

const delegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;

const TAG: string = '[Sample_MediaSourceRawFdContract]';
const DOMAIN: number = 0xF811;

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

interface ExpectAssert {
  assertEqual(expectValue: string | number | boolean | Object | null | undefined): void;
  assertTrue(): void;
  assertFalse(): void;
  assertLarger(expectValue: number): void;
  assertLargerOrEqual(expectValue: number): void;
  assertLess(expectValue: number): void;
  assertLessOrEqual(expectValue: number): void;
  assertClose(expectValue: number, precision: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function mediaSourceRawFdContractTest(): void {
  describe('mediaSourceRawFdContractTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    beforeAll(async () => {
      const want: Want = { bundleName: bundleName, abilityName: 'EntryAbility' };
      await delegator.startAbility(want);
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 3000);
      });
    })

    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RAWFd_0001
     * @tc.name      testExtRawFd0000
     * @tc.desc      Rawfile test1.mp4 opens with a valid descriptor.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRawFd0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const descriptor = await ability.context.resourceManager.getRawFd('test1.mp4');
      expect(descriptor.fd).assertLargerOrEqual(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.fd).assertLargerOrEqual(0);
      await ability.context.resourceManager.closeRawFd('test1.mp4');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RAWFd_0002
     * @tc.name      testExtRawFd0001
     * @tc.desc      Rawfile test_01.mp3 opens with a valid descriptor.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRawFd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const descriptor = await ability.context.resourceManager.getRawFd('test_01.mp3');
      expect(descriptor.fd).assertLargerOrEqual(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.fd).assertLargerOrEqual(0);
      await ability.context.resourceManager.closeRawFd('test_01.mp3');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RAWFd_0003
     * @tc.name      testExtRawFd0002
     * @tc.desc      Rawfile test.m3u8 opens with a valid descriptor.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRawFd0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const descriptor = await ability.context.resourceManager.getRawFd('test.m3u8');
      expect(descriptor.fd).assertLargerOrEqual(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.fd).assertLargerOrEqual(0);
      await ability.context.resourceManager.closeRawFd('test.m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RAWFd_0004
     * @tc.name      testExtRawFd0003
     * @tc.desc      Rawfile test1.mp4 opens with a valid descriptor.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRawFd0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const descriptor = await ability.context.resourceManager.getRawFd('test1.mp4');
      expect(descriptor.fd).assertLargerOrEqual(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      await ability.context.resourceManager.closeRawFd('test1.mp4');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RAWFd_0005
     * @tc.name      testExtRawFd0004
     * @tc.desc      Rawfile test_01.mp3 opens with a valid descriptor.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRawFd0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const descriptor = await ability.context.resourceManager.getRawFd('test_01.mp3');
      expect(descriptor.fd).assertLargerOrEqual(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      await ability.context.resourceManager.closeRawFd('test_01.mp3');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RAWFd_0006
     * @tc.name      testExtRawFd0005
     * @tc.desc      Rawfile test.m3u8 opens with a valid descriptor.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRawFd0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const descriptor = await ability.context.resourceManager.getRawFd('test.m3u8');
      expect(descriptor.fd).assertLargerOrEqual(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      await ability.context.resourceManager.closeRawFd('test.m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RAWFd_0007
     * @tc.name      testExtRawFd0006
     * @tc.desc      Rawfile test1.mp4 opens with a valid descriptor.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRawFd0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const descriptor = await ability.context.resourceManager.getRawFd('test1.mp4');
      expect(descriptor.fd).assertLargerOrEqual(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.length).assertEqual(21780300);
      await ability.context.resourceManager.closeRawFd('test1.mp4');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RAWFd_0008
     * @tc.name      testExtRawFd0007
     * @tc.desc      Rawfile test_01.mp3 opens with a valid descriptor.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRawFd0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const descriptor = await ability.context.resourceManager.getRawFd('test_01.mp3');
      expect(descriptor.fd).assertLargerOrEqual(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.length).assertEqual(1757305);
      await ability.context.resourceManager.closeRawFd('test_01.mp3');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RAWFd_0009
     * @tc.name      testExtRawFd0008
     * @tc.desc      Rawfile test.m3u8 opens with a valid descriptor.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRawFd0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const descriptor = await ability.context.resourceManager.getRawFd('test.m3u8');
      expect(descriptor.fd).assertLargerOrEqual(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.length).assertEqual(1086);
      await ability.context.resourceManager.closeRawFd('test.m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RAWFd_0010
     * @tc.name      testExtRawFd0009
     * @tc.desc      Rawfile test1.mp4 opens with a valid descriptor.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRawFd0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const descriptor = await ability.context.resourceManager.getRawFd('test1.mp4');
      expect(descriptor.fd).assertLargerOrEqual(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertLarger(0);
      await ability.context.resourceManager.closeRawFd('test1.mp4');
      const reopened = await ability.context.resourceManager.getRawFd('test1.mp4');
      expect(reopened.fd).assertLargerOrEqual(0);
      expect(reopened.length).assertEqual(21780300);
      await ability.context.resourceManager.closeRawFd('test1.mp4');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RAWFd_0011
     * @tc.name      testExtRawFd0010
     * @tc.desc      Rawfile test_01.mp3 opens with a valid descriptor.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRawFd0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const descriptor = await ability.context.resourceManager.getRawFd('test_01.mp3');
      expect(descriptor.fd).assertLargerOrEqual(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertLarger(0);
      await ability.context.resourceManager.closeRawFd('test_01.mp3');
      const reopened = await ability.context.resourceManager.getRawFd('test_01.mp3');
      expect(reopened.fd).assertLargerOrEqual(0);
      expect(reopened.length).assertEqual(1757305);
      await ability.context.resourceManager.closeRawFd('test_01.mp3');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RAWFd_0012
     * @tc.name      testExtRawFd0011
     * @tc.desc      Rawfile test.m3u8 opens with a valid descriptor.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRawFd0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const descriptor = await ability.context.resourceManager.getRawFd('test.m3u8');
      expect(descriptor.fd).assertLargerOrEqual(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertLarger(0);
      await ability.context.resourceManager.closeRawFd('test.m3u8');
      const reopened = await ability.context.resourceManager.getRawFd('test.m3u8');
      expect(reopened.fd).assertLargerOrEqual(0);
      expect(reopened.length).assertEqual(1086);
      await ability.context.resourceManager.closeRawFd('test.m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RAWFd_0013
     * @tc.name      testExtRawFd0012
     * @tc.desc      Rawfile test1.mp4 opens with a valid descriptor.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRawFd0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const descriptor = await ability.context.resourceManager.getRawFd('test1.mp4');
      expect(descriptor.fd).assertLargerOrEqual(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.length).assertLarger(0);
      await ability.context.resourceManager.closeRawFd('test1.mp4');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RAWFd_0014
     * @tc.name      testExtRawFd0013
     * @tc.desc      Rawfile test_01.mp3 opens with a valid descriptor.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRawFd0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const descriptor = await ability.context.resourceManager.getRawFd('test_01.mp3');
      expect(descriptor.fd).assertLargerOrEqual(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.length).assertLarger(0);
      await ability.context.resourceManager.closeRawFd('test_01.mp3');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RAWFd_0015
     * @tc.name      testExtRawFd0014
     * @tc.desc      Rawfile test.m3u8 opens with a valid descriptor.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRawFd0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const descriptor = await ability.context.resourceManager.getRawFd('test.m3u8');
      expect(descriptor.fd).assertLargerOrEqual(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.length).assertLarger(0);
      await ability.context.resourceManager.closeRawFd('test.m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RAWFd_0016
     * @tc.name      testExtRawFd0015
     * @tc.desc      Rawfile test1.mp4 opens with a valid descriptor.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRawFd0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const descriptor = await ability.context.resourceManager.getRawFd('test1.mp4');
      expect(descriptor.fd).assertLargerOrEqual(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.fd).assertLargerOrEqual(0);
      await ability.context.resourceManager.closeRawFd('test1.mp4');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RAWFd_0017
     * @tc.name      testExtRawFd0016
     * @tc.desc      Rawfile test_01.mp3 opens with a valid descriptor.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRawFd0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const descriptor = await ability.context.resourceManager.getRawFd('test_01.mp3');
      expect(descriptor.fd).assertLargerOrEqual(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.fd).assertLargerOrEqual(0);
      await ability.context.resourceManager.closeRawFd('test_01.mp3');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RAWFd_0018
     * @tc.name      testExtRawFd0017
     * @tc.desc      Rawfile test.m3u8 opens with a valid descriptor.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRawFd0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const descriptor = await ability.context.resourceManager.getRawFd('test.m3u8');
      expect(descriptor.fd).assertLargerOrEqual(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.fd).assertLargerOrEqual(0);
      await ability.context.resourceManager.closeRawFd('test.m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RAWFd_0019
     * @tc.name      testExtRawFd0018
     * @tc.desc      Rawfile test1.mp4 opens with a valid descriptor.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRawFd0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const descriptor = await ability.context.resourceManager.getRawFd('test1.mp4');
      expect(descriptor.fd).assertLargerOrEqual(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      await ability.context.resourceManager.closeRawFd('test1.mp4');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RAWFd_0020
     * @tc.name      testExtRawFd0019
     * @tc.desc      Rawfile test_01.mp3 opens with a valid descriptor.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRawFd0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const descriptor = await ability.context.resourceManager.getRawFd('test_01.mp3');
      expect(descriptor.fd).assertLargerOrEqual(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      await ability.context.resourceManager.closeRawFd('test_01.mp3');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RAWFd_0021
     * @tc.name      testExtRawFd0020
     * @tc.desc      Rawfile test.m3u8 opens with a valid descriptor.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRawFd0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const descriptor = await ability.context.resourceManager.getRawFd('test.m3u8');
      expect(descriptor.fd).assertLargerOrEqual(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      await ability.context.resourceManager.closeRawFd('test.m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RAWFd_0022
     * @tc.name      testExtRawFd0021
     * @tc.desc      Rawfile test1.mp4 opens with a valid descriptor.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRawFd0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const descriptor = await ability.context.resourceManager.getRawFd('test1.mp4');
      expect(descriptor.fd).assertLargerOrEqual(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.length).assertEqual(21780300);
      await ability.context.resourceManager.closeRawFd('test1.mp4');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RAWFd_0023
     * @tc.name      testExtRawFd0022
     * @tc.desc      Rawfile test_01.mp3 opens with a valid descriptor.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRawFd0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const descriptor = await ability.context.resourceManager.getRawFd('test_01.mp3');
      expect(descriptor.fd).assertLargerOrEqual(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.length).assertEqual(1757305);
      await ability.context.resourceManager.closeRawFd('test_01.mp3');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RAWFd_0024
     * @tc.name      testExtRawFd0023
     * @tc.desc      Rawfile test.m3u8 opens with a valid descriptor.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRawFd0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const descriptor = await ability.context.resourceManager.getRawFd('test.m3u8');
      expect(descriptor.fd).assertLargerOrEqual(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.length).assertEqual(1086);
      await ability.context.resourceManager.closeRawFd('test.m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RAWFd_0025
     * @tc.name      testExtRawFd0024
     * @tc.desc      Rawfile test1.mp4 opens with a valid descriptor.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRawFd0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const descriptor = await ability.context.resourceManager.getRawFd('test1.mp4');
      expect(descriptor.fd).assertLargerOrEqual(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertLarger(0);
      await ability.context.resourceManager.closeRawFd('test1.mp4');
      const reopened = await ability.context.resourceManager.getRawFd('test1.mp4');
      expect(reopened.fd).assertLargerOrEqual(0);
      expect(reopened.length).assertEqual(21780300);
      await ability.context.resourceManager.closeRawFd('test1.mp4');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RAWFd_0026
     * @tc.name      testExtRawFd0025
     * @tc.desc      Rawfile test_01.mp3 opens with a valid descriptor.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRawFd0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const descriptor = await ability.context.resourceManager.getRawFd('test_01.mp3');
      expect(descriptor.fd).assertLargerOrEqual(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertLarger(0);
      await ability.context.resourceManager.closeRawFd('test_01.mp3');
      const reopened = await ability.context.resourceManager.getRawFd('test_01.mp3');
      expect(reopened.fd).assertLargerOrEqual(0);
      expect(reopened.length).assertEqual(1757305);
      await ability.context.resourceManager.closeRawFd('test_01.mp3');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RAWFd_0027
     * @tc.name      testExtRawFd0026
     * @tc.desc      Rawfile test.m3u8 opens with a valid descriptor.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRawFd0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const descriptor = await ability.context.resourceManager.getRawFd('test.m3u8');
      expect(descriptor.fd).assertLargerOrEqual(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertLarger(0);
      await ability.context.resourceManager.closeRawFd('test.m3u8');
      const reopened = await ability.context.resourceManager.getRawFd('test.m3u8');
      expect(reopened.fd).assertLargerOrEqual(0);
      expect(reopened.length).assertEqual(1086);
      await ability.context.resourceManager.closeRawFd('test.m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RAWFd_0028
     * @tc.name      testExtRawFd0027
     * @tc.desc      Rawfile test1.mp4 opens with a valid descriptor.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRawFd0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const descriptor = await ability.context.resourceManager.getRawFd('test1.mp4');
      expect(descriptor.fd).assertLargerOrEqual(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.length).assertLarger(0);
      await ability.context.resourceManager.closeRawFd('test1.mp4');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RAWFd_0029
     * @tc.name      testExtRawFd0028
     * @tc.desc      Rawfile test_01.mp3 opens with a valid descriptor.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRawFd0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const descriptor = await ability.context.resourceManager.getRawFd('test_01.mp3');
      expect(descriptor.fd).assertLargerOrEqual(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.length).assertLarger(0);
      await ability.context.resourceManager.closeRawFd('test_01.mp3');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_RAWFd_0030
     * @tc.name      testExtRawFd0029
     * @tc.desc      Rawfile test.m3u8 opens with a valid descriptor.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRawFd0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const descriptor = await ability.context.resourceManager.getRawFd('test.m3u8');
      expect(descriptor.fd).assertLargerOrEqual(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.length).assertLarger(0);
      await ability.context.resourceManager.closeRawFd('test.m3u8');
    })
  });
}
