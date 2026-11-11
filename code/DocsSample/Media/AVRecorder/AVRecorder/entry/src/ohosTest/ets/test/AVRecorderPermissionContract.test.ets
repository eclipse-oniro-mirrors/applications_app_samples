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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_avRecorderPermissionContract]';
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
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function avRecorderPermissionContractTest(): void {
  describe('avRecorderPermissionContractTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0001
     * @tc.name      testExtRecPerm0000
     * @tc.desc      Permission contract ohos.permission.CAMERA audio=True video=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.CAMERA';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0002
     * @tc.name      testExtRecPerm0001
     * @tc.desc      Permission contract ohos.permission.MICROPHONE audio=False video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.MICROPHONE';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0003
     * @tc.name      testExtRecPerm0002
     * @tc.desc      Permission contract ohos.permission.WRITE_MEDIA audio=True video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.WRITE_MEDIA';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0004
     * @tc.name      testExtRecPerm0003
     * @tc.desc      Permission contract ohos.permission.READ_MEDIA audio=False video=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.READ_MEDIA';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0005
     * @tc.name      testExtRecPerm0004
     * @tc.desc      Permission contract ohos.permission.MEDIA_LOCATION audio=True video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.MEDIA_LOCATION';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0006
     * @tc.name      testExtRecPerm0005
     * @tc.desc      Permission contract ohos.permission.APPROXIMATELY_LOCATION audio=False video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.APPROXIMATELY_LOCATION';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0007
     * @tc.name      testExtRecPerm0006
     * @tc.desc      Permission contract ohos.permission.CAMERA audio=True video=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.CAMERA';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0008
     * @tc.name      testExtRecPerm0007
     * @tc.desc      Permission contract ohos.permission.MICROPHONE audio=False video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.MICROPHONE';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0009
     * @tc.name      testExtRecPerm0008
     * @tc.desc      Permission contract ohos.permission.WRITE_MEDIA audio=True video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.WRITE_MEDIA';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0010
     * @tc.name      testExtRecPerm0009
     * @tc.desc      Permission contract ohos.permission.READ_MEDIA audio=False video=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.READ_MEDIA';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0011
     * @tc.name      testExtRecPerm0010
     * @tc.desc      Permission contract ohos.permission.MEDIA_LOCATION audio=True video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.MEDIA_LOCATION';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0012
     * @tc.name      testExtRecPerm0011
     * @tc.desc      Permission contract ohos.permission.APPROXIMATELY_LOCATION audio=False video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.APPROXIMATELY_LOCATION';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0013
     * @tc.name      testExtRecPerm0012
     * @tc.desc      Permission contract ohos.permission.CAMERA audio=True video=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.CAMERA';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0014
     * @tc.name      testExtRecPerm0013
     * @tc.desc      Permission contract ohos.permission.MICROPHONE audio=False video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.MICROPHONE';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0015
     * @tc.name      testExtRecPerm0014
     * @tc.desc      Permission contract ohos.permission.WRITE_MEDIA audio=True video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.WRITE_MEDIA';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0016
     * @tc.name      testExtRecPerm0015
     * @tc.desc      Permission contract ohos.permission.READ_MEDIA audio=False video=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.READ_MEDIA';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0017
     * @tc.name      testExtRecPerm0016
     * @tc.desc      Permission contract ohos.permission.MEDIA_LOCATION audio=True video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.MEDIA_LOCATION';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0018
     * @tc.name      testExtRecPerm0017
     * @tc.desc      Permission contract ohos.permission.APPROXIMATELY_LOCATION audio=False video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.APPROXIMATELY_LOCATION';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0019
     * @tc.name      testExtRecPerm0018
     * @tc.desc      Permission contract ohos.permission.CAMERA audio=True video=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.CAMERA';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0020
     * @tc.name      testExtRecPerm0019
     * @tc.desc      Permission contract ohos.permission.MICROPHONE audio=False video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.MICROPHONE';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0021
     * @tc.name      testExtRecPerm0020
     * @tc.desc      Permission contract ohos.permission.WRITE_MEDIA audio=True video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.WRITE_MEDIA';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0022
     * @tc.name      testExtRecPerm0021
     * @tc.desc      Permission contract ohos.permission.READ_MEDIA audio=False video=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.READ_MEDIA';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0023
     * @tc.name      testExtRecPerm0022
     * @tc.desc      Permission contract ohos.permission.MEDIA_LOCATION audio=True video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.MEDIA_LOCATION';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0024
     * @tc.name      testExtRecPerm0023
     * @tc.desc      Permission contract ohos.permission.APPROXIMATELY_LOCATION audio=False video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.APPROXIMATELY_LOCATION';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0025
     * @tc.name      testExtRecPerm0024
     * @tc.desc      Permission contract ohos.permission.CAMERA audio=True video=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.CAMERA';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0026
     * @tc.name      testExtRecPerm0025
     * @tc.desc      Permission contract ohos.permission.MICROPHONE audio=False video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.MICROPHONE';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0027
     * @tc.name      testExtRecPerm0026
     * @tc.desc      Permission contract ohos.permission.WRITE_MEDIA audio=True video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.WRITE_MEDIA';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0028
     * @tc.name      testExtRecPerm0027
     * @tc.desc      Permission contract ohos.permission.READ_MEDIA audio=False video=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.READ_MEDIA';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0029
     * @tc.name      testExtRecPerm0028
     * @tc.desc      Permission contract ohos.permission.MEDIA_LOCATION audio=True video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.MEDIA_LOCATION';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0030
     * @tc.name      testExtRecPerm0029
     * @tc.desc      Permission contract ohos.permission.APPROXIMATELY_LOCATION audio=False video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.APPROXIMATELY_LOCATION';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0031
     * @tc.name      testExtRecPerm0030
     * @tc.desc      Permission contract ohos.permission.CAMERA audio=True video=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.CAMERA';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0032
     * @tc.name      testExtRecPerm0031
     * @tc.desc      Permission contract ohos.permission.MICROPHONE audio=False video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.MICROPHONE';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0033
     * @tc.name      testExtRecPerm0032
     * @tc.desc      Permission contract ohos.permission.WRITE_MEDIA audio=True video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.WRITE_MEDIA';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0034
     * @tc.name      testExtRecPerm0033
     * @tc.desc      Permission contract ohos.permission.READ_MEDIA audio=False video=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.READ_MEDIA';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0035
     * @tc.name      testExtRecPerm0034
     * @tc.desc      Permission contract ohos.permission.MEDIA_LOCATION audio=True video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.MEDIA_LOCATION';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0036
     * @tc.name      testExtRecPerm0035
     * @tc.desc      Permission contract ohos.permission.APPROXIMATELY_LOCATION audio=False video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.APPROXIMATELY_LOCATION';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0037
     * @tc.name      testExtRecPerm0036
     * @tc.desc      Permission contract ohos.permission.CAMERA audio=True video=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.CAMERA';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0038
     * @tc.name      testExtRecPerm0037
     * @tc.desc      Permission contract ohos.permission.MICROPHONE audio=False video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.MICROPHONE';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0039
     * @tc.name      testExtRecPerm0038
     * @tc.desc      Permission contract ohos.permission.WRITE_MEDIA audio=True video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.WRITE_MEDIA';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0040
     * @tc.name      testExtRecPerm0039
     * @tc.desc      Permission contract ohos.permission.READ_MEDIA audio=False video=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.READ_MEDIA';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0041
     * @tc.name      testExtRecPerm0040
     * @tc.desc      Permission contract ohos.permission.MEDIA_LOCATION audio=True video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.MEDIA_LOCATION';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0042
     * @tc.name      testExtRecPerm0041
     * @tc.desc      Permission contract ohos.permission.APPROXIMATELY_LOCATION audio=False video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.APPROXIMATELY_LOCATION';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0043
     * @tc.name      testExtRecPerm0042
     * @tc.desc      Permission contract ohos.permission.CAMERA audio=True video=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.CAMERA';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0044
     * @tc.name      testExtRecPerm0043
     * @tc.desc      Permission contract ohos.permission.MICROPHONE audio=False video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.MICROPHONE';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0045
     * @tc.name      testExtRecPerm0044
     * @tc.desc      Permission contract ohos.permission.WRITE_MEDIA audio=True video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.WRITE_MEDIA';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0046
     * @tc.name      testExtRecPerm0045
     * @tc.desc      Permission contract ohos.permission.READ_MEDIA audio=False video=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.READ_MEDIA';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0047
     * @tc.name      testExtRecPerm0046
     * @tc.desc      Permission contract ohos.permission.MEDIA_LOCATION audio=True video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.MEDIA_LOCATION';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0048
     * @tc.name      testExtRecPerm0047
     * @tc.desc      Permission contract ohos.permission.APPROXIMATELY_LOCATION audio=False video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.APPROXIMATELY_LOCATION';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0049
     * @tc.name      testExtRecPerm0048
     * @tc.desc      Permission contract ohos.permission.CAMERA audio=True video=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.CAMERA';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0050
     * @tc.name      testExtRecPerm0049
     * @tc.desc      Permission contract ohos.permission.MICROPHONE audio=False video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.MICROPHONE';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0051
     * @tc.name      testExtRecPerm0050
     * @tc.desc      Permission contract ohos.permission.WRITE_MEDIA audio=True video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.WRITE_MEDIA';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0052
     * @tc.name      testExtRecPerm0051
     * @tc.desc      Permission contract ohos.permission.READ_MEDIA audio=False video=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.READ_MEDIA';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0053
     * @tc.name      testExtRecPerm0052
     * @tc.desc      Permission contract ohos.permission.MEDIA_LOCATION audio=True video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.MEDIA_LOCATION';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0054
     * @tc.name      testExtRecPerm0053
     * @tc.desc      Permission contract ohos.permission.APPROXIMATELY_LOCATION audio=False video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.APPROXIMATELY_LOCATION';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0055
     * @tc.name      testExtRecPerm0054
     * @tc.desc      Permission contract ohos.permission.CAMERA audio=True video=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.CAMERA';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0056
     * @tc.name      testExtRecPerm0055
     * @tc.desc      Permission contract ohos.permission.MICROPHONE audio=False video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.MICROPHONE';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0057
     * @tc.name      testExtRecPerm0056
     * @tc.desc      Permission contract ohos.permission.WRITE_MEDIA audio=True video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.WRITE_MEDIA';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0058
     * @tc.name      testExtRecPerm0057
     * @tc.desc      Permission contract ohos.permission.READ_MEDIA audio=False video=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.READ_MEDIA';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0059
     * @tc.name      testExtRecPerm0058
     * @tc.desc      Permission contract ohos.permission.MEDIA_LOCATION audio=True video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.MEDIA_LOCATION';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PERMISSION_0060
     * @tc.name      testExtRecPerm0059
     * @tc.desc      Permission contract ohos.permission.APPROXIMATELY_LOCATION audio=False video=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPerm0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: string[] = ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'];
      const permission: string = 'ohos.permission.APPROXIMATELY_LOCATION';
      expect(permissions.indexOf(permission) >= 0).assertTrue();
      expect(permissions.length).assertEqual(6);
      expect(permissions.indexOf('ohos.permission.MICROPHONE') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
      expect(permissions.indexOf('ohos.permission.WRITE_MEDIA') >= 0).assertTrue();
    })
  });
}
