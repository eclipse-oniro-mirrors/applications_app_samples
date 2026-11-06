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
// SheetFlow 单测：样式文案与切换、重复打开拦截、拖拽高度分档、状态摘要。
// 半模态页面把 onHeightDidChange 的高度按低/中/高三档归档，这些纯函数保证分档边界稳定。

import { describe, it, expect } from '@ohos/hypium';
import {
  SheetStyle,
  canOpenSheet,
  heightBucket,
  heightBucketLabel,
  sheetModeName,
  sheetStatusText,
  toggleSheetStyle
} from '../main/ets/model/SheetFlow';

export default function sheetFlowTest() {
  describe('SheetFlowTest', () => {
    // 样式文案：CENTER / POPUP 各有可读名称
    it('sheetModeName_values', 0, () => {
      expect(sheetModeName(SheetStyle.CENTER)).assertEqual('CENTER centered style');
      expect(sheetModeName(SheetStyle.POPUP)).assertEqual('POPUP popup style');
    });

    // 样式切换：两次切换回到原值
    it('toggleSheetStyle_roundTrip', 0, () => {
      expect(toggleSheetStyle(SheetStyle.CENTER)).assertEqual(SheetStyle.POPUP);
      expect(toggleSheetStyle(SheetStyle.POPUP)).assertEqual(SheetStyle.CENTER);
      expect(toggleSheetStyle(toggleSheetStyle(SheetStyle.CENTER))).assertEqual(SheetStyle.CENTER);
    });

    // 重复打开拦截：已打开时拒绝，关闭后可再次打开
    it('canOpenSheet_guard', 0, () => {
      expect(canOpenSheet(false)).assertTrue();
      expect(canOpenSheet(true)).assertFalse();
    });

    // 高度分档边界：0、299.9、300、599.9、600 分别落入预期档位
    it('heightBucket_boundaries', 0, () => {
      expect(heightBucket(0)).assertEqual(0);
      expect(heightBucket(-10)).assertEqual(0);
      expect(heightBucket(1)).assertEqual(1);
      expect(heightBucket(299.9)).assertEqual(1);
      expect(heightBucket(300)).assertEqual(2);
      expect(heightBucket(599.9)).assertEqual(2);
      expect(heightBucket(600)).assertEqual(3);
      expect(heightBucket(1280)).assertEqual(3);
    });

    // 档位文案：三档 + 兜底
    it('heightBucketLabel_all', 0, () => {
      expect(heightBucketLabel(0)).assertEqual('Not opened');
      expect(heightBucketLabel(1).includes('Low')).assertTrue();
      expect(heightBucketLabel(2).includes('Medium')).assertTrue();
      expect(heightBucketLabel(3).includes('High')).assertTrue();
      expect(heightBucketLabel(9)).assertEqual('Not opened');
    });

    // 状态摘要：打开/关闭、样式与档位组合
    it('sheetStatusText_combinations', 0, () => {
      expect(sheetStatusText(false, SheetStyle.CENTER, 0))
        .assertEqual('Closed · CENTER centered style · Not opened');
      expect(sheetStatusText(true, SheetStyle.POPUP, 350))
        .assertEqual('Opened · POPUP popup style · Medium (300-600vp)');
      expect(sheetStatusText(true, SheetStyle.CENTER, 700))
        .assertEqual('Opened · CENTER centered style · High (>= 600vp)');
    });
  });
}
