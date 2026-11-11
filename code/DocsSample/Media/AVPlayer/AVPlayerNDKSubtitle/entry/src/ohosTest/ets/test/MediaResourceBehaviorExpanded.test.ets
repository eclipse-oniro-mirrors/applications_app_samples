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
import { describe, beforeAll, it as hypiumIt, expect as hypiumExpect, TestType, Size, Level, Assert } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { application, common } from '@kit.AbilityKit';

interface RawDescriptor {
  fd: number;
  offset: number;
  length: number;
}

let moduleContext: common.Context | null = null;
let cachedVideo: Uint8Array | null = null;
let cachedSubtitle: Uint8Array | null = null;

function ensureContext(): common.Context {
  return moduleContext as common.Context;
}

function videoFd(): RawDescriptor {
  const raw = ensureContext().resourceManager.getRawFdSync('test1.mp4');
  return { fd: raw.fd, offset: raw.offset, length: raw.length };
}

function subtitleFd(): RawDescriptor {
  const raw = ensureContext().resourceManager.getRawFdSync('subtitle.srt');
  return { fd: raw.fd, offset: raw.offset, length: raw.length };
}

function videoBytes(): Uint8Array {
  if (cachedVideo === null) {
    cachedVideo = ensureContext().resourceManager.getRawFileContentSync('test1.mp4');
  }
  return cachedVideo as Uint8Array;
}

function subtitleBytes(): Uint8Array {
  if (cachedSubtitle === null) {
    cachedSubtitle = ensureContext().resourceManager.getRawFileContentSync('subtitle.srt');
  }
  return cachedSubtitle as Uint8Array;
}




const TAG: string = '[Sample_MediaResourceBehaviorExpanded]';
const DOMAIN: number = 0xF811;

