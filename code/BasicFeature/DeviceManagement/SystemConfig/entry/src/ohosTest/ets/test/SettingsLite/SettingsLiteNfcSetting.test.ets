import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SettingsLiteService, SettingsItemModel, SettingsItemType, SettingsOperationStatus } from 'library';

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

/**
 * SettingsLiteService NFC 设置测试套件。
 */
export default function SettingsLiteNfcSettingTest(): void {
  describe('SettingsLiteNfcSettingTest', () => {

    /**
     * @tc.number SUB_SETTINGS_LITE_NFC_SETTING_0100
     * @tc.name testSettingsLiteNfcSetting0001
     * @tc.desc 正向用例：获取 NFC 模型，验证类型为 NFC_SETTING。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsLiteNfcSetting0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteNfcSetting0001: begin');
      const service: SettingsLiteService = new SettingsLiteService();
      service.initialize();
      const model: SettingsItemModel = service.getNfcModel();
      expect(model.itemType).assertEqual(SettingsItemType.NFC_SETTING);
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.IDLE);
      expect(model.title.length).assertLarger(0);
      service.destroy();
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_NFC_SETTING_0200
     * @tc.name testSettingsLiteNfcSetting0002
     * @tc.desc 正向用例：NFC 模型的 getTypeName 返回非空字符串。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsLiteNfcSetting0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteNfcSetting0002: begin');
      const service: SettingsLiteService = new SettingsLiteService();
      service.initialize();
      const model: SettingsItemModel = service.getNfcModel();
      const typeName: string = model.getTypeName();
      expect(typeName.length).assertLarger(0);
      expect(typeName).assertEqual('NFC 设置');
      expect(model.itemType).assertEqual(SettingsItemType.NFC_SETTING);
      service.destroy();
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_NFC_SETTING_0300
     * @tc.name testSettingsLiteNfcSetting0003
     * @tc.desc 正向用例：getAllModels 返回 3 个模型。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsLiteNfcSetting0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testSettingsLiteNfcSetting0003: begin');
      const service: SettingsLiteService = new SettingsLiteService();
      service.initialize();
      const models: SettingsItemModel[] = service.getAllModels();
      expect(models.length).assertEqual(3);
      expect(models[0].itemType).assertEqual(SettingsItemType.PIN_SETTING);
      expect(models[1].itemType).assertEqual(SettingsItemType.NFC_SETTING);
      service.destroy();
    });
  });
}
