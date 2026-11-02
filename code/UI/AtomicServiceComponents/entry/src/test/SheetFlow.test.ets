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
      expect(sheetModeName(SheetStyle.CENTER)).assertEqual('CENTER 居中样式');
      expect(sheetModeName(SheetStyle.POPUP)).assertEqual('POPUP 弹窗样式');
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
      expect(heightBucketLabel(0)).assertEqual('尚未打开');
      expect(heightBucketLabel(1).includes('低档')).assertTrue();
      expect(heightBucketLabel(2).includes('中档')).assertTrue();
      expect(heightBucketLabel(3).includes('高档')).assertTrue();
      expect(heightBucketLabel(9)).assertEqual('尚未打开');
    });

    // 状态摘要：打开/关闭、样式与档位组合
    it('sheetStatusText_combinations', 0, () => {
      expect(sheetStatusText(false, SheetStyle.CENTER, 0))
        .assertEqual('已关闭 · CENTER 居中样式 · 尚未打开');
      expect(sheetStatusText(true, SheetStyle.POPUP, 350))
        .assertEqual('已打开 · POPUP 弹窗样式 · 中档（300–600vp）');
      expect(sheetStatusText(true, SheetStyle.CENTER, 700))
        .assertEqual('已打开 · CENTER 居中样式 · 高档（≥ 600vp）');
    });
  });
}