function it(name: string, filter: number, func: () => void): void {
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
export default function mediaResourceBehaviorExpandedTest(): void {
  describe('mediaResourceBehaviorExpandedTest', () => {
  beforeAll(async () => {
    if (moduleContext === null) {
      moduleContext = await application.createModuleContext(
        abilityDelegatorRegistry.getAbilityDelegator().getAppContext().getApplicationContext(), 'entry');
    }
  });

    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0001
     * @tc.name      testBehaviorResource0001
     * @tc.desc      Raw video descriptor and content check 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const descriptor = videoFd();
      expect(descriptor.fd).assertLarger(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertEqual(21780300);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0002
     * @tc.name      testBehaviorResource0002
     * @tc.desc      Raw subtitle descriptor and content check 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const descriptor = subtitleFd();
      expect(descriptor.fd).assertLarger(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertEqual(682);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0003
     * @tc.name      testBehaviorResource0003
     * @tc.desc      Raw video descriptor and content check 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.length).assertLarger(0);
      expect(bytes.byteLength).assertEqual(bytes.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0004
     * @tc.name      testBehaviorResource0004
     * @tc.desc      Raw subtitle descriptor and content check 4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bytes: Uint8Array = subtitleBytes();
      expect(bytes.length).assertEqual(682);
      expect(bytes.length).assertLarger(0);
      expect(bytes.byteLength).assertEqual(bytes.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0005
     * @tc.name      testBehaviorResource0005
     * @tc.desc      Raw video descriptor and content check 5.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const descriptor = videoFd();
      expect(descriptor.fd).assertLarger(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.fd !== descriptor.offset).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0006
     * @tc.name      testBehaviorResource0006
     * @tc.desc      Raw subtitle descriptor and content check 6.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const descriptor = subtitleFd();
      expect(descriptor.fd).assertLarger(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.fd !== descriptor.offset).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0007
     * @tc.name      testBehaviorResource0007
     * @tc.desc      Raw video descriptor and content check 7.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertLarger(0);
      expect(bytes[0]).assertLargerOrEqual(0);
      expect(bytes[bytes.length - 1]).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0008
     * @tc.name      testBehaviorResource0008
     * @tc.desc      Raw subtitle descriptor and content check 8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bytes: Uint8Array = subtitleBytes();
      expect(bytes.length).assertLarger(0);
      expect(bytes[0]).assertLargerOrEqual(0);
      expect(bytes[bytes.length - 1]).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0009
     * @tc.name      testBehaviorResource0009
     * @tc.desc      Raw video descriptor and content check 9.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const descriptor = videoFd();
      const bytes: Uint8Array = videoBytes();
      expect(descriptor.length).assertEqual(bytes.length);
      expect(descriptor.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0010
     * @tc.name      testBehaviorResource0010
     * @tc.desc      Raw subtitle descriptor and content check 10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const descriptor = subtitleFd();
      const bytes: Uint8Array = subtitleBytes();
      expect(descriptor.length).assertEqual(bytes.length);
      expect(descriptor.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0011
     * @tc.name      testBehaviorResource0011
     * @tc.desc      Raw video descriptor and content check 11.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const descriptor = videoFd();
      expect(descriptor.fd).assertLarger(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertEqual(21780300);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0012
     * @tc.name      testBehaviorResource0012
     * @tc.desc      Raw subtitle descriptor and content check 12.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const descriptor = subtitleFd();
      expect(descriptor.fd).assertLarger(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertEqual(682);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0013
     * @tc.name      testBehaviorResource0013
     * @tc.desc      Raw video descriptor and content check 13.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.length).assertLarger(0);
      expect(bytes.byteLength).assertEqual(bytes.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0014
     * @tc.name      testBehaviorResource0014
     * @tc.desc      Raw subtitle descriptor and content check 14.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bytes: Uint8Array = subtitleBytes();
      expect(bytes.length).assertEqual(682);
      expect(bytes.length).assertLarger(0);
      expect(bytes.byteLength).assertEqual(bytes.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0015
     * @tc.name      testBehaviorResource0015
     * @tc.desc      Raw video descriptor and content check 15.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const descriptor = videoFd();
      expect(descriptor.fd).assertLarger(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.fd !== descriptor.offset).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0016
     * @tc.name      testBehaviorResource0016
     * @tc.desc      Raw subtitle descriptor and content check 16.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const descriptor = subtitleFd();
      expect(descriptor.fd).assertLarger(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.fd !== descriptor.offset).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0017
     * @tc.name      testBehaviorResource0017
     * @tc.desc      Raw video descriptor and content check 17.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertLarger(0);
      expect(bytes[0]).assertLargerOrEqual(0);
      expect(bytes[bytes.length - 1]).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0018
     * @tc.name      testBehaviorResource0018
     * @tc.desc      Raw subtitle descriptor and content check 18.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bytes: Uint8Array = subtitleBytes();
      expect(bytes.length).assertLarger(0);
      expect(bytes[0]).assertLargerOrEqual(0);
      expect(bytes[bytes.length - 1]).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0019
     * @tc.name      testBehaviorResource0019
     * @tc.desc      Raw video descriptor and content check 19.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const descriptor = videoFd();
      const bytes: Uint8Array = videoBytes();
      expect(descriptor.length).assertEqual(bytes.length);
      expect(descriptor.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0020
     * @tc.name      testBehaviorResource0020
     * @tc.desc      Raw subtitle descriptor and content check 20.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const descriptor = subtitleFd();
      const bytes: Uint8Array = subtitleBytes();
      expect(descriptor.length).assertEqual(bytes.length);
      expect(descriptor.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0021
     * @tc.name      testBehaviorResource0021
     * @tc.desc      Raw video descriptor and content check 21.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const descriptor = videoFd();
      expect(descriptor.fd).assertLarger(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertEqual(21780300);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0022
     * @tc.name      testBehaviorResource0022
     * @tc.desc      Raw subtitle descriptor and content check 22.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const descriptor = subtitleFd();
      expect(descriptor.fd).assertLarger(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertEqual(682);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0023
     * @tc.name      testBehaviorResource0023
     * @tc.desc      Raw video descriptor and content check 23.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.length).assertLarger(0);
      expect(bytes.byteLength).assertEqual(bytes.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0024
     * @tc.name      testBehaviorResource0024
     * @tc.desc      Raw subtitle descriptor and content check 24.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bytes: Uint8Array = subtitleBytes();
      expect(bytes.length).assertEqual(682);
      expect(bytes.length).assertLarger(0);
      expect(bytes.byteLength).assertEqual(bytes.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0025
     * @tc.name      testBehaviorResource0025
     * @tc.desc      Raw video descriptor and content check 25.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const descriptor = videoFd();
      expect(descriptor.fd).assertLarger(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.fd !== descriptor.offset).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0026
     * @tc.name      testBehaviorResource0026
     * @tc.desc      Raw subtitle descriptor and content check 26.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const descriptor = subtitleFd();
      expect(descriptor.fd).assertLarger(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.fd !== descriptor.offset).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0027
     * @tc.name      testBehaviorResource0027
     * @tc.desc      Raw video descriptor and content check 27.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertLarger(0);
      expect(bytes[0]).assertLargerOrEqual(0);
      expect(bytes[bytes.length - 1]).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0028
     * @tc.name      testBehaviorResource0028
     * @tc.desc      Raw subtitle descriptor and content check 28.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bytes: Uint8Array = subtitleBytes();
      expect(bytes.length).assertLarger(0);
      expect(bytes[0]).assertLargerOrEqual(0);
      expect(bytes[bytes.length - 1]).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0029
     * @tc.name      testBehaviorResource0029
     * @tc.desc      Raw video descriptor and content check 29.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const descriptor = videoFd();
      const bytes: Uint8Array = videoBytes();
      expect(descriptor.length).assertEqual(bytes.length);
      expect(descriptor.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0030
     * @tc.name      testBehaviorResource0030
     * @tc.desc      Raw subtitle descriptor and content check 30.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const descriptor = subtitleFd();
      const bytes: Uint8Array = subtitleBytes();
      expect(descriptor.length).assertEqual(bytes.length);
      expect(descriptor.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0031
     * @tc.name      testBehaviorResource0031
     * @tc.desc      Raw video descriptor and content check 31.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const descriptor = videoFd();
      expect(descriptor.fd).assertLarger(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertEqual(21780300);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0032
     * @tc.name      testBehaviorResource0032
     * @tc.desc      Raw subtitle descriptor and content check 32.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const descriptor = subtitleFd();
      expect(descriptor.fd).assertLarger(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertEqual(682);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0033
     * @tc.name      testBehaviorResource0033
     * @tc.desc      Raw video descriptor and content check 33.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.length).assertLarger(0);
      expect(bytes.byteLength).assertEqual(bytes.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0034
     * @tc.name      testBehaviorResource0034
     * @tc.desc      Raw subtitle descriptor and content check 34.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bytes: Uint8Array = subtitleBytes();
      expect(bytes.length).assertEqual(682);
      expect(bytes.length).assertLarger(0);
      expect(bytes.byteLength).assertEqual(bytes.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0035
     * @tc.name      testBehaviorResource0035
     * @tc.desc      Raw video descriptor and content check 35.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const descriptor = videoFd();
      expect(descriptor.fd).assertLarger(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.fd !== descriptor.offset).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0036
     * @tc.name      testBehaviorResource0036
     * @tc.desc      Raw subtitle descriptor and content check 36.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const descriptor = subtitleFd();
      expect(descriptor.fd).assertLarger(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.fd !== descriptor.offset).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0037
     * @tc.name      testBehaviorResource0037
     * @tc.desc      Raw video descriptor and content check 37.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertLarger(0);
      expect(bytes[0]).assertLargerOrEqual(0);
      expect(bytes[bytes.length - 1]).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0038
     * @tc.name      testBehaviorResource0038
     * @tc.desc      Raw subtitle descriptor and content check 38.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bytes: Uint8Array = subtitleBytes();
      expect(bytes.length).assertLarger(0);
      expect(bytes[0]).assertLargerOrEqual(0);
      expect(bytes[bytes.length - 1]).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0039
     * @tc.name      testBehaviorResource0039
     * @tc.desc      Raw video descriptor and content check 39.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const descriptor = videoFd();
      const bytes: Uint8Array = videoBytes();
      expect(descriptor.length).assertEqual(bytes.length);
      expect(descriptor.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0040
     * @tc.name      testBehaviorResource0040
     * @tc.desc      Raw subtitle descriptor and content check 40.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const descriptor = subtitleFd();
      const bytes: Uint8Array = subtitleBytes();
      expect(descriptor.length).assertEqual(bytes.length);
      expect(descriptor.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0041
     * @tc.name      testBehaviorResource0041
     * @tc.desc      Raw video descriptor and content check 41.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const descriptor = videoFd();
      expect(descriptor.fd).assertLarger(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertEqual(21780300);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0042
     * @tc.name      testBehaviorResource0042
     * @tc.desc      Raw subtitle descriptor and content check 42.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const descriptor = subtitleFd();
      expect(descriptor.fd).assertLarger(0);
      expect(descriptor.offset).assertLargerOrEqual(0);
      expect(descriptor.length).assertEqual(682);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0043
     * @tc.name      testBehaviorResource0043
     * @tc.desc      Raw video descriptor and content check 43.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.length).assertLarger(0);
      expect(bytes.byteLength).assertEqual(bytes.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0044
     * @tc.name      testBehaviorResource0044
     * @tc.desc      Raw subtitle descriptor and content check 44.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bytes: Uint8Array = subtitleBytes();
      expect(bytes.length).assertEqual(682);
      expect(bytes.length).assertLarger(0);
      expect(bytes.byteLength).assertEqual(bytes.length);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0045
     * @tc.name      testBehaviorResource0045
     * @tc.desc      Raw video descriptor and content check 45.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const descriptor = videoFd();
      expect(descriptor.fd).assertLarger(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.fd !== descriptor.offset).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0046
     * @tc.name      testBehaviorResource0046
     * @tc.desc      Raw subtitle descriptor and content check 46.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const descriptor = subtitleFd();
      expect(descriptor.fd).assertLarger(0);
      expect(descriptor.length).assertLarger(0);
      expect(descriptor.fd !== descriptor.offset).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0047
     * @tc.name      testBehaviorResource0047
     * @tc.desc      Raw video descriptor and content check 47.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertLarger(0);
      expect(bytes[0]).assertLargerOrEqual(0);
      expect(bytes[bytes.length - 1]).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0048
     * @tc.name      testBehaviorResource0048
     * @tc.desc      Raw subtitle descriptor and content check 48.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bytes: Uint8Array = subtitleBytes();
      expect(bytes.length).assertLarger(0);
      expect(bytes[0]).assertLargerOrEqual(0);
      expect(bytes[bytes.length - 1]).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0049
     * @tc.name      testBehaviorResource0049
     * @tc.desc      Raw video descriptor and content check 49.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const descriptor = videoFd();
      const bytes: Uint8Array = videoBytes();
      expect(descriptor.length).assertEqual(bytes.length);
      expect(descriptor.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_BEH_RES_0050
     * @tc.name      testBehaviorResource0050
     * @tc.desc      Raw subtitle descriptor and content check 50.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorResource0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const descriptor = subtitleFd();
      const bytes: Uint8Array = subtitleBytes();
      expect(descriptor.length).assertEqual(bytes.length);
      expect(descriptor.length).assertLarger(0);
    })
  })
}
