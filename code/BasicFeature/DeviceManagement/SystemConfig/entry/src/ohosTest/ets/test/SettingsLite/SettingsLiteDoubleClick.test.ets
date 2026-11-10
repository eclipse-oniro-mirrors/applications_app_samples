import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  SettingsLiteService,
  SettingsItemModel,
  SettingsItemType,
  SettingsOperationStatus,
  ClickResult
} from 'library';

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

/**
 * SettingsLiteService 双击设置测试套件。
 */
export default function SettingsLiteDoubleClickTest(): void {
  describe('SettingsLiteDoubleClickTest', () => {

    /**
     * @tc.number SUB_SETTINGS_LITE_DOUBLE_CLICK_0100
     * @tc.name testSettingsLiteDoubleClick0001
     * @tc.desc 正向用例：获取双击模型，验证类型为 DOUBLE_CLICK_SETTING。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsLiteDoubleClick0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteDoubleClick0001: begin');
      const service: SettingsLiteService = new SettingsLiteService();
      service.initialize();
      const model: SettingsItemModel = service.getDoubleClickModel();
      expect(model.itemType).assertEqual(SettingsItemType.DOUBLE_CLICK_SETTING);
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.IDLE);
      expect(model.clickResult).assertEqual(ClickResult.NOT_SELF);
      service.destroy();
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_DOUBLE_CLICK_0200
     * @tc.name testSettingsLiteDoubleClick0002
     * @tc.desc 正向用例：markOpening 后状态变为 OPENING。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsLiteDoubleClick0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteDoubleClick0002: begin');
      const model: SettingsItemModel = new SettingsItemModel(
        SettingsItemType.DOUBLE_CLICK_SETTING, '双击设置', '测试'
      );
      model.markOpening();
      expect(model.isOpening()).assertTrue();
      expect(model.isSuccess()).assertFalse();
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.OPENING);
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_DOUBLE_CLICK_0300
     * @tc.name testSettingsLiteDoubleClick0003
     * @tc.desc 正向用例：updateClickResult 更新双击结果。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsLiteDoubleClick0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteDoubleClick0003: begin');
      const model: SettingsItemModel = new SettingsItemModel();
      model.updateClickResult(ClickResult.IS_SELF);
      expect(model.clickResult).assertEqual(ClickResult.IS_SELF);
      expect(model.lastOperationTime).assertLarger(0);
      model.updateClickResult(ClickResult.ERROR);
      expect(model.clickResult).assertEqual(ClickResult.ERROR);
    });
  });
}
