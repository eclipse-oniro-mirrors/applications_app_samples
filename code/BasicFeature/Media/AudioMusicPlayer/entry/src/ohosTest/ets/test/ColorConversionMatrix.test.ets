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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ColorConversion } from '../../../main/ets/common/utils/ColorConversion';
import { paceTurn } from './TestPace';

const TAG: string = 'Sample_AudioMusicPlayer';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'AudioMusicPlayer_';

/**
 * 独立复算沉浸式背景：CSS 色相球公式求 HSB，亮度按三段规则压到 0.3 以下区间，再转回 RGB。
 * 与 main 的实现分开书写，用于交叉验证。
 */
function hsbToRgb(r: number, g: number, b: number): number[] {
  let max: number = Math.max(r, Math.max(g, b));
  let min: number = Math.min(r, Math.min(g, b));
  let delta: number = max - min;
  let brightness: number = max / 256;
  let saturation: number = max === 0 ? 0 : delta / max;
  let hue: number = 0;
  if (delta !== 0) {
    if (max === r) {
      hue = 60 * (((g - b) / delta) % 6);
    } else if (max === g) {
      hue = 60 * ((b - r) / delta + 2);
    } else {
      hue = 60 * ((r - g) / delta + 4);
    }
  }
  if (hue < 0) {
    hue += 360;
  }
  let target: number = brightness >= 0.4 ? 0.3 : (brightness >= 0.2 ? brightness - 0.1 : brightness + 0.2);
  let chroma: number = target * saturation;
  let hueSector: number = hue / 60;
  let second: number = chroma * (1 - Math.abs(hueSector % 2 - 1));
  let m: number = target - chroma;
  let base: number[] = [0, 0, 0];
  if (hueSector < 1) {
    base = [chroma, second, 0];
  } else if (hueSector < 2) {
    base = [second, chroma, 0];
  } else if (hueSector < 3) {
    base = [0, chroma, second];
  } else if (hueSector < 4) {
    base = [0, second, chroma];
  } else if (hueSector < 5) {
    base = [second, 0, chroma];
  } else {
    base = [chroma, 0, second];
  }
  return base.map((channel: number) => Math.floor((channel + m) * 255));
}

function sameColor(left: number[], right: number[]): boolean {
  return left[0] === right[0] && left[1] === right[1] && left[2] === right[2];
}

function inRange(color: number[]): boolean {
  return color.every((channel: number) =>
    channel >= 0 && channel <= 255 && Math.floor(channel) === channel);
}

function maxChannel(color: number[]): number {
  let top: number = color[0];
  for (let channel of color) {
    top = Math.max(top, channel);
  }
  return top;
}

export default function ColorConversionMatrixTest() {
  describe('ColorConversionMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COLOR_MATRIX_0100
     * @tc.name      testColorConversionMatrix0001
     * @tc.desc      验证色相六区间内按 30 度步进的采样颜色换算结果与独立复算完全一致，且所有通道都在合法字节范围
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testColorConversionMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ColorMatrix_HueSectors_0001 begin');
      let samples: number[][] = [
        [255, 0, 0], [255, 128, 0], [255, 255, 0], [128, 255, 0],
        [0, 255, 0], [0, 255, 128], [0, 255, 255], [0, 128, 255],
        [0, 0, 255], [128, 0, 255], [255, 0, 255], [255, 0, 128]
      ];
      let mismatched: number = 0;
      let outOfRange: number = 0;
      let sectorCoverage: Set<string> = new Set<string>();
      for (let sample of samples) {
        let actual: number[] = ColorConversion.dealColor(sample[0], sample[1], sample[2]);
        let expected: number[] = hsbToRgb(sample[0], sample[1], sample[2]);
        if (!sameColor(actual, expected)) {
          mismatched++;
        }
        if (!inRange(actual)) {
          outOfRange++;
        }
        sectorCoverage.add(JSON.stringify(actual));
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `样本=${samples.length}, 不一致=${mismatched}, 越界=${outOfRange}, 去重结果=${sectorCoverage.size}`);
      expect(mismatched).assertEqual(0);
      expect(outOfRange).assertEqual(0);
      expect(sectorCoverage.size > 6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ColorMatrix_HueSectors_0001 end');
    });

    /**
     * @tc.number    SUB_COLOR_MATRIX_0200
     * @tc.name      testColorConversionMatrix0002
     * @tc.desc      验证亮度压缩分档：高亮样本输出亮度不超过 0.3 对应的通道上限，中等与暗色样本分别落在各自目标区间
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    

    /**
     * @tc.number    SUB_COLOR_MATRIX_0300
     * @tc.name      testColorConversionMatrix0003
     * @tc.desc      验证灰度输入换算后三通道相等，亮度下调后暗灰仍保持原色相中性，纯白与纯黑得到不同结果
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    

    /**
     * @tc.number    SUB_COLOR_MATRIX_0400
     * @tc.name      testColorConversionMatrix0004
     * @tc.desc      验证同一个颜色重复换算结果稳定，交换两个非最大值通道只改变色相不改变亮度上限
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testColorConversionMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ColorMatrix_StableAndSwap_0004 begin');
      let base: number[] = ColorConversion.dealColor(200, 60, 120);
      let repeats: string[] = [];
      for (let round = 0; round < 3; round++) {
        repeats.push(ColorConversion.dealColor(200, 60, 120).join('/'));
      }
      let swapped: number[] = ColorConversion.dealColor(200, 120, 60);
      let baseMax: number = maxChannel(base);
      let swappedMax: number = maxChannel(swapped);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `重复结果=${repeats.join('|')}, 原色=${base.join('/')}, 交换通道=${swapped.join('/')}`);
      expect(new Set<string>(repeats).size).assertEqual(1);
      expect(repeats[0]).assertEqual(base.join('/'));
      expect(swappedMax).assertEqual(baseMax);
      expect(sameColor(base, swapped)).assertFalse();
      expect(base).assertDeepEquals([76, 22, 45]);
      expect(swapped).assertDeepEquals([76, 45, 22]);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ColorMatrix_StableAndSwap_0004 end');
    });
  });
}
