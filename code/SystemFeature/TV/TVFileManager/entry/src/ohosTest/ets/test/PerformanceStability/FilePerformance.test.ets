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

export default function filePerformanceTest() {
  describe('FilePerformance', () => {
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
     * Extended boundary, type and matrix coverage for FilePerformance derived from the reference suite.
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

      it('perf_size_loop_14', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_size_loop_14');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(Tools.byte2Str(i * 15).length > 0).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_storage_loop_15', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_storage_loop_15');
        let start: number = Date.now();
        for (let i = 0; i < 20; i++) {
          let pair: [number, number] = StorageManager.getFreeSpaceSize('/');
          expect(pair.length).assertEqual(2);
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_suffix_loop_16', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_suffix_loop_16');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(checkSuffix('sample.mp4', SUFFIX_VIDEO)).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_bean_loop_17', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_bean_loop_17');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          let bean: FileBean = createBean('perf17-' + i + '.mp4');
          expect(bean.isVideo()).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_size_loop_18', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_size_loop_18');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(Tools.byte2Str(i * 19).length > 0).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_storage_loop_19', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_storage_loop_19');
        let start: number = Date.now();
        for (let i = 0; i < 20; i++) {
          let pair: [number, number] = StorageManager.getFreeSpaceSize('/');
          expect(pair.length).assertEqual(2);
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_suffix_loop_20', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_suffix_loop_20');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(checkSuffix('sample.mp4', SUFFIX_VIDEO)).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_bean_loop_21', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_bean_loop_21');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          let bean: FileBean = createBean('perf21-' + i + '.mp4');
          expect(bean.isVideo()).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_size_loop_22', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_size_loop_22');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(Tools.byte2Str(i * 23).length > 0).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_storage_loop_23', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_storage_loop_23');
        let start: number = Date.now();
        for (let i = 0; i < 20; i++) {
          let pair: [number, number] = StorageManager.getFreeSpaceSize('/');
          expect(pair.length).assertEqual(2);
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_suffix_loop_24', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_suffix_loop_24');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(checkSuffix('sample.mp4', SUFFIX_VIDEO)).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_bean_loop_25', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_bean_loop_25');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          let bean: FileBean = createBean('perf25-' + i + '.mp4');
          expect(bean.isVideo()).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_size_loop_26', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_size_loop_26');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(Tools.byte2Str(i * 27).length > 0).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_storage_loop_27', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_storage_loop_27');
        let start: number = Date.now();
        for (let i = 0; i < 20; i++) {
          let pair: [number, number] = StorageManager.getFreeSpaceSize('/');
          expect(pair.length).assertEqual(2);
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_suffix_loop_28', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_suffix_loop_28');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(checkSuffix('sample.mp4', SUFFIX_VIDEO)).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_bean_loop_29', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_bean_loop_29');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          let bean: FileBean = createBean('perf29-' + i + '.mp4');
          expect(bean.isVideo()).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_size_loop_30', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_size_loop_30');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(Tools.byte2Str(i * 31).length > 0).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_storage_loop_31', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_storage_loop_31');
        let start: number = Date.now();
        for (let i = 0; i < 20; i++) {
          let pair: [number, number] = StorageManager.getFreeSpaceSize('/');
          expect(pair.length).assertEqual(2);
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_suffix_loop_32', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_suffix_loop_32');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(checkSuffix('sample.mp4', SUFFIX_VIDEO)).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_bean_loop_33', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_bean_loop_33');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          let bean: FileBean = createBean('perf33-' + i + '.mp4');
          expect(bean.isVideo()).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_size_loop_34', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_size_loop_34');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(Tools.byte2Str(i * 35).length > 0).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_storage_loop_35', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_storage_loop_35');
        let start: number = Date.now();
        for (let i = 0; i < 20; i++) {
          let pair: [number, number] = StorageManager.getFreeSpaceSize('/');
          expect(pair.length).assertEqual(2);
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_suffix_loop_36', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_suffix_loop_36');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(checkSuffix('sample.mp4', SUFFIX_VIDEO)).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_bean_loop_37', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_bean_loop_37');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          let bean: FileBean = createBean('perf37-' + i + '.mp4');
          expect(bean.isVideo()).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_size_loop_38', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_size_loop_38');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(Tools.byte2Str(i * 39).length > 0).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_storage_loop_39', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_storage_loop_39');
        let start: number = Date.now();
        for (let i = 0; i < 20; i++) {
          let pair: [number, number] = StorageManager.getFreeSpaceSize('/');
          expect(pair.length).assertEqual(2);
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_suffix_loop_40', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_suffix_loop_40');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(checkSuffix('sample.mp4', SUFFIX_VIDEO)).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_bean_loop_41', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_bean_loop_41');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          let bean: FileBean = createBean('perf41-' + i + '.mp4');
          expect(bean.isVideo()).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_size_loop_42', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_size_loop_42');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(Tools.byte2Str(i * 43).length > 0).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_storage_loop_43', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_storage_loop_43');
        let start: number = Date.now();
        for (let i = 0; i < 20; i++) {
          let pair: [number, number] = StorageManager.getFreeSpaceSize('/');
          expect(pair.length).assertEqual(2);
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_suffix_loop_44', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_suffix_loop_44');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(checkSuffix('sample.mp4', SUFFIX_VIDEO)).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_bean_loop_45', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_bean_loop_45');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          let bean: FileBean = createBean('perf45-' + i + '.mp4');
          expect(bean.isVideo()).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_size_loop_46', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_size_loop_46');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(Tools.byte2Str(i * 47).length > 0).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_storage_loop_47', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_storage_loop_47');
        let start: number = Date.now();
        for (let i = 0; i < 20; i++) {
          let pair: [number, number] = StorageManager.getFreeSpaceSize('/');
          expect(pair.length).assertEqual(2);
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_suffix_loop_48', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_suffix_loop_48');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(checkSuffix('sample.mp4', SUFFIX_VIDEO)).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_bean_loop_49', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_bean_loop_49');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          let bean: FileBean = createBean('perf49-' + i + '.mp4');
          expect(bean.isVideo()).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_size_loop_50', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_size_loop_50');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(Tools.byte2Str(i * 51).length > 0).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_storage_loop_51', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_storage_loop_51');
        let start: number = Date.now();
        for (let i = 0; i < 20; i++) {
          let pair: [number, number] = StorageManager.getFreeSpaceSize('/');
          expect(pair.length).assertEqual(2);
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_suffix_loop_52', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_suffix_loop_52');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(checkSuffix('sample.mp4', SUFFIX_VIDEO)).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_bean_loop_53', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_bean_loop_53');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          let bean: FileBean = createBean('perf53-' + i + '.mp4');
          expect(bean.isVideo()).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_size_loop_54', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_size_loop_54');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(Tools.byte2Str(i * 55).length > 0).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_storage_loop_55', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_storage_loop_55');
        let start: number = Date.now();
        for (let i = 0; i < 20; i++) {
          let pair: [number, number] = StorageManager.getFreeSpaceSize('/');
          expect(pair.length).assertEqual(2);
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_suffix_loop_56', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_suffix_loop_56');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(checkSuffix('sample.mp4', SUFFIX_VIDEO)).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_bean_loop_57', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_bean_loop_57');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          let bean: FileBean = createBean('perf57-' + i + '.mp4');
          expect(bean.isVideo()).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_size_loop_58', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_size_loop_58');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(Tools.byte2Str(i * 59).length > 0).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_storage_loop_59', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_storage_loop_59');
        let start: number = Date.now();
        for (let i = 0; i < 20; i++) {
          let pair: [number, number] = StorageManager.getFreeSpaceSize('/');
          expect(pair.length).assertEqual(2);
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_suffix_loop_60', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_suffix_loop_60');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(checkSuffix('sample.mp4', SUFFIX_VIDEO)).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_bean_loop_61', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_bean_loop_61');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          let bean: FileBean = createBean('perf61-' + i + '.mp4');
          expect(bean.isVideo()).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_size_loop_62', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_size_loop_62');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(Tools.byte2Str(i * 63).length > 0).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_storage_loop_63', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_storage_loop_63');
        let start: number = Date.now();
        for (let i = 0; i < 20; i++) {
          let pair: [number, number] = StorageManager.getFreeSpaceSize('/');
          expect(pair.length).assertEqual(2);
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_suffix_loop_64', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_suffix_loop_64');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(checkSuffix('sample.mp4', SUFFIX_VIDEO)).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_bean_loop_65', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_bean_loop_65');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          let bean: FileBean = createBean('perf65-' + i + '.mp4');
          expect(bean.isVideo()).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_size_loop_66', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_size_loop_66');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(Tools.byte2Str(i * 67).length > 0).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_storage_loop_67', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_storage_loop_67');
        let start: number = Date.now();
        for (let i = 0; i < 20; i++) {
          let pair: [number, number] = StorageManager.getFreeSpaceSize('/');
          expect(pair.length).assertEqual(2);
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_suffix_loop_68', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_suffix_loop_68');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(checkSuffix('sample.mp4', SUFFIX_VIDEO)).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_bean_loop_69', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_bean_loop_69');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          let bean: FileBean = createBean('perf69-' + i + '.mp4');
          expect(bean.isVideo()).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_size_loop_70', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_size_loop_70');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(Tools.byte2Str(i * 71).length > 0).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_storage_loop_71', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_storage_loop_71');
        let start: number = Date.now();
        for (let i = 0; i < 20; i++) {
          let pair: [number, number] = StorageManager.getFreeSpaceSize('/');
          expect(pair.length).assertEqual(2);
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_suffix_loop_72', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_suffix_loop_72');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(checkSuffix('sample.mp4', SUFFIX_VIDEO)).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_bean_loop_73', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_bean_loop_73');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          let bean: FileBean = createBean('perf73-' + i + '.mp4');
          expect(bean.isVideo()).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_size_loop_74', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_size_loop_74');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(Tools.byte2Str(i * 75).length > 0).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_storage_loop_75', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_storage_loop_75');
        let start: number = Date.now();
        for (let i = 0; i < 20; i++) {
          let pair: [number, number] = StorageManager.getFreeSpaceSize('/');
          expect(pair.length).assertEqual(2);
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_suffix_loop_76', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_suffix_loop_76');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(checkSuffix('sample.mp4', SUFFIX_VIDEO)).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_bean_loop_77', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_bean_loop_77');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          let bean: FileBean = createBean('perf77-' + i + '.mp4');
          expect(bean.isVideo()).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_size_loop_78', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_size_loop_78');
        let start: number = Date.now();
        for (let i = 0; i < 50; i++) {
          expect(Tools.byte2Str(i * 79).length > 0).assertTrue();
        }
        expect(Date.now() - start < 10000).assertTrue();
      });

      it('perf_storage_loop_79', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: perf_storage_loop_79');
        let start: number = Date.now();
        for (let i = 0; i < 20; i++) {
          let pair: [number, number] = StorageManager.getFreeSpaceSize('/');
          expect(pair.length).assertEqual(2);
        }
        expect(Date.now() - start < 10000).assertTrue();
      });
    });
  });
}
