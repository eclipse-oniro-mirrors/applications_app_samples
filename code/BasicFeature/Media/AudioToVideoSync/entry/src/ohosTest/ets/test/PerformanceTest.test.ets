/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, it, expect } from '@ohos/hypium';
import { media } from '@kit.MediaKit';
import { audio } from '@kit.AudioKit';
import { display } from '@kit.ArkUI';
import { CommonConstants } from '../../../main/ets/common/CommonConstants';
import hilog from '@ohos.hilog';
const DOMAIN: number = 0xF811;
const TAG: string = 'Performance01';


/**
 * Performance Test Suite（关键路径耗时真实测量）
 *
 * 播放启动阶段需要完成：创建媒体实例 -> 解封装 -> 初始化解码器 -> 建立音频输出流。
 * 用例用 Date.now() 包裹真实调用测量耗时，并与可接受上限比较；
 * 阈值是判定标准，测量值全部来自本次运行的真实结果，日志中会打印实测数据便于追踪劣化。
 */
export default function Performance01Test() {
  describe('Performance01Test', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', `${TAG}: suite setup`);
    })

    /**
     * @tc.number    SUB_PERFORMANCE_TEST01_0100
     * @tc.name      testPerformance01Chapter0001
     * @tc.desc      Verify TC_Perf_001
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPerformance01Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerformance01Chapter0001 begin');
      const start: number = Date.now();
      const player: media.AVPlayer = await media.createAVPlayer();
      await player.release();
      const cost: number = Date.now() - start;
      hilog.info(DOMAIN, TAG, '%{public}s', `${TAG}: AVPlayer create+release ${cost}ms`);
      expect(player.state).assertEqual('released');
      expect(cost).assertLargerOrEqual(0);
      expect(cost).assertLess(3000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerformance01Chapter0001 end');
    })

    /**
     * @tc.number    SUB_PERFORMANCE_TEST01_0200
     * @tc.name      testPerformance01Chapter0002
     * @tc.desc      Verify TC_Perf_002
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPerformance01Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerformance01Chapter0002 begin');
      const queryCount: number = 100;
      const start: number = Date.now();
      for (let i = 0; i < queryCount; i++) {
        display.getDefaultDisplaySync();
      }
      const totalCost: number = Date.now() - start;
      const averageCost: number = totalCost / queryCount;
      const sampleDisplay: display.Display = display.getDefaultDisplaySync();
      hilog.info(DOMAIN, TAG, '%{public}s', `${TAG}: ${queryCount} display queries ${totalCost}ms, average ${averageCost}ms`);
      expect(sampleDisplay.width).assertLarger(0);
      expect(averageCost).assertLess(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerformance01Chapter0002 end');
    })

    /**
     * @tc.number    SUB_PERFORMANCE_TEST01_0300
     * @tc.name      testPerformance01Chapter0003
     * @tc.desc      Verify TC_Perf_003
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPerformance01Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerformance01Chapter0003 begin');
      const volumeManager: audio.AudioVolumeManager = audio.getAudioManager().getVolumeManager();
      const start: number = Date.now();
      const volume: number = volumeManager.getVolumeByStream(audio.StreamUsage.STREAM_USAGE_MEDIA);
      const cost: number = Date.now() - start;
      hilog.info(DOMAIN, TAG, '%{public}s', `${TAG}: media volume query cost ${cost}ms, volume ${volume}`);
      expect(volume).assertLargerOrEqual(0);
      expect(cost).assertLess(500);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerformance01Chapter0003 end');
    })

    /**
     * @tc.number    SUB_PERFORMANCE_TEST01_0400
     * @tc.name      testPerformance01Chapter0004
     * @tc.desc      Verify TC_Perf_004
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPerformance01Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerformance01Chapter0004 begin');
      const defaultDisplay: display.Display = display.getDefaultDisplaySync();
      const loopCount: number = 10000;
      let heightPx: string = '';
      const start: number = Date.now();
      for (let i = 0; i < loopCount; i++) {
        heightPx = (defaultDisplay.width * CommonConstants.DEFAULT_HEIGHT / CommonConstants.DEFAULT_WIDTH) +
          CommonConstants.PX;
      }
      const cost: number = Date.now() - start;
      hilog.info(DOMAIN, TAG, '%{public}s', `${TAG}: ${loopCount} height calculations cost ${cost}ms, result ${heightPx}`);
      expect(heightPx.endsWith(CommonConstants.PX)).assertTrue();
      expect(cost).assertLess(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerformance01Chapter0004 end');
    })
  })
}
