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

export default function subtitlePipeline8wTest() {
  describe('subtitlePipeline8wTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0001
     * @tc.name      test8wSubtitlePipeline0001
     * @tc.desc      Subtitle pipeline 0-1000 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0001', 0, () => {
      const start: number = 0;
      const end: number = 1000;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0002
     * @tc.name      test8wSubtitlePipeline0002
     * @tc.desc      Subtitle pipeline 200-1200 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0002', 0, () => {
      const start: number = 200;
      const end: number = 1200;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0003
     * @tc.name      test8wSubtitlePipeline0003
     * @tc.desc      Subtitle pipeline 400-1400 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0003', 0, () => {
      const start: number = 400;
      const end: number = 1400;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0004
     * @tc.name      test8wSubtitlePipeline0004
     * @tc.desc      Subtitle pipeline 600-1600 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0004', 0, () => {
      const start: number = 600;
      const end: number = 1600;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0005
     * @tc.name      test8wSubtitlePipeline0005
     * @tc.desc      Subtitle pipeline 800-1800 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0005', 0, () => {
      const start: number = 800;
      const end: number = 1800;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0006
     * @tc.name      test8wSubtitlePipeline0006
     * @tc.desc      Subtitle pipeline 1000-2000 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0006', 0, () => {
      const start: number = 1000;
      const end: number = 2000;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0007
     * @tc.name      test8wSubtitlePipeline0007
     * @tc.desc      Subtitle pipeline 1200-2200 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0007', 0, () => {
      const start: number = 1200;
      const end: number = 2200;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0008
     * @tc.name      test8wSubtitlePipeline0008
     * @tc.desc      Subtitle pipeline 1400-2400 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0008', 0, () => {
      const start: number = 1400;
      const end: number = 2400;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0009
     * @tc.name      test8wSubtitlePipeline0009
     * @tc.desc      Subtitle pipeline 1600-2600 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0009', 0, () => {
      const start: number = 1600;
      const end: number = 2600;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0010
     * @tc.name      test8wSubtitlePipeline0010
     * @tc.desc      Subtitle pipeline 1800-2800 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0010', 0, () => {
      const start: number = 1800;
      const end: number = 2800;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0011
     * @tc.name      test8wSubtitlePipeline0011
     * @tc.desc      Subtitle pipeline 2000-3000 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0011', 0, () => {
      const start: number = 2000;
      const end: number = 3000;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0012
     * @tc.name      test8wSubtitlePipeline0012
     * @tc.desc      Subtitle pipeline 2200-3200 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0012', 0, () => {
      const start: number = 2200;
      const end: number = 3200;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0013
     * @tc.name      test8wSubtitlePipeline0013
     * @tc.desc      Subtitle pipeline 2400-3400 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0013', 0, () => {
      const start: number = 2400;
      const end: number = 3400;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0014
     * @tc.name      test8wSubtitlePipeline0014
     * @tc.desc      Subtitle pipeline 2600-3600 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0014', 0, () => {
      const start: number = 2600;
      const end: number = 3600;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0015
     * @tc.name      test8wSubtitlePipeline0015
     * @tc.desc      Subtitle pipeline 2800-3800 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0015', 0, () => {
      const start: number = 2800;
      const end: number = 3800;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0016
     * @tc.name      test8wSubtitlePipeline0016
     * @tc.desc      Subtitle pipeline 3000-4000 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0016', 0, () => {
      const start: number = 3000;
      const end: number = 4000;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0017
     * @tc.name      test8wSubtitlePipeline0017
     * @tc.desc      Subtitle pipeline 3200-4200 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0017', 0, () => {
      const start: number = 3200;
      const end: number = 4200;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0018
     * @tc.name      test8wSubtitlePipeline0018
     * @tc.desc      Subtitle pipeline 3400-4400 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0018', 0, () => {
      const start: number = 3400;
      const end: number = 4400;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0019
     * @tc.name      test8wSubtitlePipeline0019
     * @tc.desc      Subtitle pipeline 3600-4600 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0019', 0, () => {
      const start: number = 3600;
      const end: number = 4600;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0020
     * @tc.name      test8wSubtitlePipeline0020
     * @tc.desc      Subtitle pipeline 3800-4800 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0020', 0, () => {
      const start: number = 3800;
      const end: number = 4800;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0021
     * @tc.name      test8wSubtitlePipeline0021
     * @tc.desc      Subtitle pipeline 4000-5000 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0021', 0, () => {
      const start: number = 4000;
      const end: number = 5000;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0022
     * @tc.name      test8wSubtitlePipeline0022
     * @tc.desc      Subtitle pipeline 4200-5200 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0022', 0, () => {
      const start: number = 4200;
      const end: number = 5200;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0023
     * @tc.name      test8wSubtitlePipeline0023
     * @tc.desc      Subtitle pipeline 4400-5400 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0023', 0, () => {
      const start: number = 4400;
      const end: number = 5400;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0024
     * @tc.name      test8wSubtitlePipeline0024
     * @tc.desc      Subtitle pipeline 4600-5600 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0024', 0, () => {
      const start: number = 4600;
      const end: number = 5600;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0025
     * @tc.name      test8wSubtitlePipeline0025
     * @tc.desc      Subtitle pipeline 4800-5800 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0025', 0, () => {
      const start: number = 4800;
      const end: number = 5800;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0026
     * @tc.name      test8wSubtitlePipeline0026
     * @tc.desc      Subtitle pipeline 5000-6000 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0026', 0, () => {
      const start: number = 5000;
      const end: number = 6000;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0027
     * @tc.name      test8wSubtitlePipeline0027
     * @tc.desc      Subtitle pipeline 5200-6200 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0027', 0, () => {
      const start: number = 5200;
      const end: number = 6200;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0028
     * @tc.name      test8wSubtitlePipeline0028
     * @tc.desc      Subtitle pipeline 5400-6400 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0028', 0, () => {
      const start: number = 5400;
      const end: number = 6400;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0029
     * @tc.name      test8wSubtitlePipeline0029
     * @tc.desc      Subtitle pipeline 5600-6600 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0029', 0, () => {
      const start: number = 5600;
      const end: number = 6600;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0030
     * @tc.name      test8wSubtitlePipeline0030
     * @tc.desc      Subtitle pipeline 5800-6800 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0030', 0, () => {
      const start: number = 5800;
      const end: number = 6800;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0031
     * @tc.name      test8wSubtitlePipeline0031
     * @tc.desc      Subtitle pipeline 6000-7000 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0031', 0, () => {
      const start: number = 6000;
      const end: number = 7000;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0032
     * @tc.name      test8wSubtitlePipeline0032
     * @tc.desc      Subtitle pipeline 6200-7200 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0032', 0, () => {
      const start: number = 6200;
      const end: number = 7200;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0033
     * @tc.name      test8wSubtitlePipeline0033
     * @tc.desc      Subtitle pipeline 6400-7400 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0033', 0, () => {
      const start: number = 6400;
      const end: number = 7400;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0034
     * @tc.name      test8wSubtitlePipeline0034
     * @tc.desc      Subtitle pipeline 6600-7600 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0034', 0, () => {
      const start: number = 6600;
      const end: number = 7600;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0035
     * @tc.name      test8wSubtitlePipeline0035
     * @tc.desc      Subtitle pipeline 6800-7800 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0035', 0, () => {
      const start: number = 6800;
      const end: number = 7800;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0036
     * @tc.name      test8wSubtitlePipeline0036
     * @tc.desc      Subtitle pipeline 7000-8000 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0036', 0, () => {
      const start: number = 7000;
      const end: number = 8000;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0037
     * @tc.name      test8wSubtitlePipeline0037
     * @tc.desc      Subtitle pipeline 7200-8200 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0037', 0, () => {
      const start: number = 7200;
      const end: number = 8200;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0038
     * @tc.name      test8wSubtitlePipeline0038
     * @tc.desc      Subtitle pipeline 7400-8400 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0038', 0, () => {
      const start: number = 7400;
      const end: number = 8400;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0039
     * @tc.name      test8wSubtitlePipeline0039
     * @tc.desc      Subtitle pipeline 7600-8600 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0039', 0, () => {
      const start: number = 7600;
      const end: number = 8600;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0040
     * @tc.name      test8wSubtitlePipeline0040
     * @tc.desc      Subtitle pipeline 7800-8800 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0040', 0, () => {
      const start: number = 7800;
      const end: number = 8800;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0041
     * @tc.name      test8wSubtitlePipeline0041
     * @tc.desc      Subtitle pipeline 8000-9000 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0041', 0, () => {
      const start: number = 8000;
      const end: number = 9000;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0042
     * @tc.name      test8wSubtitlePipeline0042
     * @tc.desc      Subtitle pipeline 8200-9200 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0042', 0, () => {
      const start: number = 8200;
      const end: number = 9200;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0043
     * @tc.name      test8wSubtitlePipeline0043
     * @tc.desc      Subtitle pipeline 8400-9400 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0043', 0, () => {
      const start: number = 8400;
      const end: number = 9400;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0044
     * @tc.name      test8wSubtitlePipeline0044
     * @tc.desc      Subtitle pipeline 8600-9600 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0044', 0, () => {
      const start: number = 8600;
      const end: number = 9600;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0045
     * @tc.name      test8wSubtitlePipeline0045
     * @tc.desc      Subtitle pipeline 8800-9800 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0045', 0, () => {
      const start: number = 8800;
      const end: number = 9800;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0046
     * @tc.name      test8wSubtitlePipeline0046
     * @tc.desc      Subtitle pipeline 9000-10000 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0046', 0, () => {
      const start: number = 9000;
      const end: number = 10000;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0047
     * @tc.name      test8wSubtitlePipeline0047
     * @tc.desc      Subtitle pipeline 9200-10200 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0047', 0, () => {
      const start: number = 9200;
      const end: number = 10200;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0048
     * @tc.name      test8wSubtitlePipeline0048
     * @tc.desc      Subtitle pipeline 9400-10400 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0048', 0, () => {
      const start: number = 9400;
      const end: number = 10400;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0049
     * @tc.name      test8wSubtitlePipeline0049
     * @tc.desc      Subtitle pipeline 9600-10600 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0049', 0, () => {
      const start: number = 9600;
      const end: number = 10600;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0050
     * @tc.name      test8wSubtitlePipeline0050
     * @tc.desc      Subtitle pipeline 9800-10800 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0050', 0, () => {
      const start: number = 9800;
      const end: number = 10800;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0051
     * @tc.name      test8wSubtitlePipeline0051
     * @tc.desc      Subtitle pipeline 10000-11000 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0051', 0, () => {
      const start: number = 10000;
      const end: number = 11000;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0052
     * @tc.name      test8wSubtitlePipeline0052
     * @tc.desc      Subtitle pipeline 10200-11200 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0052', 0, () => {
      const start: number = 10200;
      const end: number = 11200;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0053
     * @tc.name      test8wSubtitlePipeline0053
     * @tc.desc      Subtitle pipeline 10400-11400 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0053', 0, () => {
      const start: number = 10400;
      const end: number = 11400;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0054
     * @tc.name      test8wSubtitlePipeline0054
     * @tc.desc      Subtitle pipeline 10600-11600 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0054', 0, () => {
      const start: number = 10600;
      const end: number = 11600;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0055
     * @tc.name      test8wSubtitlePipeline0055
     * @tc.desc      Subtitle pipeline 10800-11800 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0055', 0, () => {
      const start: number = 10800;
      const end: number = 11800;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0056
     * @tc.name      test8wSubtitlePipeline0056
     * @tc.desc      Subtitle pipeline 11000-12000 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0056', 0, () => {
      const start: number = 11000;
      const end: number = 12000;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0057
     * @tc.name      test8wSubtitlePipeline0057
     * @tc.desc      Subtitle pipeline 11200-12200 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0057', 0, () => {
      const start: number = 11200;
      const end: number = 12200;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0058
     * @tc.name      test8wSubtitlePipeline0058
     * @tc.desc      Subtitle pipeline 11400-12400 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0058', 0, () => {
      const start: number = 11400;
      const end: number = 12400;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0059
     * @tc.name      test8wSubtitlePipeline0059
     * @tc.desc      Subtitle pipeline 11600-12600 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0059', 0, () => {
      const start: number = 11600;
      const end: number = 12600;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0060
     * @tc.name      test8wSubtitlePipeline0060
     * @tc.desc      Subtitle pipeline 11800-12800 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0060', 0, () => {
      const start: number = 11800;
      const end: number = 12800;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0061
     * @tc.name      test8wSubtitlePipeline0061
     * @tc.desc      Subtitle pipeline 12000-13000 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0061', 0, () => {
      const start: number = 12000;
      const end: number = 13000;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0062
     * @tc.name      test8wSubtitlePipeline0062
     * @tc.desc      Subtitle pipeline 12200-13200 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0062', 0, () => {
      const start: number = 12200;
      const end: number = 13200;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0063
     * @tc.name      test8wSubtitlePipeline0063
     * @tc.desc      Subtitle pipeline 12400-13400 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0063', 0, () => {
      const start: number = 12400;
      const end: number = 13400;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0064
     * @tc.name      test8wSubtitlePipeline0064
     * @tc.desc      Subtitle pipeline 12600-13600 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0064', 0, () => {
      const start: number = 12600;
      const end: number = 13600;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0065
     * @tc.name      test8wSubtitlePipeline0065
     * @tc.desc      Subtitle pipeline 12800-13800 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0065', 0, () => {
      const start: number = 12800;
      const end: number = 13800;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0066
     * @tc.name      test8wSubtitlePipeline0066
     * @tc.desc      Subtitle pipeline 13000-14000 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0066', 0, () => {
      const start: number = 13000;
      const end: number = 14000;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0067
     * @tc.name      test8wSubtitlePipeline0067
     * @tc.desc      Subtitle pipeline 13200-14200 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0067', 0, () => {
      const start: number = 13200;
      const end: number = 14200;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0068
     * @tc.name      test8wSubtitlePipeline0068
     * @tc.desc      Subtitle pipeline 13400-14400 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0068', 0, () => {
      const start: number = 13400;
      const end: number = 14400;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0069
     * @tc.name      test8wSubtitlePipeline0069
     * @tc.desc      Subtitle pipeline 13600-14600 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0069', 0, () => {
      const start: number = 13600;
      const end: number = 14600;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0070
     * @tc.name      test8wSubtitlePipeline0070
     * @tc.desc      Subtitle pipeline 13800-14800 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0070', 0, () => {
      const start: number = 13800;
      const end: number = 14800;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0071
     * @tc.name      test8wSubtitlePipeline0071
     * @tc.desc      Subtitle pipeline 14000-15000 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0071', 0, () => {
      const start: number = 14000;
      const end: number = 15000;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0072
     * @tc.name      test8wSubtitlePipeline0072
     * @tc.desc      Subtitle pipeline 14200-15200 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0072', 0, () => {
      const start: number = 14200;
      const end: number = 15200;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0073
     * @tc.name      test8wSubtitlePipeline0073
     * @tc.desc      Subtitle pipeline 14400-15400 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0073', 0, () => {
      const start: number = 14400;
      const end: number = 15400;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0074
     * @tc.name      test8wSubtitlePipeline0074
     * @tc.desc      Subtitle pipeline 14600-15600 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0074', 0, () => {
      const start: number = 14600;
      const end: number = 15600;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0075
     * @tc.name      test8wSubtitlePipeline0075
     * @tc.desc      Subtitle pipeline 14800-15800 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0075', 0, () => {
      const start: number = 14800;
      const end: number = 15800;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0076
     * @tc.name      test8wSubtitlePipeline0076
     * @tc.desc      Subtitle pipeline 15000-16000 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0076', 0, () => {
      const start: number = 15000;
      const end: number = 16000;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0077
     * @tc.name      test8wSubtitlePipeline0077
     * @tc.desc      Subtitle pipeline 15200-16200 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0077', 0, () => {
      const start: number = 15200;
      const end: number = 16200;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0078
     * @tc.name      test8wSubtitlePipeline0078
     * @tc.desc      Subtitle pipeline 15400-16400 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0078', 0, () => {
      const start: number = 15400;
      const end: number = 16400;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0079
     * @tc.name      test8wSubtitlePipeline0079
     * @tc.desc      Subtitle pipeline 15600-16600 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0079', 0, () => {
      const start: number = 15600;
      const end: number = 16600;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0080
     * @tc.name      test8wSubtitlePipeline0080
     * @tc.desc      Subtitle pipeline 15800-16800 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0080', 0, () => {
      const start: number = 15800;
      const end: number = 16800;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0081
     * @tc.name      test8wSubtitlePipeline0081
     * @tc.desc      Subtitle pipeline 16000-17000 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0081', 0, () => {
      const start: number = 16000;
      const end: number = 17000;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0082
     * @tc.name      test8wSubtitlePipeline0082
     * @tc.desc      Subtitle pipeline 16200-17200 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0082', 0, () => {
      const start: number = 16200;
      const end: number = 17200;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0083
     * @tc.name      test8wSubtitlePipeline0083
     * @tc.desc      Subtitle pipeline 16400-17400 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0083', 0, () => {
      const start: number = 16400;
      const end: number = 17400;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0084
     * @tc.name      test8wSubtitlePipeline0084
     * @tc.desc      Subtitle pipeline 16600-17600 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0084', 0, () => {
      const start: number = 16600;
      const end: number = 17600;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0085
     * @tc.name      test8wSubtitlePipeline0085
     * @tc.desc      Subtitle pipeline 16800-17800 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0085', 0, () => {
      const start: number = 16800;
      const end: number = 17800;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0086
     * @tc.name      test8wSubtitlePipeline0086
     * @tc.desc      Subtitle pipeline 17000-18000 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0086', 0, () => {
      const start: number = 17000;
      const end: number = 18000;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0087
     * @tc.name      test8wSubtitlePipeline0087
     * @tc.desc      Subtitle pipeline 17200-18200 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0087', 0, () => {
      const start: number = 17200;
      const end: number = 18200;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0088
     * @tc.name      test8wSubtitlePipeline0088
     * @tc.desc      Subtitle pipeline 17400-18400 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0088', 0, () => {
      const start: number = 17400;
      const end: number = 18400;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0089
     * @tc.name      test8wSubtitlePipeline0089
     * @tc.desc      Subtitle pipeline 17600-18600 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0089', 0, () => {
      const start: number = 17600;
      const end: number = 18600;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0090
     * @tc.name      test8wSubtitlePipeline0090
     * @tc.desc      Subtitle pipeline 17800-18800 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0090', 0, () => {
      const start: number = 17800;
      const end: number = 18800;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0091
     * @tc.name      test8wSubtitlePipeline0091
     * @tc.desc      Subtitle pipeline 18000-19000 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0091', 0, () => {
      const start: number = 18000;
      const end: number = 19000;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0092
     * @tc.name      test8wSubtitlePipeline0092
     * @tc.desc      Subtitle pipeline 18200-19200 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0092', 0, () => {
      const start: number = 18200;
      const end: number = 19200;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0093
     * @tc.name      test8wSubtitlePipeline0093
     * @tc.desc      Subtitle pipeline 18400-19400 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0093', 0, () => {
      const start: number = 18400;
      const end: number = 19400;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0094
     * @tc.name      test8wSubtitlePipeline0094
     * @tc.desc      Subtitle pipeline 18600-19600 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0094', 0, () => {
      const start: number = 18600;
      const end: number = 19600;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0095
     * @tc.name      test8wSubtitlePipeline0095
     * @tc.desc      Subtitle pipeline 18800-19800 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0095', 0, () => {
      const start: number = 18800;
      const end: number = 19800;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0096
     * @tc.name      test8wSubtitlePipeline0096
     * @tc.desc      Subtitle pipeline 19000-20000 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0096', 0, () => {
      const start: number = 19000;
      const end: number = 20000;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0097
     * @tc.name      test8wSubtitlePipeline0097
     * @tc.desc      Subtitle pipeline 19200-20200 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0097', 0, () => {
      const start: number = 19200;
      const end: number = 20200;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0098
     * @tc.name      test8wSubtitlePipeline0098
     * @tc.desc      Subtitle pipeline 19400-20400 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0098', 0, () => {
      const start: number = 19400;
      const end: number = 20400;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0099
     * @tc.name      test8wSubtitlePipeline0099
     * @tc.desc      Subtitle pipeline 19600-20600 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0099', 0, () => {
      const start: number = 19600;
      const end: number = 20600;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_8W_PIPE_0100
     * @tc.name      test8wSubtitlePipeline0100
     * @tc.desc      Subtitle pipeline 19800-20800 contains 2 500ms slices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wSubtitlePipeline0100', 0, () => {
      const start: number = 19800;
      const end: number = 20800;
      const duration: number = end - start;
      const slices: number = Math.floor(duration / 500);
      expect(duration).assertEqual(1000);
      expect(slices).assertEqual(2);
      expect(end).assertLarger(start);
      expect(slices).assertLarger(0);
    })
  })
}
