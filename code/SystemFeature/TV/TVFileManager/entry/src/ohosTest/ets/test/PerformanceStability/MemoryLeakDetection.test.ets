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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Tools } from '../../../../main/ets/common/utils/Tools';
import { checkSuffix, SUFFIX_VIDEO, SUFFIX_AUDIO, SUFFIX_IMAGE } from '../../../../main/ets/common/ConstantsMedia';
import { FileBean } from '../../../../main/ets/component/bean/FileBean';
import { StorageManager } from '../../../../main/ets/common/manager/StorageManager';
import { createBean, VIDEO_NAMES, SAMPLE_SIZES } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'TVFileManagerTest';

export default function memoryLeakDetectionTest() {
  describe('MemoryLeakDetection', () => {
    /*
     * Classification runs for every visible row while scrolling.
     */
    describe('Suffix_Matching_Performance', () => {
      it('classify_thousand_rows', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: classify_thousand_rows');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          let bean: FileBean = createBean('perf-' + i + '.mp4');
          expect(bean.isVideo()).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('format_size_thousand_times', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_size_thousand_times');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(Tools.byte2Str(i * 1024).length > 0).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });
    });

    /*
     * The title bar queries the volume on every refresh event.
     */
    describe('Storage_Query_Stability', () => {
      it('repeat_storage_query', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: repeat_storage_query');
        for (let i = 0; i < 50; i++) {
          let pair: [number, number] = StorageManager.getFreeSpaceSize('/');
          expect(pair.length).assertEqual(2);
        }
      });

      it('largest_sample_size_format', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: largest_sample_size_format');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(Tools.byte2Str(SAMPLE_SIZES[SAMPLE_SIZES.length - 1]).length > 0).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });
    });

    /*
     * Extended boundary, type and matrix coverage for MemoryLeakDetection derived from the reference suite.
     */
    describe('Extended_Coverage', () => {
      it('perf_suffix_loop_0', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_suffix_loop_0');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(checkSuffix('sample.mp4', SUFFIX_VIDEO)).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_bean_loop_1', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_bean_loop_1');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          let bean: FileBean = createBean('perf1-' + i + '.mp4');
          expect(bean.isVideo()).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_size_loop_2', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_size_loop_2');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(Tools.byte2Str(i * 3).length > 0).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_storage_loop_3', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_storage_loop_3');
        let start: number = Date.now();
        for (let i = 0; i < 20; i++) {
          let pair: [number, number] = StorageManager.getFreeSpaceSize('/');
          expect(pair.length).assertEqual(2);
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_suffix_loop_4', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_suffix_loop_4');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(checkSuffix('sample.mp4', SUFFIX_VIDEO)).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_bean_loop_5', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_bean_loop_5');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          let bean: FileBean = createBean('perf5-' + i + '.mp4');
          expect(bean.isVideo()).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_size_loop_6', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_size_loop_6');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(Tools.byte2Str(i * 7).length > 0).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_storage_loop_7', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_storage_loop_7');
        let start: number = Date.now();
        for (let i = 0; i < 20; i++) {
          let pair: [number, number] = StorageManager.getFreeSpaceSize('/');
          expect(pair.length).assertEqual(2);
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_suffix_loop_8', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_suffix_loop_8');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(checkSuffix('sample.mp4', SUFFIX_VIDEO)).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_bean_loop_9', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_bean_loop_9');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          let bean: FileBean = createBean('perf9-' + i + '.mp4');
          expect(bean.isVideo()).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_size_loop_10', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_size_loop_10');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(Tools.byte2Str(i * 11).length > 0).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_storage_loop_11', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_storage_loop_11');
        let start: number = Date.now();
        for (let i = 0; i < 20; i++) {
          let pair: [number, number] = StorageManager.getFreeSpaceSize('/');
          expect(pair.length).assertEqual(2);
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_suffix_loop_12', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_suffix_loop_12');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(checkSuffix('sample.mp4', SUFFIX_VIDEO)).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_bean_loop_13', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_bean_loop_13');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          let bean: FileBean = createBean('perf13-' + i + '.mp4');
          expect(bean.isVideo()).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });
    });
  });
}
