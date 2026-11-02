import { describe, it, expect } from '@ohos/hypium';
import {
  SheetStyle,
  canOpenSheet,
  heightBucket,
  heightBucketLabel,
  sheetModeName,
  sheetStatusText,
  toggleSheetStyle
} from '../../../main/ets/model/SheetFlow';
import { RouteKey, isRouteKey } from '../../../main/ets/common/AppConstants';
import { DEMO_ITEMS } from '../../../main/ets/model/DemoLogic';

export default function sheetFlowTest() {
  describe('sheetFlowTest', () => {

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_SHEETFLOW_0100
     * @tc.name sheetModeNames001
     * @tc.desc Verify both sheet styles map to readable names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sheetMode_names', 0, () => {
      expect(sheetModeName(SheetStyle.CENTER)).assertEqual('CENTER 居中样式');
      expect(sheetModeName(SheetStyle.POPUP)).assertEqual('POPUP 弹窗样式');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_SHEETFLOW_0200
     * @tc.name toggleSheetStyleRoundTrip002
     * @tc.desc Verify toggling the style twice returns to the original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('toggleSheetStyle_roundTrip', 0, () => {
      expect(toggleSheetStyle(SheetStyle.CENTER)).assertEqual(SheetStyle.POPUP);
      expect(toggleSheetStyle(SheetStyle.POPUP)).assertEqual(SheetStyle.CENTER);
      expect(toggleSheetStyle(toggleSheetStyle(SheetStyle.POPUP))).assertEqual(SheetStyle.POPUP);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_SHEETFLOW_0300
     * @tc.name canOpenSheetGuard003
     * @tc.desc Verify an already open sheet rejects another open request
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('canOpenSheet_guard', 0, () => {
      expect(canOpenSheet(false)).assertTrue();
      expect(canOpenSheet(true)).assertFalse();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_SHEETFLOW_0400
     * @tc.name heightBucketBoundaries004
     * @tc.desc Verify drag heights at 0, 1, 299.9, 300, 599.9, 600 and 1280 vp fall into the expected bucket
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('heightBucket_boundaries', 0, () => {
      expect(heightBucket(0)).assertEqual(0);
      expect(heightBucket(1)).assertEqual(1);
      expect(heightBucket(299.9)).assertEqual(1);
      expect(heightBucket(300)).assertEqual(2);
      expect(heightBucket(599.9)).assertEqual(2);
      expect(heightBucket(600)).assertEqual(3);
      expect(heightBucket(1280)).assertEqual(3);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_SHEETFLOW_0500
     * @tc.name heightBucketNonPositive005
     * @tc.desc Verify zero and negative heights stay in the closed bucket
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('heightBucket_nonPositive', 0, () => {
      expect(heightBucket(0)).assertEqual(0);
      expect(heightBucket(-1)).assertEqual(0);
      expect(heightBucket(-320)).assertEqual(0);
      expect(heightBucketLabel(0)).assertEqual('尚未打开');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_SHEETFLOW_0600
     * @tc.name heightBucketLabels006
     * @tc.desc Verify each bucket has a label with its vp range and unknown buckets fall back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('heightBucket_labels', 0, () => {
      expect(heightBucketLabel(1)).assertEqual('低档（< 300vp）');
      expect(heightBucketLabel(2)).assertEqual('中档（300–600vp）');
      expect(heightBucketLabel(3)).assertEqual('高档（≥ 600vp）');
      expect(heightBucketLabel(4)).assertEqual('尚未打开');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_SHEETFLOW_0700
     * @tc.name sheetStatusTextCombinations007
     * @tc.desc Verify the status summary combines open state, style and height bucket
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sheetStatusText_combinations', 0, () => {
      expect(sheetStatusText(false, SheetStyle.CENTER, 0))
        .assertEqual('已关闭 · CENTER 居中样式 · 尚未打开');
      expect(sheetStatusText(true, SheetStyle.POPUP, 350))
        .assertEqual('已打开 · POPUP 弹窗样式 · 中档（300–600vp）');
      expect(sheetStatusText(true, SheetStyle.CENTER, 700))
        .assertEqual('已打开 · CENTER 居中样式 · 高档（≥ 600vp）');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_SHEETFLOW_0800
     * @tc.name heightBucketMonotonic008
     * @tc.desc Verify bucket numbers never decrease as the sheet grows
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('heightBucket_monotonic', 0, () => {
      let previous = 0;
      for (let height = 0; height <= 900; height += 50) {
        const bucket = heightBucket(height);
        expect(bucket >= previous).assertTrue();
        previous = bucket;
      }
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_SHEETFLOW_0900
     * @tc.name sheetRouteRegistered009
     * @tc.desc Verify the sheet route key is registered and exposed in the home catalog
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sheetRoute_registered', 0, () => {
      expect(RouteKey.SHEET).assertEqual('sheet');
      expect(isRouteKey(RouteKey.SHEET)).assertTrue();
      const keys: string[] = DEMO_ITEMS.map((item) => item.key);
      expect(keys.includes(RouteKey.SHEET)).assertTrue();
    });
  });
}
