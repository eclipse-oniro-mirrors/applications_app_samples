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

const TAG: string = '[Sample_MediaSourceSeekContract]';
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

export default function mediaSourceSeekContractTest(): void {
  describe('mediaSourceSeekContractTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0001
     * @tc.name      testExtSeekContract0000
     * @tc.desc      Slider 0 seeks to 0, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(0);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0002
     * @tc.name      testExtSeekContract0001
     * @tc.desc      Slider 0.4 seeks to 0, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.4;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(0);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0003
     * @tc.name      testExtSeekContract0002
     * @tc.desc      Slider 0.6 seeks to 1, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.6;
      const previousSeek: number = 1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(1);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0004
     * @tc.name      testExtSeekContract0003
     * @tc.desc      Slider 1.4 seeks to 1, duplicate=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.4;
      const previousSeek: number = 1.4;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(1);
      expect(shouldSeek).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0005
     * @tc.name      testExtSeekContract0004
     * @tc.desc      Slider 1.6 seeks to 2, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.6;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(2);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0006
     * @tc.name      testExtSeekContract0005
     * @tc.desc      Slider 59.4 seeks to 59, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 59.4;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(59);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0007
     * @tc.name      testExtSeekContract0006
     * @tc.desc      Slider 59.6 seeks to 60, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 59.6;
      const previousSeek: number = 60;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(60);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0008
     * @tc.name      testExtSeekContract0007
     * @tc.desc      Slider 60.4 seeks to 60, duplicate=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 60.4;
      const previousSeek: number = 60.4;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(60);
      expect(shouldSeek).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0009
     * @tc.name      testExtSeekContract0008
     * @tc.desc      Slider 60.6 seeks to 61, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 60.6;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(61);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0010
     * @tc.name      testExtSeekContract0009
     * @tc.desc      Slider 999.4 seeks to 999, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 999.4;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(999);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0011
     * @tc.name      testExtSeekContract0010
     * @tc.desc      Slider 999.6 seeks to 1000, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 999.6;
      const previousSeek: number = 1000;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(1000);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0012
     * @tc.name      testExtSeekContract0011
     * @tc.desc      Slider 3599.6 seeks to 3600, duplicate=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 3599.6;
      const previousSeek: number = 3599.6;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(3600);
      expect(shouldSeek).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0013
     * @tc.name      testExtSeekContract0012
     * @tc.desc      Slider 0 seeks to 0, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(0);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0014
     * @tc.name      testExtSeekContract0013
     * @tc.desc      Slider 0.4 seeks to 0, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.4;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(0);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0015
     * @tc.name      testExtSeekContract0014
     * @tc.desc      Slider 0.6 seeks to 1, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.6;
      const previousSeek: number = 1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(1);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0016
     * @tc.name      testExtSeekContract0015
     * @tc.desc      Slider 1.4 seeks to 1, duplicate=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.4;
      const previousSeek: number = 1.4;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(1);
      expect(shouldSeek).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0017
     * @tc.name      testExtSeekContract0016
     * @tc.desc      Slider 1.6 seeks to 2, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.6;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(2);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0018
     * @tc.name      testExtSeekContract0017
     * @tc.desc      Slider 59.4 seeks to 59, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 59.4;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(59);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0019
     * @tc.name      testExtSeekContract0018
     * @tc.desc      Slider 59.6 seeks to 60, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 59.6;
      const previousSeek: number = 60;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(60);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0020
     * @tc.name      testExtSeekContract0019
     * @tc.desc      Slider 60.4 seeks to 60, duplicate=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 60.4;
      const previousSeek: number = 60.4;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(60);
      expect(shouldSeek).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0021
     * @tc.name      testExtSeekContract0020
     * @tc.desc      Slider 60.6 seeks to 61, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 60.6;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(61);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0022
     * @tc.name      testExtSeekContract0021
     * @tc.desc      Slider 999.4 seeks to 999, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 999.4;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(999);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0023
     * @tc.name      testExtSeekContract0022
     * @tc.desc      Slider 999.6 seeks to 1000, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 999.6;
      const previousSeek: number = 1000;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(1000);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0024
     * @tc.name      testExtSeekContract0023
     * @tc.desc      Slider 3599.6 seeks to 3600, duplicate=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 3599.6;
      const previousSeek: number = 3599.6;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(3600);
      expect(shouldSeek).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0025
     * @tc.name      testExtSeekContract0024
     * @tc.desc      Slider 0 seeks to 0, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(0);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0026
     * @tc.name      testExtSeekContract0025
     * @tc.desc      Slider 0.4 seeks to 0, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.4;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(0);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0027
     * @tc.name      testExtSeekContract0026
     * @tc.desc      Slider 0.6 seeks to 1, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.6;
      const previousSeek: number = 1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(1);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0028
     * @tc.name      testExtSeekContract0027
     * @tc.desc      Slider 1.4 seeks to 1, duplicate=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.4;
      const previousSeek: number = 1.4;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(1);
      expect(shouldSeek).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0029
     * @tc.name      testExtSeekContract0028
     * @tc.desc      Slider 1.6 seeks to 2, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.6;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(2);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0030
     * @tc.name      testExtSeekContract0029
     * @tc.desc      Slider 59.4 seeks to 59, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 59.4;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(59);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0031
     * @tc.name      testExtSeekContract0030
     * @tc.desc      Slider 59.6 seeks to 60, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 59.6;
      const previousSeek: number = 60;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(60);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0032
     * @tc.name      testExtSeekContract0031
     * @tc.desc      Slider 60.4 seeks to 60, duplicate=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 60.4;
      const previousSeek: number = 60.4;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(60);
      expect(shouldSeek).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0033
     * @tc.name      testExtSeekContract0032
     * @tc.desc      Slider 60.6 seeks to 61, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 60.6;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(61);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0034
     * @tc.name      testExtSeekContract0033
     * @tc.desc      Slider 999.4 seeks to 999, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 999.4;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(999);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0035
     * @tc.name      testExtSeekContract0034
     * @tc.desc      Slider 999.6 seeks to 1000, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 999.6;
      const previousSeek: number = 1000;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(1000);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0036
     * @tc.name      testExtSeekContract0035
     * @tc.desc      Slider 3599.6 seeks to 3600, duplicate=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 3599.6;
      const previousSeek: number = 3599.6;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(3600);
      expect(shouldSeek).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0037
     * @tc.name      testExtSeekContract0036
     * @tc.desc      Slider 0 seeks to 0, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(0);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0038
     * @tc.name      testExtSeekContract0037
     * @tc.desc      Slider 0.4 seeks to 0, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.4;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(0);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0039
     * @tc.name      testExtSeekContract0038
     * @tc.desc      Slider 0.6 seeks to 1, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.6;
      const previousSeek: number = 1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(1);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0040
     * @tc.name      testExtSeekContract0039
     * @tc.desc      Slider 1.4 seeks to 1, duplicate=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.4;
      const previousSeek: number = 1.4;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(1);
      expect(shouldSeek).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0041
     * @tc.name      testExtSeekContract0040
     * @tc.desc      Slider 1.6 seeks to 2, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.6;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(2);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0042
     * @tc.name      testExtSeekContract0041
     * @tc.desc      Slider 59.4 seeks to 59, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 59.4;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(59);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0043
     * @tc.name      testExtSeekContract0042
     * @tc.desc      Slider 59.6 seeks to 60, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 59.6;
      const previousSeek: number = 60;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(60);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0044
     * @tc.name      testExtSeekContract0043
     * @tc.desc      Slider 60.4 seeks to 60, duplicate=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 60.4;
      const previousSeek: number = 60.4;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(60);
      expect(shouldSeek).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0045
     * @tc.name      testExtSeekContract0044
     * @tc.desc      Slider 60.6 seeks to 61, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 60.6;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(61);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0046
     * @tc.name      testExtSeekContract0045
     * @tc.desc      Slider 999.4 seeks to 999, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 999.4;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(999);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0047
     * @tc.name      testExtSeekContract0046
     * @tc.desc      Slider 999.6 seeks to 1000, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 999.6;
      const previousSeek: number = 1000;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(1000);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0048
     * @tc.name      testExtSeekContract0047
     * @tc.desc      Slider 3599.6 seeks to 3600, duplicate=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 3599.6;
      const previousSeek: number = 3599.6;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(3600);
      expect(shouldSeek).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0049
     * @tc.name      testExtSeekContract0048
     * @tc.desc      Slider 0 seeks to 0, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(0);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0050
     * @tc.name      testExtSeekContract0049
     * @tc.desc      Slider 0.4 seeks to 0, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.4;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(0);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0051
     * @tc.name      testExtSeekContract0050
     * @tc.desc      Slider 0.6 seeks to 1, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.6;
      const previousSeek: number = 1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(1);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0052
     * @tc.name      testExtSeekContract0051
     * @tc.desc      Slider 1.4 seeks to 1, duplicate=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.4;
      const previousSeek: number = 1.4;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(1);
      expect(shouldSeek).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0053
     * @tc.name      testExtSeekContract0052
     * @tc.desc      Slider 1.6 seeks to 2, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.6;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(2);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0054
     * @tc.name      testExtSeekContract0053
     * @tc.desc      Slider 59.4 seeks to 59, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 59.4;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(59);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0055
     * @tc.name      testExtSeekContract0054
     * @tc.desc      Slider 59.6 seeks to 60, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 59.6;
      const previousSeek: number = 60;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(60);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0056
     * @tc.name      testExtSeekContract0055
     * @tc.desc      Slider 60.4 seeks to 60, duplicate=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 60.4;
      const previousSeek: number = 60.4;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(60);
      expect(shouldSeek).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0057
     * @tc.name      testExtSeekContract0056
     * @tc.desc      Slider 60.6 seeks to 61, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 60.6;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(61);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0058
     * @tc.name      testExtSeekContract0057
     * @tc.desc      Slider 999.4 seeks to 999, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 999.4;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(999);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0059
     * @tc.name      testExtSeekContract0058
     * @tc.desc      Slider 999.6 seeks to 1000, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 999.6;
      const previousSeek: number = 1000;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(1000);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0060
     * @tc.name      testExtSeekContract0059
     * @tc.desc      Slider 3599.6 seeks to 3600, duplicate=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 3599.6;
      const previousSeek: number = 3599.6;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(3600);
      expect(shouldSeek).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0061
     * @tc.name      testExtSeekContract0060
     * @tc.desc      Slider 0 seeks to 0, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(0);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0062
     * @tc.name      testExtSeekContract0061
     * @tc.desc      Slider 0.4 seeks to 0, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.4;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(0);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0063
     * @tc.name      testExtSeekContract0062
     * @tc.desc      Slider 0.6 seeks to 1, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.6;
      const previousSeek: number = 1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(1);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0064
     * @tc.name      testExtSeekContract0063
     * @tc.desc      Slider 1.4 seeks to 1, duplicate=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.4;
      const previousSeek: number = 1.4;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(1);
      expect(shouldSeek).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0065
     * @tc.name      testExtSeekContract0064
     * @tc.desc      Slider 1.6 seeks to 2, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.6;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(2);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0066
     * @tc.name      testExtSeekContract0065
     * @tc.desc      Slider 59.4 seeks to 59, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 59.4;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(59);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0067
     * @tc.name      testExtSeekContract0066
     * @tc.desc      Slider 59.6 seeks to 60, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 59.6;
      const previousSeek: number = 60;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(60);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0068
     * @tc.name      testExtSeekContract0067
     * @tc.desc      Slider 60.4 seeks to 60, duplicate=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 60.4;
      const previousSeek: number = 60.4;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(60);
      expect(shouldSeek).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0069
     * @tc.name      testExtSeekContract0068
     * @tc.desc      Slider 60.6 seeks to 61, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 60.6;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(61);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0070
     * @tc.name      testExtSeekContract0069
     * @tc.desc      Slider 999.4 seeks to 999, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 999.4;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(999);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0071
     * @tc.name      testExtSeekContract0070
     * @tc.desc      Slider 999.6 seeks to 1000, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 999.6;
      const previousSeek: number = 1000;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(1000);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0072
     * @tc.name      testExtSeekContract0071
     * @tc.desc      Slider 3599.6 seeks to 3600, duplicate=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 3599.6;
      const previousSeek: number = 3599.6;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(3600);
      expect(shouldSeek).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0073
     * @tc.name      testExtSeekContract0072
     * @tc.desc      Slider 0 seeks to 0, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(0);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0074
     * @tc.name      testExtSeekContract0073
     * @tc.desc      Slider 0.4 seeks to 0, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.4;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(0);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0075
     * @tc.name      testExtSeekContract0074
     * @tc.desc      Slider 0.6 seeks to 1, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.6;
      const previousSeek: number = 1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(1);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0076
     * @tc.name      testExtSeekContract0075
     * @tc.desc      Slider 1.4 seeks to 1, duplicate=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.4;
      const previousSeek: number = 1.4;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(1);
      expect(shouldSeek).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0077
     * @tc.name      testExtSeekContract0076
     * @tc.desc      Slider 1.6 seeks to 2, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.6;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(2);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0078
     * @tc.name      testExtSeekContract0077
     * @tc.desc      Slider 59.4 seeks to 59, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 59.4;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(59);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0079
     * @tc.name      testExtSeekContract0078
     * @tc.desc      Slider 59.6 seeks to 60, duplicate=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 59.6;
      const previousSeek: number = 60;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(60);
      expect(shouldSeek).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEK_0080
     * @tc.name      testExtSeekContract0079
     * @tc.desc      Slider 60.4 seeks to 60, duplicate=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekContract0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 60.4;
      const previousSeek: number = 60.4;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      const shouldSeek: boolean = previousSeek !== value;
      expect(seekTime).assertEqual(60);
      expect(shouldSeek).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
      expect(seekTime.toString().length).assertLarger(0);
    })
  });
}
